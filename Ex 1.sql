/*Xóa những khách hàng có tên là "Le Thi A" */
DELETE FROM KHACH HANG
WHERE TenKhachHang = "Le Thi A";

/* Cập nhật những khách hàng đang thường trú ở khu vực "Son Tra" thành khu vực "Ngu Hanh 
Son"*/
UPDATE KHACHHANG
SET DiaChiNhanHang = 'Son Tra'
WHERE DiaChiNhanHang = 'Ngu Hanh Son';

/* Liệt kê những thành viên (shipper) có họ tên bắt đầu là ký tự 'Tr' và có độ dài ít nhất là 25 ký tự 
(kể cả ký tự trắng) */
SELECT TenThanhVienGiaoHang FROM THANHVIENGIAOHANG
WHERE TenThanhVienGiaoHang LIKE 'Tr%' AND len(TenThanhVienGiaoHang) >= 25;

/* Liệt kê những đơn hàng có NgayGiaoHang nằm trong năm 2017 và có khu vực giao hàng là Hai 
Chau */
SELECT * FROM DONHANG_GIAOHANG INNER JOIN KHUVUC
ON DONHANG_GIAOHANG.MaKhuvucGiaoHang = KHUVUC.MaKhuVuc
WHERE YEAR(NgayGiaoHang) = 2017 AND TenKhuVuc ='Hai Chau'

/*Liệt kê MaDonHangGiaoHang, MaThanhVienGiaoHang, TenThanhVienGiaoHang, 
NgayGiaoHang, PhuongThucThanhToan của tất cả những đơn hàng có trạng thái là "Da giao hang". Kết quả hiển  thị được sắp xếp tăng dần theo NgayGiaoHang và giảm dần theo PhuongThucThanhToan*/
SELECT MaDonHangGiaoHang, MaThanhVienGiaoHang, TenThanhVienGiaoHang, NgayGiaoHang, PhuongThucThanhToan FROM DONHANG_GIAOHANG
INNER JOIN THANHVIENGIAOHANG
ON DONHANG_GIAOHANG.MaThanhVienGiaoHang = THANHVIENGIAOHANG.MaThanhVienGiaoHang
WHERE TrangThaiGiaoHang LIKE 'Da giao hang'
ORDER BY NgayGiaoHang ASC, PhuongThucThanhToan DESC

/*Liệt kê những thành viên có giới tính là "Nam" và chưa từng được giao hàng lần nào.*/
SELECT * FROM THANHVIENGIAOHANG
INNER JOIN DONHANG_GIAOHANG
ON THANHVIENGIAOHANG.MaThanhVienGiaoHang = DONHANG_GIAOHANG.MaThanhVienGiaoHang
WHERE GioiTinh = 'Nam' AND TrangThaiGiaoHang = 'Chua Giao Hang'

/*Liệt kê họ tên của những khách hàng đang có trong hệ thống. Nếu họ tên trùng nhau thì chỉ hiển 
thị 1 lần. Học viên cần thực hiện yêu cầu này bằng 2 cách khác nhau */
SELECT DISTINCT TenKhachHang FROM KHACHANG;
SELECT TenKhachHang FROM KhachHang
GROUP BY TenKhachHang;

/* Liệt kê MaKhachHang, TenKhachHang, DiaChiNhanHang, MaDonHangGiaoHang, 
PhuongThucThanhToan, TrangThaiGiaoHang của tất cả các khách hàng đang có trong hệ thống */
SELECT MaKhachHang,TenKhachHang,DiaChiGiaoHang,MaDonHangGiaoHang,PhuongThucGiaoHang, TrangThaiKhachHang FROM KHACHHANG
LEFT JOIN DONHANG_GIAOHANG
ON KHACHHANG.MaKhachHang = DONHANG_GIAOHANG.MaKhachHang


/*Liệt kê những thành viên giao hàng có giới tính là "Nu" và từng giao hàng cho 10 khách hàng 
khác nhau ở khu vực giao hàng là "Hai Chau"*/
SELECT THANHVIENGIAOHANG.MaThanhVienGiaoHang, THANHVIENGIAOHANG.TenThanhVienGiaoHang FROM THANHVIENGIAOHANG
INNER JOIN DONHANG_GIAOHANG
ON THANHVIENGIAOHANG.MaThanhVienGiaoHang = DONHANG_GIAOHANG.MaThanhVienGiaoHang
INNER JOIN KHUVUC
ON DONHANG_GIAOHANG.MaKhuVucGiaoHang = KHUVUC.MaKhuVuc
WHERE Gioitinh = "Nu" AND TenKhuVuc = "Hai Chau"
GROUP BY THANHVIENGIAOHANG.MaThanhVienGiaoHang
HAVING COUNT(DISTINCT MaKhachHang) = 10;

/*Liệt kê những khách hàng đã từng yêu cầu giao hàng tại khu vực "Lien Chieu" và chưa từng 
được một thành viên giao hàng nào có giới tính là "Nam" nhận giao hàng.*/
SELECT KHACHHANG.* FROM KHACHHANG INNER JOIN DONHANG_GIAOHANG ON KHACHHANG.MaKhachHang = DONHANG_GIAOHANG.MaKhachHang
INNER JOIN KHUVUC ON DONHANG_GIAOHANG.MaKhuVuc = KHUVUC.MaKhuVuc
WHERE KHUVUC.TenKhuVuc = 'Lien Chieu'
EXCEPT 
SELECT KHACHHANG.* FROM KHACHHANG INNER JOIN DONHANG_GIAOHANG ON KHACHHANG.MaKhachHang = DONHANG_GIAOHANG.MaKhachHang
INNER JOIN THANHVIENGIAOHANG ON DONHANG_GIAOHANG.MaThanhVienGiaoHang = THANHVIENGIAOHANG.MaThanhVienGiaoHang
WHERE THANHVIENGIAOHANG.GioiTinh = 'Nam'



