<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FumoFood.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .contact-title {
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            color: #2E7D32;
            margin: 30px 0;
        }

        .contact-wrapper {
            display: flex;
            justify-content: space-between;
            gap: 40px;
            margin-bottom: 30px;
        }

        .contact-left,
        .contact-right {
            background-color: #A2D998;
            padding: 20px;
            border-radius: 4px;
            width: 48%;
        }

        .contact-left h4,
        .contact-right h4 {
            font-weight: bold;
            margin-bottom: 15px;
        }

        .contact-left p {
            font-size: 16px;
            margin: 12px 0;
        }

        .contact-left span {
            margin-right: 8px;
            color: #2E7D32;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 120px 1fr;
            row-gap: 12px;
            column-gap: 12px;
            align-items: center;
        }

        .contact-right input,
        .contact-right textarea {
            width: 100%;
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-send {
            margin-top: 10px;
            background-color: #7CB342;
            border: none;
            padding: 6px 20px;
            border-radius: 5px;
            color: white;
        }

        .bottom-green {
            background-color: #A2D998;
            padding: 12px 0;
            display: flex;
            justify-content: space-around;
            font-weight: bold;
        }
    </style>

    <!-- TIÊU ĐỀ -->
    <div class="contact-title">Liên hệ với FUMO FOOD</div>

    <div class="contact-wrapper">

        <!-- THÔNG TIN LIÊN HỆ -->
        <div class="contact-left">
            <h4>Thông tin liên hệ</h4>

            <p><span class="glyphicon glyphicon-map-marker"></span>
                Địa chỉ <br />
                36 đường AB, phường XY, quận NA
            </p>

            <p><span class="glyphicon glyphicon-earphone"></span>
                Điện thoại <br />
                (+84)123 456 789
            </p>

            <p><span class="glyphicon glyphicon-envelope"></span>
                Email <br />
                abc123@gmail.com
            </p>

            <img src="Images/map.png" style="width:100%; border-radius:5px;" />
        </div>

        <!-- FORM GỬI TIN NHẮN -->
        <div class="contact-right">
           <h4>Gửi tin nhắn cho chúng tôi</h4>

        <div class="form-grid">
           <asp:Label runat="server" Text="Họ và tên" />
<asp:TextBox ID="txtName" runat="server" />
<asp:RequiredFieldValidator 
    ControlToValidate="txtName"
    runat="server"
    ErrorMessage="Vui lòng nhập họ tên!"
    ForeColor="Red"
    Display="Dynamic" />

<asp:Label runat="server" Text="Email" />
<asp:TextBox ID="txtEmail" runat="server" />
<asp:RequiredFieldValidator 
    ControlToValidate="txtEmail"
    runat="server"
    ErrorMessage="Vui lòng nhập email!"
    ForeColor="Red"
    Display="Dynamic" />
<asp:RegularExpressionValidator 
    ControlToValidate="txtEmail"
    runat="server"
    ErrorMessage="Email không đúng định dạng!"
    ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"
    ForeColor="Red"
    Display="Dynamic" />

<asp:Label runat="server" Text="SĐT" />
<asp:TextBox ID="txtPhone" runat="server" />
<asp:RequiredFieldValidator 
    ControlToValidate="txtPhone"
    runat="server"
    ErrorMessage="Vui lòng nhập số điện thoại!"
    ForeColor="Red"
    Display="Dynamic" />
<asp:RegularExpressionValidator 
    ControlToValidate="txtPhone"
    runat="server"
    ErrorMessage="SĐT không hợp lệ!"
    ValidationExpression="^0\d{9}$"
    ForeColor="Red"
    Display="Dynamic" />

<asp:Label runat="server" Text="Nội dung" />
<asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" />
<asp:RequiredFieldValidator 
    ControlToValidate="txtMessage"
    runat="server"
    ErrorMessage="Vui lòng nhập nội dung!"
    ForeColor="Red"
    Display="Dynamic" />

<asp:Button 
    ID="btnSend" 
    runat="server" 
    CssClass="btn-send" 
    Text="Gửi tin nhắn"
    OnClick="btnSend_Click" />

</div>

    </div>

   
   

</asp:Content>