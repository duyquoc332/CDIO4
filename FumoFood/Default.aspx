<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FumoFood._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .category-list .list-group-item {
            background-color: #D6EBC5; /* Màu xanh nhạt cho menu */
            border: 1px solid #A2D998;
            color: #333;
            font-weight: bold;
        }
        .main-banner {
            width: 100%;
            height: 250px;
            background-color: #8BC380; /* Màu nền banner nếu chưa có ảnh */
            background-image: url('Images/banner.jpg'); /* Đặt đường dẫn ảnh banner của bạn ở đây */
            background-size: cover;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.5);
            margin-bottom: 20px;
        }
        .section-title {
            color: #2E7D32;
            border-bottom: 2px solid #2E7D32;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }
        
        /* Box sản phẩm */
        .product-box {
            background: #E8F5E9;
            border: 1px solid #C8E6C9;
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .product-img {
            background: #ccc;
            height: 120px;
            width: 100%;
            margin-bottom: 10px;
            display: flex; 
            align-items: center; 
            justify-content: center;
        }
    </style>
    <div class="row">
        <div class="col-md-3">
            <div class="list-group category-list">
                <a href="#" class="list-group-item">Danh mục 1</a>
                <a href="#" class="list-group-item">Danh mục 2</a>
                <a href="#" class="list-group-item">Danh mục 3</a>
                <a href="#" class="list-group-item">Danh mục 4</a>
                <a href="#" class="list-group-item">Danh mục 5</a>
            </div>
        </div>

        <div class="col-md-9">
            <div class="main-banner">
                <div style="text-align:center;">
                    <h1>Thực phẩm từ thiên nhiên</h1>
                    <p>Bảo vệ sức khỏe - Cuộc sống luôn đẹp</p>
                    <button class="btn btn-success">Xem ngay</button>
                </div>
            </div>

            <h3 class="section-title">Kiểu Sản phẩm</h3>
            
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="product-box">
                        <div class="product-img">Hình ảnh</div>
                        <h5>Tên Sản Phẩm</h5>
                        <p style="color:red; font-weight:bold;">Giá Tiền</p>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="product-box">
                        <div class="product-img">Hình ảnh</div>
                        <h5>Tên Sản Phẩm</h5>
                        <p style="color:red; font-weight:bold;">Giá Tiền</p>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="product-box">
                        <div class="product-img">Hình ảnh</div>
                        <h5>Tên Sản Phẩm</h5>
                        <p style="color:red; font-weight:bold;">Giá Tiền</p>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="product-box">
                        <div class="product-img">Hình ảnh</div>
                        <h5>Tên Sản Phẩm</h5>
                        <p style="color:red; font-weight:bold;">Giá Tiền</p>
                    </div>
                </div>
            </div>
             <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="product-box">
                        <div class="product-img">Hình ảnh</div>
                        <h5>Tên Sản Phẩm</h5>
                        <p style="color:red; font-weight:bold;">Giá Tiền</p>
                    </div>
                </div>
                </div>

        </div>
    </div>

</asp:Content>
