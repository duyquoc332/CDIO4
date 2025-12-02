using System;
using System.Web.UI;

namespace FumoFood
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra nếu người dùng đã đăng nhập thì chuyển hướng
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text;

                // Gọi phương thức xác thực người dùng
                if (AuthenticateUser(username, password))
                {
                    // Đăng nhập thành công
                    Session["IsLoggedIn"] = true;
                    Session["Username"] = username;
                    lblMessage.Text = "Đăng nhập thành công!";
                    lblMessage.CssClass = "message-label message-success";
                    lblMessage.Visible = true;

                    // Chuyển hướng sau 1 giây
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                        "setTimeout(function(){ window.location.href = 'Default.aspx'; }, 1000);", true);
                }
                else
                {
                    // Đăng nhập thất bại
                    lblMessage.Text = "Tên đăng nhập hoặc mật khẩu không đúng!";
                    lblMessage.CssClass = "message-label message-error";
                    lblMessage.Visible = true;
                }
            }
        }

        private bool AuthenticateUser(string username, string password)
        {
            // TODO: Thay thế bằng logic xác thực thực tế
            // Ví dụ: Kiểm tra trong database
            // Tạm thời sử dụng giá trị mẫu
            return (username == "demo" && password == "demo");

            // Code thực tế có thể như sau:
            
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(1) FROM Users WHERE Username=@Username AND Password=@Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", HashPassword(password)); // Nên hash mật khẩu
                    conn.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    return count > 0;
                }
            }
            
        }
    }
}