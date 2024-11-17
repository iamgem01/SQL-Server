USE Baitap1
GO

CREATE TABLE LOAIMATHANG(
MaLoaiMatHang VARCHAR(20) NOT NULL PRIMARY KEY,
TenLoaiMatHang NVARCHAR(255) NULL,
)
GO

CREATE TABLE KHUVUC(
    MaKhuVuc NVARCHAR(20) NOT NULL,
    TenKhuVuc NVARCHAR(255) NOT NULL,
    PRIMARY KEY(MaKhuVuc),
)
GO

CREATE TABLE KHOANGTHOIGIAN(
    MaKhoangThoiGianGiaoHang NVARCHAR(10) NOT NULL,
    MoTa VARCHAR(255) NOT NULL,
    PRIMARY KEY(MaKhoangThoiGianGiaoHang),
)
GO
CREATE TABLE DICHVU(
    MaDichVu NVARCHAR(10) NOT NULL,
    TenDichVu VARCHAR(255) NOT NULL,
    PRIMARY KEY(MaDichVu),
) 
GO

CREATE TABLE THANHVIENGIAOHANG(
    MaThanhVienGiaoHang NVARCHAR(10) NOT NULL,
    TenThanhVienGiaoHang NVARCHAR(50) NOT NULL,
    NgaySinh DATETIME NOT NULL,
    GioiTinh CHAR(3) NOT NULL,
    SDTThanhVien VARCHAR(15) NOT NULL,
    DiaChiThanhVien NVARCHAR(255) NOT NULL,
    PRIMARY KEY(MaThanhVienGiaoHang),
)
GO

CREATE TABLE DANGKYGIAOHANG(
    MaThanhVienGiaoHang NVARCHAR(10) NOT NULL,
    MaKhoangThoiGianGiaoHang NVARCHAR(10) NOT NULL,
    PRIMARY KEY (MaThanhVienGiaoHang, MaKhoangThoiGianGiaoHang),
    FOREIGN KEY (MaThanhVienGiaoHang) REFERENCES THANHVIENGIAOHANG(MaThanhVienGiaoHang),
    FOREIGN KEY (MaKhoangThoiGianGiaoHang) REFERENCES KHOANGTHOIGIAN(MaKhoangThoiGianGiaoHang),
)
GO

CREATE TABLE KHACHHANG(
    MaKhachHang NVARCHAR(10) NOT NULL,
    MaKhuVuc NVARCHAR(20) NOT NULL,
    TenKhachHang NVARCHAR(50) NOT NULL,
    TenCuaHang NVARCHAR(50) NOT NULL,
    SDTKhachHang VARCHAR(15) NOT NULL,
    DiaChiEmail NVARCHAR(255) NOT NULL,
    DiaChiNhanHang NVARCHAR(255) NOT NULL,
    PRIMARY KEY (MaKhachHang),
    FOREIGN KEY (MaKhuVuc) REFERENCES KHUVUC(MaKhuVuc),
)
GO

CREATE TABLE DONHANGGIAOHANG(
    MaDonHangGiaoHang CHAR(10) NOT NULL,
    MaKhachHang NVARCHAR(10) NOT NULL,
    MaThanhVienGiaoHang NVARCHAR(10) NOT NULL,
    MaDichVu NVARCHAR(10) NOT NULL,
	MaKhuVucGiaoHang NVARCHAR(10) NOT NULL,
    TenNguoiNhan NVARCHAR(50) NOT NULL,
    DiaChiGiaoHang NVARCHAR(255) NOT NULL,
    SDTNguoiNhan VARCHAR(15) NOT NULL,
    MaKhoangThoiGianGiaoHang NVARCHAR(10) NOT NULL,
    NgayGiaoHang DATE NOT NULL,
    PhuongThucThanhToan NVARCHAR(20) NOT NULL,
    TrangThaiPheDuyet VARCHAR(20) NOT NULL,
    TrangThaiGiaoHang NVARCHAR(10) NOT NULL,
    PRIMARY KEY (MaDonHangGiaoHang),
    FOREIGN KEY (MaKhachHang) REFERENCES KHACHHANG(MaKhachHang),
    FOREIGN KEY (MaThanhVienGiaoHang) REFERENCES THANHVIENGIAOHANG(MaThanhVienGiaoHang),
    FOREIGN KEY (MaDichVu) REFERENCES DICHVU(MaDichVu),
    FOREIGN KEY (MaKhoangThoiGianGiaoHang) REFERENCES KHOANGTHOIGIAN(MaKhoangThoiGianGiaoHang),
)
GO

CREATE TABLE CHITIETDONHANG(
    MaDonHangGiaoHang CHAR(10) NOT NULL,
    TenSanPhamDuocGiao NVARCHAR(255),
    SoLuong INT,
    TrongLuong FLOAT,
    MaLoaiMatHang VARCHAR(20) NOT NULL,
    TienThuHo DECIMAL(15, 2),
    PRIMARY KEY (MaDonHangGiaoHang, TenSanPhamDuocGiao),
    FOREIGN KEY (MaDonHangGiaoHang) REFERENCES DONHANGGIAOHANG(MaDonHangGiaoHang),
    FOREIGN KEY (MaLoaiMatHang) REFERENCES LOAIMATHANG(MaLoaiMatHang),
)
GO

/*them gia tri vo ne*/

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

INSERT INTO DONHANGGIAOHANG(MaDonHangGiaohang, MaKhachHang, MaThanhVienGiaohang, MaDichVu,MaKhuVucGiaoHang, TenNguoiNhan, DiaChiGiaoHang, SDTNguoiNhan, MaKhoangThoiGianGiaoHang,  NgayGiaoHang, PhuongThucThanhToan, TrangThaiPheDuyet, TrangThaiGiaoHang) VALUES 
('DH001', 'KH001', 'TV001', 'DV001', 'KV001', 'Pham Van A', '30 Hoang Van Thu', '0905111111', 'TG004', '2016-10-10', 'Tien mat', 'Da duyet', 'Da giao hang'),
('DH002', 'KH001', 'TV002','DV001', 'KV005', 'Pham Van B', '15 Le Dinh Ly', '0905111112', 'TG005', '2016-12-23', 'Tien mat', 'Da duyet', 'Chua giao hang'),
('DH003', 'KH002', 'TV003','DV001', 'KV005', 'Pham Van C', '23 Le Dinh Duong', '0905111113', 'TG001', '2017-04-08', 'Tien mat', 'Da duyet', 'Da giao hang'),
('DH004', 'KH003', 'TV001','DV003', 'KV002', 'Pham Van D', '45 Pham Phu Thai', '0905111114', 'TG002', '2015-10-11', 'Chuyen khoan', 'Da duyet', 'Da giao hang'),
('DH005', 'KH003', 'TV005','DV003', 'KV003', 'Pham Van E', '78 Hoang Dieu', '0905111115', 'TG003', '04-04-2017', 'Chuyen khoan', 'Chua duyet', NULL);
GO
ALTER TABLE CHITIETDONHANG
DROP CONSTRAINT FK_CHITIETDONHANG_LOAIMATHANG;

INSERT INTO CHITIETDONHANG(MaDonHangGiaoHang, TenSanPhamDuocGiao, SoLuong, TrongLuong, MaLoaiMatHang, TienThuHo) VALUES 
('DH001', 'Ao len', 2, 0.5, 'binh thuong', 200000),
('DH001', 'Quan ao', 1, 0.25, 'binh thuong', 350000),
('DH002', 'Ao thun', 1, 0.25, 'binh thuong', 1000000),
('DH002', 'Ao khoac', 3, 0.25, 'binh thuong', 2000000),
('DH003', 'Sua duong the', 2, 0.25, 'binh thuong', 780000),
('DH003', 'Kem tay da chet', 3, 0.5, 'binh thuong', 150000),
('DH003', 'Kem duong ban dem', 4, 0.25, 'binh thuong', 900000);
