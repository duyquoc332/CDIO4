using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FumoFood
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XuLyKetNoi kn = new XuLyKetNoi();

            //ktra loading
            if (!Page.IsPostBack)
            {
                // Load tất cả danh mục
                string q = "SELECT * FROM DanhMuc";
                DataList1.DataSource = kn.GetData(q);
                DataList1.DataBind();

                // Load tất cả sản phẩm khi mới vào trang
                string q_sp = "SELECT * FROM SanPham";
                DataList2.DataSource = kn.GetData(q_sp);
                DataList2.DataBind();
            }

            //Hiển thị danh mục sản phẩm
            try
            {
                string q = "select * from DanhMuc";
                this.DataList1.DataSource = kn.GetData(q);
                this.DataList1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi tải danh mục: " + ex.Message);
            }

            //Hiển thị sản phẩm
            string q_sanpham;
            if (Context.Items["sp"] == null)
            {
                q_sanpham = "select * from SanPham";
            }
            else
            {
                string sanpham = Context.Items["sp"].ToString();
                q_sanpham = "select * from SanPham where MaDanhMuc = '" + sanpham + "'";
            }

            try
            {
                this.DataList2.DataSource = kn.GetData(q_sanpham);
                this.DataList2.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("Lỗi tải sản phẩm: " + ex.Message);
            }
        }

        //Lọc danh mục
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "chonDM")
            {
                string maDM = e.CommandArgument.ToString();

                XuLyKetNoi kn = new XuLyKetNoi();

                // Lọc sản phẩm theo danh mục
                string q = "SELECT * FROM SanPham WHERE MaDanhMuc = '" + maDM + "'";

                DataList2.DataSource = kn.GetData(q);
                DataList2.DataBind();
            }
        }
    }
}