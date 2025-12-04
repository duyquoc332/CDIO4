using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;
using System.Data.SqlClient;

namespace FumoFood
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Pre-fill user information if logged in
                if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
                {
                    if (Session["Username"] != null)
                    {
                        txtFullName.Text = Session["Username"].ToString();
                    }
                    if (Session["Email"] != null)
                    {
                        txtEmail.Text = Session["Email"].ToString();
                    }
                }
            }
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                // Collect form data
                string fullName = txtFullName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string message = txtMessage.Text.Trim();

                // TODO: Save contact message to database
                SaveContactToDatabase(fullName, email, phone, message);

                // TODO: Send email notification (optional)
                SendEmailNotification(fullName, email, phone, message);

                // Show success message
                ShowMessage("Cảm ơn bạn đã liên hệ! Chúng tôi sẽ phản hồi sớm nhất có thể.", true);

                // Clear form
                ClearForm();
            }
            catch (Exception ex)
            {
                // Log error
                System.Diagnostics.Debug.WriteLine($"Contact form error: {ex.Message}");

                // Show error message
                ShowMessage("Có lỗi xảy ra khi gửi tin nhắn. Vui lòng thử lại sau.", false);
            }
        }

        private void SaveContactToDatabase(string fullName, string email, string phone, string message)
        {
            // TODO: Implement database saving logic
            // Example using ADO.NET or Entity Framework

            
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO ContactMessages (FullName, Email, Phone, Message, CreatedDate, IsRead) 
                               VALUES (@FullName, @Email, @Phone, @Message, @CreatedDate, @IsRead)";
                
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phone ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@Message", message);
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@IsRead", false);
                    
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            
        }

        private void SendEmailNotification(string fullName, string email, string phone, string message)
        {
            // TODO: Implement email sending logic
            // This is optional and depends on your email configuration

            
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("noreply@fumofood.com");
                mail.To.Add("abc123@gmail.com"); // Your contact email
                mail.Subject = $"Liên hệ mới từ {fullName}";
                mail.Body = $@"
                    Thông tin liên hệ mới từ website FUMO FOOD:
                    
                    Họ và tên: {fullName}
                    Email: {email}
                    Số điện thoại: {phone ?? "Không cung cấp"}
                    
                    Nội dung:
                    {message}
                    
                    Thời gian: {DateTime.Now.ToString("dd/MM/yyyy HH:mm")}
                ";
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient("your-smtp-server");
                // Configure SMTP settings in web.config
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                // Log email error but don't show to user
                System.Diagnostics.Debug.WriteLine($"Email sending error: {ex.Message}");
            }
            
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = isSuccess ? "message-label message-success" : "message-label message-error";
            lblMessage.Visible = true;

            // Scroll to message
            ScriptManager.RegisterStartupScript(this, this.GetType(), "scrollToMessage",
                "setTimeout(function() { document.getElementById('" + lblMessage.ClientID + "').scrollIntoView({ behavior: 'smooth' }); }, 100);", true);
        }

        private void ClearForm()
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                txtFullName.Text = "";
                txtEmail.Text = "";
            }
            txtPhone.Text = "";
            txtMessage.Text = "";
        }
    }
}