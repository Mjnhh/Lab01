<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonDatHang.aspx.cs" Inherits="Lab01.DonDatHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đơn Đặt Hàng</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 800px; margin: 20px auto; border: 1px solid #ccc; background-color: white;">
            
            <table style="width: 100%; border-collapse: collapse;">
                
                <!-- Header -->
                <tr>
                    <td colspan="2" style="text-align: center; background-color: #90EE90; padding: 15px;">
                        <h1 style="margin: 0; font-size: 24px; color: black; font-weight: bold;">ĐƠN ĐẶT HÀNG</h1>
                    </td>
                </tr>

                <!-- Thông tin khách hàng -->
                <tr>
                    <td style="width: 25%; padding: 10px;">
                        <asp:Label ID="lblKhachHang" runat="server" Text="Khách hàng:"></asp:Label>
                    </td>
                    <td style="padding: 10px;">
                        <asp:TextBox ID="txtKhachHang" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 10px;">
                        <asp:Label ID="lblDiaChi" runat="server" Text="Địa chỉ:"></asp:Label>
                    </td>
                    <td style="padding: 10px;">
                        <asp:TextBox ID="txtDiaChi" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 10px;">
                        <asp:Label ID="lblMaSoThue" runat="server" Text="Mã số thuế:"></asp:Label>
                    </td>
                    <td style="padding: 10px;">
                        <asp:TextBox ID="txtMaSoThue" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>

                <!-- Phần chọn bánh - 2 cột -->
                <tr>
                    <td colspan="2" style="padding: 15px 10px 10px 10px;">
                        <table style="width: 100%; border-collapse: collapse;">
                            <tr>
                                <td style="width: 50%; vertical-align: top; padding-right: 10px;">
                                    <asp:Label ID="lblChonBanh" runat="server" Text="Chọn các lọai bánh sau:" Font-Bold="True"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="ddlLoaiBanh" runat="server" Width="100%" style="margin-top: 5px;"></asp:DropDownList>
                                    <br />
                                    <table style="width: 100%; margin-top: 10px;">
                                        <tr>
                                            <td style="width: auto; padding: 5px 5px 5px 0;">
                                                <asp:Label ID="lblSoLuong" runat="server" Text="Số lượng:"></asp:Label>
                                            </td>
                                            <td style="width: auto; padding: 5px;">
                                                <asp:TextBox ID="txtSoLuong" runat="server" Width="100px"></asp:TextBox>
                                            </td>
                                            <td style="width: auto; padding: 5px;">
                                                <asp:Label ID="lblDonVi" runat="server" Text="cái"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="text-align: center; margin-top: 10px;">
                                        <asp:ImageButton ID="btnThem" runat="server" ImageUrl="~/Images/rt.gif" 
                                            OnClick="btnThem_Click" Width="50px" Height="30px" />
                                    </div>
                                </td>
                                <td style="width: 50%; vertical-align: top; padding-left: 10px;">
                                    <asp:Label ID="lblDanhSach" runat="server" Text="Danh sách bánh được đặt:" Font-Bold="True"></asp:Label>
                                    <br />
                                    <table style="width: 100%; margin-top: 5px;">
                                        <tr>
                                            <td style="width: 85%;">
                                                <asp:ListBox ID="lbDanhSachBanh" runat="server" Width="100%" Rows="8" SelectionMode="Multiple"></asp:ListBox>
                                            </td>
                                            <td style="width: 15%; vertical-align: top; padding-left: 5px;">
                                                <asp:ImageButton ID="btnXoa" runat="server" ImageUrl="~/Images/delete.gif" 
                                                    OnClick="btnXoa_Click" Width="40px" Height="30px" CausesValidation="False" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <!-- Nút In đơn đặt hàng -->
                <tr>
                    <td colspan="2" style="text-align: center; padding: 20px;">
                        <asp:Button ID="btnInDon" runat="server" Text="In đơn đặt hàng" OnClick="btnInDon_Click" 
                            BackColor="#4CAF50" ForeColor="White" Width="200px" Height="40px" Font-Size="16px" Font-Bold="True" />
                    </td>
                </tr>
            </table>
            
            <!-- Khu vực hiển thị kết quả in đơn -->
            <asp:Label ID="lblKetQua" runat="server" style="display: block; padding: 20px; border-top: 1px solid #ccc;"></asp:Label>
        </div>
    </form>
</body>
</html>
