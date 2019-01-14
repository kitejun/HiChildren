﻿using Microsoft.Kinect.VisualGestureBuilder;
using System;
using System.Reactive.Concurrency;
using System.Reactive.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Media.Imaging;
using Windows.UI.Xaml.Navigation;
using WindowsPreview.Kinect;

// 빈 페이지 항목 템플릿에 대한 설명은 http://go.microsoft.com/fwlink/?LinkId=234238 에 나와 있습니다.

namespace Eleven
{
    /// <summary>
    /// 자체에서 사용하거나 프레임 내에서 탐색할 수 있는 빈 페이지입니다.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        KinectSensor _kinect;
        MultiSourceFrameReader _multiFrameReader;
        IDisposable _multiFrameSubscription;

        Body[] _bodies = new Body[6];
        byte[] _colorPixels;
        uint _bytesPerPixel;

        bool _colorFrameProcessed;
        bool _bodiesProcessed;

        string gbdFile;

        WriteableBitmap _writeableBitmap;
        VisualGestureBuilderDatabase _gestureDatabase;
        VisualGestureBuilderFrameSource _gestureFrameSource;
        VisualGestureBuilderFrameReader _gestureFrameReader;

        Gesture _saluteProgress;
        Gesture _salute;

        public MainPage()
        {
            this.InitializeComponent();
            Loaded += MainPage_Loaded;
          Unloaded += MainPage_Unloaded;
        }
        //
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {

            if (e.Parameter is string)
            {
                gbdFile = e.Parameter.ToString() + ".gbd";
                state.Text = e.Parameter.ToString() + ".gbd";
            }
            else
            {
                state.Text = "실패";
                gbdFile = "kinect1.gbd";
            }
            base.OnNavigatedTo(e);
        }
        //
        void MainPage_Unloaded(object sender, RoutedEventArgs e)
        {
            if (_multiFrameSubscription != null)
                _multiFrameSubscription.Dispose();

            _kinect.Close();
            _kinect = null;

            _multiFrameReader.Dispose();
            _multiFrameReader = null;
        }

        void MainPage_Loaded(object sender, RoutedEventArgs evt)
        {
            _kinect = KinectSensor.GetDefault();

            // We need at least body data in order to get the tracking ID for face tracking..
            _multiFrameReader = _kinect.OpenMultiSourceFrameReader(FrameSourceTypes.Body | FrameSourceTypes.Color);

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

            _gestureDatabase = new VisualGestureBuilderDatabase(@"Gestures/"+ gbdFile);
            _gestureFrameSource = new VisualGestureBuilderFrameSource(_kinect, 0);

            // Add all gestures in the database to the framesource..
            _gestureFrameSource.AddGestures(_gestureDatabase.AvailableGestures);

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
            _gestureFrameReader.FrameArrived += reader_FrameArrived;

            _kinect.Open();
        }

        void reader_FrameArrived(VisualGestureBuilderFrameReader sender, VisualGestureBuilderFrameArrivedEventArgs args)
        {
            using (var frame = args.FrameReference.AcquireFrame())
            {
                if (frame != null && frame.DiscreteGestureResults != null)
                {
                    var result = frame.DiscreteGestureResults[_salute];

                    if (result.Detected == true)
                    {
                        var progressResult = frame.ContinuousGestureResults[_saluteProgress];
                        Progress.Value = progressResult.Progress;
                    }
                    else
                    {
                        Progress.Value = 0.0;
                    }

                    GestureText.Text = result.Detected ? "TRUE" : "FALSE";
                    ConfidenceText.Text = result.Confidence.ToString();
                }
            }
        }

        private void OnMultiFrame(MultiSourceFrameArrivedEventArgs args)
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

                    using (var color = multiSourceFrame.ColorFrameReference.AcquireFrame())
                    {
                        if (color != null)
                        {
                            FrameDescription colorFrameDescription = color.FrameDescription;

                            if (color.RawColorImageFormat == ColorImageFormat.Bgra)
                            {
                                color.CopyRawFrameDataToArray(_colorPixels);
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
                    Dispatcher.RunAsync(Windows.UI.Core.CoreDispatcherPriority.Normal, () =>
                    {
                        _colorPixels.CopyTo(_writeableBitmap.PixelBuffer);
                        _writeableBitmap.Invalidate();
                        MyImage.Source = _writeableBitmap;
                    });
                }
            }
        }

        private void Back_button(object sender, RoutedEventArgs e)
        {
            this.Frame.Navigate(typeof(List));
        }
    }
}