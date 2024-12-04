create table KHOA(
  MaKhoa char(10) primary key,
  TenKhoa varchar(30),
  DienThoai int, )

  create table GIAOVIEN (
  MaGiaoVien char(10) primary key,
  HoTen varchar(30),
  MaKhoa char(10),
  foreign key(MaKhoa) references KHOA(MaKhoa), 
  )
create table MONHOC(
  MaMonHoc char(10) primary key,
  TenMonHoc varchar(30),
  SoTinChi varchar(20),
  )
create table TKB(
  SoThuTu char(100) primary key,
  HocKy int,
  MaGiaoVien char(10),
  MaMonHoc char(10),
  PhongHoc char(255),
  Thu int,
  TietBatDau int,
  TietKetThuc int,
  foreign key(MaGiaoVien) references GIAOVIEN(MaGiaoVien),
  foreign key(MaMonHoc) references MONHOC(MaMonHoc),
  )
  -- Thêm dữ liệu mẫu vào bảng KHOA
INSERT INTO KHOA (MaKhoa, TenKhoa, DienThoai)
VALUES 
('K01', 'Công nghệ thông tin', 0123456789),
('K02', 'Điện', 0987654321),
('K03', 'Xây dựng', 0474738338);

-- Thêm dữ liệu mẫu vào bảng GIAOVIEN
INSERT INTO GIAOVIEN (MaGiaoVien, HoTen, MaKhoa)
VALUES 
('GV01', N'Trương Ngọc Châu', 'K01'),
('GV02', 'Nguyễn Lê Hòa', 'K02'),
('GV03', 'Nguyễn Hữu Sơn', 'K03'),
('GV04', 'Đặng Thiên Bình', 'K01');

-- Thêm dữ liệu mẫu vào bảng MONHOC
INSERT INTO MONHOC (MaMonHoc, TenMonHoc, SoTinChi)
VALUES 
('CTDL', 'Cấu trúc dữ liệu', '2'),
('CSDL', 'Cơ sở dữ liệu', '2'),
('CKC', 'Cơ kết cấu', '2'),
('MD', 'Mạch điện', '3'),
('PT', 'Phân tích thiết kế', '3');

-- Thêm dữ liệu mẫu vào bảng TKB
INSERT INTO TKB (SoThuTu, HocKy, MaGiaoVien, MaMonHoc, PhongHoc, Thu, TietBatDau, TietKetThuc)
VALUES 
('TKB01', 2, 'GV04', 'CTDL', 'P101', 2, 1, 3),
('TKB02', 1, 'GV01', 'CSDL', 'P202', 3, 2, 4),
('TKB03', 2, 'GV02', 'CKC', 'P303', 4, 1, 3),
('TKB04', 1, 'GV03', 'MD', 'P301', 4, 1, 3),
('TKB05', 2, 'GV04', 'PT', 'P404', 5, 3, 5);

SELECT * FROM TKB
SELECT * FROM MONHOC
SELECT * FROM GIAOVIEN
SELECT * FROM KHOA
--a,iet ke ds ho ten gv..--
SELECT HoTen,Thu,TietBatDau,TietKetThuc,PhongHoc FROM GIAOVIEN gv
INNER JOIN TKB tkb
ON gv.MaGiaoVien = tkb.MaGiaoVien
WHERE HocKy = 1;


---b---
SELECT gv.MaGiaoVien FROM GIAOVIEN gv
INNER JOIN KHOA kh ON gv.MaKhoa = kh.MaKhoa
JOIN TKB tkb ON gv.MaGiaoVien = tkb.MaGiaoVien
WHERE TenKhoa = 'Công nghệ thông tin' 
AND HocKy = '2' 
AND tkb.MaMonHoc IN('PT','CTDL')
GROUP BY (gv.MaGiaoVien)
HAVING COUNT(tkb.MaMonHoc) = 2;

SELECT gv.MaGiaoVien FROM GIAOVIEN gv
JOIN KHOA kh ON gv.MaKhoa = kh.MaKhoa
JOIN TKB tkb ON gv.MaGiaoVien = tkb.MaGiaoVien
WHERE TenKhoa = 'Công nghệ thông tin' AND HocKy ='2' AND tkb.MaMonHoc = 'PT'
INTERSECT
SELECT gv.MaGiaoVien FROM GIAOVIEN gv
JOIN KHOA kh ON gv.MaKhoa = kh.MaKhoa
JOIN TKB tkb ON gv.MaGiaoVien = tkb.MaGiaoVien
WHERE TenKhoa = 'Công nghệ thông tin' AND HocKy ='2' AND tkb.MaMonHoc = 'CTDL';
---c--
SELECT TenMonHoc FROM MONHOC mh
JOIN TKB  ON mh.MaMonHoc = tkb.MaMonHoc
JOIN GIAOVIEN gv ON TKB.MaGiaoVien = gv.MaGiaoVien
JOIN KHOA ON gv.MaKhoa = KHOA.MaKhoa
WHERE TenKhoa = 'Điện'

--d--
SELECT HoTen FROM GIAOVIEN
WHERE MaGiaoVien IN (SELECT MaGiaoVien FROM TKB WHERE Thu = 5)
--e--
UPDATE KHOA
SET TenKhoa = 'Điện'
WHERE TenKhoa = 'Xây dựng' AND MaKhoa = 'K03'

SELECT HoTen FROM GIAOVIEN
JOIN TKB ON GIAOVIEN.MaGiaoVien = TKB.MaGiaoVien
JOIN MONHOC ON TKB.MaMonHoc = MONHOC.MaMonHoc
JOIN KHOA ON GIAOVIEN.MaKhoa = KHOA.MaKhoa
WHERE TenKhoa = 'Xây dựng' AND TenMonHoc = 'Cơ kết cấu' AND Thu = 4 AND TietBatDau = 1


---f---
UPDATE MONHOC
SET SoTinChi = 3
WHERE SoTinChi = 2 AND TenMonHoc = 'Cơ sở dữ liệu'

SELECT TOP 1 TenKhoa, COUNT(MaGiaoVien) AS Soluonggiaovien FROM KHOA
JOIN GIAOVIEN ON KHOA.MaKhoa = GIAOVIEN.MaKhoa
GROUP BY TenKhoa
ORDER BY Soluonggiaovien DESC


SELECT TenKhoa, COUNT(MaGiaoVien) AS Soluonggiaovien FROM GIAOVIEN
JOIN KHOA ON GIAOVIEN.MaKhoa = KHOA.MaKhoa
GROUP BY TenKhoa
HAVING COUNT(GIAOVIEN.MaGiaoVien) = (
SELECT MAX(SL) FROM( SELECT COUNT(MaGiaoVien) AS SL FROM GIAOVIEN
JOIN KHOA ON GIAOVIEN.MaKhoa = KHOA.MaKhoa
GROUP BY TenKhoa) AS sub )
