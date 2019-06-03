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
    public sealed partial class MainPage : Page
    {
        string conn;
        MySqlConnection connect;
        Info info;

        public MainPage()
        {
            this.InitializeComponent();
        }

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

        private async void LoginUser()
        {
            db_connection();
            string sql = "select userID,userPassword,userNum from user where userID=@id and userPassword=@pw";
            MySqlCommand cmd = new MySqlCommand(sql, connect); //아이디와 비밀번호가 같은 데이터 가져오기
            cmd.Parameters.AddWithValue("@id", id.Text);
            cmd.Parameters.AddWithValue("@pw", pw.Password);
            MySqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read()) //데이터가 있으면
            {
                string m_num = rd.GetString("userNum");
                info = new Info { num = m_num, gbd="k"}; //클래스 info에 회원번호 저장

                this.Frame.Navigate(typeof(st_List),info); //클래스 info 값 넘김

                rd.Close();
                connect.Close();
            }

            else //없으면
            {
                MessageDialog Correct = new MessageDialog("---------로그인 실패---------");
                await Correct.ShowAsync();

                rd.Close();
                connect.Close();
            }
        }

        private void login_button_Click(object sender, RoutedEventArgs e)
        {
            LoginUser();
        }
    }
}
