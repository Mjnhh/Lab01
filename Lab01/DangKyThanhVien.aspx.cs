using System;
using System.Text;
using System.Web.UI.WebControls;

namespace Lab01
{
    public partial class DangKyThanhVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Nap ngay thang nam
                ddlNgay.Items.Clear();
                ddlNgay.Items.Add(new ListItem("--", ""));
                for (int d = 1; d <= 31; d++)
                {
                    ddlNgay.Items.Add(new ListItem(d.ToString(), d.ToString()));
                }

                ddlThang.Items.Clear();
                ddlThang.Items.Add(new ListItem("--", ""));
                for (int m = 1; m <= 12; m++)
                {
                    ddlThang.Items.Add(new ListItem(m.ToString(), m.ToString()));
                }

                ddlNam.Items.Clear();
                ddlNam.Items.Add(new ListItem("--", ""));
                for (int y = 1950; y <= DateTime.Now.Year; y++)
                {
                    ddlNam.Items.Add(new ListItem(y.ToString(), y.ToString()));
                }

                // Du lieu mau
                txtTendn.Text = "thienthanh";
                txtMatkhau.Text = "123456";
                txtNhaplai.Text = "123456";
                txtHoten.Text = "Phạm Thiên Thanh";
                ddlNgay.SelectedValue = "31";
                ddlThang.SelectedValue = "12";
                ddlNam.SelectedValue = "2005";
                txtEmail.Text = "ptthanh@yahoo.com";
                txtThunhap.Text = "3000000";
                chkNam.Checked = false; // Nu
                txtDiachi.Text = "227 Đinh Tiên\nHoàng, Q1";
                txtDienthoai.Text = "8351056";
            }
        }

        protected void butDangky_Click(object sender, EventArgs e)
        {
            // Chi xu ly khi hop le
            if (!Page.IsValid)
            {
                lblHoso.Text = string.Empty;
                return;
            }

            StringBuilder sb = new StringBuilder();
            sb.Append("<ul style='margin:0; padding-left: 18px;'>");
            sb.AppendFormat("<li><b>Họ tên khách hàng:</b> {0}</li>", txtHoten.Text);
            sb.AppendFormat("<li><b>Tên đăng nhập:</b> {0}</li>", txtTendn.Text);
            sb.AppendFormat("<li><b>Mật khẩu:</b> {0}</li>", txtMatkhau.Text);
            sb.AppendFormat("<li><b>Ngày sinh:</b> {0}/{1}/{2}</li>", ddlNgay.SelectedValue, ddlThang.SelectedValue, ddlNam.SelectedValue);
            sb.AppendFormat("<li><b>Giới tính:</b> {0}</li>", chkNam.Checked ? "Nam" : "Nữ");
            sb.AppendFormat("<li><b>Email:</b> {0}</li>", txtEmail.Text);
            sb.AppendFormat("<li><b>Địa chỉ:</b> {0}</li>", txtDiachi.Text.Replace("\n", "<br/>"));
            sb.AppendFormat("<li><b>Điện thoại:</b> {0}</li>", txtDienthoai.Text);
            sb.Append("</ul>");

            lblHoso.Text = sb.ToString();
        }
    }
}
