using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FumoFood
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            string message = txtMessage.Text;

            // Thông báo giả lập (chưa lưu DB)
            Response.Write("<script>alert('Gửi tin nhắn thành công! Cảm ơn bạn đã liên hệ với FUMO FOOD');</script>");

            txtName.Text = txtEmail.Text = txtPhone.Text = txtMessage.Text = "";
        }
    }
}