CREATE TABLE LOAITHUTUC(
 MaLoaiTT CHAR(10) PRIMARY KEY,
 TenLoaiTT NVARCHAR(50),
 ThoiHanTraKetQua INT,
 MucPhi INT,
 )
 CREATE TABLE CONGDAN(
 MaCD CHAR(10) PRIMARY KEY,
 HoTenCD NVARCHAR(50),
 DiaChi NVARCHAR(50),
 ToDanPho NVARCHAR(50),
 GioiTinh CHAR(3),
 HoTenChuHo NVARCHAR(50),
 QuanHeVoiChuHo NVARCHAR(50),
 )

 CREATE TABLE CANBOTIEPNHAN(
 MaCBTN CHAR(10) PRIMARY KEY,
 HoTenCBTN NVARCHAR(20),
 ChucVu NVARCHAR(20),
 )

 CREATE TABLE YEUCAUTHUTUC(
 MaYeuCau CHAR(10) PRIMARY KEY,
 MaCD CHAR(10),
 NoiDungYeuCau NVARCHAR(50),
 MaLoaiTT CHAR(10),
 ThoiDiemTaoYeuCau DATE,
 ThoiDiemHenTraKetQua DATE,
 MaCBTN CHAR(10),
 TrangThai NVARCHAR(50),
 FOREIGN KEY (MaCD) REFERENCES CONGDAN(MaCD),
 FOREIGN KEY (MaLoaiTT) REFERENCES LOAITHUTUC(MaLoaiTT),
 FOREIGN KEY (MaCBTN) REFERENCES CANBOTIEPNHAN(MaCBTN),
 )

 CREATE TABLE GIAYTOKEMTHEO(
 MaYeuCau CHAR(10),
 TenGiayToKemTheo NVARCHAR(50),
 MoTaGiayToKemTheo NVARCHAR(50),
 ThoiDiemNhanGTKT DATE,
 PRIMARY KEY(TenGiayToKemTheo,MaYeuCau),
 FOREIGN KEY (MaYeuCau) REFERENCES YEUCAUTHUTUC(MaYeuCau)
 )

 CREATE TABLE GIAYTOCANBOSUNG(
 MaYeuCau CHAR(10),
 TenGiayToCanBoSung NVARCHAR(50),
 MoTaGiayToCanBoSung NVARCHAR(50),
 ThoiHanCuoiCungDeBoSung DATE,
 TinhTrangBoSung NVARCHAR(50),
 PRIMARY KEY(TenGiayToCanBoSung,MaYeuCau),
 FOREIGN KEY (MaYeuCau) REFERENCES YEUCAUTHUTUC(MaYeuCau)
 )
 GO
UPDATE CONGDAN
SET GioiTinh = 
    CASE 
        WHEN GioiTinh= 'Nam' THEN 1
        WHEN GioiTinh = 'Nu' THEN 0
        ELSE NULL
    END
WHERE GioiTinh IN ('Nam', 'Nu');


ALTER TABLE CONGDAN
ALTER COLUMN GioiTinh CHAR(3);

 INSERT INTO CONGDAN(MaCD, HoTenCD, DiaChi, ToDanPho, GioiTinh, HoTenChuHo, QuanHeVoiChuHo)
 VALUES ('CD001', 'Tran A1', '10 Nguyen Du', 'To 1', 'Nam', 'Nguyen Van1', 'Ban than'),
        ('CD002', 'Tran A2', '11 Nguyen Du', 'To 2', 'Nu', 'Nguyen Van2', 'Chong'),
		('CD003', 'Tran A3', '12 Nguyen Du', 'To 3', 'Nam', 'Nguyen Van3', 'Vo');

 INSERT INTO LOAITHUTUC(MaLoaiTT, TenLoaiTT, ThoiHanTraKetQua, MucPhi)
 VALUES ('TT001', 'Dang ky ket hon', '2', '15000'),
        ('TT002', 'Khai sinh', '7', '20000');

INSERT INTO CANBOTIEPNHAN(MaCBTN,HoTenCBTN,ChucVu)
VALUES  ('CB001','CBTN001','Nhan vien thoi vu'),
        ('CB002','CBTN002','Can bo ho tich');

INSERT INTO YEUCAUTHUTUC(MaYeuCau,MaCD,NoiDungYeuCau,MaLoaiTT,ThoiDiemTaoYeuCau,ThoiDiemHenTraKetQua,MaCBTN,TrangThai)
VALUES ('YC00001','CD001','Khai sinh cho con','TT002','2019-02-15 07:50:00','2019-02-25 13:00:00','CB001','Da tiep nhan xu ly'),
       ('YC00002','CD002','Khai sinh cho me','TT010','2019-02-15 07:10:00',NULL,'CB002','Cong dan moi dang ky');

INSERT INTO GIAYTOKEMTHEO(MaYeuCau,TenGiayToKemTheo,MoTaGiayToKemTheo,ThoiDiemNhanGTKT)
VALUES ('YC00001','Giay dang ky ket hon','Giay dang ky ket hon cua cha me','2019-02-15 07:50:00'),
       ('YC00001','Ho khau','Ho khau thuong tru','2019-02-15 07:50:00');


INSERT INTO GIAYTOCANBOSUNG(MaYeuCau,TenGiayToCanBoSung,MoTaGiayToCanBoSung,ThoiHanCuoiCungDeBoSung,TinhTrangBoSung)
VALUES ('YC00002','Chung minh nhan dan','Ban sao CMND','2019-02-15 07:50:00','Dang yeu cau bo sung'),
       ('YC00002','Giay khai sinh','Giay khai sinh nguoi khai','2019-03-15 07:50:00','Da duoc bo sung');

SELECT * FROM CANBOTIEPNHAN;
SELECT * FROM CONGDAN;
SELECT * FROM GIAYTOCANBOSUNG;
SELECT * FROM GIAYTOKEMTHEO;
SELECT * FROM LOAITHUTUC;
SELECT * FROM YEUCAUTHUTUC;
GO
--Câu 1: Xóa những công dân ở tổ dân phố 13. 
DELETE FROM CONGDAN
WHERE ToDanPho = 'To 13';

--Câu 2: Cập nhật những loại thủ tục có thời hạn trả kết quả tối đa là 2 (ngày) thành 5 
--(ngày). 
UPDATE LOAITHUTUC
SET ThoiHanTraKetQua = '5'
WHERE ThoiHanTraKetQua = '2';
SELECT ThoiHanTraKetQua FROM LOAITHUTUC

--Câu 3: Liệt kê những công dân có họ tên bắt đầu là ký tự 'Tr', kết thúc bằng ký tự '3' và 
-- có độ dài tối đa là 50 ký tự (kể cả ký tự trắng).  
SELECT HoTenCD FROM CONGDAN 
WHERE HoTenCD LIKE 'Tr%3' AND len(HoTenCD) < 50

--Câu 4: Liệt kê những yêu cầu có thời điểm tạo nằm trong năm 2016 hoặc năm 2019.
SELECT * FROM YEUCAUTHUTUC
WHERE YEAR(ThoiDiemTaoYeuCau) = 2016 OR YEAR(ThoiDiemTaoYeuCau) = 2019

--Câu 5: Liệt kê MaYeuCau, MaCD, NoiDungYeuCau, ThoiDiemTaoYeuCau, 
--ThoiDiemHenTraKetQua, TrangThai của tất cả những yêu cầu có trạng thái là "Da tiep 
--nhan xu ly". Kết quả hiển thị được sắp xếp giảm dần theo MaCD và tăng dần theo ThoiDiemHenTraKetQua.  
SELECT MaYeuCau, MaCD, NoiDungYeuCau, ThoiDiemTaoYeuCau, ThoiDiemHenTraKetQua, TrangThai FROM YEUCAUTHUTUC
WHERE TrangThai = 'Da tiep nhan xu ly'
ORDER BY MaCD ASC, ThoiDiemHenTraKetQua DESC;

--Câu 6: Liệt kê những cán bộ có chức vụ là "Can bo ho tich" và chưa từng tiếp nhận bất 
-- kỳ một yêu cầu nào của công dân. 
SELECT * FROM CANBOTIEPNHAN 
WHERE ChucVu = 'Can bo ho tich' AND MaCBTN NOT IN(SELECT MaCBTN FROM YEUCAUTHUTUC)

--Câu 7: Liệt kê họ tên của những công dân đang có trong hệ thống. Nếu họ tên trùng nhau 
--thì chỉ hiển thị 1 lần. Sinh viên cần thực hiện yêu cầu này bằng 2 cách khác nhau (mỗi 
-- cách được tính 0.5 điểm).  
SELECT DISTINCT HoTenCD FROM CONGDAN

SELECT HoTenCD FROM CONGDAN
GROUP BY HoTenCD

--Câu 8: Liệt kê MaCD, HoTenCD, MaYeuCau, NoiDungYeuCau, TrangThai của tất cả 
--công dân trong hệ thống (nếu công dân nào chưa từng tạo một yêu cầu thì cũng phải hiển 
--thị thông tin của công dân đó).  
SELECT cd.MaCD, cd.HoTenCD, yctt.MaYeuCau, yctt.NoiDungYeuCau, yctt.TrangThai  FROM CONGDAN cd
INNER JOIN YEUCAUTHUTUC yctt
ON cd.MaCD = yctt.MaCD


--Câu 9: Liệt kê những công dân là chủ hộ và đã từng tạo ít nhất 1 yêu cầu khác nhau 
--trong nửa đầu năm 2019.  
SELECT cd.MaCD,HoTenChuHo,COUNT(MaYeuCau) AS SoLuongYeuCau FROM CONGDAN cd
LEFT JOIN YEUCAUTHUTUC yc
ON cd.MaCD = yc.MaCD
WHERE ThoiDiemTaoYeuCau BETWEEN '2019-01-01' AND '2019-06-30'
GROUP BY cd.HoTenChuHo,cd.MaCD
HAVING COUNT (yc.MaYeuCau) >= 1

--Câu 10: Liệt kê những công dân đã từng tạo yêu cầu có loại thủ tục là 'Chung nhan doc 
-- than' và chưa từng tạo yêu cầu nào thuộc loại thủ tục có tên là 'Dang ky ket hon' trong 
-- tháng 10 năm 2019.  
SELECT * FROM CONGDAN cd
INNER JOIN YEUCAUTHUTUC yctt 
ON cd.MaCD = yctt.MaCD
WHERE NoiDungYeuCau LIKE 'Chung nhan doc than'
AND yctt.MaCD NOT IN(SELECT MaCD FROM YEUCAUTHUTUC WHERE NoiDungYeuCau = 'Dang ky ket hon'
AND ThoiDiemTaoYeuCau BETWEEN '2019-10-01' AND '2019-10-31')
