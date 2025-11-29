using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FumoFood
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in
                if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
                {
                    Response.Redirect("Login.aspx?returnUrl=" + Server.UrlEncode(Request.Url.ToString()));
                    return;
                }

                LoadUserInfo();
                LoadCities();
                CalculateTotals();
            }
        }

        private void LoadUserInfo()
        {
            // TODO: Load user information from database/session
            // For demo, we'll pre-fill with sample data
            if (Session["Username"] != null)
            {
                txtFullName.Text = Session["Username"].ToString();
                txtEmail.Text = "user@example.com";
                txtPhone.Text = "0905123456";
            }
        }

        private void LoadCities()
        {
            // TODO: Load cities from database
            // Sample data
            ddlCity.Items.Add(new ListItem("Hà Nội", "1"));
            ddlCity.Items.Add(new ListItem("TP. Hồ Chí Minh", "2"));
            ddlCity.Items.Add(new ListItem("Đà Nẵng", "3"));
            ddlCity.Items.Add(new ListItem("Cần Thơ", "4"));
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDistricts();
        }

        private void LoadDistricts()
        {
            ddlDistrict.Items.Clear();
            ddlDistrict.Items.Add(new ListItem("Chọn quận/huyện", ""));

            // TODO: Load districts based on selected city from database
            string cityId = ddlCity.SelectedValue;

            // Sample data
            if (cityId == "1") // Hà Nội
            {
                ddlDistrict.Items.Add(new ListItem("Ba Đình", "1"));
                ddlDistrict.Items.Add(new ListItem("Hoàn Kiếm", "2"));
                ddlDistrict.Items.Add(new ListItem("Hai Bà Trưng", "3"));
            }
            else if (cityId == "2") // TP.HCM
            {
                ddlDistrict.Items.Add(new ListItem("Quận 1", "4"));
                ddlDistrict.Items.Add(new ListItem("Quận 3", "5"));
                ddlDistrict.Items.Add(new ListItem("Quận 5", "6"));
            }
        }

        private void CalculateTotals()
        {
            // TODO: Calculate actual totals from cart
            decimal subtotal = 165000;
            decimal shipping = subtotal > 499000 ? 0 : 15000;
            decimal discount = 0;
            decimal total = subtotal + shipping - discount;

            lblSubtotal.Text = subtotal.ToString("#,##0 đ");
            lblShipping.Text = shipping.ToString("#,##0 đ");
            lblDiscount.Text = discount.ToString("#,##0 đ");
            lblTotal.Text = total.ToString("#,##0 đ");
        }

        protected void btnApplyPromo_Click(object sender, EventArgs e)
        {
            string promoCode = txtPromoCode.Text.Trim();

            if (string.IsNullOrEmpty(promoCode))
            {
                ShowPromoMessage("Vui lòng nhập mã giảm giá", false);
                return;
            }

            // TODO: Validate promo code from database
            if (promoCode.ToUpper() == "FUMO10")
            {
                decimal subtotal = 165000;
                decimal shipping = subtotal > 499000 ? 0 : 15000;
                decimal discount = subtotal * 0.1m;
                decimal total = subtotal + shipping - discount;

                lblDiscount.Text = discount.ToString("#,##0 đ");
                lblTotal.Text = total.ToString("#,##0 đ");

                ShowPromoMessage("Áp dụng mã giảm giá thành công! Giảm 10%", true);
            }
            else if (promoCode.ToUpper() == "FREESHIP")
            {
                decimal subtotal = 165000;
                decimal shipping = 0;
                decimal discount = 0;
                decimal total = subtotal + shipping - discount;

                lblShipping.Text = shipping.ToString("#,##0 đ");
                lblTotal.Text = total.ToString("#,##0 đ");

                ShowPromoMessage("Áp dụng mã miễn phí vận chuyển thành công!", true);
            }
            else
            {
                ShowPromoMessage("Mã giảm giá không hợp lệ", false);
            }
        }

        private void ShowPromoMessage(string message, bool isSuccess)
        {
            lblPromoMessage.Text = message;
            lblPromoMessage.CssClass = isSuccess ? "promo-message promo-success" : "promo-message promo-error";
            lblPromoMessage.Visible = true;
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                // Collect order information
                string fullName = txtFullName.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string email = txtEmail.Text.Trim();
                string address = txtAddress.Text.Trim();
                string city = ddlCity.SelectedItem.Text;
                string district = ddlDistrict.SelectedItem.Text;
                string note = txtNote.Text.Trim();
                string paymentMethod = rbCashOnDelivery.Checked ? "COD" : "BankTransfer";

                // TODO: Save order to database
                // TODO: Clear cart
                // TODO: Send confirmation email

                // Show success message and redirect
                Session["OrderSuccess"] = true;
                Response.Redirect("OrderSuccess.aspx");
            }
            catch (Exception ex)
            {
                // Log error
                ShowErrorMessage("Có lỗi xảy ra khi đặt hàng. Vui lòng thử lại.");
            }
        }

        private void ShowErrorMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showError",
                $"alert('{message}');", true);
        }
    }
}