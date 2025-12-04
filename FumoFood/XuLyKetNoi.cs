using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FumoFood
{
    public class XuLyKetNoi:System.Web.UI.Page
    {
        SqlConnection conn;

        //Xây dựng hàm mở kết nối
        private void connect()
        {
            string path = Page.Server.MapPath("App_Data");
            path += "\\Database1.mdf";
            conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + path + ";Integrated Security=True");
            conn.Open();
        }

        //Xây dựng hàm đóng kết nối
        private void close_connect()
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }

        //Lấy dữ liệu, tham số truyền vào sql
        public DataTable GetData(string q)
        {
            DataTable dt = new DataTable();
            try
            {
                connect();
                SqlDataAdapter da = new SqlDataAdapter(q, conn);
                da.Fill(dt);
            }
            catch
            {
                dt = null;
            }
            finally
            {
                close_connect();
            }
            return dt;
        }
    }
}