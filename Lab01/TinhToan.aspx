<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TinhToan.aspx.cs" Inherits="YourNamespace.TinhToan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Máy Tính Đơn Giản</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 400px; margin: 50px auto; border: 1px solid #ccc; padding: 10px;">
            
            <table style="width: 100%; border-collapse: collapse;">
                <tr>
                    <td colspan="2" style="text-align: center; background-color: #3498DB; color: white; padding: 10px;">
                        <h2 style="margin: 0;">Tính toán đơn giản</h2>
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%; padding: 10px 0;">
                        <asp:Label ID="Label1" runat="server" Text="Nhập số 1:"></asp:Label>
                    </td>
                    <td style="padding: 10px 0;">
                        <asp:TextBox ID="txtSo1" runat="server" Width="90%"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 10px 0;">
                        <asp:Label ID="Label2" runat="server" Text="Nhập số 2:"></asp:Label>
                    </td>
                    <td style="padding: 10px 0;">
                        <asp:TextBox ID="txtSo2" runat="server" Width="90%"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center; padding: 20px 0;">
                        <asp:Button ID="btnCong" runat="server" Text="Cộng" OnClick="btn_Click" BackColor="#2ECC71" ForeColor="White" Width="70px" />
                        <asp:Button ID="btnTru" runat="server" Text="Trừ" OnClick="btn_Click" BackColor="#F1C40F" ForeColor="Black" Width="70px" />
                        <asp:Button ID="btnNhan" runat="server" Text="Nhân" OnClick="btn_Click" BackColor="#E74C3C" ForeColor="White" Width="70px" />
                        <asp:Button ID="btnChia" runat="server" Text="Chia" OnClick="btn_Click" BackColor="#3498DB" ForeColor="White" Width="70px" />
                    </td>
                </tr>

                <tr>
                    <td style="padding: 10px 0;">
                        <asp:Label ID="Label3" runat="server" Text="Kết quả:"></asp:Label>
                    </td>
                    <td style="padding: 10px 0;">
                        <asp:Label ID="lblKetQua" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>