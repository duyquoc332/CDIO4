<%@ Page Title="Đăng nhập - FUMO FOOD" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FumoFood.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="fumo-container">
        <!-- Main Content với ảnh rau làm nền -->
        <main class="registration-main">
            <div class="content-overlay">
                <h1 class="registration-title">Đăng nhập</h1>
                
                <div class="registration-form">
                    <div class="form-section">
                        <label for="txtUsername" class="form-label">Tên Đăng Nhập</label>
                        <div class="input-field-container">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-input-field"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                            ControlToValidate="txtUsername"
                            ErrorMessage="Vui lòng nhập tên đăng nhập"
                            CssClass="validator-error"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-section">
                        <label for="txtPassword" class="form-label">Mật Khẩu</label>
                        <div class="input-field-container">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input-field"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                            ControlToValidate="txtPassword"
                            ErrorMessage="Vui lòng nhập mật khẩu"
                            CssClass="validator-error"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-footer">
                        <span class="account-question">Bạn chưa có tài khoản? Đăng ký </span>
                        <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Register.aspx" CssClass="login-link">Tại đây</asp:HyperLink>
                    </div>

                    <div class="register-btn-container">
                        <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="register-submit-btn" OnClick="btnLogin_Click" />
                    </div>
                    
                    <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Visible="false"></asp:Label>
                </div>
            </div>
        </main>
    </div>

   <style>
        /* Reset và Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background-color: #ffffff;
            color: #333333;
            line-height: 1.4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .fumo-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        /* Header Styles với màu xanh */
        .fumo-header {
            padding: 15px 0;
            background: linear-gradient(135deg, #A2D998);
            border-radius: 0 0 10px 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header-center {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .logo-container {
            flex: 0 0 auto;
        }

        .main-logo {
            height: 60px;
            width: auto;
            max-width: 180px;
            filter: brightness(0) invert(1); /* Làm logo trắng để nổi bật trên nền xanh */
        }

        .search-main {
            flex: 1;
            display: flex;
            justify-content: center;
            margin: 0 20px;
        }

        .search-container {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 25px;
            padding: 10px 20px;
            border: 1px solid rgba(255, 255, 255, 0.5);
            width: 100%;
            max-width: 500px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .search-icon {
            width: 18px;
            height: 18px;
            margin-right: 10px;
            opacity: 0.6;
        }

        .search-box {
            border: none;
            background: transparent;
            outline: none;
            width: 100%;
            font-size: 16px;
            color: #333;
        }

        .search-box::placeholder {
            color: #999;
        }

        .header-icons-right {
            display: flex;
            align-items: center;
            gap: 15px;
            flex: 0 0 auto;
        }

        .header-icon {
            width: 28px;
            height: 28px;
            cursor: pointer;
            transition: transform 0.3s ease, opacity 0.3s ease;
            filter: brightness(0) invert(1); /* Làm icon trắng */
        }

        .header-icon:hover {
            transform: scale(1.1);
            opacity: 0.8;
        }

        .login-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 4px;
            padding: 8px 16px;
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .login-btn:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        /* Main Content với ảnh rau nền */
        .registration-main {
        flex: 1;
        width: 100vw; /* Chiều rộng 100% viewport */
        position: relative;
        left: 50%;
        right: 50%;
        margin-left: -50vw;
        margin-right: -50vw;
        padding: 40px 0;
        background-image: url('Images/rau.png');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        min-height: calc(100vh - 200px);
        }

        .content-overlay {
            position: relative;
            z-index: 1;
            max-width: 500px;
            margin: 0 auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .registration-title {
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #2c5530;
        }

        /* Form Styles */
        .registration-form {
            background: transparent;
            border-radius: 8px;
        }

        .form-section {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
            color: #333;
            font-size: 15px;
        }

        .input-field-container {
            position: relative;
        }

        .form-input-field {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d0d0d0;
            border-radius: 6px;
            font-size: 16px;
            background: #fff;
            transition: all 0.3s ease;
        }

        .form-input-field:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
        }

        .form-footer {
            text-align: center;
            margin: 30px 0;
            font-size: 15px;
        }

        .account-question {
            color: #666;
        }

        .login-link {
            color: #4CAF50;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link:hover {
            text-decoration: underline;
            color: #388E3C;
        }

        /* Nút đăng ký dịch phải */
        .register-btn-container {
            text-align: right;
            margin-top: 20px;
        }

        .register-submit-btn {
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 14px 30px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: inline-block;
        }

        .register-submit-btn:hover {
            background: #388E3C;
        }

        /* Validation Styles */
        .validator-error {
            color: #d9534f;
            font-size: 13px;
            margin-top: 5px;
            display: block;
        }

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

        /* Footer với màu xanh */
        .fumo-footer {
            background: linear-gradient(135deg, #A2D998);
            color: white;
            padding: 20px 0;
            margin-top: 20px;
            border-radius: 10px 10px 0 0;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .footer-content p {
            margin: 0;
        }

        .footer-links {
            display: flex;
            gap: 20px;
        }

        .footer-links a {
            color: white;
            text-decoration: none;
            transition: opacity 0.3s ease;
        }

        .footer-links a:hover {
            opacity: 0.8;
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-center {
                flex-direction: column;
                gap: 15px;
            }
            
            .logo-container {
                order: 1;
            }
            
            .search-main {
                order: 3;
                width: 100%;
                margin: 15px 0;
            }
            
            .header-icons-right {
                order: 2;
                gap: 20px;
            }
            
            .main-logo {
                height: 50px;
            }
            
            .registration-title {
                font-size: 24px;
            }
            
            .content-overlay {
                padding: 20px;
                margin: 20px;
            }
            
            .footer-content {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
        }

        @media (max-width: 480px) {
            .registration-form {
                padding: 0;
            }
            
            .search-container {
                padding: 8px 15px;
            }
            
            .header-icons-right {
                gap: 15px;
            }
            
            .header-icon {
                width: 24px;
                height: 24px;
            }
            
            .register-btn-container {
                text-align: center;
            }
            
            .register-submit-btn {
                width: 100%;
            }
        }
    </style>
    </asp:Content>