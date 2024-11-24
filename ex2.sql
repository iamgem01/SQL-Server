/*Xóa những đơn vị ủng hộ có tài khoản ngân hàng được mở ở ngân hàng "DongA"*/
DELETE FROM DON_VI_UNG_HO WHERE TenNganHang = 'DongA'

/*Cập nhật hình thức ủng hộ có tên là "Mi tom" thành "Mi an lien"*/
UPDATE HINH_THUC_UH
SET TenHinhThucUngHo = 'Mi an lien'
WHERE TenHinhThucUngHo = 'Mi tom'

/*Liệt kê những chủ hộ có họ tên bắt đầu là ký tự 'Ph' và có độ dài nhiều nhất là 30 
ký tự (kể cả ký tự trắng) */
SELECT HoTenChuHo FROM HO_DAN
WHERE HoTenChuHo LIKE 'Ph%' AND LEN(HoTenChuHo) <= 30

/*Liệt kê những đợt nhận ủng hộ có NgayNhanUngHo nằm trong năm 2015 và có 
MaHoDan kết thúc bằng ký tự '1' (ký tự số 1) */
SELECT * FROM DOT_NHAN_UNG_HO INNER JOIN HO_DAN ON MaHoDan.DOT_NHAN_UNG_HO = MaHoDan.HO_DAN
WHERE YEAR(NgayNhanUngHo) = 2015 AND MaHoDan LIKE '%1'

/*Liệt kê MaDVUH, HoTenNguoiDaiDien, MaDotUngHo, NgayUngHo của những 
đợt ủng hộ diễn ra trước ngày 30/04/2016. Kết quả hiển thị cần được sắp xếp giảm dần 
theo NgayUngHo và tăng dần theo HoTenNguoiDaiDien */
SELECT DON_VI_UNG_HO.MaDVUH, DON_VI_UNG_HO.HoTenNguoiDaiDien, DOT_UNG_HO.MaDotUngHo, DOT_UNG_HO.NgayUngHo FROM DON_VI_UNG_HO INNER JOIN DOT_UNG_HO
ON DON_VI_UNG_HO.MaDVUH = DOT_UNG_HO.MaDVUH
WHERE NgayUngHo < '2016-04-30'
ORDER BY NgayUngHo DESC,
HoTenNguoiDaiDien ASC

/*Liệt kê những hộ dân là hộ nghèo và chưa từng được nhận ủng hộ lần nào*/
SELECT * FROM HO_DAN 
WHERE LaHoNgheo = 'Dung' AND MaHoDan NOT IN( SELECT MaHoDan FROM DOT_NHAN_UNG_HO)
 
 /*Liệt kê họ tên của những chủ hộ đang có trong hệ thống. Nếu họ tên trùng nhau 
thì chỉ hiển thị 1 lần. Học viên cần thực hiện yêu cầu này bằng 2 cách khác nhau (mỗi 
cách được tính 0.5 điểm)  */
SELECT DISTINCT HoTenChuHo FROM HO_ĐAN

SELECT HoTenChuHo FROM HO_DAN 
GROUP BY HoTenChuHo

/*Liệt kê MaHoDan, HoTenChuHo, ToDanPho, KhoiHoacThon, 
MaDotNhanUngHo, NgayNhanUngHo, MaHinhThucUH, SoLuongNhanUngHo, 
DonViTinh của tất cả hộ dân đang có trong hệ thống*/
SELECT MaHoDan, HoTenChuHo, ToDanPho, KhoiHoacThon, 
MaDotNhanUngHo, NgayNhanUngHo, MaHinhThucUH, SoLuongNhanUngHo, 
DonViTinh FROM HO_DAN 
LEFT JOIN DOT_NHAN_UNG_HO ON HO_DAN.MaHoDan = DOT_NHAN_UNG_HO.MaHoDan
LEFT JOIN CHI_TIET_NHAN_UNG_HO ON DOT_NHAN_UNG_HO.MaDotNhanUngHo = CHI_TIET_NHAN_UNG_HO.MaDotNhanUngHo

/*Liệt kê những đơn vị ủng hộ có tài khoản ngân hàng ở ngân hàng "DongA", từng 
ít nhất 5 lần hỗ trợ cho người dân với TenHinhThucUngHo là "Mi an lien" trong năm 
2016 */
SELECT * FROM DON_VI_UNG_HO 
INNER JOIN DOT_UNG_HO
ON DON_VI_UNG_HO.MaDVUH = DOT_UNG_HO.MaDVUH
INNER JOIN CHI_TIET_UNG_HO
ON DOT_UNG_HO.MaDotUngHo = CHI_TIET_UNG_HO.MaDotUngHo
INNER JOIN HINH_THUC_UH
ON CHI_TIET_UNG_HO.MaHinhThucUH = HINH_THUC_UH.MaHinhThucUH
WHERE DON_VI_UNG_HO.TenNganHang = 'DongA' AND HINH_THUC_UH.TenHinhThucUngHo = 'Mi an lien' AND YEAR(DOT_UNG_HO.NgayNhanUngHo) = 2016
GROUP BY MaDVUH, MaDotUngHo
HAVING COUNT(MaDotUngHo) > 5 

/*Liệt kê những hộ dân đã từng được nhận ủng hộ với TenHinhThucUngHo là 
"Mi an lien" và chưa từng được nhận ủng hộ với TenHinhThucUngHo là "Gao"  */
SELECT DISTINCT MaHoDan, HoTenChuHo FROM HO_DAN 
INNER JOIN  DOT_NHAN_UNG_HO ON HO_DAN.MaHoDan = DOT_NHAN_UNG_HO.MaHoDan
JOIN CHI_TIET_NHAN_UNG_HO ON DOT_NHAN_UNG_HO.MaDotNhanUngHo = CHI_TIET_NHAN_UNG_HO.MaDotNhanUngHo
JOIN HINH_THUC_UH ON CHI_TIET_NHAN_UNG_HO.MaHinhThucUH = HINH_THUC_UH.MaHinhThucUH
WHERE HINH_THUC_UH.TenHinhThucUngHo = 'Mi an lien' AND MaHoDan NOT IN (
SELECT DISTINCT HO_DAN.MaHoDan FROM HO_DAN 
INNER JOIN  DOT_NHAN_UNG_HO ON HO_DAN.MaHoDan = DOT_NHAN_UNG_HO.MaHoDan
JOIN CHI_TIET_NHAN_UNG_HO ON DOT_NHAN_UNG_HO.MaDotNhanUngHo = CHI_TIET_NHAN_UNG_HO.MaDotNhanUngHo
JOIN HINH_THUC_UH ON CHI_TIET_NHAN_UNG_HO.MaHinhThucUH = HINH_THUC_UH.MaHinhThucUH
WHERE HINH_THUC_UH.TenHinhThucUngHo = 'Gao' 
)




