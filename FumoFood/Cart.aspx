<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FumoFood.Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cart-container">
        <!-- Breadcrumb -->
        <div class="breadcrumb-section">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="Shop.aspx">Shop</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Cart Title -->
        <div class="cart-title-section">
            <div class="container">
                <h1 class="cart-title">Giỏ hàng</h1>
            </div>
        </div>

        <!-- Cart Content -->
        <div class="cart-content-section">
            <div class="container">
                <div class="row">
                    <!-- Cart Items -->
                    <div class="col-lg-8">
                        <div class="cart-items">
                            <asp:Repeater ID="rptCartItems" runat="server">
                                <ItemTemplate>
                                    <div class="cart-item">
                                        <div class="item-image">
                                            <asp:Image ID="imgProduct" runat="server" 
                                                ImageUrl='<%# Eval("ImageUrl") %>' 
                                                AlternateText='<%# Eval("ProductName") %>'
                                                CssClass="product-image" />
                                        </div>
                                        <div class="item-details">
                                            <h3 class="product-name"><%# Eval("ProductName") %></h3>
                                            <div class="quantity-controls">
                                                <span class="quantity-label">Số lượng:</span>
                                                <div class="quantity-input-group">
                                                    <asp:Button ID="btnDecrease" runat="server" Text="-" 
                                                        CssClass="quantity-btn minus" CommandArgument='<%# Eval("ProductId") %>'
                                                        OnClick="btnDecrease_Click" />
                                                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>'
                                                        CssClass="quantity-input" ReadOnly="true"></asp:TextBox>
                                                    <asp:Button ID="btnIncrease" runat="server" Text="+" 
                                                        CssClass="quantity-btn plus" CommandArgument='<%# Eval("ProductId") %>'
                                                        OnClick="btnIncrease_Click" />
                                                </div>
                                            </div>
                                            <div class="price-section">
                                                <span class="price"><%# Eval("Price", "{0:#,##0} đ") %></span>
                                            </div>
                                        </div>
                                        <div class="item-actions">
                                            <asp:Button ID="btnRemove" runat="server" Text="×" 
                                                CssClass="remove-btn" CommandArgument='<%# Eval("ProductId") %>'
                                                OnClick="btnRemove_Click" />
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <!-- Empty Cart Message -->
                            <asp:Panel ID="pnlEmptyCart" runat="server" CssClass="empty-cart-message" Visible="false">
                                <div class="empty-cart-content">
                                    <div class="empty-cart-icon">🛒</div>
                                    <h3>Giỏ hàng trống</h3>
                                    <p>Bạn chưa có sản phẩm nào trong giỏ hàng</p>
                                    <asp:Button ID="btnContinueShopping" runat="server" Text="Tiếp tục mua sắm" 
                                        CssClass="btn-continue-shopping" OnClick="btnContinueShopping_Click" />
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <!-- Cart Summary -->
                    <div class="col-lg-4">
                        <div class="cart-summary">
                            <h3 class="summary-title">Giá tiền</h3>
                            
                            <div class="summary-items">
                                <div class="summary-item">
                                    <span class="item-label">Tổng giá trị sản phẩm</span>
                                    <span class="item-value">
                                        <asp:Label ID="lblSubtotal" runat="server" Text="0 đ"></asp:Label>
                                    </span>
                                </div>
                                
                                <div class="summary-item">
                                    <span class="item-label">Shipping</span>
                                    <span class="item-value">
                                        <asp:Label ID="lblShipping" runat="server" Text="0 đ"></asp:Label>
                                    </span>
                                </div>
                                
                                <div class="summary-item">
                                    <span class="item-label">Discount</span>
                                    <span class="item-value discount">
                                        <asp:Label ID="lblDiscount" runat="server" Text="0 đ"></asp:Label>
                                    </span>
                                </div>

                                <!-- Promocode Section -->
                                <div class="promocode-section">
                                    <div class="promocode-header">
                                        <span class="item-label">Promocode</span>
                                    </div>
                                    <div class="promocode-input-group">
                                        <asp:TextBox ID="txtPromoCode" runat="server" 
                                            CssClass="promo-input" placeholder="Nhập mã giảm giá"></asp:TextBox>
                                        <asp:Button ID="btnApplyPromo" runat="server" Text="Apply" 
                                            CssClass="btn-apply-promo" OnClick="btnApplyPromo_Click" />
                                    </div>
                                    <asp:Label ID="lblPromoMessage" runat="server" CssClass="promo-message" Visible="false"></asp:Label>
                                </div>

                                <div class="summary-divider"></div>
                                
                                <div class="summary-item total">
                                    <span class="item-label">Thành tiền</span>
                                    <span class="item-value total-price">
                                        <asp:Label ID="lblTotal" runat="server" Text="0 đ"></asp:Label>
                                    </span>
                                </div>
                            </div>

                            <!-- Checkout Button -->
                            <div class="checkout-section">
                                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" 
                                    CssClass="btn-checkout" OnClick="btnCheckout_Click" />
                            </div>

                            <!-- Continue Shopping -->
                            <div class="continue-shopping">
                                <asp:HyperLink ID="hlContinueShopping" runat="server" 
                                    NavigateUrl="~/Shop.aspx" CssClass="continue-link">
                                    ← Tiếp tục mua sắm
                                </asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        /* Cart Container */
        .cart-container {
            background-color: #f9fdf9;
            min-height: 100vh;
            padding-bottom: 40px;
        }

        /* Breadcrumb */
        .breadcrumb-section {
            padding: 20px 0;
            background: white;
            border-bottom: 1px solid #eee;
        }

        .breadcrumb {
            background: none;
            padding: 0;
            margin: 0;
            font-size: 14px;
        }

        .breadcrumb-item a {
            color: #4CAF50;
            text-decoration: none;
        }

        .breadcrumb-item.active {
            color: #666;
        }

        /* Cart Title */
        .cart-title-section {
            padding: 30px 0;
            background: white;
            border-bottom: 1px solid #eee;
        }

        .cart-title {
            font-size: 32px;
            font-weight: 600;
            color: #2c5530;
            margin: 0;
        }

        /* Cart Content */
        .cart-content-section {
            padding: 40px 0;
        }

        /* Cart Items */
        .cart-items {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 20px 0;
            border-bottom: 1px solid #eee;
            position: relative;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-image {
            flex: 0 0 100px;
            margin-right: 20px;
        }

        .product-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #eee;
        }

        .item-details {
            flex: 1;
        }

        .product-name {
            font-size: 18px;
            font-weight: 500;
            color: #333;
            margin-bottom: 10px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }

        .quantity-label {
            font-size: 14px;
            color: #666;
            margin-right: 10px;
            min-width: 70px;
        }

        .quantity-input-group {
            display: flex;
            align-items: center;
        }

        .quantity-btn {
            width: 35px;
            height: 35px;
            border: 1px solid #ddd;
            background: white;
            font-size: 16px;
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
            width: 50px;
            height: 35px;
            border: 1px solid #ddd;
            border-left: none;
            border-right: none;
            text-align: center;
            font-size: 14px;
            background: #f9f9f9;
        }

        .price-section {
            margin-top: 5px;
        }

        .price {
            font-size: 18px;
            font-weight: 600;
            color: #e74c3c;
        }

        .item-actions {
            position: absolute;
            top: 20px;
            right: 0;
        }

        .remove-btn {
            background: #ff4757;
            color: white;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            font-size: 18px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .remove-btn:hover {
            background: #ff3742;
        }

        /* Empty Cart */
        .empty-cart-message {
            text-align: center;
            padding: 60px 20px;
        }

        .empty-cart-icon {
            font-size: 80px;
            margin-bottom: 20px;
        }

        .empty-cart-content h3 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .empty-cart-content p {
            color: #666;
            margin-bottom: 30px;
        }

        .btn-continue-shopping {
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 12px 30px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-continue-shopping:hover {
            background: #388E3C;
        }

        /* Cart Summary */
        .cart-summary {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 20px;
        }

        .summary-title {
            font-size: 22px;
            font-weight: 600;
            color: #2c5530;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #A2D998;
        }

        .summary-items {
            margin-bottom: 25px;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .summary-item.total {
            font-size: 18px;
            font-weight: 600;
            margin-top: 10px;
        }

        .item-label {
            color: #333;
        }

        .item-value {
            color: #333;
            font-weight: 500;
        }

        .discount {
            color: #4CAF50;
        }

        .total-price {
            color: #e74c3c;
            font-size: 20px;
        }

        .summary-divider {
            height: 1px;
            background: #eee;
            margin: 15px 0;
        }

        /* Promocode Section */
        .promocode-section {
            margin: 20px 0;
        }

        .promocode-header {
            margin-bottom: 10px;
        }

        .promocode-input-group {
            display: flex;
            gap: 10px;
        }

        .promo-input {
            flex: 1;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .btn-apply-promo {
            background: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-apply-promo:hover {
            background: #2980b9;
        }

        .promo-message {
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }

        .promo-success {
            color: #4CAF50;
        }

        .promo-error {
            color: #e74c3c;
        }

        /* Checkout Section */
        .checkout-section {
            margin: 25px 0;
        }

        .btn-checkout {
            width: 100%;
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 15px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-checkout:hover {
            background: #c0392b;
        }

        /* Continue Shopping */
        .continue-shopping {
            text-align: center;
        }

        .continue-link {
            color: #4CAF50;
            text-decoration: none;
            font-size: 16px;
        }

        .continue-link:hover {
            text-decoration: underline;
            color: #388E3C;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .cart-title {
                font-size: 28px;
            }

            .cart-item {
                flex-direction: column;
                align-items: flex-start;
                text-align: left;
            }

            .item-image {
                margin-right: 0;
                margin-bottom: 15px;
            }

            .item-details {
                width: 100%;
            }

            .item-actions {
                position: absolute;
                top: 20px;
                right: 0;
            }

            .quantity-controls {
                flex-direction: column;
                align-items: flex-start;
            }

            .quantity-label {
                margin-bottom: 5px;
            }

            .cart-summary {
                position: static;
                margin-top: 30px;
            }
        }

        @media (max-width: 576px) {
            .cart-content-section {
                padding: 20px 0;
            }

            .cart-items {
                padding: 15px;
            }

            .cart-summary {
                padding: 20px;
            }

            .promocode-input-group {
                flex-direction: column;
            }

            .btn-apply-promo {
                width: 100%;
            }
        }
    </style>
</asp:Content>
