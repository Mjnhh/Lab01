using System;
using System.Text;
using System.Web.UI.WebControls;

namespace Lab01
{
    public partial class DonDatHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Nạp dữ liệu mẫu cho các loại bánh vào DropDownList
                ddlLoaiBanh.Items.Clear();
                ddlLoaiBanh.Items.Add(new ListItem("-- Chọn bánh --", ""));
                ddlLoaiBanh.Items.Add(new ListItem("Bánh Croissant bơ", "Croissant"));
                ddlLoaiBanh.Items.Add(new ListItem("Bánh bò nướng", "BanhBo"));
                ddlLoaiBanh.Items.Add(new ListItem("Patés chauds", "Pates"));
                ddlLoaiBanh.Items.Add(new ListItem("Hamburger", "Hamburger"));

                // Nạp dữ liệu mẫu cho thông tin khách hàng
                txtKhachHang.Text = "Nguyễn Thị Phi Giao";
                txtDiaChi.Text = "2A Đinh Tiên Hòang, Q1";
                txtMaSoThue.Text = "0123456789";

                // Nạp dữ liệu mẫu số lượng
                txtSoLuong.Text = "1500";

                // Xóa danh sách bánh đã đặt (để người dùng tự thêm)
                lbDanhSachBanh.Items.Clear();
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            // Kiểm tra đã chọn loại bánh và nhập số lượng
            if (ddlLoaiBanh.SelectedIndex < 0 || string.IsNullOrEmpty(ddlLoaiBanh.SelectedValue))
            {
                return;
            }

            string soLuong = txtSoLuong.Text.Trim();
            if (string.IsNullOrEmpty(soLuong) || !int.TryParse(soLuong, out int sl) || sl <= 0)
            {
                return;
            }

            // Lấy tên bánh đã chọn
            string tenBanh = ddlLoaiBanh.SelectedItem.Text;

            // Tạo chuỗi hiển thị: "Tên bánh (số lượng)"
            string itemText = string.Format("{0} ({1})", tenBanh, sl);

            // Thêm vào ListBox
            lbDanhSachBanh.Items.Add(itemText);
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            // Xóa các dòng đã chọn trong ListBox (cho phép chọn nhiều)
            // Duyệt từ cuối lên đầu để tránh lỗi khi xóa nhiều item
            for (int i = lbDanhSachBanh.Items.Count - 1; i >= 0; i--)
            {
                if (lbDanhSachBanh.Items[i].Selected)
                {
                    lbDanhSachBanh.Items.RemoveAt(i);
                }
            }
        }

        protected void btnInDon_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            StringBuilder sb = new StringBuilder();

            // Tạo container cho hóa đơn với border đỏ và shadow
            sb.Append("<div style='width: 600px; margin: 20px auto; padding: 20px; background-color: white; border: 2px solid red; box-shadow: 2px 2px 5px rgba(0,0,0,0.2); font-family: Arial, sans-serif; font-size: 14px;'>");

            // Tiêu đề HÓA ĐƠN ĐẶT HÀNG - màu đỏ, in đậm, căn giữa
            sb.Append("<h1 style='text-align: center; color: red; font-weight: bold; margin: 0 0 20px 0; font-size: 28px; font-family: Arial, sans-serif;'>HÓA ĐƠN ĐẶT HÀNG</h1>");

            // Section Khách hàng
            sb.Append("<p style='color: red; font-weight: bold; margin: 15px 0 10px 0; font-size: 16px; font-family: Arial, sans-serif;'>Khách hàng:</p>");
            sb.Append("<table style='width: 100%; border-collapse: collapse; margin-bottom: 20px; font-family: Arial, sans-serif; font-size: 14px;'>");
            sb.AppendFormat("<tr><td style='padding: 5px 0; font-size: 14px;'><strong>Khách hàng:</strong> {0}</td></tr>", txtKhachHang.Text);
            sb.AppendFormat("<tr><td style='padding: 5px 0; font-size: 14px;'><strong>Địa chỉ:</strong> {0}</td></tr>", txtDiaChi.Text);
            sb.AppendFormat("<tr><td style='padding: 5px 0; font-size: 14px;'><strong>Mã số thuế:</strong> {0}</td></tr>", txtMaSoThue.Text);
            sb.Append("</table>");

            // Section Đặt các loại bánh sau
            sb.Append("<p style='color: red; font-weight: bold; margin: 15px 0 10px 0; font-size: 16px; font-family: Arial, sans-serif;'>Đặt các lọai bánh sau:</p>");
            sb.Append("<table style='width: 100%; border-collapse: collapse; font-family: Arial, sans-serif; font-size: 14px;'>");

            // Duyệt qua danh sách bánh trong ListBox và parse tên + số lượng
            foreach (ListItem item in lbDanhSachBanh.Items)
            {
                // Parse định dạng "Tên bánh (số lượng)"
                string itemText = item.Text;
                string tenBanh = "";
                string soLuong = "";

                // Tìm dấu ngoặc đơn cuối cùng để tách tên và số lượng
                int lastOpenParen = itemText.LastIndexOf('(');
                int lastCloseParen = itemText.LastIndexOf(')');

                if (lastOpenParen > 0 && lastCloseParen > lastOpenParen)
                {
                    tenBanh = itemText.Substring(0, lastOpenParen).Trim();
                    soLuong = itemText.Substring(lastOpenParen + 1, lastCloseParen - lastOpenParen - 1).Trim();
                    
                    // Format số lượng với dấu phẩy nếu là số lớn
                    if (int.TryParse(soLuong, out int sl))
                    {
                        soLuong = sl.ToString("N0"); // Format với dấu phẩy ngăn cách hàng nghìn
                    }
                }
                else
                {
                    // Nếu không có định dạng (số lượng), chỉ lấy tên
                    tenBanh = itemText;
                    soLuong = "";
                }

                // Tạo hàng trong bảng: tên bánh bên trái, số lượng bên phải
                sb.Append("<tr>");
                sb.AppendFormat("<td style='padding: 5px 0; width: 70%; font-size: 14px;'>{0}</td>", tenBanh);
                sb.AppendFormat("<td style='padding: 5px 0; text-align: right; font-weight: bold; width: 30%; font-size: 14px;'>{0}</td>", soLuong);
                sb.Append("</tr>");
            }

            sb.Append("</table>");
            sb.Append("</div>");

            // Hiển thị kết quả
            lblKetQua.Text = sb.ToString();
        }
    }
}
