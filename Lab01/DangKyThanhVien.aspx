<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKyThanhVien.aspx.cs" Inherits="Lab01.DangKyThanhVien" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hồ sơ đăng ký</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 900px; margin: 20px auto; border: 1px solid #ccc; background-color: white;">
            <table style="width: 100%; border-collapse: collapse;">
                <!-- Header -->
                <tr>
                    <td colspan="2" style="text-align: center; background-color: #f5c6f0; padding: 10px; color: #800000; font-weight: bold; font-size: 22px;">
                        Hồ sơ đăng ký
                    </td>
                </tr>

                <tr>
                    <!-- Cột trái: Form -->
                    <td style="width: 60%; vertical-align: top; padding: 10px;">

                        <!-- Thông tin đăng nhập -->
                        <table style="width: 100%; border: 1px solid #d8a9d1; border-collapse: collapse;">
                            <tr style="background-color: #d8a9d1;">
                                <td colspan="2" style="padding: 8px; font-weight: bold; text-align: center;">
                                    Thông tin đăng nhập
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 35%; padding: 6px;">Tên đăng nhập</td>
                                <td style="padding: 6px;">
                                    <asp:TextBox ID="txtTendn" runat="server" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvTendn" runat="server" ControlToValidate="txtTendn"
                                        ErrorMessage="Tên đăng nhập không được rỗng" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ID="revTendn" runat="server" ControlToValidate="txtTendn"
                                        ValidationExpression="^[\w!&_]{8,16}$"
                                        ErrorMessage="Tên đăng nhập không hợp lệ" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 6px;">Mật khẩu</td>
                                <td style="padding: 6px;">
                                    <asp:TextBox ID="txtMatkhau" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMatkhau" runat="server" ControlToValidate="txtMatkhau"
                                        ErrorMessage="Mật khẩu không được rỗng" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 6px;">Nhập lại mật khẩu</td>
                                <td style="padding: 6px;">
                                    <asp:TextBox ID="txtNhaplai" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvNhaplai" runat="server" ControlToValidate="txtNhaplai"
                                        ErrorMessage="Mật khẩu nhập lại không được rỗng" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                    <asp:CompareValidator ID="cvNhaplai" runat="server" ControlToValidate="txtNhaplai"
                                        ControlToCompare="txtMatkhau"
                                        ErrorMessage="Mật khẩu nhập lại không đúng" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                </td>
                            </tr>
                        </table>

                        <!-- Thông tin cá nhân -->
                        <table style="width: 100%; border: 1px solid #d8a9d1; border-collapse: collapse; margin-top: 8px;">
                            <tr style="background-color: #d8a9d1;">
                                <td colspan="2" style="padding: 8px; font-weight: bold; text-align: center;">
                                    Thông tin cá nhân
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 35%; padding: 6px;">Họ tên khách hàng</td>
                                <td style="padding: 6px;">
                                    <asp:TextBox ID="txtHoten" runat="server" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvHoten" runat="server" ControlToValidate="txtHoten"
                                        ErrorMessage="Họ tên không được rỗng" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 6px;">Ngày sinh</td>
                                <td style="padding: 6px;">
                                    <asp:DropDownList ID="ddlNgay" runat="server" Width="60px"></asp:DropDownList>
                                    <asp:DropDownList ID="ddlThang" runat="server" Width="60px"></asp:DropDownList>
                                    <asp:DropDownList ID="ddlNam" runat="server" Width="80px"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvNgay" runat="server" ControlToValidate="ddlNgay"
                                        InitialValue="" ErrorMessage="Chưa chọn ngày sinh" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                    <asp:RequiredFieldValidator ID="rfvThang" runat="server" ControlToValidate="ddlThang"
                                        InitialValue="" ErrorMessage="Chưa chọn tháng sinh" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                    <asp:RequiredFieldValidator ID="rfvNam" runat="server" ControlToValidate="ddlNam"
                                        InitialValue="" ErrorMessage="Chưa chọn năm sinh" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 6px;">Email</td>
                                <td style="padding: 6px;">
                                    <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                        ValidationExpression="^\w+([-.+' ]?\w+)*@\w+([-.]?\w+)*\.\w+([-.]?\w+)*$"
                                        ErrorMessage="Email không hợp lệ" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 6px;">Thu nhập</td>
                                <td style="padding: 6px;">
                                    <asp:TextBox ID="txtThunhap" runat="server" Width="180px"></asp:TextBox>
                                    <asp:RangeValidator ID="rvThunhap" runat="server" ControlToValidate="txtThunhap"
                                        MinimumValue="1000000" MaximumValue="50000000" Type="Integer"
                                        ErrorMessage="Thu nhập từ 1000000 đến 50000000" Text="*" ValidationGroup="Reg" Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 6px;">Giới tính</td>
                                <td style="padding: 6px;">
                                    <asp:CheckBox ID="chkNam" runat="server" Text="Nam" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 6px;">Địa chỉ</td>
                                <td style="padding: 6px;">
                                    <asp:TextBox ID="txtDiachi" runat="server" Width="250px" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 6px;">Điện thoại</td>
                                <td style="padding: 6px;">
                                    <asp:TextBox ID="txtDienthoai" runat="server" Width="180px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="padding: 8px;">
                                    <asp:Button ID="butDangky" runat="server" Text="Đăng ký" OnClick="butDangky_Click"
                                        ValidationGroup="Reg" />
                                </td>
                            </tr>
                        </table>
                    </td>

                    <!-- Cột phải: Hồ sơ khách hàng / Lỗi -->
                    <td style="width: 40%; vertical-align: top; padding: 10px;">
                        <table style="width: 100%; border-collapse: collapse;">
                            <tr style="background-color: #c2a7f2;">
                                <td style="padding: 8px; font-weight: bold; text-align: center;">Hồ sơ khách hàng</td>
                            </tr>
                            <tr>
                                <td style="padding: 8px;">
                                    <asp:ValidationSummary ID="vsBangloi" runat="server" ValidationGroup="Reg"
                                        HeaderText="Danh sách lỗi:" ShowSummary="True" DisplayMode="BulletList"
                                        ForeColor="Red" />
                                    <asp:Label ID="lblHoso" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
