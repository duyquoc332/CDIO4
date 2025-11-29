<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="FumoFood.Checkout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="checkout-container">
        <!-- Breadcrumb -->
        <div class="breadcrumb-section">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="Shop.aspx">Shop</a></li>
                        <li class="breadcrumb-item"><a href="Cart.aspx">Cart</a></li>
                        <li class="breadcrumb-item active">Checkout</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Checkout Title -->
        <div class="checkout-title-section">
            <div class="container">
                <h1 class="checkout-title">Thanh toán</h1>
            </div>
        </div>

        <!-- Checkout Content -->
        <div class="checkout-content-section">
            <div class="container">
                <div class="row">
                    <!-- Shipping Information -->
                    <div class="col-lg-8">
                        <div class="checkout-form-section">
                            <h3 class="section-title">Thông tin / địa chỉ nhận hàng</h3>
                            
                            <div class="checkout-form">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtFullName" class="form-label">Họ và tên *</label>
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Nhập họ và tên"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" 
                                            ControlToValidate="txtFullName" ErrorMessage="Vui lòng nhập họ tên"
                                            CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtPhone" class="form-label">Số điện thoại *</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                            ControlToValidate="txtPhone" ErrorMessage="Vui lòng nhập số điện thoại"
                                            CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                                            ControlToValidate="txtPhone" ValidationExpression="^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$"
                                            ErrorMessage="Số điện thoại không hợp lệ" CssClass="validator-error" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="txtEmail" class="form-label">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập email" TextMode="Email"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                        ControlToValidate="txtEmail" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                                        ErrorMessage="Email không hợp lệ" CssClass="validator-error" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtAddress" class="form-label">Địa chỉ *</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Nhập địa chỉ nhận hàng"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                        ControlToValidate="txtAddress" ErrorMessage="Vui lòng nhập địa chỉ"
                                        CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="ddlCity" class="form-label">Tỉnh/Thành phố *</label>
                                        <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
                                            <asp:ListItem Value="">Chọn tỉnh/thành phố</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                                            ControlToValidate="ddlCity" InitialValue="" ErrorMessage="Vui lòng chọn tỉnh/thành phố"
                                            CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="ddlDistrict" class="form-label">Quận/Huyện *</label>
                                        <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="">Chọn quận/huyện</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" 
                                            ControlToValidate="ddlDistrict" InitialValue="" ErrorMessage="Vui lòng chọn quận/huyện"
                                            CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="txtNote" class="form-label">Ghi chú</label>
                                    <asp:TextBox ID="txtNote" runat="server" CssClass="form-control" 
                                        TextMode="MultiLine" Rows="3" placeholder="Ghi chú thêm cho đơn hàng..."></asp:TextBox>
                                </div>
                            </div>

                            <!-- Payment Method -->
                            <div class="payment-method-section">
                                <h3 class="section-title">Chọn phương thức thanh toán:</h3>
                                <div class="payment-methods">
                                    <div class="payment-option">
                                        <asp:RadioButton ID="rbCashOnDelivery" runat="server" 
                                            GroupName="PaymentMethod" Checked="true" CssClass="payment-radio" />
                                        <label for="<%= rbCashOnDelivery.ClientID %>" class="payment-label">
                                            <span class="payment-icon">💵</span>
                                            <span class="payment-text">Thanh toán khi nhận hàng (COD)</span>
                                        </label>
                                    </div>
                                    <div class="payment-option">
                                        <asp:RadioButton ID="rbBankTransfer" runat="server" 
                                            GroupName="PaymentMethod" CssClass="payment-radio" />
                                        <label for="<%= rbBankTransfer.ClientID %>" class="payment-label">
                                            <span class="payment-icon">🏦</span>
                                            <span class="payment-text">Chuyển khoản ngân hàng</span>
                                        </label>
                                    </div>
                                </div>

                                <!-- Bank Transfer Info (Hidden by default) -->
                                <asp:Panel ID="pnlBankInfo" runat="server" CssClass="bank-info" Visible="false">
                                    <div class="bank-details">
                                        <h4>Thông tin chuyển khoản:</h4>
                                        <div class="bank-account">
                                            <p><strong>Ngân hàng:</strong> FUMO BANK</p>
                                            <p><strong>Số tài khoản:</strong> 123456789</p>
                                            <p><strong>Chủ tài khoản:</strong> FUMO FOOD COMPANY</p>
                                            <p><strong>Nội dung chuyển khoản:</strong> FUMO_[Mã đơn hàng]</p>
                                        </div>
                                        <div class="bank-note">
                                            <p><small>Vui lòng chuyển khoản trước khi đặt hàng. Đơn hàng sẽ được xác nhận sau khi nhận được thanh toán.</small></p>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="col-lg-4">
                        <div class="order-summary">
                            <h3 class="summary-title">Giá tiền</h3>
                            
                            <div class="summary-items">
                                <div class="summary-item">
                                    <span class="item-label">Tổng giá trị sản phẩm</span>
                                    <span class="item-value">
                                        <asp:Label ID="lblSubtotal" runat="server" Text="165.000 đ"></asp:Label>
                                    </span>
                                </div>
                                
                                <div class="summary-item">
                                    <span class="item-label">Shipping</span>
                                    <span class="item-value">
                                        <asp:Label ID="lblShipping" runat="server" Text="15.000 đ"></asp:Label>
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
                                        <asp:Label ID="lblTotal" runat="server" Text="180.000 đ"></asp:Label>
                                    </span>
                                </div>
                            </div>

                            <!-- Checkout Button -->
                            <div class="checkout-action">
                                <asp:Button ID="btnPlaceOrder" runat="server" Text="Thanh toán" 
                                    CssClass="btn-place-order" OnClick="btnPlaceOrder_Click" />
                            </div>

                            <!-- Security Info -->
                            <div class="security-info">
                                <div class="security-item">
                                    <span class="security-icon">🔒</span>
                                    <span class="security-text">Thông tin của bạn được bảo mật</span>
                                </div>
                                <div class="security-item">
                                    <span class="security-icon">🛡️</span>
                                    <span class="security-text">Giao hàng nhanh trong 2h</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        /* Checkout Container */
        .checkout-container {
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

        /* Checkout Title */
        .checkout-title-section {
            padding: 30px 0;
            background: white;
            border-bottom: 1px solid #eee;
        }

        .checkout-title {
            font-size: 32px;
            font-weight: 600;
            color: #2c5530;
            margin: 0;
        }

        /* Checkout Content */
        .checkout-content-section {
            padding: 40px 0;
        }

        /* Checkout Form Section */
        .checkout-form-section {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: #2c5530;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #A2D998;
        }

        /* Form Styles */
        .checkout-form {
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
            color: #333;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d0d0d0;
            border-radius: 6px;
            font-size: 16px;
            background: #fff;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -10px;
        }

        .form-row .form-group {
            flex: 1;
            padding: 0 10px;
            min-width: 250px;
        }

        /* Payment Method */
        .payment-method-section {
            margin-top: 30px;
        }

        .payment-methods {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .payment-option {
            display: flex;
            align-items: center;
        }

        .payment-radio {
            margin-right: 10px;
        }

        .payment-label {
            display: flex;
            align-items: center;
            padding: 15px;
            border: 2px solid #eee;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            flex: 1;
        }

        .payment-radio:checked + .payment-label {
            border-color: #4CAF50;
            background-color: #f8fff8;
        }

        .payment-icon {
            font-size: 24px;
            margin-right: 15px;
        }

        .payment-text {
            font-size: 16px;
            font-weight: 500;
            color: #333;
        }

        /* Bank Info */
        .bank-info {
            margin-top: 20px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #3498db;
        }

        .bank-details h4 {
            color: #2c5530;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .bank-account p {
            margin-bottom: 8px;
            font-size: 14px;
            color: #555;
        }

        .bank-note {
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #ddd;
        }

        .bank-note small {
            color: #666;
            font-style: italic;
        }

        /* Order Summary */
        .order-summary {
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

        /* Checkout Action */
        .checkout-action {
            margin: 25px 0;
        }

        .btn-place-order {
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

        .btn-place-order:hover {
            background: #c0392b;
        }

        .btn-place-order:disabled {
            background: #ccc;
            cursor: not-allowed;
        }

        /* Security Info */
        .security-info {
            border-top: 1px solid #eee;
            padding-top: 20px;
        }

        .security-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            font-size: 14px;
            color: #666;
        }

        .security-icon {
            margin-right: 10px;
            font-size: 16px;
        }

        /* Validation Styles */
        .validator-error {
            color: #d9534f;
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .checkout-title {
                font-size: 28px;
            }

            .checkout-form-section {
                padding: 20px;
            }

            .form-row {
                flex-direction: column;
            }

            .form-row .form-group {
                padding: 0;
            }

            .order-summary {
                position: static;
                margin-top: 30px;
            }

            .payment-label {
                padding: 12px;
            }

            .payment-icon {
                font-size: 20px;
                margin-right: 10px;
            }
        }

        @media (max-width: 576px) {
            .checkout-content-section {
                padding: 20px 0;
            }

            .checkout-form-section {
                padding: 15px;
            }

            .order-summary {
                padding: 20px;
            }

            .promocode-input-group {
                flex-direction: column;
            }

            .btn-apply-promo {
                width: 100%;
            }

            .payment-methods {
                gap: 10px;
            }
        }
    </style>

    <script>
        // JavaScript to show bank info when bank transfer is selected
        document.addEventListener('DOMContentLoaded', function () {
            const cashRadio = document.getElementById('<%= rbCashOnDelivery.ClientID %>');
            const bankRadio = document.getElementById('<%= rbBankTransfer.ClientID %>');
            const bankInfo = document.getElementById('<%= pnlBankInfo.ClientID %>');

            if (cashRadio && bankRadio && bankInfo) {
                // Initial state
                bankInfo.style.display = bankRadio.checked ? 'block' : 'none';

                // Add event listeners
                cashRadio.addEventListener('change', function () {
                    bankInfo.style.display = 'none';
                });

                bankRadio.addEventListener('change', function () {
                    bankInfo.style.display = 'block';
                });
            }
        });
    </script>
</asp:Content>