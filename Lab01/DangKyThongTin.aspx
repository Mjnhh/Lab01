<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="YourNamespace.DangKy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Form Đăng Ký</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 500px; margin: 50px auto; border: 1px solid #00BCD4; background-color: #E0F7FA;">
            
            <table style="width: 100%; border-collapse: collapse;">
                
                <tr>
                    <td colspan="2" style="text-align: center; background-color: #00BCD4; color: white; padding: 15px;">
                        <h1 style="margin: 0; font-size: 24px;">ĐĂNG KÝ THÔNG TIN</h1>
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%; padding: 5px;">
                        <asp:Label ID="lblHoTen" runat="server" Text="Họ và tên:"></asp:Label>
                    </td>
                    <td style="padding: 5px;">
                        <asp:TextBox ID="txtHoTen" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 5px;">
                        <asp:Label ID="lblNgaySinh" runat="server" Text="Ngày sinh:"></asp:Label>
                    </td>
                    <td style="padding: 5px;">
                        <asp:TextBox ID="txtNgaySinh" runat="server" TextMode="Date" Width="100%"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 5px;">
                        <asp:Label ID="lblGioiTinh" runat="server" Text="Giới tính:"></asp:Label>
                    </td>
                    <td style="padding: 5px;">
                        <asp:RadioButtonList ID="rblGioiTinh" runat="server" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 5px;">
                        <asp:Label ID="lblTrinhDo" runat="server" Text="Trình độ:"></asp:Label>
                    </td>
                    <td style="padding: 5px;">
                        <asp:DropDownList ID="ddlTrinhDo" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 5px;">
                        <asp:Label ID="lblNgheNghiep" runat="server" Text="Nghề nghiệp:"></asp:Label>
                    </td>
                    <td style="padding: 5px;">
                        <asp:ListBox ID="lbNgheNghiep" runat="server" SelectionMode="Multiple" Rows="4" Width="100%">
                        </asp:ListBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 5px;">
                        <asp:Label ID="lblHinh" runat="server" Text="Hình:"></asp:Label>
                    </td>
                    <td style="padding: 5px;">
                        <asp:FileUpload ID="fuHinh" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td style="padding: 5px;">
                        <asp:Label ID="lblSoThich" runat="server" Text="Sở thích:"></asp:Label>
                    </td>
                    <td style="padding: 5px;">
                        <asp:CheckBoxList ID="cblSoThich" runat="server" RepeatDirection="Vertical">
                        </asp:CheckBoxList>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center; padding: 15px;">
                        <asp:Button ID="btnGui" runat="server" Text="Gửi" OnClick="btnGui_Click" BackColor="#2ECC71" ForeColor="White" Width="100px" />
                        <asp:Button ID="btnLamLai" runat="server" Text="Làm lại" OnClick="btnLamLai_Click" CausesValidation="False" BackColor="#E74C3C" ForeColor="White" Width="100px" />
                    </td>
                </tr>
            </table>
            
            <asp:Label ID="lblKetQua" runat="server" ForeColor="Black" Font-Bold="True" style="margin-top: 20px; display: block; padding: 20px; border-top: 1px solid #ccc;"></asp:Label>
        </div>
    </form>
</body>
</html>