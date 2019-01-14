using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// 빈 페이지 항목 템플릿에 대한 설명은 http://go.microsoft.com/fwlink/?LinkId=234238 에 나와 있습니다.

namespace Eleven
{
    /// <summary>
    /// 자체에서 사용하거나 프레임 내에서 탐색할 수 있는 빈 페이지입니다.
    /// </summary>
    public sealed partial class List : Page
    {
        string gbd_type = null;
        public List()
        {
                this.InitializeComponent();
        }
        //
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            if (e.Parameter == null)
                gbd_type = null;
            else
                gbd_type = null;

            base.OnNavigatedTo(e);
        }
        //
        private void button_Click1(object sender, RoutedEventArgs e)
        {
            gbd_type = "kinect1";
            this.Frame.Navigate(typeof(MainPage), gbd_type);
        }

        private void button_Click2(object sender, RoutedEventArgs e)
        {
            gbd_type = "salute";
            this.Frame.Navigate(typeof(MainPage), gbd_type);
        }
            private void Back_Main_button(object sender, RoutedEventArgs e)
        {
            this.Frame.Navigate(typeof(Main));
        }
    }
}
