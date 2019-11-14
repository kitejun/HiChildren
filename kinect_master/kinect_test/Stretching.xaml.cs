using Microsoft.Kinect.VisualGestureBuilder;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reactive.Concurrency;
using System.Reactive.Linq;
using System.Net.Http;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Media.Imaging;
using Windows.UI.Xaml.Navigation;
using WindowsPreview.Kinect;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
// 빈 페이지 항목 템플릿에 대한 설명은 http://go.microsoft.com/fwlink/?LinkId=234238 에 나와 있습니다.

namespace kinect_test
{
    /// <summary>
    /// 자체에서 사용하거나 프레임 내에서 탐색할 수 있는 빈 페이지입니다.
    /// </summary>
    public sealed partial class Stretching : Page
    {
        KinectSensor _kinect;
        MultiSourceFrameReader _multiFrameReader;
        IDisposable _multiFrameSubscription;

        private DispatcherTimer timer;
        private int basetime;

        Body[] _bodies = new Body[6];
        byte[] _colorPixels;
        uint _bytesPerPixel;

        bool _colorFrameProcessed;
        bool _bodiesProcessed;
        double cntRsult = 0;
        int icntR = 0, icntC=0;

        WriteableBitmap _writeableBitmap;
        VisualGestureBuilderDatabase _gestureDatabase;
        VisualGestureBuilderFrameSource _gestureFrameSource;
        VisualGestureBuilderFrameReader _gestureFrameReader;

        Gesture _saluteProgress;
        Gesture _salute;

        string conn;
        MySqlConnection connect;

        string new_song;
        string gbd_type,gbd_name;
        string gifimages;
        string m_num;
        Info st_info;
        int torf;
        int str_c = 0, count = 0, _count=0;

        public Stretching()
        {
            this.InitializeComponent();
            Loaded += MainPage_Loaded;
           
            this.NavigationCacheMode = NavigationCacheMode.Required;
            timer = new DispatcherTimer();
            timer.Interval = new TimeSpan(10000000); 
            timer.Tick += timer_Tick;
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            st_info = (Info)e.Parameter;

            if (!string.IsNullOrWhiteSpace(st_info.num.ToString()))
            {
                gbd_name = st_info.gbd;
                gbd_type = gbd_name + ".gbd"; //gdb파일
                m_num = st_info.num; //회원번호
                new_song = st_info.song_name;
                gifimages = st_info.gifimage; //동작gif

                GestureText1.Text = "0";
               // Count_(m_num);
                //icntC = count;
            }
            else
            {
                gbd_type = "kinect1.gbd";
            }
            base.OnNavigatedTo(e);
        }


        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            var main_info = new Info { num = m_num, gbd = gbd_type };
            this.Frame.Navigate(typeof(st_List), main_info);
        }

        void timer_Tick(object sender, object e)
        {
            basetime = basetime - 1;
            if (basetime == 0)
            {
                timer.Stop();

            }
        }
        
         private void done()
        {
            basetime = 2;
            //            if (Progress.Value == 1)
            //            {
            timer.Start();
            //           }

        }

        /*  void MainPage_Unloaded(object sender, RoutedEventArgs e)
          {
              if (_multiFrameSubscription != null)
                  _multiFrameSubscription.Dispose();

              _kinect.Close();
              _kinect = null;

              _multiFrameReader.Dispose();
              _multiFrameReader = null;
          }*/

        void Media_eneded(object sender, RoutedEventArgs e)
        {

            mediaElement.Position = TimeSpan.FromSeconds(0);
            mediaElement.Play();
        }

        void MainPage_Loaded(object sender, RoutedEventArgs evt)
        {
            mediaElement.Source = new Uri(new_song);
            mediaElement.MediaEnded += new RoutedEventHandler(Media_eneded);

            XamlAnimatedGif.AnimationBehavior.SetSourceUri(gifimage, new Uri(gifimages));

            cntRsult = 0;
            GestureText1.Text = "0";

            _kinect = KinectSensor.GetDefault();

            // We need at least body data in order to get the tracking ID for face tracking..
            _multiFrameReader = _kinect.OpenMultiSourceFrameReader(FrameSourceTypes.Body | FrameSourceTypes.Color);
            //바디와 컬러 정보가져옴
            var multiFrames = Observable.FromEvent<MultiSourceFrameArrivedEventArgs>(
                ev => { _multiFrameReader.MultiSourceFrameArrived += (s, e) => ev(e); },
                ev => { _multiFrameReader.MultiSourceFrameArrived -= (s, e) => ev(e); })
                .SubscribeOn(TaskPoolScheduler.Default)
                .ObserveOn(TaskPoolScheduler.Default);

            _multiFrameSubscription = multiFrames.Subscribe(OnMultiFrame);

            // create the colorFrameDescription from the ColorFrameSource using rgba format
            var colorFrameDescription = _kinect.ColorFrameSource.CreateFrameDescription(ColorImageFormat.Rgba);

            _writeableBitmap = new WriteableBitmap(colorFrameDescription.Width, colorFrameDescription.Height);

            // rgba is 4 bytes per pixel
            _bytesPerPixel = colorFrameDescription.BytesPerPixel;

            // allocate space to put the pixels to be rendered
            _colorPixels = new byte[colorFrameDescription.Width * colorFrameDescription.Height * _bytesPerPixel];

            _gestureDatabase = new VisualGestureBuilderDatabase(@"Gestures/" + gbd_type); //동작을 가져옴
            _gestureFrameSource = new VisualGestureBuilderFrameSource(_kinect, 0); //

            // Add all gestures in the database to the framesource..
            _gestureFrameSource.AddGestures(_gestureDatabase.AvailableGestures);
            //프레임에 가져온 gbd 추가 하기
            foreach (var gesture in _gestureDatabase.AvailableGestures)
            {
                if (gesture.Name == "salute")
                {
                    _salute = gesture;
                }
                if (gesture.Name == "saluteProgress")
                {
                    _saluteProgress = gesture;
                }
            }

            _gestureFrameReader = _gestureFrameSource.OpenReader(); 
            _gestureFrameReader.IsPaused = true;
            _gestureFrameReader.FrameArrived += reader_FrameArrived; //새 프레임 준비되면 발생

            _kinect.Open();
        }

        void reader_FrameArrived(VisualGestureBuilderFrameReader sender, VisualGestureBuilderFrameArrivedEventArgs args)
        {
            using (var frame = args.FrameReference.AcquireFrame())
            {
                if (frame != null && frame.DiscreteGestureResults != null) //제스쳐 결과
                {
                    var result = frame.DiscreteGestureResults[_salute];

                    if (result.Detected == true) //제스처가 감지됌
                    {
                        var progressResult = frame.ContinuousGestureResults[_saluteProgress]; //연속제스쳐결과모음을 가져옴
                        Progress.Value = progressResult.Progress;

                        if (Progress.Value == 1)
                        {
                            done();
                            //icntR += 1;
                        }
                        cntRsult += 0.1;
                    }
                    else
                    {
                        Progress.Value = 0.0;
                    }
                                        
                    icntR = (int)cntRsult / 3; 
                    GestureText.Text = result.Detected ? "잘 하고 있어요" : "좀 더 힘내요!"; //동작
                    GestureText1.Text = icntR.ToString(); //횟수
                    //ConfidenceText.Text = result.Confidence.ToString(); //정확도
                    if (result.Confidence == 1)
                        ConfidenceText.Text = "GOOD!";
                    else
                        ConfidenceText.Text = result.Confidence.ToString();

                    TrueOrFalse(icntR); //횟수에 따른 T/F 저장
                }
            }
        }

        private void TrueOrFalse(int count)
        {

            if (count > 3)
            {
                torf = 1;
            }
            else
            {
                torf = 0;
            }
        }

        private async void OnMultiFrame(MultiSourceFrameArrivedEventArgs args)
        {
            _bodiesProcessed = _colorFrameProcessed = false;

            using (var multiSourceFrame = args.FrameReference.AcquireFrame())
            {
                if (multiSourceFrame != null)
                {
                    if (!_gestureFrameSource.IsTrackingIdValid)
                    {                     
                        // For each skeleton being tracked get the ID and tell the face trackers to track that ID
                        using (var bodyFrame = multiSourceFrame.BodyFrameReference.AcquireFrame())
                        {
                            if (bodyFrame != null)
                            {
                                bodyFrame.GetAndRefreshBodyData(_bodies);
                                _bodiesProcessed = true;
                            }
                        }
                    }

                    using (var color = multiSourceFrame.ColorFrameReference.AcquireFrame()) //색상프레임참조가져옴
                    {
                        if (color != null)
                        {
                            FrameDescription colorFrameDescription = color.FrameDescription;

                            if (color.RawColorImageFormat == ColorImageFormat.Bgra)
                            {
                                color.CopyRawFrameDataToArray(_colorPixels); //원시 프레임 데이터를 제공된 배열로 복사
                            }
                            else
                            {
                                color.CopyConvertedFrameDataToArray(_colorPixels, ColorImageFormat.Bgra);
                            }

                            _colorFrameProcessed = true;
                        }
                    }
                }

                if (_bodiesProcessed == true)
                {
                    foreach (var body in _bodies)
                    {
                        if (body != null && body.IsTracked)
                        {
                            _gestureFrameSource.TrackingId = body.TrackingId;
                            _gestureFrameReader.IsPaused = false;
                            break;
                        }
                    }
                }

                if (_colorFrameProcessed == true)
                {
                    await Dispatcher.RunAsync(Windows.UI.Core.CoreDispatcherPriority.Normal, () =>
                     {
                         _colorPixels.CopyTo(_writeableBitmap.PixelBuffer);
                         _writeableBitmap.Invalidate();
                         MyImage.Source = _writeableBitmap;
                     });
                }
            }
        }

 //DB
        private void db_connection()
        {
            try
            {
                conn = "server=localhost; port=3306; database=kinect_db; user id=root; password=ki5786; SSLMode = None;";
                //              conn = "server=127.0.0.1; port=3306; database=health; user id=root; password=123456; SSLMode = None;";  // port:3306
                connect = new MySqlConnection(conn);
                connect.Open();
            }
            catch (MySqlException e)
            {
                throw;
            }
        }

        private async void Count_(string num) //스트레칭 횟수
        {
            string count_sql;
            MySqlCommand countCmd;
            db_connection();

            count_sql = "select count from streching where userNum=@num and str_name=@name and date=curdate()";
            try
            {
                countCmd = new MySqlCommand(count_sql, connect);
                countCmd.Parameters.AddWithValue("@num", num);
                countCmd.Parameters.AddWithValue("@name", gbd_name);
                MySqlDataReader rd = countCmd.ExecuteReader();

                if (rd.Read())
                {
                    count = rd.GetInt16("count");
                    _count = 1;
                }
                else
                {
                    count = 0;
                    _count = 0;
                }

                rd.Close();
                connect.Close();
            }
            catch (SqlException e)
            {
                MessageDialog Correct = new MessageDialog(e.Message);
                await Correct.ShowAsync();
            }


        }

        private async void InsertNew(string num, string type, string cnt,string torf) //스트레칭 DB 저장
        {
            Count_(num);

            using (MySqlConnection connection = new MySqlConnection(conn))
            {
                string sql;
                MySqlCommand insertCmd;
                db_connection();

                if (_count==1)
                {
                    sql = "update streching set count=@count where streching.userNum=@num and streching.str_name=@name";
                    insertCmd = new MySqlCommand(sql, connect);
                    insertCmd.Parameters.AddWithValue("@count", cnt);
                    insertCmd.Parameters.AddWithValue("@num", num);
                    insertCmd.Parameters.AddWithValue("@name", gbd_name);

                    if (insertCmd.ExecuteNonQuery() > 0)
                    {
                        MessageDialog Correct = new MessageDialog("---------DB 저장완료---------");
                        await Correct.ShowAsync();
                        connect.Close();
                    }
                    else
                    {
                        MessageDialog Correct = new MessageDialog("---------DB 저장실패---------");
                        await Correct.ShowAsync();
                        connect.Close();
                    }
                }
                else if(_count==0)
                {
                    sql = "Insert into streching (userNum,str_name,count,str_check,date) values (@num, @type,@cnt,@tf,curdate())";
                    insertCmd = new MySqlCommand(sql, connect);
                    insertCmd.Parameters.AddWithValue("@num", num);
                    insertCmd.Parameters.AddWithValue("@type", gbd_name);
                    insertCmd.Parameters.AddWithValue("@cnt", cnt);
                    insertCmd.Parameters.AddWithValue("@tf", torf);

                    if (insertCmd.ExecuteNonQuery() > 0)
                    {
                        MessageDialog Correct = new MessageDialog("---------DB 저장완료---------");
                        await Correct.ShowAsync();
                        connect.Close();
                    }
                    else
                    {
                        MessageDialog Correct = new MessageDialog("---------DB 저장실패---------");
                        await Correct.ShowAsync();
                        connect.Close();
                    }
                }
                             
            }

        }

        private async void Count_C(string num) //스트레칭 완료 횟수
        {
            string count_sql;
            MySqlCommand countCmd;
            db_connection();

            count_sql = "select count(str_check) count from streching where userNum=@num and str_check=1 and date=curdate()";
            try
            {
                countCmd = new MySqlCommand(count_sql, connect);
                countCmd.Parameters.AddWithValue("@num", num);
                MySqlDataReader rd = countCmd.ExecuteReader();

                if (rd.Read())
                {
                    str_c = rd.GetInt16("count");
                }

                rd.Close();
                connect.Close();
            }
            catch (SqlException e)
            {
                MessageDialog Correct = new MessageDialog(e.Message);
                await Correct.ShowAsync();
            }


        }

        private void InsertCal(string num) //캘린더 DB 저장
        {
            Count_C(num);
            using (MySqlConnection connection = new MySqlConnection(conn))
            {
                string sql;
                MySqlCommand insertCmd;
                db_connection();

                if (str_c == 1)
                {
                    sql = "Insert into calendar (userNum,date,c_num) values (@num,curdate(),@count)";
                    insertCmd = new MySqlCommand(sql, connect);
                    insertCmd.Parameters.AddWithValue("@num", num);
                    insertCmd.Parameters.AddWithValue("@count", str_c.ToString());

                    // connect.Close();

                    if (insertCmd.ExecuteNonQuery() > 0)
                    {
                        connect.Close();
                    }
                    else
                    {
                        connect.Close();
                    }

                }
                else if (str_c > 1)
                {
                    sql = "update calendar set c_num=@count where calendar.userNum=@num and date=curdate()";
                    insertCmd = new MySqlCommand(sql, connect);
                    insertCmd.Parameters.AddWithValue("@count", str_c.ToString());
                    insertCmd.Parameters.AddWithValue("@num", num);

                    if (insertCmd.ExecuteNonQuery() > 0)
                    {
                        connect.Close();
                    }
                    else
                    {
                        connect.Close();
                    }
                }
            }
        }
        private void save_Click(object sender, RoutedEventArgs e)
        {
            InsertNew(m_num,gbd_name, GestureText1.Text, torf.ToString());
            InsertCal(m_num);
        }
    }
}
