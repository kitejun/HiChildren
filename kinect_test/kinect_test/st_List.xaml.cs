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
using Windows.UI.Xaml.Navigation;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

// 빈 페이지 항목 템플릿에 대한 설명은 http://go.microsoft.com/fwlink/?LinkId=234238 에 나와 있습니다.

namespace kinect_test
{
    /// <summary>
    /// 자체에서 사용하거나 프레임 내에서 탐색할 수 있는 빈 페이지입니다.
    /// </summary>
    public sealed partial class st_List : Page
    {
        string gbd_type;
        string gbd_name;
        string m_num;
        Info main_info;

        string conn;
        MySqlConnection connect;

        public st_List()
        {
            this.InitializeComponent();

        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            gbd_type = "kinect1";
            var st_info = new Info { num = m_num, gbd = gbd_type };
            this.Frame.Navigate(typeof(Stretching), st_info);
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            gbd_type = "salute";
            var st_info = new Info { num = m_num, gbd = gbd_type };
            this.Frame.Navigate(typeof(Stretching), st_info);
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            main_info = (Info)e.Parameter;

            gbd_name = main_info.gbd;
            m_num = main_info.num;

            Check_Select(m_num); //스트레칭 완료 확인 함수

            base.OnNavigatedTo(e);
        }

        //db
        private void db_connection()
        {
            try
            {
                conn = "server=localhost; port=3306; database=kinect_db; user id=yujin; password=1234; SSLMode = None;";
                //              conn = "server=127.0.0.1; port=3306; database=health; user id=root; password=123456; SSLMode = None;";  // port:3306
                connect = new MySqlConnection(conn);
                connect.Open();
            }
            catch (MySqlException e)
            {
                throw;
            }
        }

        private async void Check_Select(string num)
        {
            db_connection();
            string st_name;
            Boolean st_ck;
            string sql = "select s.str_check,s.str_name from streching s,user m where m.userNum=@num and m.userNum=s.userNum and s.date=curdate()";

            try
            {
                MySqlCommand cmd = new MySqlCommand(sql, connect); 
                cmd.Parameters.AddWithValue("@num", num);
                MySqlDataReader rd = cmd.ExecuteReader();

               while (rd.Read())
               {

                    st_name = rd.GetString("str_name");
                    st_ck = rd.GetBoolean("str_check");
                                       
                    _Check(st_name, st_ck); //체크박스 체크
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

        private void _Check(string name,Boolean torf)
        {
            if (torf == true) //스트레칭 완료 시
            {
                switch (name)
                {
                    case "kinect1":
                        kinect1Check.IsChecked = true;
                        break;
                    case "salute":
                        saluteCheck.IsChecked = true;
                        break;
                }
            }
        }

        private void logout_Click(object sender, RoutedEventArgs e)
        {
            this.Frame.Navigate(typeof(MainPage));
        }

        
    }
}
           




