using System;
using System.Web.UI.WebControls;

namespace YourNamespace // Đảm bảo đúng namespace của bạn
{
    public partial class TinhToan : System.Web.UI.Page
    {
        // Phương thức xử lý chung cho 4 nút Cộng, Trừ, Nhân, Chia
        protected void btn_Click(object sender, EventArgs e)
        {
            double so1, so2, ketQua = 0;
            string phepToan = "";

            // 1. Xác định nút nào được nhấn
            Button btn = (Button)sender;
            phepToan = btn.Text; // Lấy chữ trên nút (Cộng, Trừ, Nhân, Chia)

            // 2. Kiểm tra tính hợp lệ của số nhập vào
            if (!double.TryParse(txtSo1.Text, out so1) || !double.TryParse(txtSo2.Text, out so2))
            {
                lblKetQua.Text = "Lỗi: Vui lòng nhập số hợp lệ!";
                return;
            }

            // 3. Xử lý tính toán
            switch (phepToan)
            {
                case "Cộng":
                    ketQua = so1 + so2;
                    break;
                case "Trừ":
                    ketQua = so1 - so2;
                    break;
                case "Nhân":
                    ketQua = so1 * so2;
                    break;
                case "Chia":
                    // Xử lý chia cho 0
                    if (so2 == 0)
                    {
                        lblKetQua.Text = "Lỗi: Không thể chia cho 0.";
                        return;
                    }
                    ketQua = so1 / so2;
                    break;
            }

            // 4. Hiển thị kết quả
            lblKetQua.Text = ketQua.ToString();
        }
    }
}