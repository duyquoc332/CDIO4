using System;
using System.Web.UI;

namespace FumoFood
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Khởi tạo trang
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string username = txtUsername.Text.Trim();
                    string password = txtPassword.Text;
                    string confirmPassword = txtConfirmPassword.Text;

                    // Kiểm tra mật khẩu khớp
                    if (password != confirmPassword)
                    {
                        ShowMessage("Mật khẩu không khớp! Vui lòng kiểm tra lại.", "error");
                        return;
                    }

                    // Kiểm tra độ dài mật khẩu
                    if (password.Length < 6)
                    {
                        ShowMessage("Mật khẩu phải có ít nhất 6 ký tự!", "error");
                        return;
                    }

                    // TODO: Thêm logic đăng ký vào database
                    // bool isRegistered = UserService.RegisterUser(username, password);

                    // Tạm thời giả lập đăng ký thành công
                    bool isRegistered = true;

                    if (isRegistered)
                    {
                        ShowMessage("Đăng ký tài khoản thành công! Bạn có thể đăng nhập ngay bây giờ.", "success");
                        ClearForm();
                    }
                    else
                    {
                        ShowMessage("Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác.", "error");
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("Lỗi hệ thống: " + ex.Message, "error");
                }
            }
        }

        protected void btnLoginHeader_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void ibCart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }

        protected void ibPhone_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Contact.aspx");
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "message-label " + (type == "success" ? "message-success" : "message-error");
            lblMessage.Visible = true;
        }

        private void ClearForm()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}