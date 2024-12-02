
-- tạo các bảng 
CREATE TABLE DONVI_UNGHO(
MaDVUH CHAR(20) NOT NULL PRIMARY KEY,
HoTenNguoiDaiDien NVARCHAR(255) NULL,
DiaChiNguoiDaiDien NVARCHAR(255) NOT NULL,
SoDienThoaiLienLac CHAR(15) NOT NULL,
SoCMNDNguoiDaiDien CHAR(20) NOT NULL,
SoTaiKhoanNganHang VARCHAR(20) NOT NULL,
TenNganHang NVARCHAR(50) NOT NULL,
ChiNhanhNganHang VARCHAR(20) NOT NULL,
TenChuTKNganHang NVARCHAR(50) NOT NULL,
)


CREATE TABLE HO_DAN(
    MaHoDan CHAR(10) NOT NULL,
   HoTenChuHo NVARCHAR(50) NOT NULL,
    ToDanPho NVARCHAR(50) NOT NULL,
    KhoiHoacThon NVARCHAR(5) NOT NULL,
    SoDienThoai CHAR(20) NOT NULL,
    DiaChiNha NVARCHAR(255) NOT NULL,
	SoNhanKhau NVARCHAR(255) NOT NULL,
	DienGiaDinh NVARCHAR(255) NOT NULL,
	LaHoNgheo NVARCHAR(255) NOT NULL,
    PRIMARY KEY(MaHoDan),
)


CREATE TABLE DOT_UNG_HO(
    MaDotUngHo CHAR(20) NOT NULL,
	MaDVUH CHAR(20) NOT NULL,
    NgayUngHo DATETIME NOT NULL,
    PRIMARY KEY(MaDotUngHo),
	FOREIGN KEY (MaDVUH) REFERENCES DONVI_UNGHO(MaDVUH),
)


CREATE TABLE HINHTHUC_UH(
    MaHinhThucUH CHAR(10) NOT NULL,
    TenHinhThucUngHo NVARCHAR(255) NOT NULL,
    PRIMARY KEY(MaHinhThucUH),
	
)

CREATE TABLE DOTNHAN_UNGHO(
    MaDotNhanUngHo CHAR(10) NOT NULL,
	MaHoDan CHAR(10) NOT NULL,
    NgayNhanUngHo DATETIME NOT NULL,
    PRIMARY KEY(MaDotNhanUngHo),
    FOREIGN KEY (MaHoDan) REFERENCES HO_DAN(MaHoDan),
	
)


CREATE TABLE CHITIET_UNGHO(
    MaDotUngHo CHAR(20) NOT NULL,
	MaHinhThucUH CHAR(10) NOT NULL,
    SoLuongUngHo INT NOT NULL,
	DonViTinh NVARCHAR(255) NOT NULL,
    PRIMARY KEY(MaDotUngHo,MaHinhThucUH),
	FOREIGN KEY (MaDotUngHo) REFERENCES DOT_UNG_HO(MaDotUngHo),
    FOREIGN KEY (MaHinhThucUH) REFERENCES HINHTHUC_UH(MaHinhThucUH)
	
) 
GO

CREATE TABLE CHITIET_NHAN_UNGHO(
    MaDotNhanUngHo CHAR(10) NOT NULL,
	MaHinhThucUH CHAR(10) NOT NULL,
    SoLuongNhanUngHo INT NOT NULL,
	DonViTinh NVARCHAR(255) NOT NULL,
    PRIMARY KEY(MaDotNhanUngHo,MaHinhThucUH),
	FOREIGN KEY (MaDotNhanUngHo) REFERENCES DOTNHAN_UNGHO(MaDotNhanUngHo),
	FOREIGN KEY (MaHinhThucUH) REFERENCES HINHTHUC_UH(MaHinhThucUH),
) 

--thêm dữ liệu
INSERT INTO HINHTHUC_UH (MaHinhThucUH, TenHinhThucUngHo)
VALUES 
    ('HT01', 'Tiền mặt'),
    ('HT02', 'Mì tôm'),
    ('HT03', 'Quần áo');

INSERT INTO HO_DAN (MaHoDan, HoTenChuHo, ToDanPho, KhoiHoacThon, SoDienThoai, DiaChiNha, SoNhanKhau, DienGiaDinh, LaHoNgheo)
VALUES 
    ('HD001', 'Tran Van B1', 10, 5, '0915222000', '12 Tran Van On', 5, 'Cong nhan vien chuc', 'Dung'),
    ('HD002', 'Tran Van B2', 11, 6, '0915222001', '13 Nguyen Huu Tho', 2, 'Cong nhan vien chuc', 'Sai'),
    ('HD003', 'Tran Van B3', 12, 7, '0915222002', '14 Phan Chu Trinh', 6, 'Thuong Binh', 'Dung'),
    ('HD004', 'Tran Van B4', 13, 7, '0915222003', '15 Phan Chu Trinh', 1, 'Me VNAH', 'Dung');


INSERT INTO DONVI_UNGHO(MaDVUH, HoTenNguoiDaiDien, DiaChiNguoiDaiDien, SoDienThoaiLienLac, SoCMNDNguoiDaiDien, SoTaiKhoanNganHang, TenNganHang, ChiNhanhNganHang, TenChuTKNganHang)
VALUES ('CN001', 'Nguyen Van A1', 'Nui Thanh, Quang Nam', '0905121121', '124898000', '65874000', 'TienPhongBank', 'Da Nang', 'Nguyen Van A1'),
       ('CN002', 'Nguyen Van A2', 'Phong Dien, Thua Thien Hue', '0905121122', '124898001', '65874001', 'VietcomBank', 'Quang Nam', 'Nguyen Van A2'),
	   ('CTY01', 'Nguyen Van A3', 'Tam Dao, Vinh Phuc', '0905121123', '124898002', '65874002', 'DongABank', 'Thua Thien Hue', 'Nguyen Van A3'),
	   ('CTY02', 'Nguyen Van A4', 'Ba To, Quang Ngai', '0905121124', '124898003', '65874003', 'MBank', 'Gia Lai', 'Nguyen Van A4');

INSERT INTO DOT_UNG_HO (MaDotUngHo, MaDVUH, NgayUngHo)
VALUES 
    ('UH001', 'CN002', '2016-11-18'),
    ('UH002', 'CTY01', '2015-11-19'),
    ('UH003', 'CTY02', '2015-08-10'),
    ('UH004', 'CTY02', '2015-10-20'),
    ('UH005', 'CTY02', '2016-11-11');

INSERT INTO CHITIET_UNGHO (MaDotUngHo, MaHinhThucUH, SoLuongUngHo, DonViTinh)
VALUES 
    ('UH001', 'HT01', 6000, 'USD'),
    ('UH002', 'HT02', 50, 'Thùng'),
    ('UH003', 'HT03', 200, 'Bộ'),
	('UH003', 'HT01', 100000, 'JPY'),
    ('UH004', 'HT01', 100000, 'USD'),
    ('UH005', 'HT03', 100, 'Bộ');





INSERT INTO DOTNHAN_UNGHO (MaDotNhanUngHo, MaHoDan, NgayNhanUngHo)
VALUES 
    ('NhanUH001', 'HD003', '2016-11-11'),
    ('NhanUH002', 'HD001', '2016-11-18'),
    ('NhanUH003', 'HD003', '2015-11-20');

INSERT INTO CHITIET_NHAN_UNGHO (MaDotNhanUngHo, MaHinhThucUH, SoLuongNhanUngHo, DonViTinh)
VALUES 
    ('NhanUH001', 'HT01', 5000, 'USD'),
    ('NhanUH001', 'HT02', 50, 'Thùng'),
    ('NhanUH002', 'HT03', 100, 'Bộ'),
    ('NhanUH003', 'HT01', 10000000, 'VND'),
    ('NhanUH003', 'HT02', 25, 'Thùng'),
    ('NhanUH003', 'HT03', 70, 'Bộ');


SELECT * FROM DOT_UNG_HO;
SELECT * FROM CHITIET_UNGHO;
SELECT * FROM HINHTHUC_UH;
SELECT * FROM HO_DAN;
SELECT * FROM DOTNHAN_UNGHO;
SELECT * FROM CHITIET_NHAN_UNGHO;

GO
/*Xóa những đơn vị ủng hộ có tài khoản ngân hàng đượcc mở ở ngân hàng "DOng A"*/
DELETE FROM DONVI_UNGHO
WHERE TenNganHang = 'DongA';


/*Cap nhat hinh thuc ung ho co ten la "Mi tom" thanh "mi an lien"*/
UPDATE HINHTHUC_UH 
SET TenHinhThucUngHo = 'Mi an lien'
WHERE TenHinhThucUngHo = 'Mì tôm'
SELECT TenHinhThucUngHo FROM HINHTHUC_UH;

 /*Liệt kê những chủ hộ có họ tên bắt đầu là ký tự 'Tr' và có độ dài nhiều nhất là 30 
ký tự (kể cả ký tự trắng) */ 
SELECT HoTenChuHo FROM HO_DAN
WHERE HoTenChuHo LIKE 'Tr%' AND len(HoTenChuHo) <= 30;

/*Liệt kê những đợt nhận ủng hộ có NgayNhanUngHo nằm trong năm 2016 và có 
MaHoDan kết thúc bằng ký tự '1' (ký tự số 1)  */

SELECT * FROM DOTNHAN_UNGHO 
WHERE YEAR(NgayNhanUngHo) = 2016 AND MaHoDan LIKE '%1';

/*Liệt kê MaDVUH, HoTenNguoiDaiDien, MaDotUngHo, NgayUngHo của những 
đợt ủng hộ diễn ra trước ngày 30/04/2016. Kết quả hiển thị cần được sắp xếp giảm dần 
theo NgayUngHo và tăng dần theo HoTenNguoiDaiDien  */

SELECT dvuh.MaDVUH,HoTenNguoiDaiDien,duh.MaDotUngHo,duh.NgayUngHo FROM DONVI_UNGHO dvuh
INNER JOIN DOT_UNG_HO duh
ON dvuh.MaDVUH = duh.MaDVUH
WHERE NgayUngHo < '2016-04-30' 
ORDER BY NgayUngHo ASC, HoTenNguoiDaiDien DESC;

/* Liệt kê những hộ dân là hộ nghèo và chưa từng được nhận ủng hộ lần nào */
SELECT * FROM HO_DAN 
WHERE LaHoNgheo = 'Dung' AND MaHoDan NOT IN(SELECT MaHoDan FROM DOTNHAN_UNGHO)
 /*Liệt kê họ tên của những chủ hộ đang có trong hệ thống. Nếu họ tên trùng nhau 
thì chỉ hiển thị 1 lần. Học viên cần thực hiện yêu cầu này bằng 2 cách khác nhau (mỗi 
cách được tính 0.5 điểm)*/

SELECT HoTenChuHo FROM HO_DAN
GROUP BY(HoTenChuHo)
SELECT DISTINCT HoTenChuHo FROM HO_DAN

/*Liệt kê MaHoDan, HoTenChuHo, ToDanPho, KhoiHoacThon, 
MaDotNhanUngHo, NgayNhanUngHo, MaHinhThucUH, SoLuongNhanUngHo, 
DonViTinh của tất cả hộ dân đang có trong hệ thống  */
SELECT hd.MaHoDan, HoTenChuHo,ToDanPho,KhoiHoacThon,dnuh.MaDotNhanUngHo,NgayNhanUngHo,MaHinhThucUH,SoLuongNhanUngHo,DonViTinh FROM HO_DAN hd
LEFT JOIN DOTNHAN_UNGHO dnuh
ON hd.MaHoDan = dnuh.MaHoDan
LEFT JOIN CHITIET_NHAN_UNGHO ctuh
ON dnuh.MaDotNhanUngHo = ctuh.MaDotNhanUngHo;

/* Liệt kê những đơn vị ủng hộ có tài khoản ngân hàng ở ngân hàng "DongA", từng 
ít nhất 5 lần hỗ trợ cho người dân với TenHinhThucUngHo là "Mi an lien" trong năm 
2016 */
--GROUP BY không có * 
SELECT dvuh.MaDVUH, HoTenNguoiDaiDien, COUNT(duh.MaDotUngHo) AS SoLanUngHo FROM DONVI_UNGHO dvuh
INNER JOIN DOT_UNG_HO duh
ON dvuh.MaDVUH = duh.MaDVUH
INNER JOIN CHITIET_UNGHO  ct
ON duh.MaDotUngHo = ct.MaDotUngHo
 JOIN HINHTHUC_UH htuh
ON ct.MaHinhThucUH = htuh.MaHinhThucUH
WHERE TenNganHang ='DongABank' AND TenHinhThucUngHo = 'Mi an lien' AND YEAR(NgayUngHo) = 2015
GROUP BY dvuh.MaDVUH,HoTenNguoiDaiDien,duh.MaDotUngHo,htuh.MaHinhThucUH
HAVING COUNT(duh.MaDotUngHo) >= 1


SELECT dvuh.MaDVUH, dvuh.HoTenNguoiDaiDien, COUNT(duh.MaDotUngHo) AS SoDotUngHo
FROM DONVI_UNGHO dvuh
INNER JOIN DOT_UNG_HO duh ON dvuh.MaDVUH = duh.MaDVUH
INNER JOIN CHITIET_UNGHO ct ON duh.MaDotUngHo = ct.MaDotUngHo
INNER JOIN HINHTHUC_UH htuh ON ct.MaHinhThucUH = htuh.MaHinhThucUH
WHERE dvuh.TenNganHang = 'DongABank'
  AND htuh.TenHinhThucUngHo = 'Mi an lien'
  AND YEAR(duh.NgayUngHo) = 2015
GROUP BY dvuh.MaDVUH, dvuh.HoTenNguoiDaiDien
HAVING COUNT(duh.MaDotUngHo) >= 1;


 /*Liệt kê những hộ dân đã từng được nhận ủng hộ với TenHinhThucUngHo là 
"Mi an lien" và chưa từng được nhận ủng hộ với TenHinhThucUngHo là "Gao" */
SELECT hd.MaHoDan, HoTenChuHo, TenHinhThucUngHo FROM HO_DAN hd
LEFT JOIN DOTNHAN_UNGHO dnuh
on hd.MaHoDan = dnuh.MaHoDan
left join CHITIET_NHAN_UNGHO ct
on dnuh.MaDotNhanUngHo = ct.MaDotNhanUngHo
left join HINHTHUC_UH ht
on ct.MaHinhThucUH = ht.MaHinhThucUH
WHERE TenHinhThucUngHo = 'Mi an lien'
EXCEPT 
SELECT hd.MaHoDan, HoTenChuHo, TenHinhThucUngHo FROM HO_DAN hd
LEFT JOIN DOTNHAN_UNGHO dnuh
on hd.MaHoDan = dnuh.MaHoDan
left join CHITIET_NHAN_UNGHO ct
on dnuh.MaDotNhanUngHo = ct.MaDotNhanUngHo
left join HINHTHUC_UH ht
on ct.MaHinhThucUH = ht.MaHinhThucUH
where TenHinhThucUngHo = 'Gao'

