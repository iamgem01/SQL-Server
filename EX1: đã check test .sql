
CREATE TABLE LOAIMATHANG(
MaLoaiMatHang  CHAR(20) NOT NULL PRIMARY KEY,
TenLoaiMatHang NVARCHAR(255) NULL,
)

CREATE TABLE KHUVUC(
    MaKhuVuc CHAR(20) NOT NULL PRIMARY KEY,
    TenKhuVuc NVARCHAR(255) NOT NULL,
)

CREATE TABLE KHOANGTHOIGIAN(
    MaKhoangThoiGianGiaoHang CHAR(10) NOT NULL PRIMARY KEY,
    MoTa VARCHAR(255) NOT NULL,
)
CREATE TABLE DICHVU(
    MaDichVu CHAR(10) NOT NULL PRIMARY KEY,
    TenDichVu VARCHAR(255) NOT NULL,
) 

CREATE TABLE THANHVIENGIAOHANG(
    MaThanhVienGiaoHang CHAR(10) NOT NULL PRIMARY KEY,
    TenThanhVienGiaoHang NVARCHAR(50) NOT NULL,
    NgaySinh DATETIME NOT NULL,
    GioiTinh CHAR(3) NOT NULL,
    SDTThanhVien VARCHAR(15) NOT NULL,
    DiaChiThanhVien NVARCHAR(255) NOT NULL,
)

CREATE TABLE DANGKYGIAOHANG(
    MaThanhVienGiaoHang CHAR(10) NOT NULL,
    MaKhoangThoiGianGiaoHang CHAR(10) NOT NULL,
    FOREIGN KEY (MaThanhVienGiaoHang) REFERENCES THANHVIENGIAOHANG(MaThanhVienGiaoHang),
    FOREIGN KEY (MaKhoangThoiGianGiaoHang) REFERENCES KHOANGTHOIGIAN(MaKhoangThoiGianGiaoHang),
)

CREATE TABLE KHACHHANG(
    MaKhachHang CHAR(10) NOT NULL PRIMARY KEY,
    MaKhuVuc CHAR(20) NOT NULL,
    TenKhachHang NVARCHAR(50) NOT NULL,
    TenCuaHang NVARCHAR(50) NOT NULL,
    SDTKhachHang VARCHAR(15) NOT NULL,
    DiaChiEmail NVARCHAR(255) NOT NULL,
    DiaChiNhanHang NVARCHAR(255) NOT NULL,
    FOREIGN KEY (MaKhuVuc) REFERENCES KHUVUC(MaKhuVuc),
)

CREATE TABLE DONHANG_GIAOHANG(
    MaDonHangGiaoHang CHAR(10) NOT NULL PRIMARY KEY,
    MaKhachHang CHAR(10) NOT NULL,
    MaThanhVienGiaoHang CHAR(10) NOT NULL,
    MaDichVu CHAR(10) NOT NULL,
	MaKhuVucGiaoHang CHAR(20) NOT NULL,
    TenNguoiNhan NVARCHAR(50) NOT NULL,
    DiaChiGiaoHang NVARCHAR(255) NOT NULL,
    SDTNguoiNhan VARCHAR(15) NOT NULL,
    MaKhoangThoiGianGiaoHang CHAR(10) NOT NULL,
    NgayGiaoHang DATE NOT NULL,
    PhuongThucThanhToan NVARCHAR(20) NOT NULL,
    TrangThaiPheDuyet VARCHAR(20) NOT NULL,
    TrangThaiGiaoHang NVARCHAR(10) NOT NULL,
    FOREIGN KEY (MaKhachHang) REFERENCES KHACHHANG(MaKhachHang),
    FOREIGN KEY (MaThanhVienGiaoHang) REFERENCES THANHVIENGIAOHANG(MaThanhVienGiaoHang),
    FOREIGN KEY (MaDichVu) REFERENCES DICHVU(MaDichVu),
	FOREIGN KEY (MaKhuVucGiaoHang) REFERENCES KHUVUC(MaKhuVuc),
    FOREIGN KEY (MaKhoangThoiGianGiaoHang) REFERENCES KHOANGTHOIGIAN(MaKhoangThoiGianGiaoHang),
)

CREATE TABLE CHITIET_DONHANG(
    MaDonHangGiaoHang CHAR(10) NOT NULL,
    TenSanPhamDuocGiao NVARCHAR(255),
    SoLuong INT,
    TrongLuong FLOAT,
    MaLoaiMatHang CHAR(20) NOT NULL,
    TienThuHo DECIMAL(15, 2),
    PRIMARY KEY (MaDonHangGiaoHang, TenSanPhamDuocGiao),
	FOREIGN KEY (MaDonHangGiaoHang) REFERENCES DONHANG_GIAOHANG(MaDonHangGiaoHang),
    FOREIGN KEY (MaLoaiMatHang) REFERENCES LOAIMATHANG(MaLoaiMatHang),
)


ALTER TABLE DONHANG_GIAOHANG
ALTER COLUMN TrangThaiGiaoHang NVARCHAR(20);

INSERT INTO LOAIMATHANG(MaLoaiMatHang,TenLoaiMatHang)
VALUES ('MH001','Quan ao'),
       ('MH002','My pham'),
	   ('MH003','Do gia dung'),
	   ('MH004','Do dien tu');

INSERT INTO KHUVUC(MaKhuVuc,TenKhuVuc)
VALUES ('KV001','Son Tra'),
       ('KV002','Lien Chieu'),
	   ('KV003','Ngu Hanh Son'),
	   ('KV004','Hai Chau'),
	   ('KV005','Thanh Khe');

INSERT INTO KHOANGTHOIGIAN(MaKhoangThoiGianGiaoHang,MoTa)
VALUES ('TG001','7h - 9h AM'),
       ('TG002','9h - 11h AM'),
	   ('TG003','1h - 3h AM'),
	   ('TG004','3h - 5h AM'),
	   ('TG005','7h - 9h30 AM');

INSERT INTO DICHVU(MaDichVu,TenDichVu)
VALUES ('DV001','Giao hang nguoi nhan tra tien phi'),
       ('DV002','Giao hang nguoi gui tra tien phi'),
	   ('DV003','Giao hang cong ich(khong tinh phi');

INSERT INTO THANHVIENGIAOHANG(MaThanhVienGiaohang, TenThanhVienGiaohang, NgaySinh, GioiTinh, SDTThanhVien, DiaChiThanhVien)
VALUES 
('TV001', 'Nguyen Van A', '1995-11-20', 'Nam', '0905111111', '23 Ong Ich Khiem'),
('TV002', 'Nguyen Van B', '1992-12-26', 'Nu', '0905111112', '234 Ton Duc Thang'),
('TV003', 'Nguyen Van C', '1990-11-30', 'Nu', '0905111113', '43 Hoang Dieu'),
('TV004', 'Nguyen Van D', '1995-08-07', 'Nam', '0905111114', '23/33 Ngu Hanh Son'),
('TV005', 'Nguyen Van E', '1991-02-04', 'Nam', '0905111115', '56 Dinh Thi Dieu');

INSERT INTO DANGKYGIAOHANG(MaThanhVienGiaoHang, MaKhoangThoiGianGiaoHang)
VALUES 
('TV001', 'TG004'),
('TV002', 'TG005'),
('TV003', 'TG001'),
('TV003', 'TG002'),
('TV003', 'TG003');

INSERT INTO KHACHHANG(MaKhachHang, MaKhuVuc, TenKhachHang, TenCuaHang, SDTKhachHang, DiaChiEmail, DiaChiNhanHang) VALUES 
('KH001', 'KV001', 'Le Thi A', 'Cua hang 1', '0905111111', 'alethi@gmail.com', '80 Phan Phu Thai'),
('KH002', 'KV001', 'Nguyen Van B', 'Cua hang 2', '0905111112', 'bnguyenvan@gmail.com', '100 Phan Tu'),
('KH003', 'KV002', 'Le Thi B', 'Cua hang 3', '0905111113', 'blethi@gmail.com', '23 An Thuong 18'),
('KH004', 'KV002', 'Nguyen Van C', 'Cua hang 4', '0905111114', 'nguyenvanc@gmail.com', '67 Ngo The Thai'),
('KH005', 'KV001', 'Le Thi D', 'Cua hang 5', '0905111115', 'dlethi@gmail.com', '100 Chau Thi Vinh Te');

INSERT INTO DONHANG_GIAOHANG(MaDonHangGiaohang, MaKhachHang, MaThanhVienGiaohang, MaDichVu,MaKhuVucGiaoHang, TenNguoiNhan, DiaChiGiaoHang, SDTNguoiNhan, MaKhoangThoiGianGiaoHang,  NgayGiaoHang, PhuongThucThanhToan, TrangThaiPheDuyet, TrangThaiGiaoHang) VALUES 
('DH001', 'KH001', 'TV001','DV001', 'KV001', 'Pham Van A', '30 Hoang Van Thu', '0905111111', 'TG004', '2016-10-10', 'Tien mat', 'Da duyet', 'Da giao hang'),
('DH002', 'KH001', 'TV002','DV001', 'KV005', 'Pham Van B', '15 Le Dinh Ly', '0905111112', 'TG005', '2016-12-23', 'Tien mat', 'Da duyet', 'Chua giao hang'),
('DH003', 'KH002', 'TV003','DV001', 'KV005', 'Pham Van C', '23 Le Dinh Duong', '0905111113', 'TG001', '2017-04-08', 'Tien mat', 'Da duyet', 'Da giao hang'),
('DH004', 'KH003', 'TV001','DV003', 'KV002', 'Pham Van D', '45 Pham Phu Thai', '0905111114', 'TG002', '2015-10-11', 'Chuyen khoan', 'Da duyet', 'Da giao hang'),
('DH005', 'KH003', 'TV005','DV003', 'KV003', 'Pham Van E', '78 Hoang Dieu', '0905111115', 'TG003', '04-04-2017', 'Chuyen khoan', 'Chua duyet', NULL);

INSERT INTO CHITIET_DONHANG(MaDonHangGiaoHang, TenSanPhamDuocGiao, SoLuong, TrongLuong, MaLoaiMatHang, TienThuHo) VALUES 
('DH001', 'Ao len', 2, 0.5, 'MH001', 200000),
('DH001', 'Quan ao', 1, 0.25, 'MH001', 350000),
('DH002', 'Ao thun', 1, 0.25, 'MH001', 1000000),
('DH002', 'Ao khoac', 3, 0.25, 'MH001', 2000000),
('DH003', 'Sua duong the', 2, 0.25, 'MH003', 780000),
('DH003', 'Kem tay da chet', 3, 0.5, 'MH003', 150000),
('DH003', 'Kem duong ban dem', 4, 0.25, 'MH003', 900000);


SELECT * FROM LOAIMATHANG;
SELECT * FROM KHUVUC;
SELECT * FROM KHOANGTHOIGIAN;
SELECT * FROM DICHVU;
SELECT * FROM THANHVIENGIAOHANG;
SELECT * FROM DANGKYGIAOHANG;
SELECT * FROM KHACHHANG;
SELECT * FROM CHITIET_DONHANG;
SELECT * FROM DONHANG_GIAOHANG;
GO




/*bai1 xoa nhung khach hang ten Le thi a*/
ALTER TABLE DONHANG_GIAOHANG 
DROP CONSTRAINT FK__DONHANG_G__MaKha__46E78A0C;

ALTER TABLE DONHANG_GIAOHANG 
ADD CONSTRAINT FK__DONHANG_G__MaKha__46E78A0C 
FOREIGN KEY (MaKhachHang) 
REFERENCES KHACHHANG (MaKhachHang) 
ON DELETE CASCADE;


BEGIN TRANSACTION;

-- Xóa trong bảng CHITIET_DONHANG
DELETE FROM CHITIET_DONHANG 
WHERE MaDonHangGiaoHang IN (
    SELECT MaDonHangGiaoHang 
    FROM DONHANG_GIAOHANG 
    WHERE MaKhachHang = (
        SELECT MaKhachHang 
        FROM KHACHHANG 
        WHERE TenKhachHang = 'Le Thi A'
    )
);

-- Xóa trong bảng DONHANG_GIAOHANG
DELETE FROM DONHANG_GIAOHANG 
WHERE MaKhachHang = (
    SELECT MaKhachHang 
    FROM KHACHHANG 
    WHERE TenKhachHang = 'Le Thi A'
);

-- Xóa trong bảng KHACHHANG
DELETE FROM KHACHHANG 
WHERE TenKhachHang = 'Le Thi A';

COMMIT;

DELETE FROM KHACHHANG WHERE TenKhachHang = 'Le Thi A';

--Cập nhật những khách hàng đang thường trú ở khu vực "Son Tra" thành khu vực "Ngu Hanh Son" --
UPDATE KHUVUC
SET TenKhuVuc = 'Ngu Hanh Son'
WHERE TenKhuVuc = 'Son Tra';

--Liệt kê những thành viên (shipper) có họ tên bắt đầu là ký tự 'C' và có độ dài ít nhất là 5 ký tự (kể cả ký tự trắng)--
SELECT TenThanhVienGiaoHang FROM THANHVIENGIAOHANG
WHERE TenThanhVienGiaoHang LIKE '%C' AND LEN(TenThanhVienGiaoHang) >=5;

--Liệt kê những đơn hàng có NgayGiaoHang nằm trong năm 2017 và có khu vực giao hàng là "Hai Chau"--
SELECT * FROM DONHANG_GIAOHANG dh
INNER JOIN KHUVUC kv
ON dh.MaKhuVucGiaoHang = kv.MaKhuVuc
WHERE YEAR(NgayGiaoHang) = 2017 AND TenKhuVuc ='Ngu Hanh Son'

 --Liệt kê MaDonHangGiaoHang, MaThanhVienGiaoHang, TenThanhVienGiaoHang, 
-- NgayGiaoHang, PhuongThucThanhToan của tất cả những đơn hàng có trạng thái là "Da giao hang". Kết 
-- quả hiển thị được sắp xếp tăng dần theo NgayGiaoHang và giảm dần theo PhuongThucThanhToan
SELECT dh.MaDonHangGiaoHang,tvgh.MaThanhVienGiaoHang,tvgh.TenThanhVienGiaoHang,dh.NgayGiaoHang,dh.PhuongThucThanhToan FROM DONHANG_GIAOHANG dh
INNER JOIN THANHVIENGIAOHANG tvgh ON dh.MaThanhVienGiaoHang = tvgh.MaThanhVienGiaoHang
WHERE TrangThaiGiaoHang = 'Da giao hang'
ORDER BY NgayGiaoHang ASC, PhuongThucThanhToan DESC;

-- Liệt kê những thành viên có giới tính là "Nam" và chưa từng được giao hàng lần nào. 
SELECT tv.* FROM THANHVIENGIAOHANG tv
WHERE GioiTinh = 'Nam' AND MaThanhVienGiaoHang NOT IN(SELECT MaThanhVienGiaoHang FROM DONHANG_GIAOHANG);

SELECT tv.* FROM THANHVIENGIAOHANG tv
INNER JOIN DONHANG_GIAOHANG dh
ON tv.MaThanhVienGiaoHang = dh.MaThanhVienGiaoHang
WHERE GioiTinh = 'Nu' AND TrangThaiGiaoHang = 'Chua giao hang';

--Liệt kê họ tên của những khách hàng đang có trong hệ thống. Nếu họ tên trùng nhau thì chỉ hiển 
--thị 1 lần. Học viên cần thực hiện yêu cầu này bằng 2 cách khác nhau (mỗi cách được tính 0.5 điểm) 
SELECT DISTINCT TenKhachHang FROM KHACHHANG
SELECT TenKhachHang FROM KHACHHANG
GROUP BY TenKhachHang

--Liệt kê MaKhachHang, TenKhachHang, DiaChiNhanHang, MaDonHangGiaoHang, 
--PhuongThucThanhToan, TrangThaiGiaoHang của tất cả các khách hàng đang có trong hệ thống (1 
--điểm) 
SELECT kh.MaKhachHang, TenKhachHang, DiaChiNhanHang, MaDonHangGiaoHang, PhuongThucThanhToan, TrangThaiGiaoHang FROM KHACHHANG kh
LEFT JOIN DONHANG_GIAOHANG dh
ON kh.MaKhachHang = dh.MaKhachHang

--Liệt kê những thành viên giao hàng có giới tính là "Nu" và từng giao hàng cho 10 khách hàng 
--khác nhau ở khu vực giao hàng là "Hai Chau" (1 điểm)

SELECT tv.MaThanhVienGiaoHang FROM THANHVIENGIAOHANG tv
INNER JOIN DONHANG_GIAOHANG dh
ON tv.MaThanhVienGiaoHang = dh.MaThanhVienGiaoHang
INNER JOIN KHUVUC kv
ON dh.MaKhuVucGiaoHang = kv.MaKhuVuc
WHERE GioiTinh = 'Nu' AND TenKhuVuc='Thanh Khe'
GROUP BY tv.MaThanhVienGiaoHang
HAVING COUNT(dh.MaKhachHang) =1

/* Liệt kê những khách hàng đã từng yêu cầu giao hàng tại khu vực "Thanh Khe" và chưa từng 
được một thành viên giao hàng nào có giới tính là "Nam" nhận giao hàng */
SELECT kh.* FROM KHACHHANG kh
INNER JOIN DONHANG_GIAOHANG dhgh
on kh.MaKhachHang = dhgh.MaKhachHang
INNER JOIN KHUVUC kv
on dhgh.MaKhuVucGiaoHang = kv.MaKhuVuc
JOIN THANHVIENGIAOHANG tvgh
on dhgh.MaThanhVienGiaoHang = tvgh.MaThanhVienGiaoHang

WHERE kv.TenKhuVuc = 'Thanh Khe' 
EXCEPT 
SELECT kh.* FROM KHACHHANG kh
INNER JOIN DONHANG_GIAOHANG dhgh
on kh.MaKhachHang = dhgh.MaKhachHang
INNER JOIN KHUVUC kv
on dhgh.MaKhuVucGiaoHang = kv.MaKhuVuc
JOIN THANHVIENGIAOHANG tvgh
on dhgh.MaThanhVienGiaoHang = tvgh.MaThanhVienGiaoHang
WHERE GioiTinh ='Nam'
