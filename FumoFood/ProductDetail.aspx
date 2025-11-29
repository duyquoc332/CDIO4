<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="FumoFood.ProductDetail" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="product-detail-container">
        <!-- Main Product Section -->
        <div class="product-main-section">
            <div class="container">
                <div class="row">
                    <!-- Product Image -->
                    <div class="col-md-6">
                        <div class="product-image-container">
                            <asp:Image ID="imgProduct" runat="server" CssClass="product-main-image" 
                                ImageUrl="~/Images/product-demo.jpg" AlternateText="Giá đồ - bịch 500g" />
                        </div>
                    </div>

                    <!-- Product Info -->
                    <div class="col-md-6">
                        <div class="product-info">
                            <h1 class="product-title">Giá đồ - bịch 500g</h1>
                            
                            <div class="product-meta">
                                <div class="meta-item">
                                    <span class="meta-label">Thương hiệu:</span>
                                    <span class="meta-value">bếp 0</span>
                                </div>
                                <div class="meta-item">
                                    <span class="meta-label">Tình trạng:</span>
                                    <span class="meta-value in-stock">Còn hàng</span>
                                </div>
                                <div class="meta-item price-item">
                                    <span class="meta-label">Giá:</span>
                                    <span class="product-price">55.000 đ</span>
                                </div>
                            </div>

                            <!-- Quantity and Actions -->
                            <div class="product-actions">
                                <div class="quantity-section">
                                    <label class="quantity-label">Số lượng</label>
                                    <div class="quantity-controls">
                                        <button class="quantity-btn minus">-</button>
                                        <input type="number" class="quantity-input" value="1" min="1" max="99">
                                        <button class="quantity-btn plus">+</button>
                                    </div>
                                </div>

                                <div class="action-buttons">
                                    <asp:Button ID="btnAddToCart" runat="server" Text="Thêm vào giỏ hàng" 
                                        CssClass="btn-add-cart" OnClick="btnAddToCart_Click" />
                                    <asp:Button ID="btnCheckout" runat="server" Text="Thanh toán" 
                                        CssClass="btn-checkout" OnClick="btnCheckout_Click" />
                                </div>
                            </div>

                            <!-- Login Reminder -->
                            <div class="login-reminder">
                                <div class="login-icon">🔒</div>
                                <div class="login-text">
                                    <strong>Đăng Nhập</strong><br>
                                    Duy nhất tại FUMO FOOD
                                </div>
                            </div>

                            <!-- Benefits -->
                            <div class="benefits-section">
                                <div class="benefit-item">
                                    <span class="benefit-icon">🚚</span>
                                    <span class="benefit-text">Free ship 5km cho đơn hàng từ 499k</span>
                                </div>
                                <div class="benefit-item">
                                    <span class="benefit-icon">⏱️</span>
                                    <span class="benefit-text">Giao hàng trong 2h</span>
                                </div>
                                <div class="benefit-item">
                                    <span class="benefit-icon">⭐</span>
                                    <span class="benefit-text">Tích điểm tất cả sản phẩm</span>
                                </div>
                                <div class="benefit-item">
                                    <span class="benefit-icon">🌿</span>
                                    <span class="benefit-text">Thực phẩm hữu cơ tốt cho sức khỏe</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Description -->
        <div class="product-description-section">
            <div class="container">
                <div class="description-content">
                    <h3 class="section-title">Mô tả</h3>
                    <p class="description-text">
                        Sản phẩm này có vị ngọt nhẹ, giòn, giàu dinh dưỡng như vitamin C, E, chất xơ, protein và các khoáng chất. 
                        Giá đồ được dùng phổ biến trong nhiều món ăn, từ ăn sống, xào, nấu canh đến các món nước như phở, hủ tiểu.
                    </p>
                </div>
            </div>
        </div>

        <!-- Similar Products -->
        <div class="similar-products-section">
            <div class="container">
                <h3 class="section-title">Sản phẩm tương tự</h3>
                <div class="similar-products-grid">
                    <div class="row">
                        <!-- Product 1 -->
                        <div class="col-md-3 col-sm-6">
                            <div class="similar-product-card">
                                <div class="product-image">
                                    <img src="Images/product-1.jpg" alt="Sản phẩm tương tự">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Tên sản phẩm</h4>
                                    <p class="product-price-similar">55.000 đ</p>
                                </div>
                            </div>
                        </div>
                        <!-- Product 2 -->
                        <div class="col-md-3 col-sm-6">
                            <div class="similar-product-card">
                                <div class="product-image">
                                    <img src="Images/product-2.jpg" alt="Sản phẩm tương tự">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Tên sản phẩm</h4>
                                    <p class="product-price-similar">55.000 đ</p>
                                </div>
                            </div>
                        </div>
                        <!-- Product 3 -->
                        <div class="col-md-3 col-sm-6">
                            <div class="similar-product-card">
                                <div class="product-image">
                                    <img src="Images/product-3.jpg" alt="Sản phẩm tương tự">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Tên sản phẩm</h4>
                                    <p class="product-price-similar">55.000 đ</p>
                                </div>
                            </div>
                        </div>
                        <!-- Product 4 -->
                        <div class="col-md-3 col-sm-6">
                            <div class="similar-product-card">
                                <div class="product-image">
                                    <img src="Images/product-4.jpg" alt="Sản phẩm tương tự">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">Tên sản phẩm</h4>
                                    <p class="product-price-similar">55.000 đ</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        /* Product Detail Styles */
        .product-detail-container {
            background-color: #f9fdf9;
            min-height: 100vh;
        }

        /* Main Product Section */
        .product-main-section {
            padding: 40px 0;
            background: white;
            margin-bottom: 2px;
        }

        .product-image-container {
            text-align: center;
            padding: 20px;
        }

        .product-main-image {
            max-width: 100%;
            height: auto;
            max-height: 400px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .product-info {
            padding: 20px;
        }

        .product-title {
            font-size: 28px;
            font-weight: 600;
            color: #2c5530;
            margin-bottom: 20px;
        }

        .product-meta {
            margin-bottom: 30px;
        }

        .meta-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .meta-label {
            font-weight: 500;
            color: #666;
            min-width: 100px;
        }

        .meta-value {
            color: #333;
        }

        .in-stock {
            color: #4CAF50;
            font-weight: 500;
        }

        .price-item {
            margin-top: 15px;
        }

        .product-price {
            font-size: 24px;
            font-weight: 600;
            color: #e74c3c;
        }

        /* Quantity and Actions */
        .product-actions {
            margin: 30px 0;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
        }

        .quantity-section {
            margin-bottom: 20px;
        }

        .quantity-label {
            display: block;
            font-weight: 500;
            margin-bottom: 10px;
            color: #333;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            max-width: 150px;
        }

        .quantity-btn {
            width: 40px;
            height: 40px;
            border: 1px solid #ddd;
            background: white;
            font-size: 18px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quantity-btn.minus {
            border-radius: 4px 0 0 4px;
        }

        .quantity-btn.plus {
            border-radius: 0 4px 4px 0;
        }

        .quantity-input {
            width: 60px;
            height: 40px;
            border: 1px solid #ddd;
            border-left: none;
            border-right: none;
            text-align: center;
            font-size: 16px;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .btn-add-cart, .btn-checkout {
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            flex: 1;
            min-width: 150px;
        }

        .btn-add-cart {
            background: #4CAF50;
            color: white;
        }

        .btn-add-cart:hover {
            background: #388E3C;
        }

        .btn-checkout {
            background: #e74c3c;
            color: white;
        }

        .btn-checkout:hover {
            background: #c0392b;
        }

        /* Login Reminder */
        .login-reminder {
            display: flex;
            align-items: center;
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 6px;
            padding: 15px;
            margin: 20px 0;
        }

        .login-icon {
            font-size: 24px;
            margin-right: 15px;
        }

        .login-text {
            color: #856404;
            font-size: 14px;
        }

        /* Benefits Section */
        .benefits-section {
            margin-top: 30px;
        }

        .benefit-item {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
            font-size: 14px;
            color: #555;
        }

        .benefit-icon {
            margin-right: 10px;
            font-size: 16px;
        }

        .benefit-text {
            flex: 1;
        }

        /* Product Description */
        .product-description-section {
            padding: 40px 0;
            background: white;
            margin-bottom: 2px;
        }

        .section-title {
            font-size: 22px;
            font-weight: 600;
            color: #2c5530;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #A2D998;
        }

        .description-text {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
            text-align: justify;
        }

        /* Similar Products */
        .similar-products-section {
            padding: 40px 0;
            background: white;
        }

        .similar-products-grid {
            margin-top: 30px;
        }

        .similar-product-card {
            border: 1px solid #eee;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
        }

        .similar-product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .similar-product-card .product-image {
            height: 180px;
            overflow: hidden;
            background: #f8f9fa;
        }

        .similar-product-card .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .similar-product-card .product-info {
            padding: 15px;
        }

        .product-name {
            font-size: 16px;
            font-weight: 500;
            color: #333;
            margin-bottom: 8px;
            height: 40px;
            overflow: hidden;
        }

        .product-price-similar {
            font-size: 16px;
            font-weight: 600;
            color: #e74c3c;
            margin: 0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .product-main-section {
                padding: 20px 0;
            }

            .product-title {
                font-size: 24px;
            }

            .product-price {
                font-size: 20px;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn-add-cart, .btn-checkout {
                width: 100%;
            }

            .quantity-controls {
                max-width: 100%;
            }

            .similar-product-card .product-image {
                height: 150px;
            }
        }

        @media (max-width: 576px) {
            .product-info {
                padding: 10px 0;
            }

            .product-actions {
                padding: 15px;
            }

            .login-reminder {
                flex-direction: column;
                text-align: center;
            }

            .login-icon {
                margin-right: 0;
                margin-bottom: 10px;
            }

            .similar-product-card {
                margin-bottom: 15px;
            }
        }
    </style>

    <script>
        // JavaScript for quantity controls
        document.addEventListener('DOMContentLoaded', function() {
            const minusBtn = document.querySelector('.quantity-btn.minus');
            const plusBtn = document.querySelector('.quantity-btn.plus');
            const quantityInput = document.querySelector('.quantity-input');

            if (minusBtn && plusBtn && quantityInput) {
                minusBtn.addEventListener('click', function() {
                    let currentValue = parseInt(quantityInput.value);
                    if (currentValue > 1) {
                        quantityInput.value = currentValue - 1;
                    }
                });

                plusBtn.addEventListener('click', function() {
                    let currentValue = parseInt(quantityInput.value);
                    if (currentValue < 99) {
                        quantityInput.value = currentValue + 1;
                    }
                });

                quantityInput.addEventListener('change', function() {
                    let value = parseInt(this.value);
                    if (isNaN(value) || value < 1) {
                        this.value = 1;
                    } else if (value > 99) {
                        this.value = 99;
                    }
                });
            }
        });
    </script>
</asp:Content>
