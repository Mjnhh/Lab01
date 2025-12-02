using System;
using System.Text;
using System.Web.UI.WebControls;
using System.IO; // Thêm thư viện này cho File Upload

namespace Lab01
{
    public partial class DangKyThongTin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 1. Trình độ 
                ddlTrinhDo.Items.Clear();
                ddlTrinhDo.Items.Add(new ListItem("Trung cấp", "TC"));
                ddlTrinhDo.Items.Add(new ListItem("Cao đẳng", "CD"));
                ddlTrinhDo.Items.Add(new ListItem("Đại học", "DH"));
                ddlTrinhDo.Items.Add(new ListItem("Trên đại học", "TDH"));

                // 2. Giới tính 
                rblGioiTinh.Items.Clear();
                rblGioiTinh.Items.Add(new ListItem("Nam", "M"));
                rblGioiTinh.Items.Add(new ListItem("Nữ", "F"));
                rblGioiTinh.SelectedIndex = 0; // Chọn Nam mặc định

                // 3. Nghề nghiệp 
                lbNgheNghiep.Items.Clear();
                lbNgheNghiep.Items.Add("Kỹ sư");
                lbNgheNghiep.Items.Add("Bác sĩ");
                lbNgheNghiep.Items.Add("Công nhân");
                lbNgheNghiep.Items.Add("Lập trình viên");
                lbNgheNghiep.Items.Add("Khác");

                // 4. Sở thích 
                cblSoThich.Items.Clear();
                cblSoThich.Items.Add("Chơi game");
                cblSoThich.Items.Add("Nghe nhạc");
                cblSoThich.Items.Add("Xem phim");
                cblSoThich.Items.Add("Du lịch");
                cblSoThich.Items.Add("Mua sắm");
            }
        }

        protected void btnGui_Click(object sender, EventArgs e)
        {
            // 1. Khai báo thư mục Upload
            string uploadFolder = Server.MapPath("~/Uploads/");
            if (!Directory.Exists(uploadFolder))
            {
                Directory.CreateDirectory(uploadFolder);
            }

            // 2. Xử lý Upload hình
            string imageRelativePath = ""; // Đường dẫn tương đối để hiển thị trên web
            string fileName = "(Chưa tải lên)";

            if (fuHinh.HasFile)
            {
                // Chỉ cho phép upload file ảnh (jpg, png, gif)
                string extension = Path.GetExtension(fuHinh.PostedFile.FileName).ToLower();
                if (extension == ".jpg" || extension == ".png" || extension == ".gif")
                {
                    try
                    {
                        fileName = Path.GetFileName(fuHinh.PostedFile.FileName);
                        string savePath = Path.Combine(uploadFolder, fileName);
                        fuHinh.SaveAs(savePath);

                        // Tạo đường dẫn tương đối để trình duyệt hiển thị ảnh
                        imageRelativePath = "Uploads/" + fileName;
                    }
                    catch (Exception ex)
                    {
                        lblKetQua.Text = "Lỗi upload file: " + ex.Message;
                        return;
                    }
                }
                else
                {
                    lblKetQua.Text = "Lỗi: Vui lòng chỉ tải lên các tệp hình ảnh (.jpg, .png, .gif).";
                    return;
                }
            }

            StringBuilder sb = new StringBuilder();

            sb.Append("<h2 style='text-align: center; border-bottom: 2px solid #00BCD4; padding-bottom: 10px; margin-bottom: 20px;'>KẾT QUẢ ĐĂNG KÝ</h2>");

            // Bắt đầu danh sách (<ul>)
            sb.Append("<ul>");

            // Họ và tên, Ngày sinh, Giới tính, Trình độ
            sb.AppendFormat("<li><strong>Họ tên:</strong> {0}</li>", txtHoTen.Text);
            sb.AppendFormat("<li><strong>Ngày sinh:</strong> {0}</li>", txtNgaySinh.Text);
            sb.AppendFormat("<li><strong>Giới tính:</strong> {0}</li>", rblGioiTinh.SelectedItem.Text);
            sb.AppendFormat("<li><strong>Trình độ:</strong> {0}</li>", ddlTrinhDo.SelectedItem.Text);

            // Nghề nghiệp (ListBox)
            string ngheNghiep = "";
            foreach (ListItem item in lbNgheNghiep.Items)
            {
                if (item.Selected)
                {
                    ngheNghiep += item.Text + ", ";
                }
            }
            sb.AppendFormat("<li><strong>Nghề nghiệp:</strong> {0}</li>", ngheNghiep.TrimEnd(' ', ','));

            // Hình ảnh (Hiển thị ảnh hoặc hình mặc định)
            sb.Append("<li><strong>Ảnh:</strong></li>");
            sb.Append("<div style='margin-left: 20px; margin-top: 10px;'>");
            if (!string.IsNullOrEmpty(imageRelativePath))
            {
                // Hiển thị ảnh vừa tải lên
                sb.AppendFormat("<img src='{0}' style='width: 150px; height: auto; border: 1px solid #ccc;' />", imageRelativePath);
            }
            else
            {
                // Hiển thị hình ảnh mặc định
                // Giả sử có một ảnh mặc định trong thư mục Images/default.png
                sb.Append("<img src='Images/default.png' style='width: 150px;' />"); 
            }
            sb.Append("</div>");

            // Sở thích
            string soThich = "";
            foreach (ListItem item in cblSoThich.Items)
            {
                if (item.Selected)
                {
                    soThich += item.Text + ", ";
                }
            }
            sb.AppendFormat("<li><strong>Sở thích:</strong> {0}</li>", soThich.TrimEnd(' ', ','));

            // Kết thúc danh sách (</ul>)
            sb.Append("</ul>");

            // Hiển thị kết quả ra Label
            lblKetQua.Text = sb.ToString();
        }
        // Xử lý sự kiện khi nhấn nút "Làm lại"
        protected void btnLamLai_Click(object sender, EventArgs e)
        {
            // Đặt lại các trường nhập liệu và chọn lựa
            txtHoTen.Text = string.Empty;
            txtNgaySinh.Text = string.Empty;
            rblGioiTinh.SelectedIndex = 0;
            ddlTrinhDo.SelectedIndex = 0;
            lblKetQua.Text = string.Empty;

            // Bỏ chọn tất cả các mục trong ListBox và CheckBoxList
            foreach (ListItem item in lbNgheNghiep.Items)
            {
                item.Selected = false;
            }
            foreach (ListItem item in cblSoThich.Items)
            {
                item.Selected = false;
            }
        }
    }
}