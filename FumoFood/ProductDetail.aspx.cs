using System;
using System.Web.UI;

namespace FumoFood
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load product details from database based on product ID
                LoadProductDetails();
            }
        }

        private void LoadProductDetails()
        {
            // TODO: Load actual product details from database
            // For demo purposes, we'll use hardcoded values
            
            string productId = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(productId))
            {
                // Load product from database
                // imgProduct.ImageUrl = product.ImageUrl;
                // etc.
            }
            
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx?returnUrl=" + Server.UrlEncode(Request.Url.ToString()));
                return;
            }

            // TODO: Add product to cart logic
            int quantity = Convert.ToInt32(Request.Form["quantity-input"] ?? "1");
            // Add to cart implementation

            // Show success message
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCart",
                "alert('Sản phẩm đã được thêm vào giỏ hàng!');", true);
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx?returnUrl=" + Server.UrlEncode(Request.Url.ToString()));
                return;
            }

            // TODO: Direct checkout logic
            int quantity = Convert.ToInt32(Request.Form["quantity-input"] ?? "1");
            // Redirect to checkout page with product details
            Response.Redirect("Checkout.aspx?productId=1&quantity=" + quantity);
        }
    }
}