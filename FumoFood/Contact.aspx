<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FumoFood.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contact-container">
        <!-- Contact Header -->
        <div class="contact-header-section">
            <div class="container">
                <h1 class="contact-title">Liên Hệ với FUMO FOOD</h1>
            </div>
        </div>

        <!-- Contact Content -->
        <div class="contact-content-section">
            <div class="container">
                <div class="row">
                    <!-- Contact Information -->
                    <div class="col-lg-6">
                        <div class="contact-info-section">
                            <h3 class="section-title">Thông tin liên hệ</h3>
                            
                            <div class="contact-info">
                                <div class="contact-item">
                                    <div class="contact-icon">📍</div>
                                    <div class="contact-details">
                                        <h4 class="contact-label">Địa chỉ</h4>
                                        <p class="contact-value">36 đường AB, phường XY, quận NA</p>
                                    </div>
                                </div>
                                
                                <div class="contact-item">
                                    <div class="contact-icon">📞</div>
                                    <div class="contact-details">
                                        <h4 class="contact-label">Điện thoại</h4>
                                        <p class="contact-value">(+84) 123 456 789</p>
                                    </div>
                                </div>
                                
                                <div class="contact-item">
                                    <div class="contact-icon">✉️</div>
                                    <div class="contact-details">
                                        <h4 class="contact-label">Email</h4>
                                        <p class="contact-value">abc123@gmail.com</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Map Placeholder -->
                            <div class="map-section">
                                <div class="map-placeholder">
                                    <div class="map-icon">🗺️</div>
                                    <p>Bản đồ sẽ được hiển thị tại đây</p>
                                    <small>36 đường AB, phường XY, quận NA</small>
                                </div>
                            </div>

                            <!-- Business Hours -->
                            <div class="business-hours">
                                <h4 class="hours-title">Giờ làm việc</h4>
                                <div class="hours-list">
                                    <div class="hour-item">
                                        <span class="day">Thứ 2 - Thứ 6:</span>
                                        <span class="time">7:00 - 18:00</span>
                                    </div>
                                    <div class="hour-item">
                                        <span class="day">Thứ 7:</span>
                                        <span class="time">7:00 - 17:00</span>
                                    </div>
                                    <div class="hour-item">
                                        <span class="day">Chủ nhật:</span>
                                        <span class="time">8:00 - 16:00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="col-lg-6">
                        <div class="contact-form-section">
                            <h3 class="section-title">Gửi tin nhắn cho chúng tôi</h3>
                            
                            <div class="contact-form">
                                <div class="form-group">
                                    <label for="txtFullName" class="form-label">Họ và tên *</label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Nhập họ và tên của bạn"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" 
                                        ControlToValidate="txtFullName" ErrorMessage="Vui lòng nhập họ và tên"
                                        CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtEmail" class="form-label">Email *</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập địa chỉ email" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                        ControlToValidate="txtEmail" ErrorMessage="Vui lòng nhập email"
                                        CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                        ControlToValidate="txtEmail" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                                        ErrorMessage="Email không hợp lệ" CssClass="validator-error" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtPhone" class="form-label">Số điện thoại</label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                                        ControlToValidate="txtPhone" ValidationExpression="^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$"
                                        ErrorMessage="Số điện thoại không hợp lệ" CssClass="validator-error" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtMessage" class="form-label">Nội dung *</label>
                                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" 
                                        TextMode="MultiLine" Rows="6" placeholder="Nhập nội dung tin nhắn..."></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                                        ControlToValidate="txtMessage" ErrorMessage="Vui lòng nhập nội dung tin nhắn"
                                        CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-submit">
                                    <asp:Button ID="btnSendMessage" runat="server" Text="Gửi tin nhắn" 
                                        CssClass="btn-send-message" OnClick="btnSendMessage_Click" />
                                </div>

                                <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Visible="false"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <style>
        /* Contact Container */
        .contact-container {
            background-color: #f9fdf9;
            min-height: 100vh;
            padding-bottom: 40px;
        }

        /* Contact Header */
        .contact-header-section {
            padding: 40px 0;
            background: white;
            border-bottom: 1px solid #eee;
        }

        .contact-title {
            font-size: 32px;
            font-weight: 600;
            color: #2c5530;
            margin: 0;
            text-align: center;
        }

        /* Contact Content */
        .contact-content-section {
            padding: 50px 0;
        }

        /* Contact Info Section */
        .contact-info-section {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            height: 100%;
        }

        .section-title {
            font-size: 22px;
            font-weight: 600;
            color: #2c5530;
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid #A2D998;
        }

        .contact-info {
            margin-bottom: 30px;
        }

        .contact-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 25px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #4CAF50;
        }

        .contact-icon {
            font-size: 24px;
            margin-right: 15px;
            margin-top: 2px;
        }

        .contact-details {
            flex: 1;
        }

        .contact-label {
            font-size: 16px;
            font-weight: 600;
            color: #2c5530;
            margin-bottom: 5px;
        }

        .contact-value {
            font-size: 15px;
            color: #555;
            margin: 0;
            line-height: 1.5;
        }

        /* Map Section */
        .map-section {
            margin: 30px 0;
        }

        .map-placeholder {
            background: #f8f9fa;
            border: 2px dashed #ddd;
            border-radius: 8px;
            padding: 40px 20px;
            text-align: center;
            color: #666;
        }

        .map-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .map-placeholder p {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .map-placeholder small {
            color: #888;
        }

        /* Business Hours */
        .business-hours {
            margin-top: 30px;
            padding: 20px;
            background: #fff8e1;
            border-radius: 8px;
            border-left: 4px solid #ffb300;
        }

        .hours-title {
            font-size: 18px;
            font-weight: 600;
            color: #2c5530;
            margin-bottom: 15px;
        }

        .hours-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .hour-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 0;
            border-bottom: 1px solid #ffe082;
        }

        .hour-item:last-child {
            border-bottom: none;
        }

        .day {
            font-weight: 500;
            color: #333;
        }

        .time {
            color: #e74c3c;
            font-weight: 500;
        }

        /* Contact Form Section */
        .contact-form-section {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            height: 100%;
        }

        .contact-form {
            margin-top: 10px;
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
             background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
        }

        .form-submit {
            margin-top: 30px;
        }

        .btn-send-message {
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 15px 40px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .btn-send-message:hover {
            background: #388E3C;
        }

        /* Message Label */
        .message-label {
            display: block;
            text-align: center;
            margin-top: 15px;
            padding: 10px;
            border-radius: 4px;
            font-weight: 500;
        }

        .message-success {
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
        }

        .message-error {
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
        }

        /* Quick Contact Section */
        .quick-contact-section {
            background: white;
            padding: 40px 0;
            border-top: 1px solid #eee;
            margin-top: 40px;
        }

        .quick-contact-grid {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
        }

        .quick-contact-item {
            text-align: center;
            padding: 20px;
            min-width: 200px;
        }

        .quick-icon {
            font-size: 36px;
            margin-bottom: 15px;
        }

        .quick-contact-item h4 {
            font-size: 18px;
            font-weight: 600;
            color: #2c5530;
            margin-bottom: 8px;
        }

        .quick-contact-item p {
            color: #666;
            margin: 0;
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
            .contact-title {
                font-size: 28px;
            }

            .contact-content-section {
                padding: 30px 0;
            }

            .contact-info-section,
            .contact-form-section {
                padding: 20px;
            }

            .contact-item {
                flex-direction: column;
                text-align: center;
            }

            .contact-icon {
                margin-right: 0;
                margin-bottom: 10px;
            }

            .hour-item {
                flex-direction: column;
                text-align: center;
                gap: 5px;
            }

            .quick-contact-grid {
                flex-direction: column;
                gap: 20px;
            }
        }

        @media (max-width: 576px) {
            .contact-header-section {
                padding: 30px 0;
            }

            .contact-title {
                font-size: 24px;
            }

            .contact-info-section,
            .contact-form-section {
                padding: 15px;
            }

            .map-placeholder {
                padding: 30px 15px;
            }

            .map-icon {
                font-size: 36px;
            }

            .business-hours {
                padding: 15px;
            }
        }
    </style>
</asp:Content>
