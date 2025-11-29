using System;
using System.Collections.Generic;
using System.Web.UI;

namespace FumoFood
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
                CalculateTotals();
            }
        }

        private void LoadCartItems()
        {
            // TODO: Load actual cart items from database or session
            // For demo purposes, we'll create sample data
            var cartItems = new List<CartItem>
            {
                new CartItem { ProductId = 1, ProductName = "Giá đồ - bịch 500g", Price = 55000, Quantity = 2, ImageUrl = "~/Images/product-demo.jpg" },
                new CartItem { ProductId = 2, ProductName = "Rau muống hữu cơ", Price = 25000, Quantity = 1, ImageUrl = "~/Images/product-demo2.jpg" },
                new CartItem { ProductId = 3, ProductName = "Cà chua bi", Price = 35000, Quantity = 3, ImageUrl = "~/Images/product-demo3.jpg" }
            };

            if (cartItems.Count > 0)
            {
                rptCartItems.DataSource = cartItems;
                rptCartItems.DataBind();
                pnlEmptyCart.Visible = false;
            }
            else
            {
                pnlEmptyCart.Visible = true;
            }
        }

        private void CalculateTotals()
        {
            // TODO: Calculate actual totals from cart items
            decimal subtotal = 165000; // Sample calculation
            decimal shipping = subtotal > 499000 ? 0 : 15000; // Free shipping over 499k
            decimal discount = 0;
            decimal total = subtotal + shipping - discount;

            lblSubtotal.Text = subtotal.ToString("#,##0 đ");
            lblShipping.Text = shipping.ToString("#,##0 đ");
            lblDiscount.Text = discount.ToString("#,##0 đ");
            lblTotal.Text = total.ToString("#,##0 đ");
        }

        protected void btnIncrease_Click(object sender, EventArgs e)
        {
            // TODO: Increase quantity logic
            var button = (System.Web.UI.WebControls.Button)sender;
            string productId = button.CommandArgument;
            // Increase quantity in database/session
            LoadCartItems();
            CalculateTotals();
        }

        protected void btnDecrease_Click(object sender, EventArgs e)
        {
            // TODO: Decrease quantity logic
            var button = (System.Web.UI.WebControls.Button)sender;
            string productId = button.CommandArgument;
            // Decrease quantity in database/session
            LoadCartItems();
            CalculateTotals();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            // TODO: Remove item from cart logic
            var button = (System.Web.UI.WebControls.Button)sender;
            string productId = button.CommandArgument;
            // Remove item from database/session
            LoadCartItems();
            CalculateTotals();
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
                // Apply 10% discount
                decimal subtotal = 165000;
                decimal discount = subtotal * 0.1m;
                decimal shipping = subtotal > 499000 ? 0 : 15000;
                decimal total = subtotal + shipping - discount;

                lblDiscount.Text = discount.ToString("#,##0 đ");
                lblTotal.Text = total.ToString("#,##0 đ");

                ShowPromoMessage("Áp dụng mã giảm giá thành công!", true);
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

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx?returnUrl=" + Server.UrlEncode(Request.Url.ToString()));
                return;
            }

            // TODO: Proceed to checkout
            Response.Redirect("Checkout.aspx");
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx");
        }
    }

    // Cart Item Model
    public class CartItem
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public string ImageUrl { get; set; }
    }
}