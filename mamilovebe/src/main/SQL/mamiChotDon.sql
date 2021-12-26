-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 22, 2021 lúc 01:12 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mami`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` bigint(20) NOT NULL,
  `capcha` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `one_time_password` varchar(255) DEFAULT NULL,
  `otp_requested_time` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `capcha`, `email`, `is_delete`, `one_time_password`, `otp_requested_time`, `password`, `phone`, `username`) VALUES
(1, NULL, NULL, b'0', NULL, '2021-12-21 00:23:06', '$2a$12$xV/HkPLgQhhC3HTA5jcgse6Ruu2OPaBcq.A.ckpbfdBGz89troxx.', NULL, 'admin'),
(2, NULL, '', b'0', '', '2021-12-21 00:23:06', '$2a$12$xV/HkPLgQhhC3HTA5jcgse6Ruu2OPaBcq.A.ckpbfdBGz89troxx.', NULL, 'staff'),
(3, NULL, 'datdtph09768@fpt.edu.vn', b'0', NULL, '2021-12-21 00:23:06', '$2a$12$xV/HkPLgQhhC3HTA5jcgse6Ruu2OPaBcq.A.ckpbfdBGz89troxx.', '0369332232', 'customer'),
(4, NULL, 'ducmc012@gmail.com', b'0', NULL, '2021-12-22 00:52:09', '$2a$10$1HYLgJYVI.pRpkoara/27OtpbZJffpwx7WSBFqDs3x2kqDTTcMKr2', '0334778629', 'ducmc'),
(5, NULL, 'dathvph10953@fpt.edu.vn', b'0', NULL, '2021-12-22 01:39:37', '$2a$10$UcjVuBWh4ZIn5J4r6KBJF.xS532IK2RMYk1XUoixw3gILz4sp.LMG', '0987820633', 'dathv');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authority`
--

CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL,
  `idaccount` bigint(20) DEFAULT NULL,
  `idrole` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `authority`
--

INSERT INTO `authority` (`id`, `idaccount`, `idrole`) VALUES
(1, 1, 'admin'),
(2, 2, 'staff'),
(3, 3, 'customer'),
(4, 4, 'customer'),
(5, 5, 'customer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` varchar(255) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `downtotal` double DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `idcustomer` bigint(20) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `note_refund` varchar(2000) DEFAULT NULL,
  `payment` bit(1) DEFAULT NULL,
  `refund` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `statusshipping` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `transport_fee` double DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `voucher_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `address`, `create_at`, `discount`, `downtotal`, `full_name`, `idcustomer`, `is_delete`, `note`, `note_refund`, `payment`, `refund`, `phone_number`, `status`, `statusshipping`, `total`, `transport_fee`, `update_at`, `voucher_id`) VALUES
('00474401', 'xóm 1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-01-22 03:23:08', 0, 866000, 'Nguyễn Quốc An', 2, b'0', NULL, 'Thông tin sản phẩm nhận không đúng với mô tả trên website', b'0', 'SAI_SAN_PHAM', '0334778629', 'HOAN_HANG', 'Đang xử lý', 836000, 30000, '2021-12-22 03:42:14', NULL),
('01312959', 'Xã Bản Cầm,Huyện Bảo Thắng,Tỉnh Lào Cai', '2021-01-23 03:41:18', NULL, 4262580, 'Lường Thị Phương Anh', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 4262580, 0, '2021-12-22 03:50:15', NULL),
('01891840', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-02-10 03:02:36', 0, 775000, 'Nguyễn Trung Kiên', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 745000, 30000, '2021-12-22 03:56:54', NULL),
('02234126', 'Tổ 12, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng', '2021-02-27 03:27:28', 20, 2816000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', 'Đang xử lý', 3520000, 0, '2021-12-22 03:57:40', 4),
('05439511', 'xóm 1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-03-14 03:31:11', NULL, 4200000, 'E\'Kante', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', 'Đang xử lý', 4200000, 0, '2021-12-22 03:50:20', NULL),
('05734489', ',Quận Ba Đình,Thành phố Hà Nội', '2021-03-26 03:40:08', 0, 2412030, 'Lương A Seco', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 2382030, 30000, '2021-12-22 03:50:51', NULL),
('07145031', 'Xã Lũng Cú,Huyện Đồng Văn,Tỉnh Hà Giang', '2021-04-22 03:04:24', NULL, 825000, 'Mơ đi cu', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 825000, 0, '2021-12-22 03:57:21', NULL),
('07332436', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-05-23 03:00:34', 0, 1790000, 'Lường a Can', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1760000, 30000, '2021-12-22 03:42:41', NULL),
('08082269', 'Tổ 12, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng', '2021-05-25 01:02:50', 0, 401200, 'Võ Văn Đức', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 371200, 30000, '2021-12-22 01:05:23', NULL),
('08509182', 'xóm 1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-05-29 03:30:10', NULL, 6600000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 6600000, 0, '2021-12-22 03:48:45', NULL),
('08590016', 'Tổ 12, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng', '2021-06-02 03:24:24', NULL, 3520000, 'Nguyễn Quốc An', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', 'Đang xử lý', 3520000, 0, '2021-12-22 03:54:28', NULL),
('09418373', 'Tổ 10, Xã Vũ Muộn, Huyện Bạch Thông, Tỉnh Bắc Kạn', '2021-06-24 03:27:46', 0, 2670000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 2640000, 30000, '2021-12-22 03:42:55', NULL),
('10541641', 'Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội', '2021-06-22 01:57:43', NULL, 400000, 'hoàng văn tâm', 3, b'0', NULL, NULL, b'1', NULL, '0987820633', 'HUY', 'Đang xử lý', 400000, 0, '2021-12-22 02:19:44', NULL),
('10696457', 'Xã Lũng Cú,Huyện Đồng Văn,Tỉnh Hà Giang', '2021-07-05 03:30:54', 0, 3030000, 'E\'Kante', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', 'Đang xử lý', 3000000, 30000, '2021-12-22 03:58:03', NULL),
('11471435', 'xóm 2, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang', '2021-07-24 01:19:05', NULL, 1337600, 'hoàng đức', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1337600, 0, '2021-12-22 02:07:06', NULL),
('11691406', ',Huyện Đồng Văn,Tỉnh Hà Giang', '2021-07-29 01:54:33', 0, 197200, 'hoàng văn mạnh', 3, b'0', NULL, 'Thông tin sản phẩm nhận không đúng với mô tả trên website', b'0', 'SAI_SAN_PHAM', '0987820633', 'HOAN_HANG', 'Đang xử lý', 167200, 30000, '2021-12-22 02:05:34', NULL),
('12069924', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-08-05 03:26:18', NULL, 880000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', 'Đang xử lý', 880000, 0, '2021-12-22 03:43:49', NULL),
('12120369', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-08-24 03:35:12', NULL, 1020000, 'Sơn Tùng', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 1020000, 0, '2021-12-22 03:43:59', NULL),
('12508881', 'xóm 3, , Thành phố Hà Giang, Tỉnh Hà Giang', '2021-08-23 03:21:24', NULL, 1337600, 'Hoàng Văn Chiến', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', 'Đang xử lý', 1337600, 0, '2021-12-22 03:44:09', NULL),
('12787704', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-09-05 03:35:49', 0, 444000, 'Sơn Tùng', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', 'Đang xử lý', 414000, 30000, '2021-12-22 03:44:14', NULL),
('12996408', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-10-22 03:40:42', 0, 7050000, 'Nguyễn Thị Mơ', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', 'Đang xử lý', 7020000, 30000, '2021-12-22 03:54:39', NULL),
('17789183', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-08-25 02:34:16', 0, 627000, 'Hỏi Văn Gì', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '812113148681', 597000, 30000, '2021-12-22 03:54:52', NULL),
('19353443', 't4, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-10-26 20:24:41', NULL, 1580000, 'Khách hàng', 1, b'0', NULL, NULL, b'1', NULL, '0369332232', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 1580000, 0, '2021-12-22 03:54:47', NULL),
('20171394', 'Tổ 11, Xã Minh Khương, Huyện Hàm Yên, Tỉnh Tuyên Quang', '2021-11-25 01:36:17', 15, 446564.5, 'Lường Văn Chén', 2, b'0', NULL, 'Người mua hủy, không lấy hàng nữa. ', b'1', 'KHACH_HUY', '0334778629', 'HOAN_HANG', 'Đang xử lý', 525370, 0, '2021-12-22 02:07:53', 3),
('23831498', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-11-13 02:33:31', NULL, 298500, 'Mơ Văn Ngủ', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 298500, 0, '2021-12-22 03:56:42', NULL),
('24770463', ',Thành phố Hà Nội', '2021-12-27 01:51:09', 0, 280740, 'hoàng văn hưng', 3, b'0', NULL, 'Thông tin sản phẩm nhận không đúng với mô tả trên website', b'0', 'SAI_SAN_PHAM', '0987820633', 'HOAN_HANG', 'Đang xử lý', 250740, 30000, '2021-12-22 02:20:35', NULL),
('24983384', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-12-06 03:39:13', 0, 924000, 'Lion Messi', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811031148979\n', 894000, 30000, '2021-12-22 03:55:25', NULL),
('25192722', 'Xã Lũng Cú,Huyện Đồng Văn,Tỉnh Hà Giang', '2021-08-22 01:21:58', NULL, 0, 'hoàng văn đại', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'HUY', 'Đang xử lý', 400000, 0, '2021-12-22 01:37:10', NULL),
('25645701', ',Quận Ba Đình,Thành phố Hà Nội', '2021-03-26 01:51:47', 10, 313650, 'hoàng văn điệp', 3, b'0', NULL, NULL, b'1', NULL, '0987820633', 'HUY', 'Đang xử lý', 348500, 0, '2021-12-22 02:19:38', 2),
('26938997', 'Xã Cốc Đán,Huyện Ngân Sơn,Tỉnh Bắc Kạn', '2021-08-25 03:30:37', NULL, 4800000, 'E\'Kante', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811042249966\n', 4800000, 0, '2021-12-22 03:55:03', NULL),
('27119608', 'Xã Cốc Đán,Huyện Ngân Sơn,Tỉnh Bắc Kạn', '2021-12-24 02:30:17', NULL, 3060000, 'Mai A Tiêm', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 3060000, 0, '2021-12-22 03:44:34', NULL),
('28960887', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-11-25 03:35:33', 0, 1730000, 'Sơn Tùng', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '812066101273\n', 1700000, 30000, '2021-12-22 03:51:01', NULL),
('29436696', 'xóm 2, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang', '2021-11-26 02:32:49', NULL, 298500, 'Còn Gì Đâu', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 298500, 0, '2021-12-22 03:51:05', NULL),
('31087496', ',Quận Hoàn Kiếm,Thành phố Hà Nội', '2021-08-25 03:31:32', NULL, 474000, 'E\'Kante', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'HUY', 'Đang xử lý', 474000, 0, '2021-12-22 03:44:43', NULL),
('31492628', 'Xóm 12, Xã Đôn Phong, Huyện Bạch Thông, Tỉnh Bắc Kạn', '2021-01-22 02:23:48', NULL, 675750, 'Võ Văn Văn', 3, b'0', NULL, NULL, b'1', NULL, '0987820633', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 675750, 0, '2021-12-22 03:56:47', NULL),
('32317347', 'xóm 1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-11-25 03:27:59', 0, 470000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'HUY', 'Đang xử lý', 440000, 30000, '2021-12-22 03:44:51', NULL),
('33575124', ',Quận Hoàn Kiếm,Thành phố Hà Nội', '2021-06-23 01:53:08', NULL, 348300, 'hoàng văn đại', 3, b'0', NULL, NULL, b'1', NULL, '0987820633', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 348300, 0, '2021-12-22 02:19:32', NULL),
('34209149', 'Xã Cốc Đán,Huyện Ngân Sơn,Tỉnh Bắc Kạn', '2021-01-24 03:25:59', 0, 2230000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'HUY', 'Đang xử lý', 2200000, 30000, '2021-12-22 03:44:55', NULL),
('34880167', 'xóm 2, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang', '2021-06-23 02:31:28', 0, 2070000, 'Hỏi Làm gì', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'HUY', 'Đang xử lý', 2040000, 30000, '2021-12-22 03:45:02', NULL),
('35278055', ',Quận Tây Hồ,Thành phố Hà Nội', '2022-12-22 01:52:21', 0, 382000, 'hoàng văn hòa', 3, b'0', NULL, NULL, b'0', NULL, '0987820633', 'DA_GIAO_BEN_VAN_CHUYEN', '811026099890', 352000, 30000, '2021-12-22 02:08:12', NULL),
('35965548', 'xóm 3, Phường Tứ Liên, Quận Tây Hồ, Thành phố Hà Nội', '2021-02-17 01:19:53', 0, 382000, 'hoàng hiếu', 2, b'0', NULL, 'Người mua hủy, không lấy hàng nữa. ', b'0', 'KHACH_HUY', '0334778629', 'HOAN_HANG', 'Đang xử lý', 352000, 30000, '2021-12-22 03:45:39', NULL),
('37352255', 'Xã Bản Cầm,Huyện Bảo Thắng,Tỉnh Lào Cai', '2021-02-23 03:03:52', NULL, 745000, 'Yến', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811016275210', 745000, 0, '2021-12-22 03:56:19', NULL),
('38928513', 'Xã Bản Cầm,Huyện Bảo Thắng,Tỉnh Lào Cai', '2021-03-25 03:36:58', 0, 2130000, 'Sơn Tùng', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 2100000, 30000, '2021-12-22 03:56:22', NULL),
('38965167', ',Huyện Ba Vì,Thành phố Hà Nội', '2021-01-24 01:26:50', 0, 30000, 'hoàng văn tuấn', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '812113148681', 2500000, 30000, '2021-12-22 02:08:22', NULL),
('40463061', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-08-10 03:24:07', NULL, 2640000, 'Nguyễn Quốc An', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 2640000, 0, '2021-12-22 03:56:44', NULL),
('42272680', 'xóm 1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-01-24 02:40:04', 0, 642000, 'Lường Văn Sốc', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'CHUA_XAC_NHAN', 'Đang xử lý', 612000, 30000, '2021-12-22 02:40:04', NULL),
('43995825', ',Quận Hoàn Kiếm,Thành phố Hà Nội', '2021-06-24 01:30:06', 0, 552750, 'hoàng văn hiếu', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811031148979\n', 522750, 30000, '2021-12-22 03:58:17', NULL),
('44779724', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-11-22 03:32:32', 0, 701500, 'Ronaldo', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 671500, 30000, '2021-12-22 03:45:43', NULL),
('45665895', 'xóm 3, , Thành phố Hà Giang, Tỉnh Hà Giang', '2021-11-22 01:23:07', NULL, 125370, 'hoàng văn hiếu', 2, b'0', 'giao nhanh hộ mình', NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 125370, 0, '2021-12-22 03:45:52', NULL),
('47985376', 'xóm 1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-07-22 01:17:00', 10, 225666, 'hoàng văn đạt', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 250740, 0, '2021-12-22 03:45:59', 2),
('48025378', 'Xã Lũng Cú,Huyện Đồng Văn,Tỉnh Hà Giang', '2021-02-22 03:25:32', 0, 2670000, 'Hoàng Văn Chạn', 2, b'0', NULL, 'Chưa giao được cho người mua (Có thể vì khách hàng bận, đi vắng, liên hệ không được...).', b'0', 'THAT_BAI', '0334778629', 'HOAN_HANG', 'Đang xử lý', 2640000, 30000, '2021-12-22 03:46:11', NULL),
('48180696', ',Quận Ba Đình,Thành phố Hà Nội', '2021-08-22 01:57:02', NULL, 165000, 'hoàng văn tới', 3, b'0', NULL, NULL, b'1', NULL, '0987820633', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 165000, 0, '2021-12-22 02:08:41', NULL),
('49171951', 'xóm 1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-02-04 02:30:45', 0, 1730000, 'Lường Văn Chỗ', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1700000, 30000, '2021-12-22 03:46:26', NULL),
('50471780', 'xóm 3, , Thành phố Hà Giang, Tỉnh Hà Giang', '2021-06-11 03:21:02', NULL, 1003200, 'Hoàng Văn Chiến', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1003200, 0, '2021-12-22 03:46:27', NULL),
('50525356', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-08-24 03:29:18', NULL, 3168000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811042249966\n', 3168000, 0, '2021-12-22 03:58:26', NULL),
('52037304', 'xóm 1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-09-24 03:31:56', 0, 464500, 'Ronaldo', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 434500, 30000, '2021-12-22 03:46:19', NULL),
('52313883', ',Tỉnh Cao Bằng', '2021-06-17 01:49:10', 10, 300960, 'hoàng văn đạt', 3, b'0', NULL, NULL, b'1', NULL, '0987820633', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 334400, 0, '2021-12-22 02:08:44', 2),
('53792823', 'Tổ 11, Xã Minh Khương, Huyện Hàm Yên, Tỉnh Tuyên Quang', '2021-06-23 03:00:13', NULL, 1760000, 'He Văn Chén', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1760000, 0, '2021-12-22 03:46:16', NULL),
('54505876', 'Xã Lũng Cú,Huyện Đồng Văn,Tỉnh Hà Giang', '2021-02-24 03:06:11', NULL, 1485000, 'Chán Văn Lắm', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1485000, 0, '2021-12-22 03:46:13', NULL),
('54631662', ',Thành phố Hà Nội', '2021-01-23 01:50:06', NULL, 440000, 'hoàng văn đại', 3, b'0', NULL, 'Thông tin địa chỉ nhận hàng bị sai', b'1', 'SAI_DIA_CHI', '0987820633', 'HOAN_HANG', 'Đang xử lý', 440000, 0, '2021-12-22 02:09:04', NULL),
('55396386', 'Tổ 12, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng', '2021-01-07 03:28:15', 0, 2230000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '812066101273\n', 2200000, 30000, '2021-12-22 03:46:39', NULL),
('55548279', ',Huyện Ba Vì,Thành phố Hà Nội', '2021-02-23 01:24:45', 10, 367200, 'hoàng văn hòa', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 408000, 0, '2021-12-22 02:17:23', 2),
('57209950', 'xóm 1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội', '2021-04-24 03:24:48', NULL, 1760000, 'Nguyễn Quốc An', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1760000, 0, '2021-12-22 03:47:02', NULL),
('57216726', 'Tổ 12, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng', '2021-12-01 02:31:04', 0, 2410000, 'Văn Eng', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811026099890', 2380000, 30000, '2021-12-22 03:47:11', NULL),
('58409325', 'xóm 3, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang', '2021-12-01 02:21:49', NULL, 704000, 'Lường văn bát', 3, b'0', NULL, NULL, b'1', NULL, '0987820633', 'DA_GIAO_BEN_VAN_CHUYEN', '811016275210', 704000, 0, '2021-12-22 03:47:21', NULL),
('58614484', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-12-02 03:28:34', NULL, 3080000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 3080000, 0, '2021-12-22 03:56:49', NULL),
('58874445', 'xóm 3, , Thành phố Hà Giang, Tỉnh Hà Giang', '2021-12-02 03:07:50', 0, 1185000, 'Máy Văn Tính', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1155000, 30000, '2021-12-22 03:47:24', NULL),
('59569593', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-12-03 03:32:55', NULL, 333200, 'Ronaldo', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 333200, 0, '2021-12-22 03:47:37', NULL),
('61015230', 'Tổ 10, Xã Vũ Muộn, Huyện Bạch Thông, Tỉnh Bắc Kạn', '2021-12-04 03:19:59', NULL, 836000, 'Anh a', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '812113148681', 836000, 0, '2021-12-22 03:47:42', NULL),
('61390547', 'cẩm bình cẩm thủy thanh hóa', '2021-12-05 20:57:58', 0, 167200, 'Khách hàng', 1, b'0', NULL, NULL, b'0', NULL, '0369332232', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 190000, 30000, '2021-12-22 02:18:08', NULL),
('63068637', 'Tổ 11, Xã Minh Khương, Huyện Hàm Yên, Tỉnh Tuyên Quang', '2021-12-06 02:32:26', 0, 428000, 'Mơ đi em', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 398000, 30000, '2021-12-22 03:47:46', NULL),
('64069706', 'Xã Bản Cầm,Huyện Bảo Thắng,Tỉnh Lào Cai', '2021-12-07 03:37:22', NULL, 395000, 'Messi', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'HUY', 'Đang xử lý', 395000, 0, '2021-12-22 03:47:56', NULL),
('66437854', ',Quận Hoàn Kiếm,Thành phố Hà Nội', '2021-12-08 01:49:41', 0, 234000, 'hoàng văn hiếu', 3, b'0', NULL, NULL, b'0', NULL, '0987820633', 'DA_GIAO_BEN_VAN_CHUYEN', '811031148979\n', 204000, 30000, '2021-12-22 03:58:39', NULL),
('68820784', 'Tổ 12, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng', '2021-12-09 02:33:55', 0, 229000, 'Lường Văn Sử', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 199000, 30000, '2021-12-22 03:47:51', NULL),
('69059670', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-12-10 01:15:35', 0, 1534440, 'Lường Văn Chước', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'HUY', 'Đang xử lý', 1504440, 30000, '2021-12-22 02:19:56', NULL),
('71936106', 'Tổ 11, Xã Minh Khương, Huyện Hàm Yên, Tỉnh Tuyên Quang', '2021-12-11 02:28:32', 0, 573310, 'Lường A Chan', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 543310, 30000, '2021-12-22 03:48:01', NULL),
('72018135', 'xóm 3, , Thành phố Hà Giang, Tỉnh Hà Giang', '2021-12-12 03:38:47', NULL, 395000, 'Lion Messi', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811042249966\n', 395000, 0, '2021-12-22 03:48:10', NULL),
('72584389', 'Tổ 10, Xã Vũ Muộn, Huyện Bạch Thông, Tỉnh Bắc Kạn', '2021-12-13 03:36:43', 0, 1830000, 'Sơn Tùng', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1800000, 30000, '2021-12-22 03:48:06', NULL),
('74758547', ',Quận Ba Đình,Thành phố Hà Nội', '2021-12-14 01:28:29', 0, 470000, 'hoàng văn đạt', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 440000, 30000, '2021-12-22 03:48:18', NULL),
('75363718', 'Tổ 11, Xã Minh Khương, Huyện Hàm Yên, Tỉnh Tuyên Quang', '2021-12-15 02:32:08', 0, 925500, 'Mai Ăn Ngay', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 895500, 30000, '2021-12-22 03:48:27', NULL),
('75756012', 'xóm 2, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang', '2021-12-15 02:29:03', NULL, 668800, 'Văn Mơ', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 668800, 0, '2021-12-22 03:51:20', NULL),
('76112045', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-12-16 03:38:22', 0, 583000, 'Lion Messi', 2, b'0', NULL, 'Thông tin địa chỉ nhận hàng bị sai', b'0', 'SAI_DIA_CHI', '0334778629', 'HOAN_HANG', 'Đang xử lý', 553000, 30000, '2021-12-22 03:51:28', NULL),
('76386631', 'xóm 3, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang', '2021-12-17 01:55:15', NULL, 125370, 'hoàng văn phong', 3, b'0', NULL, NULL, b'1', NULL, '0987820633', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 125370, 0, '2021-12-22 02:19:00', NULL),
('77067644', 'Tổ 10, Xã Vũ Muộn, Huyện Bạch Thông, Tỉnh Bắc Kạn', '2021-12-18 02:25:21', NULL, 125370, 'Đức đẹp trai', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 125370, 0, '2021-12-22 03:52:26', NULL),
('77484047', 'Xã Lũng Cú,Huyện Đồng Văn,Tỉnh Hà Giang', '2021-12-19 03:02:59', NULL, 1192000, 'Low g', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'CHUA_XAC_NHAN', 'Đang xử lý', 1192000, 0, '2021-12-22 03:02:59', NULL),
('78186188', 'xóm 4, , Quận Ba Đình, Thành phố Hà Nội', '2021-12-20 01:56:28', 0, 470000, 'hoàng văn thái', 3, b'0', NULL, NULL, b'0', NULL, '0987820633', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 440000, 30000, '2021-12-22 02:20:09', NULL),
('78515990', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-12-21 03:36:22', NULL, 345000, 'Sơn Tùng', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 345000, 0, '2021-12-22 03:52:36', NULL),
('79571039', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-12-01 03:29:37', NULL, 2464000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 2464000, 0, '2021-12-22 03:52:40', NULL),
('79782121', 'Xã Bản Cầm,Huyện Bảo Thắng,Tỉnh Lào Cai', '2021-12-03 03:33:24', NULL, 416500, 'Ronaldo', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 416500, 0, '2021-12-22 03:52:56', NULL),
('79887568', 'Tổ 10, Xã Vũ Muộn, Huyện Bạch Thông, Tỉnh Bắc Kạn', '2021-12-05 03:18:46', NULL, 501600, 'Người yêu', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 501600, 0, '2021-12-22 03:52:53', NULL),
('81030320', 'Tổ 12, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng', '2021-12-11 03:06:56', NULL, 825000, 'Nguyễn Văn Đạt', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '812066101273\n', 825000, 0, '2021-12-22 03:49:11', NULL),
('82858547', 'Xã Lũng Cú,Huyện Đồng Văn,Tỉnh Hà Giang', '2021-12-17 03:25:15', NULL, 2200000, 'Hoàng Văn Chạn', 2, b'0', NULL, 'Thông tin sản phẩm nhận không đúng với mô tả trên website', b'1', 'SAI_SAN_PHAM', '0334778629', 'HOAN_HANG', 'Đang xử lý', 2200000, 0, '2021-12-22 03:49:22', NULL),
('83119844', 'Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội', '2021-12-06 02:24:24', 0, 156225, 'Đức võ Văn', 3, b'0', NULL, NULL, b'0', NULL, '0987820633', 'DA_GIAO_BEN_VAN_CHUYEN', '811026099890', 126225, 30000, '2021-12-22 03:58:56', NULL),
('83679000', 'xóm 3, Phường Tứ Liên, Quận Tây Hồ, Thành phố Hà Nội', '2021-12-09 03:22:49', 0, 1033200, 'Nguyễn Quốc An', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811016275210', 1003200, 30000, '2021-12-22 03:59:00', NULL),
('85502891', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-12-17 03:27:09', 0, 1790000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 1760000, 30000, '2021-12-22 03:49:05', NULL),
('85828747', 'Tổ chà bá, Xã Lâm Thượng, Huyện Lục Yên, Tỉnh Yên Bái', '2021-12-15 03:37:49', NULL, 790000, 'Lion Messi', 2, b'0', NULL, 'Người mua hủy, không lấy hàng nữa. ', b'1', 'KHACH_HUY', '0334778629', 'HOAN_HANG', 'Đang xử lý', 790000, 0, '2021-12-22 03:49:41', NULL),
('86426504', 'Xã Lũng Cú,Huyện Đồng Văn,Tỉnh Hà Giang', '2021-12-02 03:28:57', 0, 4606000, 'Phùng A Sinh', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_XAC_NHAN_VA_DONG_GOI', 'Đang xử lý', 4576000, 30000, '2021-12-22 03:49:06', NULL),
('86463036', 'Tổ 12, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng', '2021-12-02 01:10:19', 20, 528000, 'Lường Văn Chối', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 1320000, 0, '2021-12-22 02:18:26', 4),
('87474095', ',Huyện Ba Vì,Thành phố Hà Nội', '2021-12-12 03:34:54', 0, 2750000, 'Ronaldo', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '812113148681', 2720000, 30000, '2021-12-22 03:49:51', NULL),
('88062461', 'xóm 3, Phường Tứ Liên, Quận Tây Hồ, Thành phố Hà Nội', '2021-12-05 03:07:19', 0, 1350000, 'Hỏi làm cái gì', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811031148979\n', 1320000, 30000, '2021-12-22 03:59:06', NULL),
('88625363', ',Quận Ba Đình,Thành phố Hà Nội', '2021-12-06 01:50:43', NULL, 2464000, 'hoàng văn tuấn', 3, b'0', NULL, NULL, b'1', NULL, '0987820633', 'DA_GIAO_BEN_VAN_CHUYEN', '811042249966\n', 2464000, 0, '2021-12-22 03:53:50', NULL),
('89244825', 'xóm 2, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang', '2021-12-09 03:01:34', NULL, 1408000, 'Mở Là Ngủ', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '812066101273\n', 1408000, 0, '2021-12-22 03:59:14', NULL),
('89364040', 'xóm 4, Xã Yên Thuận, Huyện Hàm Yên, Tỉnh Tuyên Quang', '2021-12-13 01:21:02', NULL, 812700, 'hoàng  văn hưng', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 812700, 0, '2021-12-22 02:19:19', NULL),
('95683949', 'Tổ 11, Xã Minh Khương, Huyện Hàm Yên, Tỉnh Tuyên Quang', '2021-12-03 02:29:41', NULL, 668800, 'Văn La', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'DA_GIAO_BEN_VAN_CHUYEN', '811026099890', 668800, 0, '2021-12-22 03:53:36', NULL),
('95775664', 'Xã Cốc Đán,Huyện Ngân Sơn,Tỉnh Bắc Kạn', '2021-12-02 02:41:22', 0, 948000, 'Võ Văn Long', 2, b'0', NULL, NULL, b'0', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 918000, 30000, '2021-12-22 03:53:30', NULL),
('96971020', 'Tổ 10, Xã Vũ Muộn, Huyện Bạch Thông, Tỉnh Bắc Kạn', '2021-12-22 03:19:15', NULL, 668800, 'Cam văn Táo', 2, b'0', NULL, NULL, b'1', NULL, '0334778629', 'KHACH_DA_NHAN_HANG', 'Đang xử lý', 668800, 0, '2021-12-22 03:53:21', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `is_delete`, `name`) VALUES
(1, b'0', 'Quần áo bé trai'),
(2, b'0', 'Quần áo bé gái'),
(3, b'0', 'Quần áo sơ sinh'),
(7, b'0', 'Mũ cho bé yêu\n'),
(8, b'0', 'Giày cho bé');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categorydetail`
--

CREATE TABLE `categorydetail` (
  `id` bigint(20) NOT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `idcategory` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categorydetail`
--

INSERT INTO `categorydetail` (`id`, `is_delete`, `name`, `idcategory`) VALUES
(1, b'0', 'Áo bé trai', 1),
(2, b'0', 'Áo quần bé trai', 1),
(3, b'0', 'Bộ quần áo bé trai', 1),
(8, b'0', 'Váy đầm công chúa', 2),
(10, b'0', 'Áo bé gái', 2),
(12, b'0', 'Đồ bộ bé gái', 2),
(16, b'0', 'Giày xinh cho bé yêu', 8),
(17, b'0', 'Giày tập đi', 8),
(18, b'0', 'Mũ len cho bé', 7),
(19, b'0', 'Mù thời trang cho bé', 7),
(20, b'0', 'Yếm sơ sinh', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `idaccount` bigint(20) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `statuscustomer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `address`, `fullname`, `idaccount`, `is_delete`, `statuscustomer`) VALUES
(1, 'cẩm bình cẩm thủy thanh hóa', 'Khách hàng', 3, b'0', NULL),
(2, NULL, 'Võ Văn Đức', 4, b'0', ''),
(3, NULL, 'Hoàng Đạt', 5, b'0', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event`
--

CREATE TABLE `event` (
  `id` bigint(20) NOT NULL,
  `endday` datetime DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `startday` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `event`
--

INSERT INTO `event` (`id`, `endday`, `is_delete`, `name`, `startday`) VALUES
(1, '2024-12-22 00:00:27', b'0', 'Giảm giá khi thanh toán qua ví', '2021-12-22 00:00:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `idhistory` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `amounts` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `idmamipay` bigint(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `surplus` double DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `trading_code` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `history`
--

INSERT INTO `history` (`idhistory`, `content`, `amounts`, `description`, `idmamipay`, `status`, `surplus`, `time`, `trading_code`) VALUES
(3, 'Nap tien vao vi', 10000000, 'NAP TIEN customer', 2, b'1', 10000000, '2021-12-21 19:45:43', 1680583),
(4, 'Thanh toán hóa đơn', 1580000, 'Thanh toán hóa đơn mã 19353443', 2, b'1', 8420000, '2021-12-21 20:24:41', 0),
(5, 'Nap tien vao vi', 100000, 'NAP TIEN ducmc', 3, b'0', 100000, '2021-12-22 00:55:24', 46747655),
(6, 'Nap tien vao vi', 10000000, 'NAP TIEN ducmc', 3, b'1', 10000000, '2021-12-22 01:00:24', 253866),
(7, 'Nap tien vao vi', 100000000, 'NAP TIEN ducmc', 3, b'1', 110000000, '2021-12-22 01:01:12', 35846809),
(8, 'Thanh toán hóa đơn', 1320000, 'Thanh toán hóa đơn mã 86463036', 3, b'1', 108680000, '2021-12-22 01:10:19', 0),
(9, 'Thanh toán hóa đơn', 250740, 'Thanh toán hóa đơn mã 47985376', 3, b'1', 108429260, '2021-12-22 01:17:00', 0),
(10, 'Thanh toán hóa đơn', 1337600, 'Thanh toán hóa đơn mã 11471435', 3, b'1', 107091660, '2021-12-22 01:19:05', 0),
(11, 'Thanh toán hóa đơn', 812700, 'Thanh toán hóa đơn mã 89364040', 3, b'1', 106278960, '2021-12-22 01:21:02', 0),
(12, 'Thanh toán hóa đơn', 0, 'Thanh toán hóa đơn mã 25192722', 3, b'1', 106278960, '2021-12-22 01:21:58', 0),
(13, 'Thanh toán hóa đơn', 125370, 'Thanh toán hóa đơn mã 45665895', 3, b'1', 106153590, '2021-12-22 01:23:07', 0),
(14, 'Thanh toán hóa đơn', 408000, 'Thanh toán hóa đơn mã 55548279', 3, b'1', 105745590, '2021-12-22 01:24:45', 0),
(15, 'Thanh toán hóa đơn', 525370, 'Thanh toán hóa đơn mã 20171394', 3, b'1', 105220220, '2021-12-22 01:36:17', 0),
(16, 'Hoàn tiền hóa đơn', 400000, 'Hoàn tiền hóa đơn mã 25192722', 3, b'1', 105620220, '2021-12-22 01:37:06', 0),
(17, 'Nap tien vao vi', -8.446744073709552e16, 'NAP TIEN dathv', 4, b'0', -8.446744073709552e16, '2021-12-22 01:44:49', 31252271),
(18, 'Nap tien vao vi', 100000000, 'NAP TIEN dathv', 4, b'0', 100000000, '2021-12-22 01:47:47', 87079445),
(19, 'Thanh toán hóa đơn', 334400, 'Thanh toán hóa đơn mã 52313883', 4, b'1', 999999685600, '2021-12-22 01:49:10', 0),
(20, 'Thanh toán hóa đơn', 440000, 'Thanh toán hóa đơn mã 54631662', 4, b'1', 999999245600, '2021-12-22 01:50:06', 0),
(21, 'Thanh toán hóa đơn', 2464000, 'Thanh toán hóa đơn mã 88625363', 4, b'1', 999996781600, '2021-12-22 01:50:43', 0),
(22, 'Thanh toán hóa đơn', 348500, 'Thanh toán hóa đơn mã 25645701', 4, b'1', 999996433100, '2021-12-22 01:51:47', 0),
(23, 'Thanh toán hóa đơn', 348300, 'Thanh toán hóa đơn mã 33575124', 4, b'1', 999996084800, '2021-12-22 01:53:08', 0),
(24, 'Thanh toán hóa đơn', 125370, 'Thanh toán hóa đơn mã 76386631', 4, b'1', 999995959430, '2021-12-22 01:55:15', 0),
(25, 'Thanh toán hóa đơn', 165000, 'Thanh toán hóa đơn mã 48180696', 4, b'1', 999995794430, '2021-12-22 01:57:02', 0),
(26, 'Thanh toán hóa đơn', 400000, 'Thanh toán hóa đơn mã 10541641', 4, b'1', 999995394430, '2021-12-22 01:57:43', 0),
(27, 'Hoàn tiền hóa đơn', 348500, 'Hoàn tiền hóa đơn mã 25645701', 4, b'1', 999995742930, '2021-12-22 02:19:35', 0),
(28, 'Hoàn tiền hóa đơn', 400000, 'Hoàn tiền hóa đơn mã 10541641', 4, b'1', 999996142930, '2021-12-22 02:19:41', 0),
(29, 'Thanh toán hóa đơn', 704000, 'Thanh toán hóa đơn mã 58409325', 4, b'1', 999995438930, '2021-12-22 02:21:49', 0),
(30, 'Thanh toán hóa đơn', 675750, 'Thanh toán hóa đơn mã 31492628', 4, b'1', 999994763180, '2021-12-22 02:23:48', 0),
(31, 'Thanh toán hóa đơn', 125370, 'Thanh toán hóa đơn mã 77067644', 3, b'1', 105494850, '2021-12-22 02:25:21', 0),
(32, 'Thanh toán hóa đơn', 668800, 'Thanh toán hóa đơn mã 75756012', 3, b'1', 104826050, '2021-12-22 02:29:03', 0),
(33, 'Thanh toán hóa đơn', 668800, 'Thanh toán hóa đơn mã 95683949', 3, b'1', 104157250, '2021-12-22 02:29:41', 0),
(34, 'Thanh toán hóa đơn', 3060000, 'Thanh toán hóa đơn mã 27119608', 3, b'1', 101097250, '2021-12-22 02:30:17', 0),
(35, 'Thanh toán hóa đơn', 298500, 'Thanh toán hóa đơn mã 29436696', 3, b'1', 100798750, '2021-12-22 02:32:49', 0),
(36, 'Thanh toán hóa đơn', 298500, 'Thanh toán hóa đơn mã 23831498', 3, b'1', 100500250, '2021-12-22 02:33:31', 0),
(37, 'Thanh toán hóa đơn', 1760000, 'Thanh toán hóa đơn mã 53792823', 3, b'1', 98740250, '2021-12-22 03:00:13', 0),
(38, 'Thanh toán hóa đơn', 1408000, 'Thanh toán hóa đơn mã 89244825', 3, b'1', 97332250, '2021-12-22 03:01:34', 0),
(39, 'Thanh toán hóa đơn', 1192000, 'Thanh toán hóa đơn mã 77484047', 3, b'1', 96140250, '2021-12-22 03:02:59', 0),
(40, 'Thanh toán hóa đơn', 745000, 'Thanh toán hóa đơn mã 37352255', 3, b'1', 95395250, '2021-12-22 03:03:52', 0),
(41, 'Thanh toán hóa đơn', 825000, 'Thanh toán hóa đơn mã 07145031', 3, b'1', 94570250, '2021-12-22 03:04:24', 0),
(42, 'Thanh toán hóa đơn', 1485000, 'Thanh toán hóa đơn mã 54505876', 3, b'1', 93085250, '2021-12-22 03:06:11', 0),
(43, 'Thanh toán hóa đơn', 825000, 'Thanh toán hóa đơn mã 81030320', 3, b'1', 92260250, '2021-12-22 03:06:56', 0),
(44, 'Thanh toán hóa đơn', 501600, 'Thanh toán hóa đơn mã 79887568', 3, b'1', 91758650, '2021-12-22 03:18:46', 0),
(45, 'Thanh toán hóa đơn', 668800, 'Thanh toán hóa đơn mã 96971020', 3, b'1', 91089850, '2021-12-22 03:19:15', 0),
(46, 'Thanh toán hóa đơn', 836000, 'Thanh toán hóa đơn mã 61015230', 3, b'1', 90253850, '2021-12-22 03:19:59', 0),
(47, 'Thanh toán hóa đơn', 1003200, 'Thanh toán hóa đơn mã 50471780', 3, b'1', 89250650, '2021-12-22 03:21:02', 0),
(48, 'Thanh toán hóa đơn', 1337600, 'Thanh toán hóa đơn mã 12508881', 3, b'1', 87913050, '2021-12-22 03:21:24', 0),
(49, 'Thanh toán hóa đơn', 2640000, 'Thanh toán hóa đơn mã 40463061', 3, b'1', 85273050, '2021-12-22 03:24:07', 0),
(50, 'Thanh toán hóa đơn', 3520000, 'Thanh toán hóa đơn mã 08590016', 3, b'1', 81753050, '2021-12-22 03:24:24', 0),
(51, 'Thanh toán hóa đơn', 1760000, 'Thanh toán hóa đơn mã 57209950', 3, b'1', 79993050, '2021-12-22 03:24:48', 0),
(52, 'Thanh toán hóa đơn', 2200000, 'Thanh toán hóa đơn mã 82858547', 3, b'1', 77793050, '2021-12-22 03:25:15', 0),
(53, 'Thanh toán hóa đơn', 880000, 'Thanh toán hóa đơn mã 12069924', 3, b'1', 76913050, '2021-12-22 03:26:18', 0),
(54, 'Thanh toán hóa đơn', 3520000, 'Thanh toán hóa đơn mã 02234126', 3, b'1', 73393050, '2021-12-22 03:27:28', 0),
(55, 'Thanh toán hóa đơn', 3080000, 'Thanh toán hóa đơn mã 58614484', 3, b'1', 70313050, '2021-12-22 03:28:34', 0),
(56, 'Thanh toán hóa đơn', 3168000, 'Thanh toán hóa đơn mã 50525356', 3, b'1', 67145050, '2021-12-22 03:29:18', 0),
(57, 'Thanh toán hóa đơn', 2464000, 'Thanh toán hóa đơn mã 79571039', 3, b'1', 64681050, '2021-12-22 03:29:37', 0),
(58, 'Thanh toán hóa đơn', 6600000, 'Thanh toán hóa đơn mã 08509182', 3, b'1', 58081050, '2021-12-22 03:30:10', 0),
(59, 'Thanh toán hóa đơn', 4800000, 'Thanh toán hóa đơn mã 26938997', 3, b'1', 53281050, '2021-12-22 03:30:37', 0),
(60, 'Thanh toán hóa đơn', 4200000, 'Thanh toán hóa đơn mã 05439511', 3, b'1', 49081050, '2021-12-22 03:31:11', 0),
(61, 'Thanh toán hóa đơn', 474000, 'Thanh toán hóa đơn mã 31087496', 3, b'1', 48607050, '2021-12-22 03:31:32', 0),
(62, 'Thanh toán hóa đơn', 333200, 'Thanh toán hóa đơn mã 59569593', 3, b'1', 48273850, '2021-12-22 03:32:55', 0),
(63, 'Thanh toán hóa đơn', 416500, 'Thanh toán hóa đơn mã 79782121', 3, b'1', 47857350, '2021-12-22 03:33:24', 0),
(64, 'Thanh toán hóa đơn', 1020000, 'Thanh toán hóa đơn mã 12120369', 3, b'1', 46837350, '2021-12-22 03:35:12', 0),
(65, 'Thanh toán hóa đơn', 345000, 'Thanh toán hóa đơn mã 78515990', 3, b'1', 46492350, '2021-12-22 03:36:22', 0),
(66, 'Thanh toán hóa đơn', 395000, 'Thanh toán hóa đơn mã 64069706', 3, b'1', 46097350, '2021-12-22 03:37:22', 0),
(67, 'Thanh toán hóa đơn', 790000, 'Thanh toán hóa đơn mã 85828747', 3, b'1', 45307350, '2021-12-22 03:37:49', 0),
(68, 'Thanh toán hóa đơn', 395000, 'Thanh toán hóa đơn mã 72018135', 3, b'1', 44912350, '2021-12-22 03:38:47', 0),
(69, 'Thanh toán hóa đơn', 4262580, 'Thanh toán hóa đơn mã 01312959', 3, b'1', 40649770, '2021-12-22 03:41:18', 0),
(70, 'Hoàn tiền hóa đơn', 474000, 'Hoàn tiền hóa đơn mã 31087496', 3, b'1', 41123770, '2021-12-22 03:44:40', 0),
(71, 'Hoàn tiền hóa đơn', 395000, 'Hoàn tiền hóa đơn mã 64069706', 3, b'1', 41518770, '2021-12-22 03:47:53', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `id` bigint(20) NOT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `idproduct` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `is_delete`, `name`, `url`, `idproduct`) VALUES
(1, b'0', 'anh.jpg', 'https://mebe-04.web4s.vn/uploads/plugin/product_items/131/tui-xach-n-venuco-madrid-g01s285-xanh-navy-rugby-polo-shirt-2-673x837-1.jpg', 1),
(2, b'0', 'anh.jpg', 'https://mebe-04.web4s.vn/uploads/plugin/product_items/131/tui-xach-n-venuco-madrid-g01s285-xanh-navy-rugby-polo-shirt-3-673x837-2.jpg', 1),
(3, b'0', 'anh.jpg', 'https://mebe-04.web4s.vn/uploads/plugin/product_items/131/tui-xach-n-venuco-madrid-g01s285-xanh-navy-rugby-polo-shirt-4-673x837-3.jpg', 1),
(4, b'0', 'anh.jpg', 'https://mebe-04.web4s.vn/uploads/plugin/product_items/131/tui-xach-n-venuco-madrid-g01s285-xanh-navy-rugby-polo-shirt-5-673x837-4.jpg', 1),
(5, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-gio-kidsplaza-in-hinh-chu-cai-1y-m20t-vang-2_1_1.jpg', 2),
(6, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-gio-kidsplaza-in-hinh-chu-cai-1y-m20t-vang-3_1_1.jpg', 2),
(7, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-gio-kidsplaza-in-hinh-chu-cai-1y-m20t-vang-4_1_1.jpg', 2),
(8, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-gio-kidsplaza-in-hinh-chu-cai-1y-m20t-vang-5_1_1.jpg', 2),
(9, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-gio-kidsplaza-in-hinh-chu-cai-1y-m20t-vang-6_1_1.jpg', 2),
(10, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-phong-tay-ngan-be-trai-in-hinh-chu-voi-kiza-1.jpg', 3),
(11, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-phong-tay-ngan-be-trai-in-hinh-chu-voi-kiza-8.jpg', 3),
(12, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-phong-tay-ngan-be-trai-in-hinh-chu-voi-kiza-9.jpg', 3),
(13, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-phong-tay-ngan-be-trai-in-hinh-chu-voi-kiza-7.jpg', 3),
(14, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-phong-tay-ngan-be-trai-in-hinh-chu-voi-kiza-3.jpg', 3),
(15, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-phong-tay-ngan-be-trai-in-hinh-chu-voi-kiza-4.jpg', 3),
(16, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-phong-tay-ngan-be-trai-in-hinh-chu-voi-kiza-2.jpg', 3),
(17, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-phong-tay-ngan-be-trai-in-hinh-chu-voi-kiza-5.jpg', 3),
(18, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-tay-ngan-be-trai-in-hinh-o-to-kiza-5.jpg', 4),
(19, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-tay-ngan-be-trai-in-hinh-o-to-kiza-3.jpg', 4),
(20, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-tay-ngan-be-trai-in-hinh-o-to-kiza-4.jpg', 4),
(21, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-tay-ngan-be-trai-in-hinh-o-to-kiza-2.jpg', 4),
(22, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-tay-ngan-be-trai-in-hinh-o-to-kiza-6.jpg', 4),
(23, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-tay-ngan-be-trai-in-hinh-o-to-kiza-7.jpg', 4),
(24, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-tay-ngan-be-trai-in-hinh-o-to-kiza-8.jpg', 4),
(25, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-quan-chip-dui-be-trai-14110-ac21-size-xxl-2.jpg', 5),
(26, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-quan-chip-dui-be-trai-14110-ac21-size-xxl-3.jpg', 5),
(27, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-quan-chip-dui-be-trai-14110-ac21-size-xxl-4.jpg', 5),
(28, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-quan-chip-dui-be-trai-14110-ac21-size-xxl-5.jpg', 5),
(29, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/q/u/quan-jeans-mem-mamago-in-hinh-thuyen-buom-xanh-nhat-3.jpg', 6),
(30, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/q/u/quan-jeans-mem-mamago-in-hinh-thuyen-buom-xanh-nhat-4.jpg', 6),
(31, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/q/u/quan-jeans-mem-mamago-in-hinh-thuyen-buom-xanh-nhat-2.jpg', 6),
(32, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/q/u/quan-jeans-mem-mamago-in-hinh-thuyen-buom-xanh-nhat-6.jpg', 6),
(33, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/q/u/quan-jeans-mem-mamago-in-hinh-thuyen-buom-xanh-nhat-5.jpg', 6),
(34, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/q/u/quan-dui-cotton-kiza-xanh-duong_3_.jpg', 7),
(35, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/q/u/quan-dui-cotton-kiza-xanh-duong_2_.jpg', 7),
(36, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/thoi-trang-be-trai/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-su-tu-m21t-trang-vang-4.jpg', 8),
(37, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/thoi-trang-be-trai/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-su-tu-m21t-trang-vang-5.jpg', 8),
(38, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/thoi-trang-be-trai/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-su-tu-m21t-trang-vang-6.jpg', 8),
(39, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/thoi-trang-be-trai/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-su-tu-m21t-trang-vang-2.jpg', 8),
(41, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/thoi-trang-be-trai/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-o-to-trang-xanh-4.jpg', 9),
(42, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/thoi-trang-be-trai/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-o-to-trang-xanh-6.jpg', 9),
(43, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/thoi-trang-be-trai/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-o-to-trang-xanh-5.jpg', 9),
(44, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/thoi-trang-be-trai/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-o-to-trang-xanh-2.jpg', 9),
(45, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/quan-ao-thoi-trang/bo-coc-tay-danh-cho-be-trai-kidsplaza-hoa-tiet-tau-ngam-deep-tour-ln21t-xanh-2.jpg', 10),
(46, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/quan-ao-thoi-trang/bo-coc-tay-danh-cho-be-trai-kidsplaza-hoa-tiet-tau-ngam-deep-tour-ln21t-xanh-4.jpg', 10),
(47, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/quan-ao-thoi-trang/bo-coc-tay-danh-cho-be-trai-kidsplaza-hoa-tiet-tau-ngam-deep-tour-ln21t-xanh-3.jpg', 10),
(48, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/quan-ao-thoi-trang/bo-coc-tay-danh-cho-be-trai-kidsplaza-hoa-tiet-tau-ngam-deep-tour-ln21t-xanh-6.jpg', 10),
(49, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/quan-ao-thoi-trang/bo-quan-ao-ba-lo-be-trai-kidsplaza-in-hinh-o-to-tt21h-do-2.jpg', 11),
(50, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/quan-ao-thoi-trang/bo-quan-ao-ba-lo-be-trai-kidsplaza-in-hinh-o-to-tt21h-do-4.jpg', 11),
(51, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/quan-ao-thoi-trang/bo-quan-ao-ba-lo-be-trai-kidsplaza-in-hinh-o-to-tt21h-do-5.jpg', 11),
(52, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/wysiwyg/product/thoi-trang-2021/quan-ao-thoi-trang/bo-quan-ao-ba-lo-be-trai-kidsplaza-in-hinh-o-to-tt21h-do-6.jpg', 11),
(53, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-1.jpg\n', 13),
(54, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-2.jpg\n', 13),
(55, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-3.jpg\n', 13),
(56, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-3.jpg\n', 13),
(57, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-1.jpg\n', 29),
(58, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-1.jpg\n', 29),
(59, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-1.jpg\n', 29),
(60, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-1.jpg\n', 29),
(61, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-so-sinh-dai-tay-kiza-in-hinh-tho-0-3m-trang-hong-1_1_2.jpg\n', 45),
(62, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-so-sinh-dai-tay-kiza-in-hinh-tho-0-3m-trang-hong-2_1_2.jpg\n', 45),
(63, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-so-sinh-dai-tay-kiza-in-hinh-tho-0-3m-trang-hong-3_1_2.jpg\n', 45),
(64, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-so-sinh-dai-tay-kiza-in-hinh-tho-0-3m-trang-hong-4_1_2.jpg', 45),
(65, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-in-hinh-ngoi-sao-kidsplaza-nd21d-xanh-hq-1.jpg\n', 46),
(66, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-in-hinh-ngoi-sao-kidsplaza-nd21d-xanh-hq-1.jpg\n', 46),
(67, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-in-hinh-ngoi-sao-kidsplaza-nd21d-xanh-hq-3.jpg\n', 46),
(68, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-in-hinh-ngoi-sao-kidsplaza-nd21d-xanh-hq-3.jpg\n', 46),
(69, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-in-hinh-ngoi-sao-kidsplaza-nd21d-xanh-hq-5.jpg', 46),
(70, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-hcd-be-gai-kidsplaza-nd21d-trang-1.jpg\n', 47),
(71, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-hcd-be-gai-kidsplaza-nd21d-trang-2.jpg\n', 47),
(72, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-hcd-be-gai-kidsplaza-nd21d-trang-2.jpg\n', 47),
(73, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-hcd-be-gai-kidsplaza-nd21d-trang-4.jpg\n', 47),
(74, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-hcd-be-gai-kidsplaza-nd21d-trang-5.jpg', 47),
(75, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-ke-xanh-be-trai-kidsplaza-nd21d-xanh-1.jpg\n', 48),
(76, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-ke-xanh-be-trai-kidsplaza-nd21d-xanh-2.jpg\n', 48),
(77, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-hcd-be-gai-kidsplaza-nd21d-trang-2.jpg\n', 48),
(78, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-ke-xanh-be-trai-kidsplaza-nd21d-xanh-3.jpg\n', 48),
(79, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-ke-xanh-be-trai-kidsplaza-nd21d-xanh-4.jpg', 48),
(80, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-gile-so-sinh-nhung-be-gai-kidsplaza-nd21d-hong-1_1.jpg', 49),
(81, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-xanh-1.jpg\n', 50),
(82, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-xanh-2.jpg\n', 50),
(83, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-xanh-3.jpg\n', 50),
(84, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-xanh-4.jpg\n', 50),
(85, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-xanh-5.jpg\n', 50),
(86, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-do-so-sinh-combo-6-mon-bamboo-in-hinh-gau-kidsplaza-m21h-trang-ghi-1.jpg\n', 51),
(87, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-do-so-sinh-combo-6-mon-bamboo-in-hinh-gau-kidsplaza-m21h-trang-ghi-2.jpg \n', 51),
(88, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-do-so-sinh-combo-6-mon-bamboo-in-hinh-gau-kidsplaza-m21h-trang-ghi-2.jpg\n', 51),
(89, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-do-so-sinh-combo-6-mon-bamboo-in-hinh-gau-kidsplaza-m21h-trang-ghi-5.jpg\n', 51),
(90, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-do-so-sinh-combo-6-mon-bamboo-in-hinh-gau-kidsplaza-m21h-trang-ghi-6.jpg\n', 51),
(91, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/body-so-sinh-dai-tay-kidsplaza-yem-in-o-to-hn21t-trang-xanh-1.jpg\n', 52),
(92, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-dai-tay-be-trai-phoi-cun-kidsplaza-m21t-trang-1_6.jpg\n', 53),
(93, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-dai-tay-be-trai-phoi-cun-kidsplaza-m21t-trang-2_6.jpg\n', 53),
(94, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-dai-tay-be-trai-phoi-cun-kidsplaza-m21t-trang-3_6.jpg\n', 53),
(95, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-dai-tay-be-trai-phoi-cun-kidsplaza-m21t-trang-3_6.jpg\n', 53),
(96, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-dai-tay-be-trai-phoi-cun-kidsplaza-m21t-trang-5_6.jpg\n', 53),
(97, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-so-sinh-dai-tay-cai-vai-kidsplaza-m21t-vang-1.jpg\n', 54),
(98, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-so-sinh-dai-tay-cai-vai-kidsplaza-m21t-vang-2.jpg\n', 54),
(99, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-so-sinh-dai-tay-cai-vai-kidsplaza-m21t-vang-3.jpg\n', 54),
(100, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-so-sinh-dai-tay-cai-vai-kidsplaza-m21t-vang-3.jpg\n', 54),
(101, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-gai-dai-tay-cai-vai-otis-kidsplaza-nd21t-trang-hong-1.jpg\n', 55),
(102, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-so-sinh-dai-tay-cai-vai-kidsplaza-m21t-vang-2.jpg\n', 55),
(103, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-so-sinh-dai-tay-cai-vai-kidsplaza-m21t-vang-3.jpg\n', 55),
(104, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-so-sinh-dai-tay-cai-vai-kidsplaza-m21t-vang-3.jpg\n', 55),
(105, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-gai-dai-tay-cai-vai-otis-kidsplaza-nd21t-trang-hong-1.jpg\n', 56),
(106, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-vang-2.jpg\n', 57),
(107, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-gai-dai-tay-cai-lech-kidsplaza-nd21d-hong-5.jpg', 58),
(108, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-cai-cheo-dai-tay-kidsplaza-in-hinh-gau-m21t-trang-ghi-2.jpg\n', 59),
(109, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-cai-cheo-dai-tay-kidsplaza-in-hinh-gau-m21t-trang-ghi-3.jpg\n', 59),
(110, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-cai-cheo-dai-tay-kidsplaza-in-hinh-gau-m21t-trang-ghi-4.jpg', 59),
(111, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-cai-cheo-dai-tay-kidsplaza-in-hinh-gau-m21t-trang-ghi-1.jpg\n', 59),
(112, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-gai-dai-tay-cai-lech-kidsplaza-nd21d-hong-1.jpg\n', 58),
(113, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-gai-dai-tay-cai-lech-kidsplaza-nd21d-hong-3.jpg\n', 58),
(114, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-gai-dai-tay-cai-lech-kidsplaza-nd21d-hong-4.jpg\n', 58),
(115, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-vang-2.jpg\n', 57),
(116, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-vang-3.jpg\n', 57),
(117, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-gai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-hong-3.jpg\n', 56),
(118, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-cai-cheo-dai-tay-kidsplaza-in-hinh-gau-m21t-trang-ghi-1.jpg\n', 60),
(119, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-cai-cheo-dai-tay-kidsplaza-in-hinh-gau-m21t-trang-ghi-2.jpg\n', 60),
(120, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-cai-cheo-dai-tay-kidsplaza-in-hinh-gau-m21t-trang-ghi-3.jpg\n', 60),
(121, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-cai-cheo-dai-tay-kidsplaza-in-hinh-gau-m21t-trang-ghi-4.jpg', 60),
(122, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-len-so-sinh-hello-be-trai-ke-ghi-ngang-kidsplaza-nd21d-vang-ghi-1.jpg\n', 61),
(123, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-len-so-sinh-hello-be-trai-ke-ghi-ngang-kidsplaza-nd21d-vang-ghi-2.jpg', 61),
(124, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-len-so-sinh-hello-be-trai-ke-ghi-ngang-kidsplaza-nd21d-vang-ghi-2.jpg', 61),
(125, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-1.jpg\n', 62),
(126, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-2.jpg\n', 62),
(127, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-3.jpg\n', 62),
(128, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-1.jpg\n', 63),
(129, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-2.jpg\n', 63),
(130, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-3.jpg\n', 63),
(131, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-1.jpg\n', 64),
(132, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-2.jpg\n', 64),
(133, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-3.jpg\n', 64),
(134, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-ho-chop-kidsplaza-hn21h-hong-1.jpg\n', 65),
(135, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-ho-chop-kidsplaza-hn21h-hong-2.jpg\n', 65),
(136, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-ho-chop-kidsplaza-hn21h-hong-3.jpg\n', 65),
(137, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-so-sinh-be-trai-otis-i-love-jungles-kidsplaza-nd21t-trang-vang-1.jpg\n', 66),
(138, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-so-sinh-be-trai-otis-i-love-jungles-kidsplaza-nd21t-trang-vang-2.jpg\n', 66),
(139, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-so-sinh-be-trai-otis-i-love-jungles-kidsplaza-nd21t-trang-vang-3.jpg\n', 66),
(140, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/g/i/giay-tap-di-kidsplaza-21k-s4-bo-sua-xanh-1.jpg\n', 67),
(141, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/g/i/giay-tap-di-kidsplaza-21k-s4-bo-sua-xanh-2.jpg\n', 67),
(142, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/g/i/giay-tap-di-kidsplaza-21k-s4-bo-sua-xanh-3.jpg\n', 67),
(143, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/g/i/giay-tap-di-kidsplaza-21k-s4-bo-sua-xanh-4.jpg\n', 67),
(144, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/g/i/giay-tap-di-kidsplaza-21k-s4-bo-sua-xanh-5.jpg', 67),
(145, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-yem-an-ct-mothers-choice-hong-xam-1.jpg\n', 68),
(146, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-yem-an-ct-mothers-choice-hong-xam-2.jpg\n', 68),
(147, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-yem-an-ct-mothers-choice-hong-xam-3.jpg', 68),
(148, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/_/m/_mg_0078.jpg\n', 69),
(149, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/_/m/_mg_0078.jpg\n', 69),
(150, b'0', 'anh.jpg', 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/_/m/_mg_0072.jpg\n', 69),
(151, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/17-12-2021/setvayhellokitty2.jpg\n', 71),
(152, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/17-12-2021/setvayhellokitty1.jpg\n', 71),
(153, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/17-12-2021/setvayhellokitty3.jpg', 71),
(154, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/18-11-2021/aorutdaychuxanh.jpg\n', 72),
(155, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/18-11-2021/aorutdaychuden.jpg\n', 72),
(156, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/18-11-2021/aorutdaychuden.jpg\n', 72),
(157, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/17-12-2021/SETSOMIGAULUNGHONG1.jpg\n', 70),
(158, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/17-12-2021/SETSOMIGAULUNGxanh.jpg\n', 70),
(159, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/17-12-2021/SETSOMIGAULUNGtrang.jpg\n', 70),
(160, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/17-12-2021/SETSOMIGAULUNGHONG1.jpg', 70),
(161, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-10-2021/aokhoatloveisxanh.jpg\n', 73),
(162, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-10-2021/aokhoatloveisvang.jpg\n', 73),
(163, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-10-2021/aokhoatloveisXAM.jpg', 73),
(164, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aokhoatdacatuigauhong.jpg\n', 74),
(165, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aokhoatdacatuigauvang.jpg\n', 74),
(166, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aokhoatdacatuigaucam.jpg', 74),
(167, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aohoodie4.jpg\n', 75),
(168, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aohoodie1.jpg\n', 75),
(169, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aohoodie3.jpg\n', 75),
(170, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aohoodie2.jpg', 75),
(171, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aohoodie1.jpg\n', 76),
(172, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aohoodie3.jpg\n', 76),
(173, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/9-7-2021/aohoodie2.jpg', 76),
(174, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/26-6-2021/aohoodiebosuatrang.jpg\n', 77),
(175, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/26-6-2021/aohoodiebosuatrang1_1.jpg\n', 77),
(176, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/26-6-2021/aohoodiebosuavang.jpg', 77),
(177, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/10-5-2021/aothunganvienrentrang.jpg\n', 78),
(178, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/10-5-2021/aothunganvienrenhong.jpg\n', 78),
(179, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/10-5-2021/aothunganvienrenvang.jpg', 78),
(180, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/10-5-2021/aothuythumattrangtrang.jpg\n', 79),
(181, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/10-5-2021/aothuythumattranghong.jpg', 79),
(182, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/1-4-2021/aosatnachtronden.jpg\n', 80),
(183, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/1-4-2021/aosatnachtron2.jpg', 80),
(184, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/1-4-2021/aosatnachtron1.jpg\n', 80),
(185, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/1-4-2021/aosatnachtron3.jpg', 80),
(186, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/6-1-2021/aosoctraitimtrang.jpg\n', 81),
(187, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/6-1-2021/aosoctraitimall.jpg', 81),
(188, b'0', 'anh.jpg', 'https://www.bexinhshop.vn/image/data/6-1-2021/aosoctraitimall.jpg', 81);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mamipay`
--

CREATE TABLE `mamipay` (
  `idmamipay` bigint(20) NOT NULL,
  `idcustomer` bigint(20) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `surplus` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `mamipay`
--

INSERT INTO `mamipay` (`idmamipay`, `idcustomer`, `is_delete`, `surplus`) VALUES
(2, 1, b'0', 8420000),
(3, 2, b'0', 41518770),
(4, 3, b'0', 999994763180);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `downprice` double DEFAULT NULL,
  `idbill` varchar(255) DEFAULT NULL,
  `idquantity` bigint(20) DEFAULT NULL,
  `intomoney` double DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantitydetail` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`id`, `create_at`, `downprice`, `idbill`, `idquantity`, `intomoney`, `is_delete`, `price`, `quantitydetail`) VALUES
(1, '2021-12-21 20:24:41', 22800, '19353443', 499, 167200, b'0', 190000, 7),
(2, '2021-12-21 20:24:41', 0, '19353443', 4, 94500, b'0', 94500, 1),
(3, '2021-12-21 20:57:58', 22800, '61390547', 276, 167200, b'0', 190000, 1),
(4, '2021-12-22 01:02:50', 18000, '08082269', 225, 102000, b'0', 120000, 1),
(5, '2021-12-22 01:02:50', 22800, '08082269', 276, 167200, b'0', 190000, 1),
(6, '2021-12-22 01:02:50', 18000, '08082269', 208, 102000, b'0', 120000, 1),
(7, '2021-12-22 01:10:19', 60000, '86463036', 403, 440000, b'0', 500000, 3),
(8, '2021-12-22 01:15:35', 13930, '69059670', 77, 125370, b'0', 139300, 12),
(9, '2021-12-22 01:17:00', 13930, '47985376', 83, 125370, b'0', 139300, 1),
(10, '2021-12-22 01:17:00', 13930, '47985376', 84, 125370, b'0', 139300, 1),
(11, '2021-12-22 01:19:05', 22800, '11471435', 276, 167200, b'0', 190000, 2),
(12, '2021-12-22 01:19:05', 22800, '11471435', 360, 167200, b'0', 190000, 6),
(13, '2021-12-22 01:19:53', 48000, '35965548', 278, 352000, b'0', 400000, 1),
(14, '2021-12-22 01:21:02', 12900, '89364040', 57, 116100, b'0', 129000, 2),
(15, '2021-12-22 01:21:02', 12900, '89364040', 55, 116100, b'0', 129000, 5),
(16, '2021-12-22 01:21:58', 0, '25192722', 274, 390000, b'0', 390000, 1),
(17, '2021-12-22 01:21:58', 0, '25192722', 316, 390000, b'0', 390000, 3),
(18, '2021-12-22 01:23:07', 13930, '45665895', 75, 125370, b'0', 139300, 1),
(19, '2021-12-22 01:24:45', 18000, '55548279', 112, 102000, b'0', 120000, 1),
(20, '2021-12-22 01:24:45', 18000, '55548279', 208, 102000, b'0', 120000, 3),
(21, '2021-12-22 01:26:50', 0, '38965167', 3, 94500, b'0', 94500, 2),
(22, '2021-12-22 01:28:29', 60000, '74758547', 319, 440000, b'0', 500000, 1),
(23, '2021-12-22 01:30:06', 30750, '43995825', 301, 174250, b'0', 205000, 1),
(24, '2021-12-22 01:30:06', 30750, '43995825', 399, 174250, b'0', 205000, 2),
(25, '2021-12-22 01:36:17', 0, '20171394', 317, 200000, b'0', 200000, 1),
(26, '2021-12-22 01:36:17', 0, '20171394', 345, 200000, b'0', 200000, 1),
(27, '2021-12-22 01:36:17', 13930, '20171394', 79, 125370, b'0', 139300, 1),
(28, '2021-12-22 01:49:10', 22800, '52313883', 290, 167200, b'0', 190000, 1),
(29, '2021-12-22 01:49:10', 22800, '52313883', 276, 167200, b'0', 190000, 1),
(30, '2021-12-22 01:49:41', 18000, '66437854', 136, 102000, b'0', 120000, 1),
(31, '2021-12-22 01:49:41', 18000, '66437854', 112, 102000, b'0', 120000, 1),
(32, '2021-12-22 01:50:06', 60000, '54631662', 277, 440000, b'0', 500000, 1),
(33, '2021-12-22 01:50:43', 48000, '88625363', 348, 352000, b'0', 400000, 2),
(34, '2021-12-22 01:50:43', 48000, '88625363', 278, 352000, b'0', 400000, 5),
(35, '2021-12-22 01:51:09', 13930, '24770463', 75, 125370, b'0', 139300, 1),
(36, '2021-12-22 01:51:09', 13930, '24770463', 76, 125370, b'0', 139300, 1),
(37, '2021-12-22 01:51:47', 30750, '25645701', 426, 174250, b'0', 205000, 1),
(38, '2021-12-22 01:51:47', 30750, '25645701', 287, 174250, b'0', 205000, 1),
(39, '2021-12-22 01:52:21', 48000, '35278055', 278, 352000, b'0', 400000, 1),
(40, '2021-12-22 01:53:08', 12900, '33575124', 60, 116100, b'0', 129000, 1),
(41, '2021-12-22 01:53:08', 12900, '33575124', 57, 116100, b'0', 129000, 2),
(42, '2021-12-22 01:54:33', 22800, '11691406', 276, 167200, b'0', 190000, 1),
(43, '2021-12-22 01:55:15', 13930, '76386631', 75, 125370, b'0', 139300, 1),
(44, '2021-12-22 01:56:28', 60000, '78186188', 277, 440000, b'0', 500000, 1),
(45, '2021-12-22 01:57:02', 0, '48180696', 272, 165000, b'0', 165000, 1),
(46, '2021-12-22 01:57:43', 0, '10541641', 470, 200000, b'0', 200000, 1),
(47, '2021-12-22 01:57:43', 0, '10541641', 275, 200000, b'0', 200000, 1),
(48, '2021-12-22 02:21:49', 48000, '58409325', 376, 352000, b'0', 400000, 2),
(49, '2021-12-22 02:23:48', 11925, '31492628', 117, 67575, b'0', 79500, 9),
(50, '2021-12-22 02:23:48', 11925, '31492628', 141, 67575, b'0', 79500, 1),
(51, '2021-12-22 02:24:24', 7425, '83119844', 118, 42075, b'0', 49500, 3),
(52, '2021-12-22 02:25:21', 13930, '77067644', 75, 125370, b'0', 139300, 1),
(53, '2021-12-22 02:28:32', 22800, '71936106', 276, 167200, b'0', 190000, 1),
(54, '2021-12-22 02:28:32', 13930, '71936106', 75, 125370, b'0', 139300, 3),
(55, '2021-12-22 02:29:03', 22800, '75756012', 276, 167200, b'0', 190000, 4),
(56, '2021-12-22 02:29:41', 22800, '95683949', 276, 167200, b'0', 190000, 4),
(57, '2021-12-22 02:30:17', 60000, '27119608', 90, 340000, b'0', 400000, 9),
(58, '2021-12-22 02:30:45', 60000, '49171951', 90, 340000, b'0', 400000, 5),
(59, '2021-12-22 02:31:04', 60000, '57216726', 90, 340000, b'0', 400000, 7),
(60, '2021-12-22 02:31:28', 60000, '34880167', 90, 340000, b'0', 400000, 6),
(61, '2021-12-22 02:32:08', 0, '75363718', 100, 99500, b'0', 99500, 9),
(62, '2021-12-22 02:32:26', 0, '63068637', 100, 99500, b'0', 99500, 4),
(63, '2021-12-22 02:32:49', 0, '29436696', 100, 99500, b'0', 99500, 3),
(64, '2021-12-22 02:33:31', 0, '23831498', 100, 99500, b'0', 99500, 3),
(65, '2021-12-22 02:33:55', 0, '68820784', 100, 99500, b'0', 99500, 2),
(66, '2021-12-22 02:34:16', 0, '17789183', 100, 99500, b'0', 99500, 6),
(67, '2021-12-22 02:40:04', 18000, '42272680', 112, 102000, b'0', 120000, 6),
(68, '2021-12-22 02:41:22', 18000, '95775664', 136, 102000, b'0', 120000, 4),
(69, '2021-12-22 02:41:22', 18000, '95775664', 208, 102000, b'0', 120000, 5),
(70, '2021-12-22 03:00:13', 48000, '53792823', 278, 352000, b'0', 400000, 5),
(71, '2021-12-22 03:00:34', 48000, '07332436', 278, 352000, b'0', 400000, 5),
(72, '2021-12-22 03:01:34', 48000, '89244825', 278, 352000, b'0', 400000, 4),
(73, '2021-12-22 03:02:36', 0, '01891840', 65, 149000, b'0', 149000, 5),
(74, '2021-12-22 03:02:59', 0, '77484047', 65, 149000, b'0', 149000, 8),
(75, '2021-12-22 03:03:52', 0, '37352255', 65, 149000, b'0', 149000, 5),
(76, '2021-12-22 03:04:24', 0, '07145031', 313, 165000, b'0', 165000, 5),
(77, '2021-12-22 03:06:11', 0, '54505876', 313, 165000, b'0', 165000, 9),
(78, '2021-12-22 03:06:56', 0, '81030320', 313, 165000, b'0', 165000, 5),
(79, '2021-12-22 03:07:19', 0, '88062461', 313, 165000, b'0', 165000, 8),
(80, '2021-12-22 03:07:50', 0, '58874445', 313, 165000, b'0', 165000, 7),
(81, '2021-12-22 03:18:46', 22800, '79887568', 276, 167200, b'0', 190000, 3),
(82, '2021-12-22 03:19:15', 22800, '96971020', 276, 167200, b'0', 190000, 4),
(83, '2021-12-22 03:19:59', 22800, '61015230', 276, 167200, b'0', 190000, 5),
(84, '2021-12-22 03:21:02', 22800, '50471780', 276, 167200, b'0', 190000, 6),
(85, '2021-12-22 03:21:24', 22800, '12508881', 276, 167200, b'0', 190000, 8),
(86, '2021-12-22 03:22:49', 22800, '83679000', 276, 167200, b'0', 190000, 6),
(87, '2021-12-22 03:23:08', 22800, '00474401', 276, 167200, b'0', 190000, 5),
(88, '2021-12-22 03:24:07', 60000, '40463061', 277, 440000, b'0', 500000, 6),
(89, '2021-12-22 03:24:24', 60000, '08590016', 277, 440000, b'0', 500000, 8),
(90, '2021-12-22 03:24:48', 60000, '57209950', 319, 440000, b'0', 500000, 4),
(91, '2021-12-22 03:25:15', 60000, '82858547', 319, 440000, b'0', 500000, 5),
(92, '2021-12-22 03:25:32', 60000, '48025378', 319, 440000, b'0', 500000, 6),
(93, '2021-12-22 03:25:59', 60000, '34209149', 319, 440000, b'0', 500000, 5),
(94, '2021-12-22 03:26:18', 60000, '12069924', 319, 440000, b'0', 500000, 2),
(95, '2021-12-22 03:27:09', 60000, '85502891', 319, 440000, b'0', 500000, 4),
(96, '2021-12-22 03:27:28', 60000, '02234126', 319, 440000, b'0', 500000, 8),
(97, '2021-12-22 03:27:46', 60000, '09418373', 319, 440000, b'0', 500000, 6),
(98, '2021-12-22 03:27:59', 60000, '32317347', 319, 440000, b'0', 500000, 1),
(99, '2021-12-22 03:28:15', 60000, '55396386', 319, 440000, b'0', 500000, 5),
(100, '2021-12-22 03:28:34', 60000, '58614484', 319, 440000, b'0', 500000, 7),
(101, '2021-12-22 03:28:57', 48000, '86426504', 278, 352000, b'0', 400000, 13),
(102, '2021-12-22 03:29:18', 48000, '50525356', 278, 352000, b'0', 400000, 9),
(103, '2021-12-22 03:29:37', 48000, '79571039', 348, 352000, b'0', 400000, 7),
(104, '2021-12-22 03:30:10', 0, '08509182', 156, 600000, b'0', 600000, 11),
(105, '2021-12-22 03:30:37', 0, '26938997', 156, 600000, b'0', 600000, 8),
(106, '2021-12-22 03:30:54', 0, '10696457', 156, 600000, b'0', 600000, 5),
(107, '2021-12-22 03:31:11', 0, '05439511', 180, 600000, b'0', 600000, 7),
(108, '2021-12-22 03:31:32', 0, '31087496', 107, 39500, b'0', 39500, 12),
(109, '2021-12-22 03:31:56', 0, '52037304', 107, 39500, b'0', 39500, 11),
(110, '2021-12-22 03:32:32', 0, '44779724', 155, 39500, b'0', 39500, 8),
(111, '2021-12-22 03:32:32', 0, '44779724', 107, 39500, b'0', 39500, 9),
(112, '2021-12-22 03:32:55', 7350, '59569593', 109, 41650, b'0', 49000, 8),
(113, '2021-12-22 03:33:24', 7350, '79782121', 205, 41650, b'0', 49000, 10),
(114, '2021-12-22 03:34:54', 60000, '87474095', 90, 340000, b'0', 400000, 8),
(115, '2021-12-22 03:35:12', 60000, '12120369', 90, 340000, b'0', 400000, 3),
(116, '2021-12-22 03:35:33', 60000, '28960887', 90, 340000, b'0', 400000, 5),
(117, '2021-12-22 03:35:49', 0, '12787704', 6, 69000, b'0', 69000, 6),
(118, '2021-12-22 03:36:22', 0, '78515990', 6, 69000, b'0', 69000, 5),
(119, '2021-12-22 03:36:43', 0, '72584389', 284, 300000, b'0', 300000, 6),
(120, '2021-12-22 03:36:58', 0, '38928513', 284, 300000, b'0', 300000, 7),
(121, '2021-12-22 03:37:22', 0, '64069706', 21, 79000, b'0', 79000, 5),
(122, '2021-12-22 03:37:49', 0, '85828747', 21, 79000, b'0', 79000, 10),
(123, '2021-12-22 03:38:22', 0, '76112045', 21, 79000, b'0', 79000, 7),
(124, '2021-12-22 03:38:47', 0, '72018135', 21, 79000, b'0', 79000, 5),
(125, '2021-12-22 03:39:13', 0, '24983384', 65, 149000, b'0', 149000, 6),
(126, '2021-12-22 03:40:08', 13930, '05734489', 75, 125370, b'0', 139300, 19),
(127, '2021-12-22 03:40:42', 0, '12996408', 400, 390000, b'0', 390000, 5),
(128, '2021-12-22 03:40:42', 0, '12996408', 455, 390000, b'0', 390000, 2),
(129, '2021-12-22 03:40:42', 0, '12996408', 274, 390000, b'0', 390000, 7),
(130, '2021-12-22 03:40:42', 0, '12996408', 344, 390000, b'0', 390000, 4),
(131, '2021-12-22 03:41:18', 13930, '01312959', 84, 125370, b'0', 139300, 17),
(132, '2021-12-22 03:41:18', 13930, '01312959', 82, 125370, b'0', 139300, 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `day_update` datetime DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `description_detail` varchar(5000) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `idcategorydetail` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `day_update`, `description`, `description_detail`, `discount`, `image`, `is_delete`, `name`, `price`, `status`, `idcategorydetail`) VALUES
(1, '2020-12-18 01:02:28', '%3Cp%3ECh%E1%BA%A5t%20li%E1%BB%87u%20da%20t%E1%BB%95ng%20h%E1%BB%A3p%20cao%20c%E1%BA%A5p%2C%20b%E1%BB%81n%20%C4%91%E1%BA%B9p%20Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BA%AFp%20g%E1%BA%ADp%2C%20kh%C3%B3a%20b%E1%BA%A5m.%3C%2Fp%3E', '%3Cp%3E%C3%81o%20len%20Venuco%20Madrid%20G01S285%20l%C3%A0%20m%E1%BB%99t%20ph%E1%BB%A5%20ki%E1%BB%87n%20kh%C3%B4ng%20th%E1%BB%83%20thi%E1%BA%BFu%20v%E1%BB%9Bi%20b%E1%BA%A5t%20c%E1%BB%A9%20ng%C6%B0%E1%BB%9Di%20ph%E1%BB%A5%20n%E1%BB%AF%20n%C3%A0o.%20Ngay%20c%E1%BA%A3%20m%E1%BB%99t%20c%C3%B4%20n%C3%A0ng%20kh%C3%B4ng%20th%C3%ADch%20th%E1%BB%9Di%20trang%20cho%20l%E1%BA%AFm%20th%C3%AC%20s%E1%BB%9F%20h%E1%BB%AFu%20m%E1%BB%99t%20chi%E1%BA%BFc%20t%C3%BAi%20%C4%91%E1%BA%B9p%2C%20t%E1%BB%91t%2C%20b%E1%BB%81n%20c%C5%A9ng%20l%C3%A0%20m%E1%BB%99t%20%C4%91i%E1%BB%81u%20m%C3%A0%20ph%C3%A1i%20%C4%91%E1%BA%B9p%20lu%C3%B4n%20ngh%C4%A9%20%C4%91%E1%BA%BFn.%20T%C3%BAi%20x%C3%A1ch%20n%E1%BB%AF%20Venuco%20Madrid%20G01S285%20xanh%20navy%E2%80%8B%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%20da%20t%E1%BB%95ng%20h%E1%BB%A3p%20si%C3%AAu%20b%E1%BB%81n%2C%20gi%C3%BAp%20b%E1%BA%A1n%20s%E1%BB%AD%20d%E1%BB%A5ng%20trong%20th%E1%BB%9Di%20gian%20d%C3%A0i%20m%C3%A0%20kh%C3%B4ng%20c%E1%BA%A7n%20lo%20l%E1%BA%AFng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BB%8B%20bong%20hay%20n%E1%BB%95%20da.%20T%C3%BAi%20%C4%91%C6%B0%E1%BB%A3c%20thi%E1%BA%BFt%20k%E1%BA%BF%20c%E1%BB%A1%20trung%20b%C3%ACnh%20theo%20phong%20c%C3%A1ch%20ch%C3%A2u%20%C3%82u%20th%E1%BB%9Di%20th%C6%B0%E1%BB%A3ng%20mang%20%C4%91%E1%BA%BFn%20cho%20qu%C3%BD%20c%C3%B4%20s%E1%BB%B1%20ti%E1%BB%87n%20d%E1%BB%A5ng%20m%C3%A0%20v%E1%BA%ABn%20thanh%20l%E1%BB%8Bch%20v%C3%A0%20sang%20tr%E1%BB%8Dng%3C%2Fp%3E', 0, 'https://mebe-04.web4s.vn/uploads/plugin/product_items/131/tui-xach-n-venuco-madrid-g01s285-xanh-navy-rugby-polo-shirt-1-673x837-0.jpg', b'0', 'Áo len Venuco Madrid G01S285 ', 300000, NULL, 1),
(2, '2020-12-18 01:02:28', '%3Cp%3E%C3%81o%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%2095%25%20poliester%2C%205%25%20spandex%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20an%20to%C3%A0n%20v%E1%BB%9Bi%20b%C3%A9%3C%2Fp%3E', '%3Cp%3EThi%E1%BA%BFt%20k%E1%BA%BF%20kh%C3%B3a%20k%C3%A9o%20ti%E1%BB%87n%20l%E1%BB%A3i%2C%20d%E1%BB%85%20d%C3%A0ng%20thay%20m%E1%BA%B7c%20%C3%A1o%2C%20b%C3%A9%20c%C3%B3%20th%E1%BB%83%20t%E1%BB%B1%20m%E1%BA%B7c%20%C3%A1o%20m%C3%A0%20kh%C3%B4ng%20c%E1%BA%A7n%20%C4%91%E1%BA%BFn%20s%E1%BB%B1%20gi%C3%BAp%20%C4%91%E1%BB%A1%20c%E1%BB%A7a%20cha%20m%E1%BA%B9.%20%C3%81o%20bo%20%E1%BB%91ng%20k%C3%A8m%20m%C5%A9%20b%E1%BA%A3o%20v%E1%BB%87%20b%C3%A9%20kh%E1%BB%8Fi%20b%E1%BB%A5i%20b%E1%BA%A9n%20m%E1%BB%97i%20khi%20ra%20ngo%C3%A0i%20v%C3%A0%20tr%C3%A1nh%20gi%C3%B3%20gi%E1%BB%AF%20%E1%BA%A5m%20%C4%91%E1%BA%A7u%20cho%20b%C3%A9%20y%C3%AAu%20Tr%C3%AAn%20%C3%A1o%20in%20nhi%E1%BB%81u%20chi%20ti%E1%BA%BFt%20h%C3%ACnh%20ng%E1%BB%99%20ngh%C4%A9nh%20khi%E1%BA%BFn%20b%C3%A9%20nh%C3%A0%20b%E1%BA%A1n%20c%C3%A0ng%20%C4%91%C3%A1ng%20y%C3%AAu%20h%C6%A1n%20khi%20m%E1%BA%B7c.%3C%2Fp%3E', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-gio-kidsplaza-in-hinh-chu-cai-1y-m20t-vang-1_1_1.jpg', b'0', 'Áo gió KidsPlaza in hình Chữ Cái 5Y M20T (Vàng)', 94500, NULL, 1),
(3, '2020-12-18 01:02:28', '%3Cp%3E%C3%81o%20ph%C3%B4ng%20tay%20ng%E1%BA%AFn%20b%C3%A9%20trai%20in%20h%C3%ACnh%20ch%C3%BA%20voi%20ng%E1%BB%99%20ngh%C4%A9nh%2C%20%C4%91%C3%A1ng%20y%C3%AAu%20Kiza.%3C%2Fp%3E', '%3Cp%3EM%C3%B9a%20h%C3%A8%20s%E1%BA%AFp%20%C4%91%E1%BA%BFn%20r%E1%BB%93i%2C%20Kids%20Plaza%20xin%20%C4%91%C6%B0%E1%BB%A3c%20gi%E1%BB%9Bi%20thi%E1%BB%87u%20v%E1%BB%9Bi%20cha%20m%E1%BA%B9%20r%E1%BA%A5t%20nhi%E1%BB%81u%20m%E1%BA%ABu%20qu%E1%BA%A7n%20%C3%A1o%20th%E1%BB%9Di%20trang%20h%C3%A8%20v%E1%BB%9Bi%20%C4%91%E1%BB%A7%20ki%E1%BB%83u%20d%C3%A1ng%2C%20k%C3%ADch%20c%E1%BB%A1%20v%C3%A0%20m%C3%A0u%20s%E1%BA%AFc%20cho%20m%E1%BA%B9%20v%C3%A0%20b%C3%A9%20c%C3%B3%20th%C3%AAm%20nhi%E1%BB%81u%20s%E1%BB%B1%20ch%E1%BB%8Dn.%20M%E1%BA%ABu%20%C3%A1o%20ph%C3%B4ng%20tay%20ng%E1%BA%AFn%20b%C3%A9%20trai%20in%20h%C3%ACnh%20ch%C3%BA%20voi%20ng%E1%BB%99%20ngh%C4%A9nh%20Kiza%20v%E1%BB%9Bi%20ch%E1%BA%A5t%20li%E1%BB%87u%20v%E1%BA%A3i%20cotton%20100%25%2C%20kh%E1%BA%A3%20n%C4%83ng%20th%E1%BA%A5m%20h%C3%BAt%20v%C6%B0%E1%BB%A3t%20tr%E1%BB%99i%20c%C3%B9ng%20h%E1%BB%8Da%20ti%E1%BA%BFt%20%C4%91%E1%BB%99c%20%C4%91%C3%A1o%20h%E1%BB%A9a%20h%E1%BA%B9n%20l%C3%A0%20m%E1%BB%99t%20trong%20nh%E1%BB%AFng%20m%E1%BA%ABu%20b%C3%A1n%20ch%E1%BA%A1y%20nh%E1%BA%A5t%20trong%20m%C3%B9a%20h%C3%A8%202017%3C%2Fp%3E', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-phong-tay-ngan-be-trai-in-hinh-chu-voi-kiza-6.jpg', b'0', 'Áo phông tay ngắn bé trai in hình chú voi Kiza', 69000, NULL, 1),
(4, '2020-12-18 01:02:28', '%3Cp%3E%C3%81o%20tay%20ng%E1%BA%AFn%20b%C3%A9%20trai%20in%20h%C3%ACnh%20%C3%B4%20t%C3%B4%20Kiza%20100%25%20t%E1%BB%AB%20v%E1%BA%A3i%20cotton.%3C%2Fp%3E', '%3Cp%3E%C3%81o%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%20v%E1%BA%A3i%20cotton%20100%25%20r%E1%BA%A5t%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20th%C3%A2n%20thi%E1%BB%87n%20v%E1%BB%9Bi%20l%C3%A0n%20da%20nh%E1%BA%A1y%20c%E1%BA%A3m%20c%E1%BB%A7a%20b%C3%A9%20y%C3%AAu%20V%E1%BA%A3i%20b%E1%BB%81n%20%C4%91%E1%BA%B9p%2C%20co%20gi%C3%A3n%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20v%C6%B0%E1%BB%A3t%20tr%E1%BB%99i%20mang%20%C4%91%E1%BA%BFn%20cho%20b%C3%A9%20y%C3%AAu%20s%E1%BB%B1%20tho%E1%BA%A3i%20m%C3%A1i%2C%20d%E1%BB%85%20ch%E1%BB%8Bu%20khi%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng%20nh%C3%A2t%20l%C3%A0%20trong%20ng%C3%A0y%20h%C3%A8%20oi%20b%E1%BB%A9c.%3C%2Fp%3E', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-tay-ngan-be-trai-in-hinh-o-to-kiza-1.jpg', b'0', 'Áo tay ngắn bé trai in hình ô tô Kiza', 69000, NULL, 1),
(5, '2020-12-18 01:02:28', '%3Cp%3EQu%E1%BA%A7n%20chip%20%C4%91%C3%B9i%20b%C3%A9%20trai%2014110%20AC21%20v%E1%BB%9Bi%20h%E1%BB%8Da%20ti%E1%BA%BFt%20ng%E1%BB%99%20ngh%C4%A9nh%20ch%E1%BA%AFc%20ch%E1%BA%AFn%20s%E1%BA%BD%20khi%E1%BA%BFn%20c%C3%A1c%20ch%C3%A0ng%20trai%20th%C3%ADch%20th%C3%BA%20v%C3%A0%20t%E1%BA%A1o%20%C4%91%C6%B0%E1%BB%A3c%20th%C3%B3i%20quen%20m%E1%BA%B7c%20qu%E1%BA%A7n%20l%C3%B3t%20b%C3%AAn%20trong%20%C4%91%E1%BB%83%20b%E1%BA%A3o%20v%E1%BB%87%20v%C3%B9ng%20k%C3%ADn%20khi%20%C4%91i%20ch%C6%A1i%20hay%20%C4%91i%20h%E1%BB%8Dc%3C%2Fp%3E', '%3Cp%3EHo%E1%BA%A1%20ti%E1%BA%BFt%3A%20qu%E1%BA%A7n%20chip%20d%E1%BA%A1ng%20qu%E1%BA%A7n%20%C4%91%C3%B9i%20d%C3%A0nh%20ri%C3%AAng%20cho%20b%C3%A9%20trai%20v%E1%BB%9Bi%20h%E1%BB%8Da%20ti%E1%BA%BFt%20in%20h%C3%ACnh%20ho%E1%BA%A1t%20h%C3%ACnh%20c%C3%A1c%20con%20v%E1%BA%ADt%20ng%E1%BB%99%20ngh%C4%A9nh%2C%20%C4%91%C3%A1ng%20y%C3%AAu.%20M%C3%A0u%20s%E1%BA%AFc%3A%20Set%202%20qu%E1%BA%A7n%20chip%20%C4%91%C3%B9i%20b%C3%A9%20trai%2014110%20AC21%20(size%20XXL)%20c%C3%B3%202%20m%C3%A0u%20l%C3%A0%20xanh%20d%C6%B0%C6%A1ng%20v%C3%A0%20ghi%20x%C3%A1m%20%C4%91%E1%BB%83%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20thay%20%C4%91%E1%BB%95i%20cho%20b%C3%A9%20h%C3%A0ng%20ng%C3%A0y.%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20Set%202%20qu%E1%BA%A7n%20chip%20%C4%91%C3%B9i%20b%C3%A9%20trai%2014110%20AC21%20size%20XXL%20d%C3%A0nh%20cho%20b%C3%A9%20trai%20t%E1%BB%AB%204-5%20tu%E1%BB%95i.%20Ba%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20tham%20kh%E1%BA%A3o%20b%E1%BA%A3ng%20size%20b%C3%AAn%20d%C6%B0%E1%BB%9Bi%20%C4%91%E1%BB%83%20l%E1%BB%B1a%20%C4%91%E1%BB%93%20cho%20b%C3%A9.%3C%2Fp%3E', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-quan-chip-dui-be-trai-14110-ac21-size-xxl-1.jpg', b'0', 'Set 2 quần chip đùi bé trai 14110 AC21', 79000, NULL, 2),
(6, '2020-12-18 01:02:28', '%3Cp%3EB%C3%A9%20y%C3%AAu%20th%E1%BB%9Di%20trang%20phong%20c%C3%A1ch%20v%E1%BB%9Bi%20qu%E1%BA%A7n%20Jeans%20m%E1%BB%81m%20Mamago%20in%20h%C3%ACnh%20thuy%E1%BB%81n%20bu%E1%BB%93m%20(xanh%20nh%E1%BA%A1t).%3C%2Fp%3E', '%3Cp%3ECh%E1%BA%A5t%20li%E1%BB%87u%3A%20v%E1%BA%A3i%20Jeans%20d%C3%A0y%20d%E1%BA%B7n%2C%20co%20gi%C3%A3n%2C%20tho%E1%BA%A3i%20m%C3%A1i%20khi%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng%20Thi%E1%BA%BFt%20k%E1%BA%BF%3A%20qu%E1%BA%A7n%20%C4%91ai%20chun%20co%20gi%C3%A3n%2C%20kh%C3%B4ng%20g%C3%A2y%20in%20h%E1%BA%B1n%20da%20tr%E1%BA%BBH%E1%BB%8Da%20ti%E1%BA%BFt%3A%20trang%20tr%C3%AD%20h%C3%ACnh%20chi%E1%BA%BFc%20thuy%E1%BB%81n%20bu%E1%BB%93n%20k%C3%A8m%20logo%20Mamago%20%C4%91%E1%BB%99c%20%C4%91%C3%A1o%20v%C3%A0%20l%C3%B4i%20cu%E1%BB%91n.%3C%2Fp%3E', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/q/u/quan-jeans-mem-mamago-in-hinh-thuyen-buom-xanh-nhat-1.jpg', b'0', 'Quần Jeans mềm Mamago in hình thuyền buồm ', 179000, NULL, 2),
(7, '2020-12-18 01:02:28', '%3Cp%3EQu%E1%BA%A7n%20%C4%91%C3%B9i%20th%E1%BB%9Di%20trang%20d%C3%A0nh%20cho%20b%C3%A9%20trai%20c%E1%BB%A7a%20th%C6%B0%C6%A1ng%20hi%E1%BB%87u%20Kiza%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%20cotton%20cao%20c%E1%BA%A5p%2C%20m%E1%BB%81m%20m%E1%BB%8Bn%2C%20c%C3%B3%20kh%E1%BA%A3%20n%C4%83ng%20th%E1%BA%A5m%20h%C3%BAt%20t%E1%BB%91t%20v%C3%A0%20%C4%91%E1%BA%B7c%20bi%E1%BB%87t%20an%20to%C3%A0n%20v%E1%BB%9Bi%20da%20c%E1%BB%A7a%20b%C3%A9.%3C%2Fp%3E', '%3Cp%3EQu%E1%BA%A7n%20c%C3%B3%20form%20kh%C3%A1%20r%E1%BB%99ng%20r%C3%A3i%20s%E1%BA%BD%20gi%C3%BAp%20b%C3%A9%20tho%E1%BA%A3i%20m%C3%A1i%20khi%20m%E1%BA%B7c%20qu%E1%BA%A7n%20ch%E1%BA%A1y%20nh%E1%BA%A3y%2C%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng%20th%C6%B0%E1%BB%9Dng%20xuy%C3%AAn.%20C%E1%BA%A1p%20chun%20co%20gi%C3%A3n%20k%E1%BA%BFt%20h%E1%BB%A3p%20v%E1%BB%9Bi%20d%C3%A2y%20r%C3%BAt%20%C4%91%E1%BB%83%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20%C4%91i%E1%BB%81u%20ch%E1%BB%89nh%20qu%E1%BA%A7n%20%C3%B4m%20v%E1%BB%ABa%20v%E1%BA%B7n%20l%E1%BA%A5y%20ng%C6%B0%E1%BB%9Di%20b%C3%A9%20m%C3%A0%20kh%C3%B4ng%20%C4%91%E1%BB%83%20l%E1%BA%A1i%20v%E1%BA%BFt%20h%E1%BA%B1n%20tr%C3%AAn%20da.Chi%E1%BA%BFc%20qu%E1%BA%A7n%20c%C3%B3%20nhi%E1%BB%81u%20m%C3%A0u%20s%E1%BA%AFc%20kh%C3%A1c%20nhau%2C%20ph%C3%ADa%20%E1%BB%91ng%20qu%E1%BA%A7n%20%C4%91%C6%B0%E1%BB%A3c%20in%20h%C3%ACnh%20c%C3%A1%20t%C3%ADnh%20c%C3%A0ng%20th%E1%BB%83%20hi%E1%BB%87n%20gu%20th%E1%BB%9Di%20trang%20n%C4%83ng%20%C4%91%E1%BB%99ng%20c%E1%BB%A7a%20b%C3%A9..%3C%2Fp%3E', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/q/u/quan-dui-cotton-kiza-xanh-duong.jpg', b'0', 'Quần đùi cotton Kiza xanh dương', 23600, NULL, 2),
(8, '2020-12-18 01:02:28', '%3Cp%3EB%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20d%C3%A0i%20tay%20k%E1%BA%BB%20s%E1%BB%8Dc%20KidsPlaza%20in%20S%C6%B0%20T%E1%BB%AD%20M21T%20(Tr%E1%BA%AFng%20V%C3%A0ng)%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%2095%25%20cotton%2C%205%25%20spandex%20m%C3%A8m%20m%E1%BA%A1i%2C%20an%20to%C3%A0n.%20V%E1%BA%A3i%20b%E1%BB%81n%20%C4%91%E1%BA%B9p%2C%20co%20gi%C3%A3n%20%C4%91%C3%A0n%20h%E1%BB%93i%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20tho%E1%BA%A3i%20m%C3%A1i%20d%E1%BB%85%20ch%E1%BB%8Bu%20khi%20m%E1%BA%B7c%3C%2Fp%3E', '%3Cp%3EThi%E1%BA%BFt%20k%E1%BA%BF%3A%20c%E1%BB%95%20%C3%A1o%20bo%20tr%C3%B2n%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20kh%C3%B4ng%20lo%20in%20h%E1%BA%B1n%20khuy%20l%C3%AAn%20b%E1%BB%A5ng%20khi%20b%C3%A9%20n%E1%BA%B1m%20s%E1%BA%A5p.%20%E1%BB%90ng%20tay%20%C3%A1o%20v%C3%A0%20%E1%BB%91ng%20qu%E1%BA%A7n%20%C4%91%E1%BB%81u%20%C4%91%C6%B0%E1%BB%A3c%20bo%20vi%E1%BB%81n%2C%20%C3%B4m%20s%C3%A1t%20gi%C3%BAp%20h%E1%BA%A1n%20ch%E1%BA%BF%20gi%C3%B3%20l%C3%B9a%2C%20gi%E1%BB%AF%20%E1%BA%A5m%20cho%20b%C3%A9%20khi%20m%E1%BA%B7c.H%E1%BB%8Da%20ti%E1%BA%BFt%3A%20tr%C3%AAn%20s%E1%BA%A3n%20ph%E1%BA%A9m%20in%20ho%E1%BA%A1%20ti%E1%BA%BFt%20ch%C3%BA%20S%C6%B0%20T%E1%BB%AD%20%C4%91%C3%A1ng%20y%C3%AAu%20n%E1%BB%95i%20b%E1%BA%ADt%20tr%C3%AAn%20n%E1%BB%81n%20tr%E1%BA%AFng%2C%20tay%20%C3%A1o%20ph%E1%BB%91i%20m%C3%A0u%20v%C3%A0ng%20t%C6%B0%C6%A1i%20t%E1%BA%AFn%20gi%C3%BAp%20b%E1%BB%99%20trang%20ph%E1%BB%A5c%20th%C3%AAm%20ph%E1%BA%A7n%20kho%E1%BA%BB%20kho%E1%BA%AFn%2C%20b%E1%BA%AFt%20m%E1%BA%AFt%3C%2Fp%3E', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-su-tu-m21t-trang-vang.jpg', b'0', 'Bộ quần áo dài tay bé trai kẻ sọc KidsPlaza in Sư Tử M21T (Trắng Vàng)', 129000, NULL, 3),
(9, '2020-12-18 01:02:28', '%3Cp%3EB%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20d%C3%A0i%20tay%20b%C3%A9%20trai%20k%E1%BA%BB%20s%E1%BB%8Dc%20KidsPlaza%20in%20%C3%B4%20t%C3%B4%20M21T%20(Tr%E1%BA%AFng%20Xanh)%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%2095%25%20cotton%2C%205%25%20spandex%20m%C3%A8m%20m%E1%BA%A1i%2C%20an%20to%C3%A0n.%20V%E1%BA%A3i%20b%E1%BB%81n%20%C4%91%E1%BA%B9p%2C%20co%20gi%C3%A3n%20%C4%91%C3%A0n%20h%E1%BB%93i%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20tho%E1%BA%A3i%20m%C3%A1i%20d%E1%BB%85%20ch%E1%BB%8Bu%20khi%20m%E1%BA%B7c%3C%2Fp%3E', '%3Cp%3EThi%E1%BA%BFt%20k%E1%BA%BF%3A%20c%E1%BB%95%20%C3%A1o%20bo%20tr%C3%B2n%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20kh%C3%B4ng%20lo%20in%20h%E1%BA%B1n%20khuy%20l%C3%AAn%20b%E1%BB%A5ng%20khi%20b%C3%A9%20n%E1%BA%B1m%20s%E1%BA%A5p.%20%E1%BB%90ng%20tay%20%C3%A1o%20v%C3%A0%20%E1%BB%91ng%20qu%E1%BA%A7n%20%C4%91%E1%BB%81u%20%C4%91%C6%B0%E1%BB%A3c%20bo%20vi%E1%BB%81n%2C%20%C3%B4m%20s%C3%A1t%20gi%C3%BAp%20h%E1%BA%A1n%20ch%E1%BA%BF%20gi%C3%B3%20l%C3%B9a%2C%20gi%E1%BB%AF%20%E1%BA%A5m%20cho%20b%C3%A9%20khi%20m%E1%BA%B7c.H%E1%BB%8Da%20ti%E1%BA%BFt%3A%20tr%C3%AAn%20s%E1%BA%A3n%20ph%E1%BA%A9m%20in%20ho%E1%BA%A1%20ti%E1%BA%BFt%20%C3%B4%20t%C3%B4%20ng%E1%BB%99%20ngh%C4%A9nh%20n%E1%BB%95i%20b%E1%BA%ADt%20tr%C3%AAn%20n%E1%BB%81n%20tr%E1%BA%AFng%2C%20tay%20%C3%A1o%20ph%E1%BB%91i%20xanh%20gi%C3%BAp%20b%E1%BB%99%20trang%20ph%E1%BB%A5c%20th%C3%AAm%20ph%E1%BA%A7n%20kho%E1%BA%BB%20kho%E1%BA%AFn%2C%20b%E1%BA%AFt%20m%E1%BA%AFt.Qu%E1%BA%A7n%20%C4%91%C3%A1p%20%C4%91%C5%A9ng%20thun%20m%E1%BB%81m%20co%20gi%C3%A3n%2C%20%C3%B4m%20nh%E1%BA%B9%20l%E1%BA%A5y%20eo%20b%C3%A9%2C%20tho%E1%BA%A3i%20m%C3%A1i%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng%3C%2Fp%3E', 10, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-dai-tay-be-trai-ke-soc-kidsplaza-in-o-to-trang-xanh-1.jpg', b'0', 'Bộ quần áo dài tay bé trai kẻ sọc KidsPlaza in ô tô M21T (Trắng Xanh)', 129000, NULL, 3),
(10, '2020-12-18 01:02:28', '%3Cp%3EB%E1%BB%99%20c%E1%BB%99c%20tay%20d%C3%A0nh%20cho%20b%C3%A9%20trai%20KidsPlaza%20h%E1%BB%8Da%20ti%E1%BA%BFt%20T%C3%A0u%20Ng%E1%BA%A7m%20Deep%20Tour%20LN21T%20(Xanh)%20n%E1%BA%B1m%20trong%20B%E1%BB%99%20s%C6%B0u%20t%E1%BA%ADp%20c%C3%A1c%20m%E1%BA%ABu%20qu%E1%BA%A7n%20%C3%A1o%20m%C3%B9a%20h%C3%A8%20Hot%20nh%E1%BA%A5t%20n%C4%83m%202021%20c%E1%BB%A7a%20KidsPlaza..%3C%2Fp%3E', '%3Cp%3EB%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%20cotton%20cao%20c%E1%BA%A5p%2C%20m%E1%BB%81m%20m%C3%A1t%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20t%E1%BB%91t%20%C4%91em%20%C4%91%E1%BA%BFn%20s%E1%BB%B1%20tho%E1%BA%A3i%20m%C3%A1i%2C%20an%20to%C3%A0n%20cho%20b%C3%A9%20y%C3%AAu%20khi%20di%E1%BB%87n%20trang%20ph%E1%BB%A5c%20trong%20nh%E1%BB%AFng%20ng%C3%A0y%20h%C3%A8%20n%C3%B3ng%20b%E1%BB%A9c.B%E1%BB%99%20c%E1%BB%99c%20tay%20d%C3%A0nh%20cho%20b%C3%A9%20trai%20KidsPlaza%20h%E1%BB%8Da%20ti%E1%BA%BFt%20T%C3%A0u%20Ng%E1%BA%A7m%20Deep%20Tour%20LN21T%20(Xanh)%20ch%E1%BA%AFc%20ch%E1%BA%AFn%20s%E1%BA%BD%20l%C3%A0%20m%E1%BA%ABu%20trang%20ph%E1%BB%A5c%20kh%C3%B4ng%20th%E1%BB%83%20thi%E1%BA%BFu%20trong%20t%E1%BB%A7%20%C4%91%E1%BB%93%20c%E1%BB%A7a%20b%C3%A9%20y%C3%AAu.%20B%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20ho%C3%A0n%20to%C3%A0n%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%2095%25%20cotton%20cao%20c%E1%BA%A5p%2C%205%25%20spandex%20si%C3%AAu%20m%E1%BB%81m%20m%E1%BA%A1i.%20%C4%90%C6%B0%E1%BB%9Dng%20ch%E1%BB%89%20may%20s%E1%BA%AFc%20n%C3%A9t%2C%20t%E1%BB%89%20m%E1%BB%89%20%C4%91%C6%B0%E1%BB%A3c%20v%E1%BA%AFt%20s%E1%BB%95%20c%E1%BA%A9n%20th%E1%BA%ADn%2C%20khi%E1%BA%BFn%20b%E1%BB%99%20trang%20ph%E1%BB%A5c%20tr%E1%BB%9F%20l%C3%AAn%20v%C3%B4%20c%C3%B9ng%20tinh%20t%E1%BA%BF..%3C%2Fp%3E', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/_/m/_mg_0946.jpg', b'0', 'Bộ cộc tay dành cho bé trai KidsPlaza họa tiết Tàu Ngầm Deep Tour LN21T (Xanh)', 149000, NULL, 3),
(11, '2020-12-18 01:02:28', '%3Cp%3EB%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20ba%20l%E1%BB%97%20b%C3%A9%20trai%20KidsPlaza%20in%20h%C3%ACnh%20%C3%94%20t%C3%B4%20TT21H%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%20100%25%20cotton%20cao%20c%E1%BA%A5p%2C%20v%E1%BB%ABa%20m%E1%BB%81m%20m%E1%BA%A1i%20l%E1%BA%A1i%20th%E1%BA%A5m%20h%C3%BAt%20t%E1%BB%91t%2C%20%C4%91em%20l%E1%BA%A1i%20s%E1%BB%B1%20tho%C3%A1ng%20m%C3%A1t.%3C%2Fp%3E', 'Ch%E1%BA%A5t%20v%E1%BA%A3i%20m%E1%BB%81m%20m%E1%BA%A1i%20nh%C6%B0ng%20kh%C3%B4ng%20nh%C4%83n%2C%20kh%C3%B4ng%20phai%20m%C3%A0u%20c%C5%A9ng%20nh%C6%B0%20kh%C3%B4ng%20bai%20nh%C3%A3o%20v%C3%A0%20nh%E1%BA%A5t%20l%C3%A0%20an%20to%C3%A0n%20v%E1%BB%9Bi%20l%C3%A0n%20da%20nh%E1%BA%A1y%20c%E1%BA%A3m%20c%E1%BB%A7a%20b%C3%A9.Khi%20l%E1%BB%B1a%20ch%E1%BB%8Dn%20s%E1%BA%A3n%20ph%E1%BA%A9m%20n%C3%A0y%20cho%20b%C3%A9%20m%E1%BA%B7c%20c%C3%A1c%20m%E1%BA%B9%20kh%C3%B4ng%20ph%E1%BA%A3i%20lo%20l%E1%BA%AFng%20b%C3%A9%20y%C3%AAu%20b%E1%BB%8B%20n%E1%BB%95i%20r%C3%B4m%2C%20tuy%E1%BB%87t%20%C4%91%E1%BB%91i%20an%20to%C3%A0n%20khi%20s%E1%BB%AD%20d%E1%BB%A5ng.%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20H%E1%BB%8Da%20ti%E1%BA%BFt%3A%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%C6%B0%E1%BB%A3c%20in%20h%C3%ACnh%20chi%E1%BA%BFc%20xe%20%C3%B4%20t%C3%B4%20m%C3%A0u%20v%C3%A0ng%20ng%E1%BB%99%20ngh%C4%A9nh%20n%E1%BB%95i%20b%E1%BA%ADt%20tr%C3%AAn%20n%E1%BB%81n%20m%C3%A0u%20%C4%91%E1%BB%8F%20c%E1%BB%A7a%20%C3%A1o%20r%E1%BA%A5t%20b%E1%BA%AFt%20m%E1%BA%AFt.', 10, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-ba-lo-be-trai-kidsplaza-in-hinh-o-to-tt21h-do-1.jpg', b'0', 'Bộ quần áo ba lỗ bé trai KidsPlaza in hình Ô tô TT21H (Đỏ)', 139300, NULL, 3),
(12, '2020-12-18 01:02:28', 'B%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20c%E1%BB%99c%20tay%20th%E1%BB%9Di%20trang%20b%C3%A9%20trai%20KidsPlaza%20in%20h%E1%BB%8Da%20ti%E1%BA%BFt%20Football%20TT21H%20(Xanh)%20n%E1%BA%B1m%20trong%20B%E1%BB%99%20s%C6%B0u%20t%E1%BA%ADp%20c%C3%A1c%20m%E1%BA%ABu%20qu%E1%BA%A7n%20%C3%A1o%20m%C3%B9a%20h%C3%A8%20Hot%20nh%E1%BA%A5t%20n%C4%83m%202021%20c%E1%BB%A7a%20KidsPlaza.', 'B%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%20cotton%20cao%20c%E1%BA%A5p%2C%20m%E1%BB%81m%20m%C3%A1t%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20t%E1%BB%91t%20%C4%91em%20%C4%91%E1%BA%BFn%20s%E1%BB%B1%20tho%E1%BA%A3i%20m%C3%A1i%2C%20an%20to%C3%A0n%20cho%20b%C3%A9%20y%C3%AAu%20khi%20di%E1%BB%87n%20trang%20ph%E1%BB%A5c%20trong%20nh%E1%BB%AFng%20ng%C3%A0y%20h%C3%A8%20n%C3%B3ng%20b%E1%BB%A9c.B%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20c%E1%BB%99c%20tay%20th%E1%BB%9Di%20trang%20b%C3%A9%20trai%20KidsPlaza%20in%20h%E1%BB%8Da%20ti%E1%BA%BFt%20Football%20TT21H%20(Xanh)%20ch%E1%BA%AFc%20ch%E1%BA%AFn%20s%E1%BA%BD%20l%C3%A0%20m%E1%BA%ABu%20trang%20ph%E1%BB%A5c%20kh%C3%B4ng%20th%E1%BB%83%20thi%E1%BA%BFu%20trong%20t%E1%BB%A7%20%C4%91%E1%BB%93%20c%E1%BB%A7a%20b%C3%A9%20y%C3%AAu.%20B%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20ho%C3%A0n%20to%C3%A0n%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%2095%25%20cotton%20cao%20c%E1%BA%A5p%2C%205%25%20spandex%20si%C3%AAu%20m%E1%BB%81m%20m%E1%BA%A1i.%20%C4%90%C6%B0%E1%BB%9Dng%20ch%E1%BB%89%20may%20s%E1%BA%AFc%20n%C3%A9t%2C%20t%E1%BB%89%20m%E1%BB%89%20%C4%91%C6%B0%E1%BB%A3c%20v%E1%BA%AFt%20s%E1%BB%95%20c%E1%BA%A9n%20th%E1%BA%ADn%2C%20khi%E1%BA%BFn%20b%E1%BB%99%20trang%20ph%E1%BB%A5c%20tr%E1%BB%9F%20l%C3%AAn%20v%C3%B4%20c%C3%B9ng%20tinh%20t%E1%BA%BF.', 10, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-coc-tay-thoi-trang-be-trai-kidsplaza-in-hoa-tiet-football-tt21h-xanh-1.jpg', b'0', 'Bộ quần áo cộc tay thời trang bé trai KidsPlaza in họa tiết Football TT21H', 139300, NULL, 3),
(13, '2020-12-18 01:02:28', '%C3%81o%20len%20m%E1%BB%81m%2C%20m%E1%BB%8Bn%2C%20nh%E1%BA%B9.%20Ph%C3%B9%20h%E1%BB%A3p%20th%E1%BB%9Di%20ti%E1%BA%BFt%20se%0A%20l%E1%BA%A1nh%20gi%C3%BAp%20con%20gi%E1%BB%AF%20%E1%BA%A5m%20m%C3%A0%20v%E1%BA%ABn%20tho%E1%BA%A3i%20m%C3%A1i%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng.', '%C4%90%E1%BA%B7c%20t%C3%ADnh%20c%E1%BB%A7a%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%20kh%C3%B4ng%20bai%2C%20kh%C3%B4ng%20x%C3%B9%2C%20kh%C3%B4ng%20nh%C3%A3o%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20gi%E1%BA%B7t%20m%C3%A1y%20tho%E1%BA%A3i%20m%C3%A1i.%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%C6%B0%E1%BB%A3c%20%C4%91%E1%BA%B7t%20d%E1%BB%87t%20ri%C3%AAng%20n%C3%AAn%20c%C3%A1c%20m%E1%BA%B9%20y%C3%AAn%20t%C3%A2m%20v%E1%BB%81%20ch%E1%BA%A5t%20li%E1%BB%87u%20bo%20%C3%A1o%20c%C5%A9ng%20nh%C6%B0%20m%C3%A0u%20s%E1%BA%AFc%20c%E1%BB%A7a%20s%E1%BA%A3n%20ph%E1%BA%A9m%20m%E1%BA%B9%20nh%C3%A9.%0A%0A%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20len%20l%C3%B4ng%20c%E1%BB%ABu%20nh%C3%A2n%20t%E1%BA%A1o%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20trai%20t%E1%BB%AB%203%20th%C3%A1ng%20tu%E1%BB%95i%20%C4%91%E1%BA%BFn%203%20tu%E1%BB%95i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%203-6M%2C%206-9M%2C%209-12M%2C%2012-18M%2C%2018-24M%2C%203Y.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m', 10, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-4.jpg', b'0', 'Áo len bé trai dài tay Hello kẻ ngang ', 300000, NULL, 1),
(29, '2020-12-18 01:02:28', '%C3%81o%20len%20m%E1%BB%81m%2C%20m%E1%BB%8Bn%2C%20nh%E1%BA%B9.%20Ph%C3%B9%20h%E1%BB%A3p%20th%E1%BB%9Di%20ti%E1%BA%BFt%20se%0A%20l%E1%BA%A1nh%20gi%C3%BAp%20con%20gi%E1%BB%AF%20%E1%BA%A5m%20m%C3%A0%20v%E1%BA%ABn%20tho%E1%BA%A3i%20m%C3%A1i%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng.', '%C4%90%E1%BA%B7c%20t%C3%ADnh%20c%E1%BB%A7a%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%20kh%C3%B4ng%20bai%2C%20kh%C3%B4ng%20x%C3%B9%2C%20kh%C3%B4ng%20nh%C3%A3o%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20gi%E1%BA%B7t%20m%C3%A1y%20tho%E1%BA%A3i%20m%C3%A1i.%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%C6%B0%E1%BB%A3c%20%C4%91%E1%BA%B7t%20d%E1%BB%87t%20ri%C3%AAng%20n%C3%AAn%20c%C3%A1c%20m%E1%BA%B9%20y%C3%AAn%20t%C3%A2m%20v%E1%BB%81%20ch%E1%BA%A5t%20li%E1%BB%87u%20bo%20%C3%A1o%20c%C5%A9ng%20nh%C6%B0%20m%C3%A0u%20s%E1%BA%AFc%20c%E1%BB%A7a%20s%E1%BA%A3n%20ph%E1%BA%A9m%20m%E1%BA%B9%20nh%C3%A9.%0A%0A%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20len%20l%C3%B4ng%20c%E1%BB%ABu%20nh%C3%A2n%20t%E1%BA%A1o%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20trai%20t%E1%BB%AB%203%20th%C3%A1ng%20tu%E1%BB%95i%20%C4%91%E1%BA%BFn%203%20tu%E1%BB%95i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%203-6M%2C%206-9M%2C%209-12M%2C%2012-18M%2C%2018-24M%2C%203Y.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m', 20, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-ke-ngang-kidsplaza-nd21d-ghi-1.jpg\n', b'0', 'Áo len bé trai dài tay Hello kẻ ngang ', 250000, NULL, 1),
(45, '2020-12-18 01:02:28', '%3Cp%3EB%E1%BB%99%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%C6%B0%E1%BB%A3c%20thi%E1%BA%BFt%20k%E1%BA%BF%20c%C3%BAc%20c%C3%A0i%20gi%E1%BB%AFa%20ti%E1%BB%87n%20l%E1%BB%A3i%2C%20m%E1%BA%B9%20s%E1%BA%BD%20thay%20m%E1%BA%B7c%20%C3%A1o%20cho%20b%C3%A9%20d%E1%BB%85%20d%C3%A0ng%20h%C6%A1n%20so%20v%E1%BB%9Bi%20c%C3%A1c%20d%C3%B2ng%20%C3%A1o%20chui%20c%E1%BB%95%20kh%C3%A1c.%3C%2Fp%3E', '%3Cp%3ETr%C3%AAn%20%C3%A1o%20in%20h%C3%ACnh%20th%E1%BB%8F%20xinh%20x%E1%BA%AFn%2C%20ng%E1%BB%99%20ngh%C4%A9nh%20v%C3%A0%20%C4%91%C3%A1ng%20y%C3%AAu.%20%C3%81o%20s%C6%A1%20sinh%20d%C3%A0i%20tay%20Kiza%20in%20h%C3%ACnh%20th%E1%BB%8F%20c%C3%B3%20m%C3%A0u%20tr%E1%BA%AFng%20trang%20nh%C3%A3%20t%C6%B0%C6%A1i%20s%C3%A1ng%2C%20t%C3%B4n%20da%20c%E1%BB%A7a%20tr%E1%BA%BB.%20S%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%20100%25%20v%E1%BA%A3i%20cotton%20USA%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20kh%C3%B4ng%20g%C3%A2y%20k%C3%ADch%20%E1%BB%A9ng%20da%20c%E1%BB%A7a%20tr%E1%BA%BB.%20Co%20gi%C3%A3n%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20t%E1%BB%91t%2C%20tho%E1%BA%A3i%20m%C3%A1i%2C%20d%E1%BB%85%20ch%E1%BB%8Bu%20ngay%20c%E1%BA%A3%20khi%20m%E1%BA%B7c%20l%C3%A2u.%20Thi%E1%BA%BFt%20k%E1%BA%BF%20ph%C3%B9%20nh%E1%BB%A3p%20v%E1%BB%9Bi%20b%C3%A9%20t%E1%BB%AB%200-24%20th%C3%A1ng%20tu%E1%BB%95i%20C%C3%B3%206%20size%20(0-3M%2C%203-6M%2C%206-9M%2C%209-12M%2C%2012-18M%20v%C3%A0%2018-24M)%20Th%C6%B0%C6%A1ng%20hi%E1%BB%87u%20Kidsplaza%20l%C3%A0%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%E1%BB%99c%20quy%E1%BB%81n%20c%E1%BB%A7a%20si%C3%AAu%20th%E1%BB%8B%20m%E1%BA%B9%20v%C3%A0%20b%C3%A9%20Kids%20Plaza%20S%E1%BA%A3n%20xu%E1%BA%A5t%3A%20t%E1%BA%A1i%20Vi%E1%BB%87t%20Nam.%3C%2Fp%3E', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-so-sinh-dai-tay-kiza-in-hinh-tho-0-3m-trang-hong-1_1_2.jpg\n', b'0', 'Áo sơ sinh dài tay Kiza in hình thỏ 12-18M', 400000, NULL, 1),
(46, '2020-12-18 01:02:28', '%3Cp%3EB%E1%BB%99%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%C6%B0%E1%BB%A3c%20thi%E1%BA%BFt%20k%E1%BA%BF%20c%C3%BAc%20c%C3%A0i%20gi%E1%BB%AFa%20ti%E1%BB%87n%20l%E1%BB%A3i%2C%20m%E1%BA%B9%20s%E1%BA%BD%20thay%20m%E1%BA%B7c%20%C3%A1o%20cho%20b%C3%A9%20d%E1%BB%85%20d%C3%A0ng%20h%C6%A1n%20so%20v%E1%BB%9Bi%20c%C3%A1c%20d%C3%B2ng%20%C3%A1o%20chui%20c%E1%BB%95%20kh%C3%A1c.%3C%2Fp%3E', '%3Cp%3E%C4%90%E1%BA%B7c%20t%C3%ADnh%20c%E1%BB%A7a%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%20kh%C3%B4ng%20bai%2C%20kh%C3%B4ng%20x%C3%B9%2C%20kh%C3%B4ng%20nh%C3%A3o%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20gi%E1%BA%B7t%20m%C3%A1y%20tho%E1%BA%A3i%20m%C3%A1i.%20S%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%C6%B0%E1%BB%A3c%20%C4%91%E1%BA%B7t%20d%E1%BB%87t%20ri%C3%AAng%20n%C3%AAn%20c%C3%A1c%20m%E1%BA%B9%20y%C3%AAn%20t%C3%A2m%20v%E1%BB%81%20ch%E1%BA%A5t%20li%E1%BB%87u%20bo%20%C3%A1o%20c%C5%A9ng%20nh%C6%B0%20m%C3%A0u%20s%E1%BA%AFc%20c%E1%BB%A7a%20s%E1%BA%A3n%20ph%E1%BA%A9m%20m%E1%BA%B9%20nh%C3%A9.%20%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%20Ch%E1%BA%A5t%20li%E1%BB%87u%3A%20len%20l%C3%B4ng%20c%E1%BB%ABu%20nh%C3%A2n%20t%E1%BA%A1o%20%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20trai%20t%E1%BB%AB%203%20%C4%91%E1%BA%BFn%2018%20th%C3%A1ng%20tu%E1%BB%95i%20S%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%203-6M%2C%206-9M%2C%209-12M%2C%2012-18M.%20B%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%20H%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%20Kh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%20Kh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%20Kh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%20N%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m.%3C%2Fp%3E', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-be-trai-dai-tay-hello-in-hinh-ngoi-sao-kidsplaza-nd21d-xanh-hq-1.jpg\n', b'0', 'Áo len bé trai dài tay Hello in hình ngôi sao', 94500, NULL, 1),
(47, '2020-12-18 01:02:28', '%C3%81o%20len%20m%E1%BB%81m%2C%20m%E1%BB%8Bn%2C%20nh%E1%BA%B9.%20Ph%C3%B9%20h%E1%BB%A3p%20th%E1%BB%9Di%20ti%E1%BA%BFt%20se%20l%E1%BA%A1nh%20gi%C3%BAp%20con%20gi%E1%BB%AF%20%E1%BA%A5m%20m%C3%A0%20v%E1%BA%ABn%20tho%E1%BA%A3i%20m%C3%A1i%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng.', '%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20len%20l%C3%B4ng%20c%E1%BB%ABu%20nh%C3%A2n%20t%E1%BA%A1o%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20g%C3%A1i%20t%E1%BB%AB%203%20%C4%91%E1%BA%BFn%2018%20th%C3%A1ng%20tu%E1%BB%95i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%203-6M%2C%206-9M%2C%209-12M%2C%2012-18M.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-hcd-be-gai-kidsplaza-nd21d-trang-1.jpg\n', b'0', 'Áo len gile Hello HCD bé gái', 480000, NULL, 10),
(48, '2020-12-18 01:02:28', '%C3%81o%20len%20m%E1%BB%81m%2C%20m%E1%BB%8Bn%2C%20nh%E1%BA%B9.%20Ph%C3%B9%20h%E1%BB%A3p%20th%E1%BB%9Di%20ti%E1%BA%BFt%20se%20l%E1%BA%A1nh%20gi%C3%BAp%20con%20gi%E1%BB%AF%20%E1%BA%A5m%20m%C3%A0%20v%E1%BA%ABn%20tho%E1%BA%A3i%20m%C3%A1i%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng.', '%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20len%20l%C3%B4ng%20c%E1%BB%ABu%20nh%C3%A2n%20t%E1%BA%A1o%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20trai%20t%E1%BB%AB%203%20%C4%91%E1%BA%BFn%2018%20th%C3%A1ng%20tu%E1%BB%95i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%203-6M%2C%206-9M%2C%209-12M%2C%2012-18M.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-len-gile-hello-ke-xanh-be-trai-kidsplaza-nd21d-xanh-1.jpg\n', b'0', 'Áo len gile Hello kẻ xanh bé trai', 79500, NULL, 1),
(49, '2020-12-18 01:02:28', 'Ch%E1%BA%A5t%20li%E1%BB%87u%20cao%20c%E1%BA%A5p%20M%E1%BA%B9%20ch%E1%BB%89%20c%E1%BA%A7n%20nh%C3%ACn%20l%C3%A0%20c%E1%BA%A3m%20nh%E1%BA%ADn%20%C4%91%C6%B0%E1%BB%A3c%20ngay%3A%20Kh%C3%B4ng%20x%C3%B9%2C%20kh%C3%B4ng%20bai%20nh%C3%A3o%20khi%20gi%E1%BA%B7t%2C%20kh%C3%B4ng%20g%C3%A2y%20ng%E1%BB%A9a%20cho%20l%C3%A0n%20da%20m%E1%BB%8Fng%20manh%20c%E1%BB%A7a%20b%C3%A9.', '%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20len%20l%C3%B4ng%20c%E1%BB%ABu%20nh%C3%A2n%20t%E1%BA%A1o%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20trai%20t%E1%BB%AB%203%20%C4%91%E1%BA%BFn%2018%20th%C3%A1ng%20tu%E1%BB%95i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%203-6M%2C%206-9M%2C%209-12M%2C%2012-18M.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/a/o/ao-gile-so-sinh-nhung-be-gai-kidsplaza-nd21d-hong-1_1.jpg', b'0', 'Áo gile sơ sinh nhung bé gái', 49500, NULL, 10),
(50, '2020-12-18 01:02:28', 'S%E1%BA%A3n%20ph%E1%BA%A9m%20d%C3%A0nh%20cho%20c%C3%A1c%20b%C3%A9%20trai%20t%E1%BB%AB%203-18%20th%C3%A1ng', 'H%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20%3E30%20%C4%91%E1%BB%99%0A%0AN%C3%AAn%20%E1%BB%A7i%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%20ph%C3%B9%20h%E1%BB%A3p%20cho%20b%C3%A9%20t%E1%BB%AB%200-6%20th%C3%A1ng%20tu%E1%BB%95i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%3A%200-3M%2C%203-6M%0A%0ATh%C3%A0nh%20ph%E1%BA%A7n%3A%2095%25%20bamboo%2C%205%25%20spandex%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0AC%E1%BA%A3nh%20b%C3%A1o%3A%20S%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20ch%C3%A1y%0A%0AN%C4%83m%20s%E1%BA%A3n%20xu%E1%BA%A5t%3A%202021%0A%0AS%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0AH%C3%A3y%20%C4%91%E1%BB%83%20kidsPlaza%20l%C3%A0%20s%E1%BB%B1%20l%E1%BB%B1a%20ch%E1%BB%8Dn%20ho%C3%A0n%20h%E1%BA%A3o%20cho%20M%E1%BA%B9%20b%E1%BA%A7u%20v%C3%A0%20Em%20b%C3%A9!', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-xanh-1.jpg\n', b'0', 'Bộ quần áo bé trai dài tay cài giữa Otis', 99500, NULL, 3),
(51, '2020-12-18 01:02:28', 'Thi%E1%BA%BFt%20k%E1%BA%BF%20xinh%20x%E1%BA%AFn%2C%20nhi%E1%BB%81u%20m%C3%A0u%20s%E1%BA%AFc', 'H%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20%3E30%20%C4%91%E1%BB%99%0A%0AN%C3%AAn%20%E1%BB%A7i%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%20ph%C3%B9%20h%E1%BB%A3p%20cho%20b%C3%A9%20t%E1%BB%AB%200-6%20th%C3%A1ng%20tu%E1%BB%95i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%3A%200-3M%2C%203-6M%0A%0ATh%C3%A0nh%20ph%E1%BA%A7n%3A%2095%25%20bamboo%2C%205%25%20spandex%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0AC%E1%BA%A3nh%20b%C3%A1o%3A%20S%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20ch%C3%A1y%0A%0AN%C4%83m%20s%E1%BA%A3n%20xu%E1%BA%A5t%3A%202021%0A%0AS%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0AH%C3%A3y%20%C4%91%E1%BB%83%20kidsPlaza%20l%C3%A0%20s%E1%BB%B1%20l%E1%BB%B1a%20ch%E1%BB%8Dn%20ho%C3%A0n%20h%E1%BA%A3o%20cho%20M%E1%BA%B9%20b%E1%BA%A7u%20v%C3%A0%20Em%20b%C3%A9!', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-do-so-sinh-combo-6-mon-bamboo-in-hinh-gau-kidsplaza-m21h-trang-ghi-1.jpg\n', b'0', 'Set đồ sơ sinh combo 6 món bamboo in hình gấu', 209300, NULL, 2),
(52, '2020-12-18 01:02:28', 'Ki%E1%BB%83u%20d%C3%A1ng%20tay%20d%C3%A0i%20v%C3%A0%20qu%E1%BA%A7n%20d%C3%A0i%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20cho%20b%C3%A9%20m%E1%BA%B7c%20khi%20n%E1%BA%B1m%20%C4%91i%E1%BB%81u%20h%C3%B2a%20v%C3%A0o%20ban%20%C4%91%C3%AAm.', 'Th%C3%B4ng%20tin%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0AXu%E1%BA%A5t%20x%E1%BB%A9%3A%20Vi%E1%BB%87t%20Nam%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2040%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%0ASize%3A%200-3M%2C%203-6M%20v%C3%A0%206-9M', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/body-so-sinh-dai-tay-kidsplaza-yem-in-o-to-hn21t-trang-xanh-1.jpg\n', b'0', 'Body sơ sinh dài tay KidsPlaza yếm in Ô Tô', 104500, NULL, 2),
(53, '2020-12-18 01:02:28', 'Set%20qu%E1%BA%A7n%20%C3%A1o%20s%C6%A1%20sinh%20s%E1%BB%A3i%20tre%20KidsPlaza%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%20cao%20c%E1%BA%A5p%2095%25%20bamboo%2C%205%25%20spandex', 'H%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%0A%0A%20Kh%C3%B4ng%20gi%E1%BA%B7t%20v%E1%BB%9Bi%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20qu%C3%A1%2040%20%C4%91%E1%BB%99%20C%0A%0A%20Kh%C3%B4ng%20gi%E1%BA%B7t%20v%E1%BB%9Bi%20ch%E1%BA%A5t%20t%E1%BA%A9y%20m%E1%BA%A1nh%0A%0A%20C%C3%B3%20th%E1%BB%83%20s%E1%BA%A5y%20%E1%BB%9F%20nhi%E1%BB%87t%20%C4%91%E1%BB%99%20trung%20b%C3%ACnh%0A%0A%20L%C3%A0%2C%20%E1%BB%A7i%20s%E1%BA%A3n%20ph%E1%BA%A9m%20v%E1%BB%9Bi%20nhi%E1%BB%87t%20%C4%91%E1%BB%99%20trung%20b%C3%ACnh%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0AS%E1%BA%A3n%20xu%E1%BA%A5t%3A%20t%E1%BA%A1i%20Vi%E1%BB%87t%20Nam%0A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20100%25%20cotton%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20S%E1%BA%A3n%20ph%E1%BA%A9m%20c%C3%B3%20%C4%91%E1%BB%A7%20size%20cho%20b%C3%A9%20t%E1%BB%AB%206%20th%C3%A1ng%20tu%E1%BB%95i%20%C4%91%E1%BA%BFn%204%20tu%E1%BB%95i%0A%0AC%E1%BA%A3nh%20b%C3%A1o%3A%20s%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20ch%C3%A1y%0A%0AN%C4%83m%20s%E1%BA%A3n%20xu%E1%BA%A5t%3A%202021%0A', 10, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-dai-tay-be-trai-phoi-cun-kidsplaza-m21t-trang-1_6.jpg\n', b'0', 'Bộ quần áo dài tay bé trai phối cún', 109000, NULL, 2),
(54, '2020-12-18 01:02:28', 'Ch%E1%BA%A5t%20li%E1%BB%87u%3A%2095%25%20cotton%2C%205%25%20spandex%20si%C3%AAu%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20si%C3%AAu%20co%20gi%C3%A3n%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%2C%20kh%C3%A1ng%20khu%E1%BA%A9n%20t%E1%BB%B1%20nhi%C3%AAn%20an%20to%C3%A0n%2C%20th%C3%A2n%20thi%E1%BB%87n%20v%E1%BB%9Bi%20da%20c%E1%BB%A7a%20tr%E1%BA%BB.', 'L%C3%A0%20m%E1%BA%ABu%20qu%E1%BA%A7n%20%C3%A1o%20s%C6%A1%20sinh%20thu%20%C4%91%C3%B4ng%20d%C3%A0i%20tay%20d%C3%A0y%20d%E1%BA%B7n%20gi%E1%BB%AF%20%E1%BA%A5m%20cho%20c%C6%A1%20th%E1%BB%83%20b%C3%A9%20y%C3%AAu%20m%E1%BB%97i%20ng%C3%A0y%0A%0A%C3%81o%20thi%E1%BA%BFt%20k%E1%BA%BF%20c%C3%BAc%20gi%E1%BB%AFa%20ti%E1%BB%87n%20l%E1%BB%A3i%20gi%C3%BAp%20m%E1%BA%B9%20d%E1%BB%85%20d%C3%A0ng%20thay%20m%E1%BA%B7c%20%C3%A1o%20m%C3%A0%20kh%C3%B4ng%20g%C3%A2y%20c%E1%BA%A3m%20gi%C3%A1c%20kh%C3%B3%20ch%E1%BB%8Bu%0AQu%E1%BA%A7n%20chun%20m%E1%BB%81m%20co%20gi%C3%A3n%2C%20kh%C3%B4ng%20g%C3%A2y%20in%20h%E1%BA%B1n%20da%20c%E1%BB%A7a%20tr%E1%BA%BB%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20thi%E1%BA%BFt%20k%E1%BA%BF%20bo%20%E1%BB%91ng%20v%E1%BB%ABa%20tr%C3%A1nh%20kh%C3%B4ng%20kh%C3%AD%20l%E1%BA%A1nh%20lu%E1%BB%93n%20v%C3%A0o%20c%C6%A1%20th%E1%BB%83%20v%E1%BB%ABa%20gi%C3%BAp%20b%C3%A9%20d%E1%BB%85%20d%C3%A0ng%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng%20m%C3%A0%20kh%C3%B4ng%20g%C3%A2y%20v%C6%B0%E1%BB%9Bng%20v%C3%ADu%2C%20kh%C3%B3%20ch%E1%BB%8Bu%0AB%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20c%C3%B3%206%20size%20ph%C3%B9%20h%E1%BB%A3p%20v%E1%BB%9Bi%20b%C3%A9%20t%E1%BB%AB%200-24%20th%C3%A1ng%20tu%E1%BB%95i%20(0-3M%2C%203-6M%2C%206-9M%2C%209-12M%2C%2012-18M%2C%2018-24M)%0A%0AC%C3%B3%205%20m%C3%A0u%20s%E1%BA%AFc%20kh%C3%A1c%20nhau%20cho%20m%E1%BA%B9%20c%C3%B3%20th%C3%AAm%20l%E1%BB%B1a%20ch%E1%BB%8Dn%20t%C3%B9y%20theo%20gi%E1%BB%9Bi%20t%C3%ADnh%20ho%E1%BA%B7c%20s%E1%BB%9F%20th%C3%ADch', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-so-sinh-dai-tay-cai-vai-kidsplaza-m21t-vang-1.jpg', b'0', 'Bộ quần áo sơ sinh dài tay cài vai', 79500, NULL, 12),
(55, '2020-12-18 01:02:28', 'Ch%E1%BA%A5t%20li%E1%BB%87u%3A%20B%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20b%C3%A9%20trai%20k%E1%BA%BB%20ph%E1%BB%91i%20c%C3%BAn%20KidsPlaza%20M21T%20(Tr%E1%BA%AFng)%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%20100%25%20cotton%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20th%E1%BA%A5m%20m%E1%BB%93%20h%C3%B4i%20t%E1%BB%91t%20v%C3%A0%20an%20to%C3%A0n%20tuy%E1%BB%87t%20%C4%91%E1%BB%91i%20v%E1%BB%9Bi%20l%C3%A0n%20da%20nh%E1%BA%A1y%20c%E1%BA%A3m%20c%E1%BB%A7a%20tr%E1%BA%BB.', 'Th%C3%B4ng%20tin%20chi%20ti%E1%BA%BFt%3A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20100%25%20cotton%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0A%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20g%C3%A1i%20t%E1%BB%AB%206%20th%C3%A1ng%20tu%E1%BB%95i%20%C4%91%E1%BA%BFn%203%20tu%E1%BB%95i.%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%206-9M%2C%209-12M%2C%2012-18M%2C%2018-24M%2C%203Y.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AN%C4%83m%20s%E1%BA%A3n%20xu%E1%BA%A5t%3A%202021', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-gai-dai-tay-cai-vai-otis-kidsplaza-nd21t-trang-hong-1.jpg', b'0', 'Bộ quần áo bé gái dài tay cài vai Otis', 99500, NULL, 12),
(56, '2020-12-18 01:02:28', 'B%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20s%C6%A1%20sinh%20d%C3%A0i%20c%C3%A0i%20gi%E1%BB%AFa%20KidsPlaza%20M21T%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%2095%25%20bamboo%205%25%20spandex%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20co%20gi%C3%A3n%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20t%E1%BB%91t%2C%20d%E1%BB%85%20ch%E1%BB%8Bu%20khi%20m%E1%BA%B7c%20l%C3%A2u', 'Th%C3%B4ng%20tin%20chi%20ti%E1%BA%BFt%3A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20100%25%20cotton%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0A%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20g%C3%A1i%20t%E1%BB%AB%206%20th%C3%A1ng%20tu%E1%BB%95i%20%C4%91%E1%BA%BFn%203%20tu%E1%BB%95i.%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%206-9M%2C%209-12M%2C%2012-18M%2C%2018-24M%2C%203Y.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AN%C4%83m%20s%E1%BA%A3n%20xu%E1%BA%A5t%3A%202021', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-vai-otis-kidsplaza-nd21t-trang-xanh-1.jpg\n', b'0', 'Bộ quần áo bé trai dài tay cài vai Otis', 99500, NULL, 2),
(57, '2020-12-18 01:02:28', 'B%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20s%C6%A1%20sinh%20cho%20b%C3%A9%20trai%20d%C3%A0i%20tay%20c%C3%A0i%20vai%20Otis%20KidsPlaza%20ND21T%2C%20t%E1%BB%AB%20m%C3%A0u%20s%E1%BA%AFc%20%C4%91%E1%BA%BFn%20c%C3%A1c%20h%E1%BB%8Da%20ti%E1%BA%BFt%20v%C3%A0%20v%E1%BA%A3i%20%C4%91%E1%BB%81u%20cao%20c%E1%BA%A5p.', '%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20d%C3%A0nh%20cho%20b%C3%A9%20t%E1%BB%AB%20s%C6%A1%20sinh%20%C4%91%E1%BA%BFn%2012%20th%C3%A1ng%20tu%E1%BB%95i%20%0A%0ATh%C3%B4ng%20tin%20chi%20ti%E1%BA%BFt%3A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20100%25%20cotton%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0A%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20g%C3%A1i%20t%E1%BB%AB%200%20%C4%91%E1%BA%BFn%2012%20th%C3%A1ng%20tu%E1%BB%95i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%200-3M%2C%203-6M%2C%206-9M%2C%209-12M.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AN%C4%83m%20s%E1%BA%A3n%20xu%E1%BA%A5t%3A%202021', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-gai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-hong-1.jpg\n', b'0', 'Bộ quần áo bé gái dài tay cài giữa Otis', 99500, NULL, 12);
INSERT INTO `product` (`id`, `day_update`, `description`, `description_detail`, `discount`, `image`, `is_delete`, `name`, `price`, `status`, `idcategorydetail`) VALUES
(58, '2020-12-18 01:02:28', 'B%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20s%C6%A1%20sinh%20cho%20b%C3%A9%20trai%20d%C3%A0i%20tay%20c%C3%A0i%20gi%E1%BB%AFa%20Otis%20KidsPlaza%20ND21T%2C%20t%E1%BB%AB%20m%C3%A0u%20s%E1%BA%AFc%20%C4%91%E1%BA%BFn%20c%C3%A1c%20h%E1%BB%8Da%20ti%E1%BA%BFt%20v%C3%A0%20v%E1%BA%A3i%20%C4%91%E1%BB%81u%20cao%20c%E1%BA%A5p.', '%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20d%C3%A0nh%20cho%20b%C3%A9%20t%E1%BB%AB%20s%C6%A1%20sinh%20%C4%91%E1%BA%BFn%2012%20th%C3%A1ng%20tu%E1%BB%95i%20%0A%0ATh%C3%B4ng%20tin%20chi%20ti%E1%BA%BFt%3A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20100%25%20cotton%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0A%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20g%C3%A1i%20t%E1%BB%AB%200%20%C4%91%E1%BA%BFn%2012%20th%C3%A1ng%20tu%E1%BB%95i%20.%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%200-3M%2C%203-6M%2C%206-9M%2C%209-12M.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AN%C4%83m%20s%E1%BA%A3n%20xu%E1%BA%A5t%3A%202021', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/bo-quan-ao-be-trai-dai-tay-cai-giua-otis-kidsplaza-nd21t-trang-vang-1.jpg\n', b'0', 'Bộ quần áo bé trai dài tay cài giữa Otis', 99500, NULL, 2),
(59, '2020-12-18 01:02:28', 'Ki%E1%BB%83u%20d%C3%A1ng%20tay%20d%C3%A0i%20v%C3%A0%20qu%E1%BA%A7n%20d%C3%A0i%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20cho%20b%C3%A9%20m%E1%BA%B7c%20khi%20n%E1%BA%B1m%20%C4%91i%E1%BB%81u%20h%C3%B2a%20v%C3%A0o%20ban%20%C4%91%C3%AAm..', 'Th%C3%B4ng%20tin%20chi%20ti%E1%BA%BFt%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20100%25%20cotton%0A%0A%C4%90%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%20D%C3%A0nh%20cho%20b%C3%A9%20g%C3%A1i%20t%E1%BB%AB%200%20%C4%91%E1%BA%BFn%206%20th%C3%A1ng%20tu%E1%BB%95i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%3A%20c%C3%B3%20%C4%91%E1%BB%A7%20c%C3%A1c%20size%20cho%20b%C3%A9%20y%C3%AAu%200-3M%2C%203-6M.%0A%0AB%E1%BA%A3o%20qu%E1%BA%A3n%20s%E1%BA%A3n%20ph%E1%BA%A9m%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20n%C3%AAn%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20m%C3%A1y%20gi%E1%BA%B7t%2C%20n%C3%AAn%20gi%E1%BA%B7t%20tay%20%C4%91%E1%BB%83%20gi%E1%BB%AF%20%C4%91%E1%BB%99%20b%E1%BB%81n%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2030%C2%B0C%0A%0AN%C3%AAn%20%E1%BB%A7i%2Fl%C3%A0%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/body-be-gai-dai-tay-cai-cheo-kidsplaza-nd21d-hong-1.jpg\n', b'0', 'Body bé gái dài tay cài chéo ', 39500, NULL, 12),
(60, '2020-12-18 01:02:28', 'Ch%E1%BA%A5t%20li%E1%BB%87u%3A%20100%25%20cotton%20nhung%20si%C3%AAu%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20si%C3%AAu%20co%20gi%C3%A3n%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%2C%20kh%C3%A1ng%20khu%E1%BA%A9n%20t%E1%BB%B1%20nhi%C3%AAn%20an%20to%C3%A0n%20v%E1%BB%9Bi%20da%20c%E1%BB%A7a%20tr%E1%BA%BB%0A%0A', 'Body%20c%C3%A0i%20gi%E1%BB%AFa%20tay%20d%C3%A0i%20KidsPlaza%20in%20G%E1%BA%A5u%20M21T%20(Tr%E1%BA%AFng%20H%E1%BB%93ng)%20thi%E1%BA%BFt%20k%E1%BA%BF%20ph%C3%B9%20h%E1%BB%A3p%20v%E1%BB%9Bi%20tr%E1%BA%BB%20t%E1%BB%AB%200-9%20th%C3%A1ng%20tu%E1%BB%95i%20v%E1%BB%9Bi%203%20size%20t%C6%B0%C6%A1ng%20%E1%BB%A9ng%20(0-3M%2C%203-6M%20v%C3%A0%206-9M)%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0AS%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%20Vi%E1%BB%87t%20Nam%0A%0AH%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20tr%C3%AAn%2040%20%C4%91%E1%BB%99%20C%0A%0AN%C3%AAn%20%E1%BB%A7i%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/b/o/body-cai-giua-tay-dai-kidsplaza-in-hinh-gau-m21t-trang-hong-1.jpg\n', b'0', 'Body cài giữa tay dài in hình gấu', 133000, NULL, 12),
(61, '2020-12-18 01:02:28', '%20%C4%91%C6%B0%E1%BB%A3c%20may%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%20v%E1%BA%A3i%20100%25%20cotton%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20b%E1%BB%99%20qu%E1%BA%A7n%20%C3%A1o%20c%C3%B3%20in%20nhi%E1%BB%81u%20h%E1%BB%8Da%20ti%E1%BA%BFt%20h%C3%ACnh%20g%E1%BA%A5u%20xinh%20x%E1%BA%AFn%20tr%C3%AAn%20gam%20m%C3%A0u%20t%C6%B0%C6%A1i%20s%C3%A1ng%2C%20ki%E1%BB%83u%20qu%E1%BA%A7n%20d%C3%A0i%20%C3%A1o%20tay%20d%C3%A0i%20n%C3%AAn%20ph%C3%B9%20h%E1%BB%A3p%20%C4%91%E1%BB%83%20b%C3%A9%20m%E1%BA%B7c%20v%C3%A0o%20ti%E1%BA%BFt%20tr%E1%BB%9Di%20Thu%20%C4%90%C3%B4ng%20ho%E1%BA%B7c%20khi%20n%E1%BA%B1m%20ng%E1%BB%A7%20%C4%91i%E1%BB%81u%20h%C3%B2a%2C%20ph%C3%B9%20h%E1%BB%A3p%20cho%20c%C3%A1c%20b%C3%A9%20t%E1%BB%AB%20s%C6%A1%20sinh%20tr%E1%BB%9F%20l%C3%AAn.', 'Thi%E1%BA%BFt%20k%E1%BA%BF%3A%0A%0AM%C5%A9%20%C4%91%C6%B0%E1%BB%A3c%20thi%E1%BA%BFt%20k%E1%BA%BF%20c%E1%BB%A5c%20b%C3%B4ng%20tr%C3%B2n%20xinh%20x%E1%BA%AFn%20tr%C3%AAn%20%C4%91%E1%BB%89nh%20m%C5%A9%20mang%20n%C3%A9t%20%C4%91%C3%A1ng%20y%C3%AAu%2C%20l%C3%B4i%20cu%E1%BB%91n%20ri%C3%AAng%20cho%20s%E1%BA%A3n%20ph%E1%BA%A9m%20c%C5%A9ng%20nh%C6%B0%20t%C3%B4n%20l%C3%AAn%20n%C3%A9t%20d%E1%BB%85%20th%C6%B0%C6%A1ng%20cho%20b%C3%A9%0A%0AM%C5%A9%20len%20co%20gi%C3%A3n%2C%20tho%C3%A1ng%20m%C3%A1t%2C%20mang%20%C4%91%E1%BA%BFn%20s%E1%BB%B1%20tho%E1%BA%A3i%20m%C3%A1i%2C%20d%E1%BB%85%20ch%E1%BB%8Bu%20khi%20ngay%20c%E1%BA%A3%20khi%20b%C3%A9%20%C4%91%E1%BB%99i%20m%C5%A9%20l%C3%A2u%0A%0AD%C6%B0%E1%BB%9Bi%20m%C5%A9%20%C4%91%C6%B0%E1%BB%A3c%20th%C3%AAu%20d%E1%BB%87t%20ch%E1%BA%AFc%20ch%E1%BA%AFn%2C%20ho%C3%A0n%20to%C3%A0n%20kh%C3%B4ng%20lo%20len%20b%E1%BB%8B%20tu%E1%BB%99t%20khi%20b%C3%A9%20v%E1%BA%ADn%20%C4%91%E1%BB%99ng%20c%C5%A9ng%20nh%C6%B0%20mang%20%C4%91%E1%BA%BFn%20s%E1%BB%B1%20%E1%BA%A5m%20%C3%A1p%20cho%20b%C3%A9%20m%E1%BB%97i%20ng%C3%A0y%0A%0AS%E1%BA%A3n%20xu%E1%BA%A5t%3A%20t%E1%BA%A1i%20Vi%E1%BB%87t%20Nam', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-kidsplaza-ba21-vang-1.jpg\n', b'0', 'Set 2 mũ sơ sinh cotton', 28800, NULL, 18),
(62, '2020-12-18 01:02:28', 'Body%20li%E1%BB%81n%20100%25%20cotton%20nhung%20k%E1%BA%BB%20s%E1%BB%8Dc%20ngang%20tr%E1%BA%BB%20em%20n%E1%BB%95i%20b%E1%BA%ADt%20v%E1%BB%9Bi%20ch%E1%BA%A5t%20v%E1%BA%A3i%20nhung%20m%E1%BB%81m%20m%E1%BA%A1i%20v%C3%A0%20h%E1%BB%8Da%20ti%E1%BA%BFt%20k%E1%BA%BB%20s%E1%BB%8Dc%20th%C3%AAu%20h%C3%ACnh%20ch%C3%BA%20voi%20con%20Hello%20Baby%20xinh%20x%E1%BA%AFn%2C%20mang%20m%C3%A0u%20s%E1%BA%AFc%20tr%E1%BA%BB%20th%C6%A1.%20S%E1%BA%A3n%20ph%E1%BA%A9m%20gi%C3%BAp%20gi%E1%BB%AF%20%E1%BA%A5m%20cho%20b%C3%A9%20t%E1%BB%91t%20h%C6%A1n%20%C4%91%E1%BA%B7c%20bi%E1%BB%87t%20l%C3%A0%20khi%20b%C3%A9%20ng%E1%BB%A7%20hay%20%C4%91i%20ra%20ngo%C3%A0i%2C%20m%E1%BA%B9%20kh%C3%B4ng%20ph%E1%BA%A3i%20lo%20l%E1%BA%AFng%20b%C3%A9%20%C4%91%E1%BA%A1p%20b%E1%BB%8B%20h%E1%BB%9F%20b%E1%BB%A5ng.', 'Th%C3%A0nh%20ph%E1%BA%A7n%20ch%E1%BA%A5t%20li%E1%BB%87u%3A%2095%25%20cotton%2C%205%25%20spandex%0A%0AH%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20%3E40%20%C4%91%E1%BB%99%0A%0AN%C3%AAn%20%E1%BB%A7i%20m%E1%BA%B7t%20tr%C3%A1i%20c%E1%BB%A7a%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AC%E1%BA%A3nh%20b%C3%A1o%3A%20s%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20ch%C3%A1y%0A%0AN%C4%83m%20s%E1%BA%A3n%20xu%E1%BA%A5t%3A%20in%20tr%C3%AAn%20bao%20b%C3%AC%0A%0AS%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-so-sinh-be-trai-otis-i-love-jungles-kidsplaza-nd21t-trang-vang-1.jpg\n', b'0', 'Mũ sơ sinh bé trai Otis i love jungles', 39500, NULL, 19),
(63, '2020-12-18 01:02:28', '%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%20100%25%20cotton%20cao%20c%E1%BA%A5p%2C%20si%C3%AAu%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20si%C3%AAu%20co%20gi%C3%A3n%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%2C%20kh%C3%A1ng%20khu%E1%BA%A9n%20t%E1%BB%B1%20nhi%C3%AAn%20an%20to%C3%A0n%2C%20th%C3%A2n%20thi%E1%BB%87n%20v%E1%BB%9Bi%20da%20nh%E1%BA%A1y%20c%E1%BA%A3m%20c%E1%BB%A7a%20tr%E1%BA%BB.', 'Th%C3%A0nh%20ph%E1%BA%A7n%3A%2095%25%20cotton%2C%205%25%20spandex%0AH%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20v%E1%BB%9Bi%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20%3E30%20%C4%91%E1%BB%99%20C%0A%0AN%C3%AAu%20%E1%BB%A7i%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0AC%E1%BA%A3nh%20b%C3%A1o%3A%20S%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20ch%C3%A1y.%0A%0AS%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%3A%20Vi%E1%BB%87t%20Nam', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-ho-chop-kidsplaza-hn21h-hong-1.jpg\n', b'0', 'Mũ hở chóp', 600000, NULL, 19),
(64, '2020-12-18 01:02:28', 'M%C5%A9%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%20len%20d%E1%BB%87t%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20%E1%BA%A5m%20%C3%A1p%2C%20ho%C3%A0n%20to%C3%A0n%20kh%C3%B4ng%20g%C3%A2y%20k%C3%ADch%20%E1%BB%A9ng%20l%C3%AAn%20da%20c%E1%BB%A7a%20b%C3%A9%20m%E1%BB%97i%20khi%20%C4%91%E1%BB%99i', 'K%C3%ADch%20th%C6%B0%E1%BB%9Bc%3A%207%2C5%20x%205%20cm%0A%0A%C4%90%C3%B3ng%20g%C3%B3i%3A%202%20chi%E1%BA%BFc%2Fset%0A%0AH%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20%3E%2040C%0A%0AN%C3%AAn%20%E1%BB%A7i%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%20d%C3%A0nh%20cho%20b%C3%A9%20s%C6%A1%20sinh%20t%E1%BB%AB%200-3M%0A%0AXu%E1%BA%A5t%20x%E1%BB%A9%3A%20Trung%20Qu%E1%BB%91c%0A%0AC%E1%BA%A3nh%20b%C3%A1o%3A%20tr%C3%A1nh%20xa%20l%E1%BB%ADa', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-mu-so-sinh-cotton-mothes-choice-tia-chop-1.jpg\n', b'0', 'Set 2 mũ sơ sinh cotton', 49000, NULL, 19),
(65, '2020-12-18 01:02:28', 'M%C5%A9%20s%C6%A1%20sinh%20h%E1%BB%9F%20ch%C3%B3p%20l%C3%A0%20s%E1%BA%A3n%20ph%E1%BA%A9m%20kh%C3%B4ng%20th%E1%BB%83%20thi%E1%BA%BFu%20trong%20t%E1%BB%A7%20%C4%91%E1%BB%93%20s%C6%A1%20sinh%20c%E1%BB%A7a%20b%C3%A9%2C%20h%E1%BB%97%20tr%E1%BB%A3%20b%E1%BB%91%20m%E1%BA%B9%20b%E1%BA%A3o%20v%E1%BB%87%20b%C3%A9%20t%E1%BB%91i%20%C4%91a%20trong%20ho%E1%BA%A1t%20%C4%91%E1%BB%99ng%20sinh%20ho%E1%BA%A1t%20h%C3%A0ng%20ng%C3%A0y.%20%C4%90%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%20cotton%20c%C3%B3%20%C4%91%E1%BB%99%20co%20gi%C3%A3n%20v%E1%BB%ABa%20ph%E1%BA%A3i%20c%C3%B9ng%20kh%E1%BA%A3%20n%C4%83ng%20th%E1%BA%A5m%20h%C3%BAt%20cao%2C%20m%C5%A9%20kh%C3%B4ng%20ch%E1%BB%89%20b%E1%BA%A3o%20v%E1%BB%87%20b%C3%A9%20kh%E1%BB%8Fi%20t%C3%A1c%20%C4%91%E1%BB%99ng%20x%E1%BA%A5u%20t%E1%BB%AB%20m%C3%B4i%20tr%C6%B0%E1%BB%9Dng%20m%C3%A0%20c%C3%B2n%20mang%20%C4%91%E1%BA%BFn%20c%E1%BA%A3m%20gi%C3%A1c%20tho%E1%BA%A3i%20m%C3%A1i%20trong%20t%E1%BB%ABng%20c%E1%BB%AD%20%C4%91%E1%BB%99ng.%20M%C3%A0u%20s%E1%BA%AFc%20t%C6%B0%C6%A1i%20s%C3%A1ng%2C%20m%C5%A9%20ph%C3%B9%20h%E1%BB%A3p%20cho%20tr%E1%BA%BB%20t%E1%BB%AB%20s%C6%A1%20sinh.%0A%0A', 'Ch%E1%BA%A5t%20li%E1%BB%87u%3A%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20t%E1%BB%AB%20ch%E1%BA%A5t%20li%E1%BB%87u%2065%25%20cotton%2035%25%20polyester%20an%20to%C3%A0n%2C%20cotton%20m%E1%BB%81m%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20t%E1%BB%91t%2C%20tho%E1%BA%A3i%20m%C3%A1i%20khi%20%C4%91%E1%BB%99i%2C%20h%C3%A0i%20l%C3%B2ng%20h%C6%A1n%20cho%20m%E1%BB%8Di%20b%C3%A0%20m%E1%BA%B9.%0A%0AKi%E1%BB%83u%20d%C3%A1ng%3A%20m%C5%A9%20thi%E1%BA%BFt%20k%E1%BA%BF%20ph%E1%BA%A7n%20d%C3%A2y%20quai%20b%C3%AAn%20trong%20l%C3%B2ng%20m%C5%A9%2C%20c%C3%B3%20ch%E1%BB%91t%20kh%C3%B3a%20gi%C3%BAp%20m%E1%BA%B9%20d%E1%BB%85%20d%C3%A0ng%20%C4%91i%E1%BB%81u%20ch%E1%BB%89nh%20%C4%91%E1%BB%99%20r%E1%BB%99ng%20ph%C3%B9%20h%E1%BB%A3p%20cho%20b%C3%A9.%0A%0AThi%E1%BA%BFt%20k%E1%BA%BF%20ph%E1%BB%A7%20v%E1%BA%A3i%20voan%20b%E1%BA%A3o%20v%E1%BB%87%20khu%C3%B4n%20m%E1%BA%B7t%20cho%20b%C3%A9%2C%20tr%C3%A1nh%20b%E1%BB%A5i%2C%20gi%C3%B3.%0A%0AH%E1%BB%8Da%20ti%E1%BA%BFt%3A%20th%C3%AAu%20h%C3%ACnh%20hoa%20xinh%20x%E1%BA%AFn%2C%20th%C3%AAm%20ph%E1%BA%A7n%20n%C6%A1%20c%C3%A1ch%20%C4%91i%E1%BB%87u%20ph%C3%ADa%20sau%20m%C5%A9%20gi%C3%BAp%20b%C3%A9%20y%C3%AAu%20th%C3%AAm%20ph%E1%BA%A7n%20%C4%91%C3%A1ng%20y%C3%AAu.%0A%0AM%C3%A0u%20s%E1%BA%AFc%3A%20M%C5%A9%20c%C3%B3%203%20m%C3%A0u%3A%20h%E1%BB%93ng%2C%20h%E1%BB%93ng%20cam%2C%20cam%20%C4%91%E1%BA%A5t%20gi%C3%BAp%20m%E1%BA%B9%20c%C3%B3%20th%C3%AAm%20nhi%E1%BB%81u%20l%E1%BB%B1a%20ch%E1%BB%8Dn%20ph%C3%B9%20h%E1%BB%A3p%20v%E1%BB%9Bi%20trang%20ph%E1%BB%A5c%20c%E1%BB%A7a%20b%C3%A9.%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%20M%C5%A9%20v%C3%A0nh%20b%C3%A9%20g%C3%A1i%20KidsPlaza%20ph%E1%BB%A7%20voan%20th%C3%AAu%20hoa%20DN21%20s%E1%BB%AD%20d%E1%BB%A5ng%20cho%20b%C3%A9%20t%E1%BB%AB%200-12%20th%C3%A1ng%20tu%E1%BB%95i.%0A%0AXu%E1%BA%A5t%20x%E1%BB%A9%3A%20S%E1%BA%A3n%20ph%E1%BA%A9m%20l%C3%A0%20th%C6%B0%C6%A1ng%20hi%E1%BB%87u%20c%E1%BB%A7a%20KidsPlaza%20%C4%91%C6%B0%E1%BB%A3c%20s%E1%BA%A3n%20xu%E1%BA%A5t%20t%E1%BA%A1i%20Vi%E1%BB%87t%20Nam.%0A%0AH%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%0A%0A%20-%20Kh%C3%B4ng%20%E1%BB%A7i%2C%20kh%C3%B4ng%20gi%E1%BA%B7t%20m%C3%A1y%2C%20kh%C3%B4ng%20s%E1%BB%AD%20d%E1%BB%A5ng%20ch%E1%BA%A5t%20t%E1%BA%A9y%2C%20kh%C3%B4ng%20v%E1%BA%AFt%20xo%E1%BA%AFn%20s%E1%BA%A5y%20kh%C3%B4.%0A%0A-%20Tr%C3%A1nh%20ti%E1%BA%BFp%20x%C3%BAc%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20v%E1%BB%9Bi%20n%C6%B0%E1%BB%9Bc%20l%C3%A2u%20ho%E1%BA%B7c%20%C4%91%E1%BB%83%20trong%20m%C3%B4i%20tr%C6%B0%E1%BB%9Dng%20%E1%BA%A9m%20th%E1%BA%A5p%20-%20Tr%C3%A1nh%20s%E1%BB%AD%20d%E1%BB%A5ng%20c%C3%A1c%20v%E1%BA%ADt%20nh%E1%BB%8Dn%20v%E1%BB%9Bi%20m%C5%A9%20v%C3%AC%20d%E1%BB%85%20g%C3%A2y%20r%C3%A1ch.', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/m/u/mu-ho-chop-kidsplaza-hn21h-hong-1.jpg\n', b'0', 'Mũ hở chóp', 54000, NULL, 19),
(66, '2021-12-21 16:16:40', '%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20%0A50%25%0A10%0AD29%0A%0AV%E1%BB%9Bi%20th%E1%BB%9Di%20ti%E1%BA%BFt%20n%E1%BA%AFng%20n%C3%B3ng%20hay%20l%E1%BA%A1nh%20th%C3%AC%20tr%E1%BA%BB%20%C4%91%E1%BB%81u%20c%E1%BA%A7n%20ph%E1%BA%A3i%20%C4%91%E1%BB%99i%20m%C5%A9%2C%20nh%E1%BA%A5t%20l%C3%A0%20khi%20ba%20m%E1%BA%B9%20cho%20tr%E1%BA%BB%20%C4%91i%20ra%20ngo%C3%A0i%20%C4%91%C6%B0%E1%BB%9Dng%2C%20chi%E1%BA%BFc%20m%C5%A9%20ch%C3%ADnh%20l%C3%A0%20th%E1%BB%A9%20gi%C3%BAp%20che%20n%E1%BA%AFng%20v%C3%A0%20c%C5%A9ng%20nh%C6%B0%20c%E1%BA%A3n%20gi%C3%B3%20l%E1%BA%A1nh%20%C4%91%E1%BA%A3m%20b%E1%BA%A3o%20cho%20v%C3%B9ng%20%C4%91%E1%BA%A7u%20non%20n%E1%BB%9Bt%20c%E1%BB%A7a%20c%C3%A1c%20em%20%C4%91%C6%B0%E1%BB%A3c%20b%E1%BA%A3o%20v%E1%BB%87%20t%E1%BB%91t%20nh%E1%BA%A5t.%20V%C3%A0o%20nh%E1%BB%AFng%20ng%C3%A0y%20tr%E1%BB%9Di%20n%E1%BA%AFng%2C%20khi%20%C4%91i%20ra%20ngo%C3%A0i%20tr%E1%BA%BB%20c%C5%A9ng%20r%E1%BA%A5t%20d%E1%BB%85%20b%E1%BB%8B%20%C3%A1nh%20n%E1%BA%AFng%20chi%E1%BA%BFu%20v%C3%A0o%20m%E1%BA%B7t%20%C4%91i%E1%BB%81u%20n%C3%A0y%20s%E1%BA%BD%20g%C3%A2y%20t%E1%BB%95n%20th%C6%B0%C6%A1ng%20cho%20%C4%91%C3%B4i%20m%E1%BA%AFt%20c%E1%BB%A7a%20b%C3%A9%20%C4%91i%E1%BB%81u%20n%C3%A0y%20th%E1%BA%ADt%20s%E1%BB%B1%20kh%C3%B4ng%20t%E1%BB%91t%20v%C3%A0%20ch%C3%ADnh%20nh%E1%BB%AFng%20chi%E1%BA%BFc%20m%C5%A9%20nh%E1%BB%8F%20nh%E1%BA%AFn%2C%20xinh%20x%E1%BA%AFn%20kia%20s%E1%BA%BD%20l%C3%A0%20gi%E1%BA%A3i%20ph%C3%A1p%20ho%C3%A0n%20h%E1%BA%A3o%20%C4%91%E1%BB%83%20kh%E1%BA%AFc%20ph%E1%BB%A5c%20l%E1%BA%A1i%20%C4%91i%E1%BB%81u%20%C4%91%C3%B3.%0AScreen%20reader%20support%20enabled.%0A%20%0A%20%0A%20%09%09%0AV%E1%BB%9Bi%20th%E1%BB%9Di%20ti%E1%BA%BFt%20n%E1%BA%AFng%20n%C3%B3ng%20hay%20l%E1%BA%A1nh%20th%C3%AC%20tr%E1%BA%BB%20%C4%91%E1%BB%81u%20c%E1%BA%A7n%20ph%E1%BA%A3i%20%C4%91%E1%BB%99i%20m%C5%A9%2C%20nh%E1%BA%A5t%20l%C3%A0%20khi%20ba%20m%E1%BA%B9%20cho%20tr%E1%BA%BB%20%C4%91i%20ra%20ngo%C3%A0i%20%C4%91%C6%B0%E1%BB%9Dng%2C%20chi%E1%BA%BFc%20m%C5%A9%20ch%C3%ADnh%20l%C3%A0%20th%E1%BB%A9%20gi%C3%BAp%20che%20n%E1%BA%AFng%20v%C3%A0%20c%C5%A9ng%20nh%C6%B0%20c%E1%BA%A3n%20gi%C3%B3%20l%E1%BA%A1nh%20%C4%91%E1%BA%A3m%20b%E1%BA%A3o%20cho%20v%C3%B9ng%20%C4%91%E1%BA%A7u%20non%20n%E1%BB%9Bt%20c%E1%BB%A7a%20c%C3%A1c%20em%20%C4%91%C6%B0%E1%BB%A3c%20b%E1%BA%A3o%20v%E1%BB%87%20t%E1%BB%91t%20nh%E1%BA%A5t.%20V%C3%A0o%20nh%E1%BB%AFng%20ng%C3%A0y%20tr%E1%BB%9Di%20n%E1%BA%AFng%2C%20khi%20%C4%91i%20ra%20ngo%C3%A0i%20tr%E1%BA%BB%20c%C5%A9ng%20r%E1%BA%A5t%20d%E1%BB%85%20b%E1%BB%8B%20%C3%A1nh%20n%E1%BA%AFng%20chi%E1%BA%BFu%20v%C3%A0o%20m%E1%BA%B7t%20%C4%91i%E1%BB%81u%20n%C3%A0y%20s%E1%BA%BD%20g%C3%A2y%20t%E1%BB%95n%20th%C6%B0%C6%A1ng%20cho%20%C4%91%C3%B4i%20m%E1%BA%AFt%20c%E1%BB%A7a%20b%C3%A9%20%C4%91i%E1%BB%81u%20n%C3%A0y%20th%E1%BA%ADt%20s%E1%BB%B1%20kh%C3%B4ng%20t%E1%BB%91t%20v%C3%A0%20ch%C3%ADnh%20nh%E1%BB%AFng%20chi%E1%BA%BFc%20m%C5%A9%20nh%E1%BB%8F%20nh%E1%BA%AFn%2C%20xinh%20x%E1%BA%AFn%20kia%20s%E1%BA%BD%20l%C3%A0%20gi%E1%BA%A3i%20ph%C3%A1p%20ho%C3%A0n%20h%E1%BA%A3o%20%C4%91%E1%BB%83%20kh%E1%BA%AFc%20ph%E1%BB%A5c%20l%E1%BA%A1i%20%C4%91i%E1%BB%81u%20%C4%91%C3%B3.%0ATurn%20on%20screen%20reader%20support%0A%C4%90%E1%BA%A1t%20Ho%C3%A0ng%20has%20joined%20the%20document.', 'M%C5%A9%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A0m%20ho%C3%A0n%20to%C3%A0n%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20li%E1%BB%87u%20v%E1%BA%A3i%20cotton%20100%25%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20th%C3%A2n%20thi%E1%BB%87n%20v%E1%BB%9Bi%20l%C3%A0n%20da%20b%C3%A9%0A%0ACotton%20con%20gi%C3%A3n%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20t%E1%BB%91t%2C%20kh%C3%B4ng%20g%C3%A2y%20b%C3%AD%20b%C3%A1ch%2C%20%C4%91%E1%BB%95%20m%E1%BB%93%20h%C3%B4i%20khi%20%C4%91%E1%BB%99i%0A%0AB%E1%BB%81n%20m%C3%A0u%2C%20kh%C3%B4ng%20b%E1%BB%8B%20x%C3%B9%20l%C3%B4ng%2C%20bai%20khi%20ng%C3%A2m%20gi%E1%BA%B7t%20nhi%E1%BB%81u%20l%E1%BA%A7n%0A%0A%0AM%C5%A9%20thi%E1%BA%BFt%20k%E1%BA%BF%20ch%C3%B9m%20k%C3%ADn%20tai%20v%E1%BB%ABa%20c%C3%B3%20t%C3%A1c%20d%E1%BB%A5ng%20b%E1%BA%A3o%20v%E1%BB%87%20ph%E1%BA%A7n%20th%C3%B3p%20c%C3%B2n%20y%E1%BA%BFu%20c%E1%BB%A7a%20b%C3%A9%20v%E1%BB%ABa%20gi%E1%BA%A3m%20thi%E1%BB%83u%20ti%E1%BA%BFng%20%E1%BB%93n%20%E1%BA%A3nh%20h%C6%B0%E1%BB%9Fng%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20%C4%91%E1%BA%BFn%20tai%20v%C3%A0%20gi%E1%BB%AF%20%E1%BA%A5m%20cho%20%C4%91%E1%BA%A7u%20b%C3%A9%20m%E1%BB%97i%20khi%20ra%20ngo%C3%A0i.%20%0A%0A%C4%90%C6%B0%E1%BB%9Dng%20ch%E1%BB%89%20may%20r%E1%BA%A5t%20ch%E1%BA%AFc%20ch%E1%BA%AFn%2C%20h%E1%BA%A1n%20ch%E1%BA%BF%20t%E1%BB%91i%20%C4%91a%20c%C3%A1c%20%C4%91%C6%B0%E1%BB%9Dng%20g%C3%A2n%2C%20ch%E1%BB%89%20th%E1%BB%ABa%20khi%20may%0AM%C5%A9%20%C4%91%C6%B0%E1%BB%A3c%20in%20h%E1%BB%8Da%20ti%E1%BA%BFt%20%C4%91%E1%BB%99c%20%C4%91%C3%A1o%20v%C3%A0%20l%C3%B4i%20cu%E1%BB%91n%20khi%E1%BA%BFn%20cho%20b%C3%A9%20c%C3%A0ng%20%C4%91%C3%A1ng%20y%C3%AAu%20h%C6%A1n%20m%E1%BB%97i%20khi%20%C4%91%E1%BB%99i%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20ph%C3%B9%20h%E1%BB%A3p%20c%E1%BA%A3%20b%C3%A9%20trai%20v%C3%A0%20b%C3%A9%20g%C3%A1i%20t%E1%BB%AB%20s%C6%A1%20sinh%20tr%E1%BB%9F%20l%C3%AAn', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/_/m/_mg_0316.jpg', b'0', 'Mũ in Ilove Mama QQ', 62000, NULL, 18),
(67, '2021-12-21 16:16:42', 'V%E1%BB%9Bi%20thi%E1%BA%BFt%20k%E1%BA%BF%20%C4%91%E1%BB%99c%20%C4%91%C3%A1o%20v%C3%A0%20c%E1%BA%A9n%20th%E1%BA%ADn%20trong%20t%E1%BB%ABng%20chi%20ti%E1%BA%BFt%20s%E1%BA%BD%20mang%20%C4%91%E1%BA%BFn%20tr%E1%BA%A3i%20nghi%E1%BB%87m%20tuy%E1%BB%87t%20v%E1%BB%9Di%20cho%20nh%E1%BB%AFng%20b%C6%B0%E1%BB%9Bc%20ch%C3%A2n%20%C4%91%E1%BA%A7u%20%C4%91%E1%BB%9Di%20c%E1%BB%A7a%20b%C3%A9.', '%C4%90%E1%BA%B7c%20%C4%91i%E1%BB%83m%20n%E1%BB%95i%20b%E1%BA%ADt%20c%E1%BB%A7a%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%3A%0AGi%C3%A0y%20c%C3%B3%20k%C3%A8n%20k%C3%AAu%20ch%C3%ADp%20ch%C3%ADp%20k%C3%ADch%20th%C3%ADch%20b%C3%A9%20t%E1%BA%ADp%20%C4%91i.%0A%0ACh%E1%BA%A5t%20li%E1%BB%87u%20an%20to%C3%A0n%2C%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20nh%E1%BA%B9%2C%20tho%C3%A1ng%20kh%C3%AD.%0A%0AThi%E1%BA%BFt%20k%E1%BA%BF%20tho%E1%BA%A3i%20m%C3%A1i%2C%20ti%E1%BB%87n%20d%E1%BB%A5ng.%0AM%E1%BA%B9%20h%C3%A3y%20%C4%91o%20chi%E1%BB%81u%20d%C3%A0i%20b%C3%A0n%20ch%C3%A2n%20b%C3%A9%20%C4%91%E1%BB%83%20ch%E1%BB%8Dn%20k%C3%ADch%20th%C6%B0%E1%BB%9Bc%20ph%C3%B9%20h%E1%BB%A3p%20nh%E1%BA%A5t%0A%0A%20%20Size%20130%20t%C6%B0%C6%A1ng%20%C4%91%C6%B0%C6%A1ng%20v%E1%BB%9Bi%20chi%E1%BB%81u%20d%C3%A0i%20b%C3%A0n%20ch%C3%A2n%2012cm%0A%0A%20%20Size%20140%3A%20chi%E1%BB%81u%20d%C3%A0i%2012.5%20cm%0A%0A%20%20Size%20150%3A%20chi%E1%BB%81u%20d%C3%A0i%2013%20cm%0A%0A%20%20Size%20160%3A%20chi%E1%BB%81u%20d%C3%A0i%2014%20cm%0A%0A%20%20Size%20170%3A%20chi%E1%BB%81u%20d%C3%A0i%2014.5%20cm%0A%0A%20%20Size%20180%3A%20chi%E1%BB%81u%20d%C3%A0i%2015%20cm%0A%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20%C4%91%C6%B0%E1%BB%A3c%20%C4%91%C3%B3ng%20trong%20h%E1%BB%99p%20n%C3%AAn%20th%C3%ADch%20h%E1%BB%A3p%20l%C3%A0m%20qu%C3%A0%20t%E1%BA%B7ng%20cho%20b%C3%A9%20y%C3%AAu%20trong%20c%C3%A1c%20d%E1%BB%8Bp%20sinh%20nh%E1%BA%ADt%2C%20th%C3%B4i%20n%C3%B4i%2C%20l%E1%BB%85%20T%E1%BA%BFt.%0A%0AXu%E1%BA%A5t%20x%E1%BB%A9%3A%20Vi%E1%BB%87t%20Nam', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/g/i/giay-tap-di-kidsplaza-21k-s5-chim-canh-cut-do-1.jpg\n', b'0', 'Giày tập đi  bò sữa ', 120000, NULL, 17),
(68, '2021-12-21 16:16:42', 'Ch%E1%BA%AFc%20ch%E1%BA%AFn%20s%E1%BA%BD%20khi%E1%BA%BFn%20cho%20b%C3%A9%20y%C3%AAu%20nh%C3%A0%20b%E1%BA%A1n%20tr%E1%BB%9F%20n%C3%AAn%20%C4%91%C3%A1ng%20y%C3%AAu%20h%C6%A1n%20ngay%20c%E1%BA%A3%20khi%20%C4%83n.', 'Set%202%20y%E1%BA%BFm%20%C4%83n%20d%E1%BA%B7m%20b%E1%BA%A5m%20c%C3%BAc%20KidsPlaza%20BA21(H%E1%BB%93ng)%20gi%C3%BAp%20gi%E1%BB%AF%20cho%20qu%E1%BA%A7n%20%C3%A1o%20b%C3%A9%20y%C3%AAu%20lu%C3%B4n%20s%E1%BA%A1ch%20s%E1%BA%BD%20v%C3%A0%20ti%E1%BB%87n%20s%E1%BB%AD%20d%E1%BB%A5ng%20lau%20ch%C3%B9i%20ch%E1%BA%A5t%20b%E1%BA%A9n%20cho%20b%C3%A9%20khi%20%C4%83n%20u%E1%BB%91ng%20b%E1%BB%8B%20v%E1%BA%A5y%20b%E1%BA%A9n%20ra%20ngo%C3%A0i.%0AH%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y.%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u.%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20%3E30%20%C4%91%E1%BB%99%20C.%0A%0AN%C3%AAu%20%E1%BB%A7i%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m.%0A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20100%25%20cotton%0A%0AK%C3%ADch%20th%C6%B0%E1%BB%9Bc%3A%2018%2C5%20x%2026cm%0A%0A%C4%90%C3%B3ng%20g%C3%B3i%3A%202%20chi%E1%BA%BFc%2Fset%0A%0AC%C3%B4ng%20d%E1%BB%A5ng%3A%20Gi%E1%BB%AF%20%E1%BA%A5m%20c%E1%BB%95%2C%20tr%C3%A1nh%20r%C3%A2y%20b%E1%BA%A9n%20ra%20qu%E1%BA%A7n%20%C3%A1o%20khi%20%C4%83n%20u%E1%BB%91ng%20hay%20ti%20m%E1%BA%B9%0A%0AXu%E1%BA%A5t%20x%E1%BB%A9%3A%20Vi%E1%BB%87t%20Nam%0A%0AC%E1%BA%A3nh%20c%C3%A1o%3A%20tr%C3%A1nh%20xa%20l%E1%BB%ADa%2C%20s%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20ch%C3%A1y.', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-yem-an-ct-mothers-choice-hong-xam-1.jpg\n', b'0', 'Set 2 yếm ăn CT Mothers Choice ', 165000, NULL, 20),
(69, '2021-12-21 16:16:42', '%3Cp%3ESet%202%20y%E1%BA%BFm%20%C4%83n%20CT%20Mothers%20Choice%20-%20V%C3%A0ng%20X%C3%A1m%20gi%C3%BAp%20gi%E1%BB%AF%20cho%20qu%E1%BA%A7n%20%C3%A1o%20b%C3%A9%20y%C3%AAu%20lu%C3%B4n%20s%E1%BA%A1ch%20s%E1%BA%BD%20v%C3%A0%20ti%E1%BB%87n%20s%E1%BB%AD%20d%E1%BB%A5ng%20lau%20ch%C3%B9i%20ch%E1%BA%A5t%20b%E1%BA%A9n%20cho%20b%C3%A9%20khi%20%C4%83n%20u%E1%BB%91ng%20b%E1%BB%8B%20v%E1%BA%A5y%20b%E1%BA%A9n%20ra%20ngo%C3%A0i.%3C%2Fp%3E', '%3Cp%3ESet%202%20y%E1%BA%BFm%20%C4%83n%20CT%20Mothers%20Choice%20-%20V%C3%A0ng%20X%C3%A1m%20gi%C3%BAp%20gi%E1%BB%AF%20cho%20qu%E1%BA%A7n%20%C3%A1o%20b%C3%A9%20y%C3%AAu%20lu%C3%B4n%20s%E1%BA%A1ch%20s%E1%BA%BD%20v%C3%A0%20ti%E1%BB%87n%20s%E1%BB%AD%20d%E1%BB%A5ng%20lau%20ch%C3%B9i%20ch%E1%BA%A5t%20b%E1%BA%A9n%20cho%20b%C3%A9%20khi%20%C4%83n%20u%E1%BB%91ng%20b%E1%BB%8B%20v%E1%BA%A5y%20b%E1%BA%A9n%20ra%20ngo%C3%A0i.%3C%2Fp%3E', 15, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/_/m/_mg_0078.jpg\n', b'0', 'Áo yếm xinh đẹp', 205000, NULL, 20),
(70, '2021-12-21 16:16:42', 'Ch%E1%BA%A5t%20li%E1%BB%87u%3A%2095%25%20cotton%2C%205%25%20spandex%20m%E1%BB%81m%20m%E1%BA%A1i%2C%20si%C3%AAu%20co%20gi%C3%A3n%2C%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%2C%20kh%C3%A1ng%20khu%E1%BA%A9n%20t%E1%BB%B1%20nhi%C3%AAn%2C%20an%20to%C3%A0n%20v%E1%BB%9Bi%20da%20c%E1%BB%A7a%20tr%E1%BA%BB.', 'Thi%E1%BA%BFt%20k%E1%BA%BF%3A%20Y%E1%BA%BFm%20s%C6%A1%20sinh%20bu%E1%BB%99c%20d%C3%A2y%20ti%E1%BB%87n%20ti%E1%BB%87n%20l%E1%BB%A3i%20khi%20thay%20m%E1%BA%B7c.%20%C4%90%C6%B0%E1%BB%9Dng%20ch%E1%BB%89%20may%20ch%E1%BA%AFc%20ch%E1%BA%AFn%2C%20c%E1%BA%A9n%20th%E1%BA%ADn.%0A%0AH%E1%BB%8Da%20ti%E1%BA%BFt%3A%20Y%E1%BA%BFm%20cho%20b%C3%A9%20s%C6%A1%20sinh%202%20m%E1%BA%B7t%20Otis%20KidsPlaza%20in%20ch%E1%BB%AF%20JR%20tr%C3%AAn%20n%E1%BB%81n%20cam%20n%E1%BB%95i%20b%E1%BA%ADt%20ph%E1%BB%91i%20c%C3%B9ng%201%20m%E1%BA%B7t%20m%C3%A0u%20cam%20t%C6%B0%C6%A1i%20t%E1%BA%AFn%20khi%E1%BA%BFn%20s%E1%BA%A3n%20ph%E1%BA%A9m%20v%C3%B4%20c%C3%B9ng%20b%E1%BA%AFt%20m%E1%BA%AFt.%0A%0AM%C3%A0u%20s%E1%BA%AFc%3A%20M%C3%A0u%20cam%20t%C6%B0%C6%A1i%20t%E1%BA%AFn%2C%20kh%E1%BB%8Fe%20kho%E1%BA%AFn.%0A%0AC%C3%B4ng%20d%E1%BB%A5ng%3A%20V%E1%BB%ABa%20gi%E1%BB%AF%20%E1%BA%A5m%20cho%20c%E1%BB%95%20b%C3%A9%20v%E1%BB%ABa%20tr%C3%A1nh%20h%E1%BA%A1n%20ch%E1%BA%BF%20s%E1%BB%AFa%20hay%20th%E1%BB%A9c%20%C4%83n%20l%C3%A0m%20b%E1%BA%A9n%20qu%E1%BA%A7n%20%C3%A1o%20b%C3%A9.%0A%0A%C4%90%E1%BB%99%20tu%E1%BB%95i%3A%200-6%20th%C3%A1ng%0A%0ATh%C6%B0%C6%A1ng%20hi%E1%BB%87u%3A%20KidsPlaza%0A%0AXu%E1%BA%A5t%20x%E1%BB%A9%3A%20Vi%E1%BB%87t%20Nam%0A%0A', 0, 'https://www.bexinhshop.vn/image/data/17-12-2021/SETSOMIGAULUNGHONG1.jpg\n', b'0', 'Set sơ mi gấu quần lửng', 390000, NULL, 12),
(71, '2021-12-21 16:16:42', 'Thi%E1%BA%BFt%20k%E1%BA%BF%20%20%20%20%20%20%20%20Ti%E1%BA%BFp%20t%E1%BB%A5c%20tr%C3%ACnh%20l%C3%A0ng%20si%C3%AAu%20ph%E1%BA%A9mmm%20cho%20c%C3%A1c%20momm%20ch%E1%BB%91t%20%C4%91%C6%A1n%20n%E1%BA%A1%0A%2C%20xinh%20mu%E1%BB%91n%20ch%C4%A9uu%20lunnn.%20%C3%81o%20may%20tr%C3%AAn%20ch%E1%BA%A5t%20li%E1%BB%87u%20v%E1%BA%A3i%20kate%20nh%E1%BA%ADp%20s%E1%BB%8Bn%20s%C3%B2%2C%20h%C3%ACnh%20in%20%0As%E1%BA%AFc%20n%C3%A9t%2C%20t%E1%BB%89%20m%E1%BB%89%20t%E1%BB%ABng%20%C4%91%C6%B0%E1%BB%9Dng%20kim%20m%C5%A9i%20ch%E1%BB%89.%20Qu%E1%BA%A7n%20ch%E1%BA%A5t%20li%E1%BB%87u%20thun%20coton%20co%20d%C3%A3n%0A%204%20chi%E1%BB%81u%2C%20m%E1%BB%81m%20m%E1%BB%8Bn.%20Nh%C3%AD%20Size%202%2F9%20v%C3%A0%20%C4%90%E1%BA%A1i%20size%2010%2F16.%0ACh%E1%BA%A5t%20li%E1%BB%87u%20%20%20%20%20%20%20%20Thun%20cotton%2C%20Kate%0AXu%E1%BA%A5t%20x%E1%BB%A9%20%20%20%20%20%20%20%20Vi%E1%BB%87t%20NamV%0A', 'V%C3%B2%20b%E1%BA%B1ng%20tay%20v%E1%BB%9Bi%20l%E1%BA%A7n%20gi%E1%BA%B7t%20%C4%91%E1%BA%A7u%20ti%C3%AAn%2C%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20n%C6%B0%E1%BB%9Bc%20l%C3%A3%20v%C3%A0%20kh%C3%B4ng%20c%C3%B3%20x%C3%A0%20ph%C3%B2ng%20%C4%91%E1%BB%83%20l%E1%BB%9Bp%20in%20m%E1%BB%81m%20h%C6%A1n%2C%20ch%E1%BB%91ng%20bong%20tr%C3%B3c.%20N%C3%AAn%20gi%E1%BA%B7t%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BA%B1ng%20n%C6%B0%E1%BB%9Bc%20l%E1%BA%A1nh%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20d%C6%B0%E1%BB%9Bi%2040%20%C4%91%E1%BB%99%20v%C3%AC%20n%E1%BA%BFu%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20qu%C3%A1%20n%C3%B3ng%20s%E1%BA%BD%20l%C3%A0m%20v%E1%BA%A3i%20gi%C3%A3n%20ra%20v%C3%A0%20l%E1%BB%8Fng%20s%E1%BA%A3n%20ph%E1%BA%A9m.%0A%0A-%20%C4%90%E1%BB%83%20gi%E1%BB%AF%20m%C3%A0u%20s%E1%BA%A3n%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A2u%20v%C3%A0%20kh%C3%B4ng%20b%E1%BB%8B%20ra%20m%C3%A0u%20trong%20qu%C3%A1%20tr%C3%ACnh%20gi%E1%BA%B7t%2C%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20ng%C3%A2m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20trong%20n%C6%B0%E1%BB%9Bc%20%E1%BA%A5m%20c%C3%B3%20pha%20ch%C3%BAt%20gi%E1%BA%A5m%20trong%20kho%E1%BA%A3ng%2015-20%20ph%C3%BAt.%0A%0A-%20Kh%C3%B4ng%20%C4%91%E1%BB%95%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20c%C3%A1c%20lo%E1%BA%A1i%20x%C3%A0%20b%C3%B4ng%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20t%E1%BA%A9y%20l%C3%AAn%20h%C3%ACnh%20in.%20M%E1%BA%B9%20n%C3%AAn%20h%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20m%E1%BB%81m%20v%E1%BA%A3i%20v%C3%AC%20n%C3%B3%20s%E1%BA%BD%20l%C3%A0m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BB%8B%20gi%C3%A3n%20r%E1%BA%A5t%20nhanh%20v%C3%A0%20khi%E1%BA%BFn%20h%C3%ACnh%20in%20b%E1%BB%8B%20m%E1%BB%81m%2C%20d%E1%BB%85%20bong%20tr%C3%B3c.%20N%E1%BA%BF%20n%20mu%E1%BB%91n%20s%E1%BA%A3n%20ph%E1%BA%A9m%20th%C6%A1m%20h%C6%A1n%20sau%20khi%20gi%E1%BA%B7t%2C%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20th%C6%A1m.%0A%0A-%20Kh%C3%B4ng%20n%C3%AAn%20%C4%91%E1%BB%83%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%E1%BB%9F%20nh%E1%BB%AFng%20n%C6%A1i%20%E1%BA%A9m%20%C6%B0%E1%BB%9Bt%2C%20v%E1%BB%9Bi%20t%C3%ADnh%20ch%E1%BA%A5t%20h%C3%BAt%20%E1%BA%A9m%2C%20h%C3%BAt%20n%C6%B0%E1%BB%9Bc%20t%E1%BB%91t%2C%20s%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20b%E1%BB%8B%20%E1%BA%A9m%20m%E1%BB%91c%2C%20th%E1%BA%ADm%20ch%C3%AD%20%C4%91%E1%BB%83%20l%E1%BA%A1i%20nh%E1%BB%AFng%20v%E1%BA%BFt%20%E1%BB%91%20tr%C3%AAn%20v%E1%BA%A3i.%20Tr%C3%A1nh%20ph%C6%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20d%C6%B0%E1%BB%9Bi%20n%E1%BA%AFng%20v%C3%AC%20s%E1%BA%BD%20l%C3%A0m%20m%C3%A0u%20v%C3%A0%20h%C3%ACnh%20in%20phai%20m%C3%A0u.', 0, 'https://www.bexinhshop.vn/image/data/17-12-2021/setvayhellokitty2.jpg\n', b'0', 'Set quần váy Hello Kitty', 200000, NULL, 8),
(72, '2021-12-21 16:16:42', 'Thi%E1%BA%BFt%20k%E1%BA%BF%20%20%20%20%20%20%20%20Set%20qu%E1%BA%A7n%20v%C3%A1y%20Hello%20Kitty%20d%E1%BB%85%20th%C6%B0%C6%A1ng%20cho%20b%C3%A9%20g%C3%A1i.%20Tr%E1%BB%8Dn%20b%E1%BB%99%20thun%20cotton%204c%20lo%E1%BA%A1i%201%0A%2C%20h%C3%ACnh%0A%20in%20%20%20ch%E1%BA%A1y%20vi%E1%BB%81n%20th%E1%BB%83%20thao%2C%20g%E1%BA%AFn%20n%C6%A1%20n%E1%BB%95i%20nh%C6%B0%20h%C3%ACnh.%20Qu%E1%BA%A7n%20gi%E1%BA%A3%20v%C3%A1y%2C%20x%C3%A8o%20r%E1%BB%99ng.%20Size%20nh%C3%AD%203-10%0A.%20Size%20%C4%90%E1%BA%A1i%2011-16.%0ACh%E1%BA%A5t%20li%E1%BB%87u%20%20%20%20%20%20%20%20Thun%20cotton%0AXu%E1%BA%A5t%20x%E1%BB%A9%20%20%20%20%20%20%20%20Vi%E1%BB%87t%20Nam', 'V%C3%B2%20b%E1%BA%B1ng%20tay%20v%E1%BB%9Bi%20l%E1%BA%A7n%20gi%E1%BA%B7t%20%C4%91%E1%BA%A7u%20ti%C3%AAn%2C%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20n%C6%B0%E1%BB%9Bc%20l%C3%A3%20v%C3%A0%20kh%C3%B4ng%20c%C3%B3%20x%C3%A0%20ph%C3%B2ng%20%C4%91%E1%BB%83%20l%E1%BB%9Bp%20in%20m%E1%BB%81m%20h%C6%A1n%2C%20ch%E1%BB%91ng%20bong%20tr%C3%B3c.%20N%C3%AAn%20gi%E1%BA%B7t%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BA%B1ng%20n%C6%B0%E1%BB%9Bc%20l%E1%BA%A1nh%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20d%C6%B0%E1%BB%9Bi%2040%20%C4%91%E1%BB%99%20v%C3%AC%20n%E1%BA%BFu%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20qu%C3%A1%20n%C3%B3ng%20s%E1%BA%BD%20l%C3%A0m%20v%E1%BA%A3i%20gi%C3%A3n%20ra%20v%C3%A0%20l%E1%BB%8Fng%20s%E1%BA%A3n%20ph%E1%BA%A9m.%0A%0A-%20%C4%90%E1%BB%83%20gi%E1%BB%AF%20m%C3%A0u%20s%E1%BA%A3n%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A2u%20v%C3%A0%20kh%C3%B4ng%20b%E1%BB%8B%20ra%20m%C3%A0u%20trong%20qu%C3%A1%20tr%C3%ACnh%20gi%E1%BA%B7t%2C%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20ng%C3%A2m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20trong%20n%C6%B0%E1%BB%9Bc%20%E1%BA%A5m%20c%C3%B3%20pha%20ch%C3%BAt%20gi%E1%BA%A5m%20trong%20kho%E1%BA%A3ng%2015-20%20ph%C3%BAt.%0A%0A-%20Kh%C3%B4ng%20%C4%91%E1%BB%95%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20c%C3%A1c%20lo%E1%BA%A1i%20x%C3%A0%20b%C3%B4ng%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20t%E1%BA%A9y%20l%C3%AAn%20h%C3%ACnh%20in.%20M%E1%BA%B9%20n%C3%AAn%20h%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20m%E1%BB%81m%20v%E1%BA%A3i%20v%C3%AC%20n%C3%B3%20s%E1%BA%BD%20l%C3%A0m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BB%8B%20gi%C3%A3n%20r%E1%BA%A5t%20nhanh%20v%C3%A0%20khi%E1%BA%BFn%20h%C3%ACnh%20in%20b%E1%BB%8B%20m%E1%BB%81m%2C%20d%E1%BB%85%20bong%20tr%C3%B3c.%20N%E1%BA%BF%20n%20mu%E1%BB%91n%20s%E1%BA%A3n%20ph%E1%BA%A9m%20th%C6%A1m%20h%C6%A1n%20sau%20khi%20gi%E1%BA%B7t%2C%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20th%C6%A1m.%0A%0A-%20Kh%C3%B4ng%20n%C3%AAn%20%C4%91%E1%BB%83%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%E1%BB%9F%20nh%E1%BB%AFng%20n%C6%A1i%20%E1%BA%A9m%20%C6%B0%E1%BB%9Bt%2C%20v%E1%BB%9Bi%20t%C3%ADnh%20ch%E1%BA%A5t%20h%C3%BAt%20%E1%BA%A9m%2C%20h%C3%BAt%20n%C6%B0%E1%BB%9Bc%20t%E1%BB%91t%2C%20s%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20b%E1%BB%8B%20%E1%BA%A9m%20m%E1%BB%91c%2C%20th%E1%BA%ADm%20ch%C3%AD%20%C4%91%E1%BB%83%20l%E1%BA%A1i%20nh%E1%BB%AFng%20v%E1%BA%BFt%20%E1%BB%91%20tr%C3%AAn%20v%E1%BA%A3i.%20Tr%C3%A1nh%20ph%C6%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20d%C6%B0%E1%BB%9Bi%20n%E1%BA%AFng%20v%C3%AC%20s%E1%BA%BD%20l%C3%A0m%20m%C3%A0u%20v%C3%A0%20h%C3%ACnh%20in%20phai%20m%C3%A0u.', 12, 'https://www.bexinhshop.vn/image/data/18-11-2021/aorutdaychuden.jpg\n', b'0', 'Áo rút dây in chữ', 190000, NULL, 12),
(73, '2021-12-21 16:16:42', 'Thi%E1%BA%BFt%20k%E1%BA%BF%20%20%20%20%20%20%20%20%C3%81o%20b%C3%A9%20g%C3%A1i%20si%C3%AAu%20xinh%20-%20si%C3%AAu%20ch%E1%BA%A5t.%20Ch%E1%BA%A5t%20li%E1%BB%87u%20%C3%A1o%20thun%20cotton%20%0Aco%20gi%C3%A3n%204%20chi%E1%BB%81u%20h%C3%ACnh%20in%20s%E1%BA%AFc%20n%C3%A9t%20.%20thi%E1%BA%BFt%20k%E1%BA%BF%20r%C3%BAt%20d%C3%A2y%20c%C3%A1%20t%C3%ADnh%20%2C%20n%C4%83ng%20%C4%91%E1%BB%99ng.%0A%20Nh%C3%AD%20Size%202%2F9%20v%C3%A0%20%C4%91%E1%BA%A1i%20size%2010%2F16.%0ACh%E1%BA%A5t%20li%E1%BB%87u%20%20%20%20%20%20%20%20Thun%20cotton%0AXu%E1%BA%A5t%20x%E1%BB%A9%20%20%20%20%20%20%20%20Vi%E1%BB%87t%20Nam', '%20V%C3%B2%20b%E1%BA%B1ng%20tay%20v%E1%BB%9Bi%20l%E1%BA%A7n%20gi%E1%BA%B7t%20%C4%91%E1%BA%A7u%20ti%C3%AAn%2C%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20n%C6%B0%E1%BB%9Bc%20l%C3%A3%20v%C3%A0%20kh%C3%B4ng%20c%C3%B3%20x%C3%A0%20ph%C3%B2ng%20%C4%91%E1%BB%83%20l%E1%BB%9Bp%20in%20m%E1%BB%81m%20h%C6%A1n%2C%20ch%E1%BB%91ng%20bong%20tr%C3%B3c.%20N%C3%AAn%20gi%E1%BA%B7t%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BA%B1ng%20n%C6%B0%E1%BB%9Bc%20l%E1%BA%A1nh%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20d%C6%B0%E1%BB%9Bi%2040%20%C4%91%E1%BB%99%20v%C3%AC%20n%E1%BA%BFu%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20qu%C3%A1%20n%C3%B3ng%20s%E1%BA%BD%20l%C3%A0m%20v%E1%BA%A3i%20gi%C3%A3n%20ra%20v%C3%A0%20l%E1%BB%8Fng%20s%E1%BA%A3n%20ph%E1%BA%A9m.%0A%0A-%20%C4%90%E1%BB%83%20gi%E1%BB%AF%20m%C3%A0u%20s%E1%BA%A3n%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A2u%20v%C3%A0%20kh%C3%B4ng%20b%E1%BB%8B%20ra%20m%C3%A0u%20trong%20qu%C3%A1%20tr%C3%ACnh%20gi%E1%BA%B7t%2C%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20ng%C3%A2m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20trong%20n%C6%B0%E1%BB%9Bc%20%E1%BA%A5m%20c%C3%B3%20pha%20ch%C3%BAt%20gi%E1%BA%A5m%20trong%20kho%E1%BA%A3ng%2015-20%20ph%C3%BAt.%0A%0A-%20Kh%C3%B4ng%20%C4%91%E1%BB%95%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20c%C3%A1c%20lo%E1%BA%A1i%20x%C3%A0%20b%C3%B4ng%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20t%E1%BA%A9y%20l%C3%AAn%20h%C3%ACnh%20in.%20M%E1%BA%B9%20n%C3%AAn%20h%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20m%E1%BB%81m%20v%E1%BA%A3i%20v%C3%AC%20n%C3%B3%20s%E1%BA%BD%20l%C3%A0m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BB%8B%20gi%C3%A3n%20r%E1%BA%A5t%20nhanh%20v%C3%A0%20khi%E1%BA%BFn%20h%C3%ACnh%20in%20b%E1%BB%8B%20m%E1%BB%81m%2C%20d%E1%BB%85%20bong%20tr%C3%B3c.%20N%E1%BA%BF%20n%20mu%E1%BB%91n%20s%E1%BA%A3n%20ph%E1%BA%A9m%20th%C6%A1m%20h%C6%A1n%20sau%20khi%20gi%E1%BA%B7t%2C%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20th%C6%A1m.%0A%0A-%20Kh%C3%B4ng%20n%C3%AAn%20%C4%91%E1%BB%83%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%E1%BB%9F%20nh%E1%BB%AFng%20n%C6%A1i%20%E1%BA%A9m%20%C6%B0%E1%BB%9Bt%2C%20v%E1%BB%9Bi%20t%C3%ADnh%20ch%E1%BA%A5t%20h%C3%BAt%20%E1%BA%A9m%2C%20h%C3%BAt%20n%C6%B0%E1%BB%9Bc%20t%E1%BB%91t%2C%20s%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20b%E1%BB%8B%20%E1%BA%A9m%20m%E1%BB%91c%2C%20th%E1%BA%ADm%20ch%C3%AD%20%C4%91%E1%BB%83%20l%E1%BA%A1i%20nh%E1%BB%AFng%20v%E1%BA%BFt%20%E1%BB%91%20tr%C3%AAn%20v%E1%BA%A3i.%20Tr%C3%A1nh%20ph%C6%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20d%C6%B0%E1%BB%9Bi%20n%E1%BA%AFng%20v%C3%AC%20s%E1%BA%BD%20l%C3%A0m%20m%C3%A0u%20v%C3%A0%20h%C3%ACnh%20in%20phai%20m%C3%A0u.', 12, 'https://www.bexinhshop.vn/image/data/9-10-2021/aokhoatloveisxanh.jpg\n', b'0', 'Áo khoác da cá', 500000, NULL, 12),
(74, '2021-12-21 16:16:42', 'Thi%E1%BA%BFt%20k%E1%BA%BF%20%20%20%20%20%20%20%20%C3%81o%20kho%C3%A1t%20cho%20b%C3%A9%20%C4%91%C6%A1n%20gi%E1%BA%A3n%20nh%C6%B0ng%20sang%20tr%E1%BB%8Dng.%20%C3%81o%20may%20b%E1%BA%B1ng%20ch%E1%BA%A5t%20da%20c%C3%A1%20%0Acotton%204c%2C%20%0Ach%E1%BA%A5t%20v%E1%BA%A3i%20v%E1%BB%ABa%20m%C3%ACnh%20ko%20d%C3%A0y%20c%E1%BB%99m%20m%E1%BB%81m%20m%E1%BB%8Bn%20co%20gi%C3%A3n%20tho%E1%BA%A3i.%20%0AC%E1%BB%95%2C%20tay%20v%C3%A0%20lai%20may%20v%E1%BA%A3i%20bo%20cotton%20d%E1%BB%87t%20co%20gi%C3%A3n%2C%202%20b%C3%AAn%20%C4%91%E1%BA%AFp%20t%C3%BAi%0A%2C%20n%C3%BAp%20b%E1%BB%8Dc%20v%E1%BA%A3i%20c%C3%B9ng%20m%C3%A0u.%20H%C3%ACnh%20th%C3%AAu%20s%E1%BA%AFc%20n%C3%A9t.%20Nh%C3%AD%20Size%202-9.%20%C4%90%E1%BA%A1i%20Size%2010-15.', 'V%C3%B2%20b%E1%BA%B1ng%20tay%20v%E1%BB%9Bi%20l%E1%BA%A7n%20gi%E1%BA%B7t%20%C4%91%E1%BA%A7u%20ti%C3%AAn%2C%20gi%E1%BA%B7t%20b%E1%BA%B1ng%20n%C6%B0%E1%BB%9Bc%20l%C3%A3%20v%C3%A0%20kh%C3%B4ng%20c%C3%B3%20x%C3%A0%20ph%C3%B2ng%20%C4%91%E1%BB%83%20l%E1%BB%9Bp%20in%20m%E1%BB%81m%20h%C6%A1n%2C%20ch%E1%BB%91ng%20bong%20tr%C3%B3c.%20N%C3%AAn%20gi%E1%BA%B7t%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BA%B1ng%20n%C6%B0%E1%BB%9Bc%20l%E1%BA%A1nh%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20d%C6%B0%E1%BB%9Bi%2040%20%C4%91%E1%BB%99%20v%C3%AC%20n%E1%BA%BFu%20gi%E1%BA%B7t%20trong%20n%C6%B0%E1%BB%9Bc%20qu%C3%A1%20n%C3%B3ng%20s%E1%BA%BD%20l%C3%A0m%20v%E1%BA%A3i%20gi%C3%A3n%20ra%20v%C3%A0%20l%E1%BB%8Fng%20s%E1%BA%A3n%20ph%E1%BA%A9m.%0A%0A-%20%C4%90%E1%BB%83%20gi%E1%BB%AF%20m%C3%A0u%20s%E1%BA%A3n%20%C4%91%C6%B0%E1%BB%A3c%20l%C3%A2u%20v%C3%A0%20kh%C3%B4ng%20b%E1%BB%8B%20ra%20m%C3%A0u%20trong%20qu%C3%A1%20tr%C3%ACnh%20gi%E1%BA%B7t%2C%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20ng%C3%A2m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20trong%20n%C6%B0%E1%BB%9Bc%20%E1%BA%A5m%20c%C3%B3%20pha%20ch%C3%BAt%20gi%E1%BA%A5m%20trong%20kho%E1%BA%A3ng%2015-20%20ph%C3%BAt.%0A%0A-%20Kh%C3%B4ng%20%C4%91%E1%BB%95%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20c%C3%A1c%20lo%E1%BA%A1i%20x%C3%A0%20b%C3%B4ng%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20t%E1%BA%A9y%20l%C3%AAn%20h%C3%ACnh%20in.%20M%E1%BA%B9%20n%C3%AAn%20h%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20m%E1%BB%81m%20v%E1%BA%A3i%20v%C3%AC%20n%C3%B3%20s%E1%BA%BD%20l%C3%A0m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BB%8B%20gi%C3%A3n%20r%E1%BA%A5t%20nhanh%20v%C3%A0%20khi%E1%BA%BFn%20h%C3%ACnh%20in%20b%E1%BB%8B%20m%E1%BB%81m%2C%20d%E1%BB%85%20bong%20tr%C3%B3c.%20N%E1%BA%BF%20n%20mu%E1%BB%91n%20s%E1%BA%A3n%20ph%E1%BA%A9m%20th%C6%A1m%20h%C6%A1n%20sau%20khi%20gi%E1%BA%B7t%2C%20m%E1%BA%B9%20c%C3%B3%20th%E1%BB%83%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20th%C6%A1m.%0A%0A-%20Kh%C3%B4ng%20n%C3%AAn%20%C4%91%E1%BB%83%20s%E1%BA%A3n%20ph%E1%BA%A9m%20%E1%BB%9F%20nh%E1%BB%AFng%20n%C6%A1i%20%E1%BA%A9m%20%C6%B0%E1%BB%9Bt%2C%20v%E1%BB%9Bi%20t%C3%ADnh%20ch%E1%BA%A5t%20h%C3%BAt%20%E1%BA%A9m%2C%20h%C3%BAt%20n%C6%B0%E1%BB%9Bc%20t%E1%BB%91t%2C%20s%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20b%E1%BB%8B%20%E1%BA%A9m%20m%E1%BB%91c%2C%20th%E1%BA%ADm%20ch%C3%AD%20%C4%91%E1%BB%83%20l%E1%BA%A1i%20nh%E1%BB%AFng%20v%E1%BA%BFt%20%E1%BB%91%20tr%C3%AAn%20v%E1%BA%A3i.%20Tr%C3%A1nh%20ph%C6%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20d%C6%B0%E1%BB%9Bi%20n%E1%BA%AFng%20v%C3%AC%20s%E1%BA%BD%20l%C3%A0m%20m%C3%A0u%20v%C3%A0%20h%C3%ACnh%20in%20phai%20m%C3%A0u.', 12, 'https://www.bexinhshop.vn/image/data/25-9-2021/AOKHOATMICKEYCAM1.jpg\n', b'0', 'Ao khoác MICKEY', 400000, NULL, 3),
(75, '2021-12-21 16:16:42', '%C3%81o%20hoodie%20s%E1%BB%8Dc%20CREME%20n%C4%83ng%20%C4%91%E1%BB%99ng%20-%20s%C3%A0nh%20%C4%91i%E1%BB%87u%20cho%20b%C3%A9%20mix%20%C4%91%E1%BB%93%20th%E1%BB%9Di%20ti%E1%BA%BFt%20giao%20m%C3%B9a.%0A%20Ch%E1%BA%A5t%20thun%20cotton%20ch%C3%ADnh%20ph%E1%BA%A9m%20co%20gi%C3%A3n%204c%2C%20m%E1%BB%81m%20m%E1%BB%8Bn.%20S%E1%BB%8Dc%20in%20th%E1%BA%AFm%20s%E1%BA%AFc%20n%C3%A9t.%0A%20Style%20n%C4%83ng%20%C4%91%E1%BB%99ng%2C%20d%E1%BB%85%20m%E1%BA%B7c%2C%20d%E1%BB%85%20ph%E1%BB%91i%20%C4%91%E1%BB%93.%20C%C3%B3%203%20m%C3%A0u%20%C4%91%C3%A1nh%20s%E1%BB%91%20nh%C6%B0%20h%C3%ACnh.%20%0ANh%C3%AD%20size%202-9.%20%C4%90%E1%BA%A1i%20size%2010-15.', 'V%C3%B2%20b%E1%BA%B1ng%20tay%20v%E1%BB%9Bi%20l%E1%BA%A7n%20gi%E1%BA%B7t%20%C4%91%E1%BA%A7u%20ti%C3%AAn', 0, 'https://www.bexinhshop.vn/image/data/9-7-2021/aokhoatdacatuigauhong.jpg\n', b'0', 'Áo khoát gấu siêu iu cho baby', 126000, NULL, 3),
(76, '2021-12-21 16:16:42', '%C3%81o%20hoodie%20b%C3%B2%20s%E1%BB%AFa%20HOTTREND%20cho%20b%C3%A9%20trai%20%26%20b%C3%A9%20g%C3%A1i.%0A%20%C3%81o%20n%C3%B3n%20ph%E1%BB%91i%202%20tai%20xin%20x%E1%BA%AFn%20ch%E1%BA%A5t%20thun%20cotton%204c%20in%20s%E1%BA%AFc%20s%E1%BA%A3o.%20Size%20nhi%CC%81%202-9.%20Size%20%C4%91a%CC%A3i%2010-15.', '-%20Kh%C3%B4ng%20%C4%91%E1%BB%95%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20c%C3%A1c%20lo%E1%BA%A1i%20x%C3%A0%20b%C3%B4ng%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20t%E1%BA%A9y%20l%C3%AAn%20h%C3%ACnh%20in.%20M%E1%BA%B9%20n%C3%AAn%20h%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20m%E1%BB%81m%20v%E1%BA%A3i%20v%C3%AC%20n%C3%B3%20s%E1%BA%BD%20l%C3%A0m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BB%8B%20gi%C3%A3n%20r%E1%BA%A5t%20nhanh%20v%C3%A0%20khi%E1%BA%BFn%20h%C3%ACnh%20in%20b%E1%BB%8B%20m%E1%BB%81m', 0, 'https://www.bexinhshop.vn/image/data/9-7-2021/aohoodie4.jpg\n', b'0', 'Áo hoodie sọc', 145000, NULL, 1),
(77, '2021-12-21 16:16:42', '%C3%81o%20hoodie%20b%C3%B2%20s%E1%BB%AFa%20HOTTREND%20cho%20b%C3%A9%20trai%20%26%20b%C3%A9%20g%C3%A1i.%0A%20%C3%81o%20n%C3%B3n%20ph%E1%BB%91i%202%20tai%20xin%20x%E1%BA%AFn%20ch%E1%BA%A5t%20thun%20cotton%204c%20in%20s%E1%BA%AFc%20s%E1%BA%A3o.%20Size%20nhi%CC%81%202-9.%20Size%20%C4%91a%CC%A3i%2010-15.', 'V%C3%B2%20b%E1%BA%B1ng%20tay%20v%E1%BB%9Bi%20l%E1%BA%A7n%20gi%E1%BA%B7t%20%C4%91%E1%BA%A7u%20ti%C3%AAn', 0, 'https://www.bexinhshop.vn/image/data/26-6-2021/aohoodiebosuatrang1_1.jpg\n', b'0', 'Áo hoodie bò sữa', 200000, NULL, 10),
(78, '2021-12-21 16:16:42', '%C3%81o%20thun%20ga%CC%82n%20vie%CC%82%CC%80n%20ren%20cho%20be%CC%81%20iu%20die%CC%A3%CC%82n%20nga%CC%80y%20he%CC%80%20ru%CC%9B%CC%A3c%20ro%CC%9B%CC%83.%20%0ACha%CC%82%CC%81t%20thun%20ga%CC%82n%20nh%E1%BA%ADp%20cao%20ca%CC%82%CC%81p%20me%CC%82%CC%80m%20mi%CC%A3n%2C%20tha%CC%82%CC%81m%20hu%CC%81t%20mo%CC%82%CC%80%20ho%CC%82i.%20%0AVie%CC%82%CC%80n%20ren%20sang%20tro%CC%A3ng.%20Nhi%CC%81%20sz%202-9.%20%C4%90a%CC%A3i%20sz%2010-15.', '-%20Kh%C3%B4ng%20%C4%91%E1%BB%95%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20c%C3%A1c%20lo%E1%BA%A1i%20x%C3%A0%20b%C3%B4ng%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20t%E1%BA%A9y%20l%C3%AAn%20h%C3%ACnh%20in.%20M%E1%BA%B9%20n%C3%AAn%20h%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20m%E1%BB%81m%20v%E1%BA%A3i%20v%C3%AC%20n%C3%B3%20s%E1%BA%BD%20l%C3%A0m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BB%8B%20gi%C3%A3n%20r%E1%BA%A5t%20nhanh%20v%C3%A0%20khi%E1%BA%BFn%20h%C3%ACnh%20in%20b%E1%BB%8B%20m%E1%BB%81m', 0, 'https://www.bexinhshop.vn/image/data/10-5-2021/aothunganvienrentrang.jpg\n', b'0', 'Áo thui gân viền ren', 100000, NULL, 10),
(79, '2021-12-21 16:16:42', '%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20%0AS%E1%BA%A3n%20ph%E1%BA%A9m%20%0A50%25%0A10%0AD56%0A%0A%C3%81o%20thun%20b%C3%A9%20g%C3%A1i%20b%E1%BB%99%20si%C3%AAu%20t%E1%BA%ADp%20nh%C3%A2n%20v%E1%BA%ADt%20ho%E1%BA%A1t%20h%C3%ACnh%20th%E1%BB%A7y%20th%E1%BB%A7%20m%E1%BA%B7t%20tr%C4%83ng.%20%0ACh%E1%BA%A5t%20li%E1%BB%87u%20thun%20cotton%20gi%C3%A3n%204c%20m%E1%BB%8Bn%20x%E1%BB%8Bn%20th%E1%BA%A5m%20m%E1%BB%93%20h%C3%B4i%0A.%20H%C3%ACnh%20in%20cao%20c%E1%BA%A5p%20s%E1%BA%AFc%20n%C3%A9t%2C%20kh%C3%B4ng%20bong%20tr%C3%B3c.%20Size%20%C4%90%E1%BA%A1i%209-15.%0AScreen%20reader%20support%20enabled.%0A%20%0A%20%0A%20%09%09%0A%C3%81o%20thun%20b%C3%A9%20g%C3%A1i%20b%E1%BB%99%20si%C3%AAu%20t%E1%BA%ADp%20nh%C3%A2n%20v%E1%BA%ADt%20ho%E1%BA%A1t%20h%C3%ACnh%20th%E1%BB%A7y%20th%E1%BB%A7%20m%E1%BA%B7t%20tr%C4%83ng.%20%0ACh%E1%BA%A5t%20li%E1%BB%87u%20thun%20cotton%20gi%C3%A3n%204c%20m%E1%BB%8Bn%20x%E1%BB%8Bn%20th%E1%BA%A5m%20m%E1%BB%93%20h%C3%B4i%0A.%20H%C3%ACnh%20in%20cao%20c%E1%BA%A5p%20s%E1%BA%AFc%20n%C3%A9t%2C%20kh%C3%B4ng%20bong%20tr%C3%B3c.%20Size%20%C4%90%E1%BA%A1i%209-15.%0A', 'V%C3%B2%20b%E1%BA%B1ng%20tay%20v%E1%BB%9Bi%20l%E1%BA%A7n%20gi%E1%BA%B7t%20%C4%91%E1%BA%A7u%20ti%C3%AAn', 0, 'https://www.bexinhshop.vn/image/data/10-5-2021/aothuythumattrangtrang.jpg\n', b'0', 'Áo thui hình thủy thủ mặt trăng', 120000, NULL, 10),
(80, '2021-12-21 16:16:42', '%C3%81o%20ba%20l%E1%BB%97%20cho%20b%C3%A9%20m%E1%BA%B7c%20h%C3%A8%20th%E1%BA%ADt%20n%C4%83ng%20%C4%91%E1%BB%99ng%20v%C3%A0%20tho%E1%BA%A3i%20m%C3%A1t.%20B%C3%A9%20trai%20hay%20g%C3%A1i%20%C4%91%E1%BB%81u%20m%E1%BA%B7c%20%C4%91%C6%B0%E1%BB%A3c%2C%20%0Ar%E1%BA%A5t%20d%E1%BB%85%20ph%E1%BB%91i%20%C4%91%E1%BB%93.%20Ch%E1%BA%A5t%20li%E1%BB%87u%20thun%20cotton%20th%E1%BA%A5m%20h%C3%BAt%20m%E1%BB%93%20h%C3%B4i%20t%E1%BB%91t.%0A%20C%C3%B3%205%20m%C3%A0u%3A%20cam%2C%20tr%E1%BA%AFng%2C%20v%C3%A0ng%2C%20H%E1%BB%93ng%2C%20%C4%91en.%20Nh%C3%AD%20Size%201-8.%20%C4%90%E1%BA%A1i%20Size%209-15.', '-%20Kh%C3%B4ng%20%C4%91%E1%BB%95%20tr%E1%BB%B1c%20ti%E1%BA%BFp%20c%C3%A1c%20lo%E1%BA%A1i%20x%C3%A0%20b%C3%B4ng%20ho%E1%BA%B7c%20n%C6%B0%E1%BB%9Bc%20t%E1%BA%A9y%20l%C3%AAn%20h%C3%ACnh%20in.%20M%E1%BA%B9%20n%C3%AAn%20h%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20c%C3%A1c%20lo%E1%BA%A1i%20n%C6%B0%E1%BB%9Bc%20x%E1%BA%A3%20m%E1%BB%81m%20v%E1%BA%A3i%20v%C3%AC%20n%C3%B3%20s%E1%BA%BD%20l%C3%A0m%20s%E1%BA%A3n%20ph%E1%BA%A9m%20b%E1%BB%8B%20gi%C3%A3n%20r%E1%BA%A5t%20nhanh%20v%C3%A0%20khi%E1%BA%BFn%20h%C3%ACnh%20in%20b%E1%BB%8B%20m%E1%BB%81m', 0, 'https://www.bexinhshop.vn/image/data/1-4-2021/aosatnachtronden.jpg\n', b'0', 'Áo sát nách', 300000, NULL, 10),
(81, '2021-12-21 16:16:42', 'Ch%E1%BA%AFc%20ch%E1%BA%AFn%20s%E1%BA%BD%20khi%E1%BA%BFn%20cho%20b%C3%A9%20y%C3%AAu%20nh%C3%A0%20b%E1%BA%A1n%20tr%E1%BB%9F%20n%C3%AAn%20%C4%91%C3%A1ng%20y%C3%AAu%20h%C6%A1n%20ngay%20c%E1%BA%A3%20khi%20%C4%83n.', 'Set%202%20y%E1%BA%BFm%20%C4%83n%20d%E1%BA%B7m%20b%E1%BA%A5m%20c%C3%BAc%20KidsPlaza%20BA21(H%E1%BB%93ng)%20gi%C3%BAp%20gi%E1%BB%AF%20cho%20qu%E1%BA%A7n%20%C3%A1o%20b%C3%A9%20y%C3%AAu%20lu%C3%B4n%20s%E1%BA%A1ch%20s%E1%BA%BD%20v%C3%A0%20ti%E1%BB%87n%20s%E1%BB%AD%20d%E1%BB%A5ng%20lau%20ch%C3%B9i%20ch%E1%BA%A5t%20b%E1%BA%A9n%20cho%20b%C3%A9%20khi%20%C4%83n%20u%E1%BB%91ng%20b%E1%BB%8B%20v%E1%BA%A5y%20b%E1%BA%A9n%20ra%20ngo%C3%A0i.%0AH%C6%B0%E1%BB%9Bng%20d%E1%BA%ABn%20s%E1%BB%AD%20d%E1%BB%A5ng%3A%0AH%E1%BA%A1n%20ch%E1%BA%BF%20d%C3%B9ng%20s%E1%BA%A3n%20ph%E1%BA%A9m%20gi%E1%BA%B7t%20t%E1%BA%A9y.%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20s%E1%BA%A3n%20ph%E1%BA%A9m%20ra%20m%C3%A0u.%0A%0AKh%C3%B4ng%20ng%C3%A2m%2C%20gi%E1%BA%B7t%20chung%20v%E1%BB%9Bi%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng%20%3E30%20%C4%91%E1%BB%99%20C.%0A%0AN%C3%AAu%20%E1%BB%A7i%20m%E1%BA%B7t%20tr%C3%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m.%0A%0ACh%E1%BA%A5t%20li%E1%BB%87u%3A%20100%25%20cotton%0A%0AK%C3%ADch%20th%C6%B0%E1%BB%9Bc%3A%2018%2C5%20x%2026cm%0A%0A%C4%90%C3%B3ng%20g%C3%B3i%3A%202%20chi%E1%BA%BFc%2Fset%0A%0AC%C3%B4ng%20d%E1%BB%A5ng%3A%20Gi%E1%BB%AF%20%E1%BA%A5m%20c%E1%BB%95%2C%20tr%C3%A1nh%20r%C3%A2y%20b%E1%BA%A9n%20ra%20qu%E1%BA%A7n%20%C3%A1o%20khi%20%C4%83n%20u%E1%BB%91ng%20hay%20ti%20m%E1%BA%B9%0A%0AXu%E1%BA%A5t%20x%E1%BB%A9%3A%20Vi%E1%BB%87t%20Nam%0A%0AC%E1%BA%A3nh%20c%C3%A1o%3A%20tr%C3%A1nh%20xa%20l%E1%BB%ADa%2C%20s%E1%BA%A3n%20ph%E1%BA%A9m%20d%E1%BB%85%20ch%C3%A1y.', 0, 'https://cdn.kidsplaza.vn/media/catalog/product/cache/e99dffa409453610a1fc54e724b09ba6/s/e/set-2-yem-an-ct-mothers-choice-hong-xam-1.jpg\n', b'0', 'Set 2 yếm ăn CT Mothers Choice ', 165000, NULL, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `property`
--

CREATE TABLE `property` (
  `idproperty` bigint(20) NOT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `property`
--

INSERT INTO `property` (`idproperty`, `is_delete`, `name`) VALUES
(1, b'0', 'Nâu'),
(2, b'0', 'Trắng'),
(3, b'0', 'Hồng'),
(4, b'0', 'Cam'),
(5, b'0', 'Tím '),
(6, b'0', 'Vàng'),
(7, b'0', 'Xanh'),
(8, b'0', 'Đỏ'),
(9, b'0', 'Đen'),
(10, b'0', 'Xám');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quantity`
--

CREATE TABLE `quantity` (
  `id` bigint(20) NOT NULL,
  `idproduct` bigint(20) DEFAULT NULL,
  `idproperty` bigint(20) DEFAULT NULL,
  `idsize` bigint(20) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `quantity` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `quantity`
--

INSERT INTO `quantity` (`id`, `idproduct`, `idproperty`, `idsize`, `is_delete`, `quantity`) VALUES
(1, 1, 1, 3, b'0', 1000),
(2, 1, 1, 2, b'0', 1000),
(3, 2, 6, 3, b'0', 4998),
(4, 2, 6, 2, b'0', 4999),
(5, 2, 6, 1, b'0', 5000),
(6, 3, 7, 9, b'0', 994),
(7, 3, 7, 6, b'0', 1000),
(8, 3, 10, 4, b'0', 1000),
(9, 3, 10, 3, b'0', 1000),
(10, 3, 10, 2, b'0', 1000),
(11, 4, 8, 1, b'0', 5000),
(12, 4, 8, 2, b'0', 5000),
(13, 4, 8, 3, b'0', 5000),
(14, 4, 8, 4, b'0', 5000),
(15, 4, 8, 5, b'0', 5000),
(16, 4, 9, 6, b'0', 5000),
(17, 4, 9, 7, b'0', 5000),
(18, 4, 9, 8, b'0', 5000),
(19, 4, 9, 9, b'0', 5000),
(20, 4, 9, 10, b'0', 5000),
(21, 5, 10, 1, b'0', 1495),
(22, 5, 10, 2, b'0', 1500),
(23, 5, 10, 3, b'0', 1500),
(24, 5, 10, 4, b'0', 1500),
(25, 5, 10, 5, b'0', 1500),
(26, 5, 10, 6, b'0', 1500),
(27, 5, 10, 7, b'0', 1500),
(28, 6, 9, 4, b'0', 1000),
(29, 6, 9, 4, b'0', 1000),
(30, 6, 9, 4, b'0', 1000),
(31, 6, 9, 3, b'0', 1000),
(32, 6, 5, 3, b'0', 1000),
(33, 6, 4, 3, b'0', 1000),
(34, 6, 5, 3, b'0', 1000),
(35, 6, 5, 3, b'0', 1000),
(36, 6, 5, 4, b'0', 1000),
(37, 6, 10, 4, b'0', 1000),
(38, 7, 7, 5, b'0', 5000),
(39, 7, 7, 4, b'0', 5000),
(40, 7, 7, 3, b'0', 5000),
(41, 7, 7, 2, b'0', 5000),
(42, 7, 7, 1, b'0', 5000),
(43, 7, 7, 6, b'0', 5000),
(44, 7, 7, 7, b'0', 5000),
(45, 8, 6, 1, b'0', 5000),
(46, 8, 6, 2, b'0', 5000),
(47, 8, 6, 3, b'0', 5000),
(48, 8, 6, 4, b'0', 5000),
(49, 8, 6, 5, b'0', 5000),
(50, 8, 6, 6, b'0', 5000),
(51, 8, 6, 7, b'0', 5000),
(52, 8, 6, 8, b'0', 5000),
(53, 8, 6, 9, b'0', 5000),
(54, 8, 6, 10, b'0', 5000),
(55, 9, 7, 1, b'0', 495),
(56, 9, 7, 2, b'0', 500),
(57, 9, 7, 3, b'0', 496),
(58, 9, 7, 4, b'0', 500),
(59, 9, 7, 5, b'0', 500),
(60, 9, 7, 6, b'0', 499),
(61, 9, 7, 7, b'0', 500),
(62, 9, 7, 8, b'0', 500),
(63, 9, 7, 9, b'0', 500),
(64, 9, 7, 10, b'0', 500),
(65, 10, 7, 1, b'0', 984),
(66, 10, 7, 2, b'0', 1000),
(67, 10, 7, 3, b'0', 1000),
(68, 10, 7, 4, b'0', 1000),
(69, 10, 7, 5, b'0', 1000),
(70, 10, 7, 6, b'0', 1000),
(71, 10, 7, 7, b'0', 1000),
(72, 10, 7, 8, b'0', 1000),
(73, 10, 7, 9, b'0', 1000),
(74, 10, 7, 10, b'0', 1000),
(75, 11, 8, 1, b'0', 1479),
(76, 11, 8, 2, b'0', 1500),
(77, 11, 8, 3, b'0', 1500),
(78, 11, 8, 4, b'0', 1500),
(79, 11, 8, 5, b'0', 1500),
(80, 11, 8, 6, b'0', 1500),
(81, 11, 8, 7, b'0', 1500),
(82, 12, 7, 1, b'0', 1983),
(83, 12, 7, 2, b'0', 1999),
(84, 12, 7, 3, b'0', 1982),
(85, 12, 7, 4, b'0', 2000),
(86, 12, 7, 5, b'0', 2000),
(87, 12, 7, 6, b'0', 2000),
(88, 12, 7, 7, b'0', 2000),
(89, 13, 6, 2, b'0', 3000),
(90, 45, 7, 1, b'0', 477),
(91, 46, 7, 1, b'0', 500),
(92, 47, 7, 1, b'0', 500),
(93, 48, 7, 1, b'0', 500),
(94, 49, 7, 1, b'0', 500),
(95, 50, 7, 1, b'0', 500),
(96, 51, 7, 1, b'0', 500),
(97, 52, 7, 1, b'0', 500),
(98, 53, 7, 1, b'0', 500),
(99, 54, 7, 1, b'0', 500),
(100, 55, 7, 1, b'0', 482),
(101, 56, 7, 1, b'0', 500),
(102, 57, 7, 1, b'0', 500),
(103, 58, 7, 1, b'0', 500),
(104, 59, 7, 1, b'0', 500),
(105, 60, 7, 1, b'0', 500),
(106, 61, 7, 1, b'0', 500),
(107, 62, 7, 1, b'0', 500),
(108, 63, 7, 1, b'0', 500),
(109, 64, 7, 1, b'0', 492),
(110, 65, 7, 1, b'0', 500),
(111, 66, 7, 1, b'0', 500),
(112, 67, 7, 1, b'0', 498),
(113, 29, 7, 1, b'0', 500),
(114, 45, 7, 2, b'0', 500),
(115, 46, 7, 2, b'0', 500),
(116, 47, 7, 2, b'0', 500),
(117, 48, 7, 2, b'0', 500),
(118, 49, 7, 2, b'0', 497),
(119, 50, 7, 2, b'0', 500),
(120, 51, 7, 2, b'0', 500),
(121, 52, 3, 2, b'0', 500),
(122, 53, 3, 2, b'0', 500),
(123, 54, 3, 2, b'0', 500),
(124, 55, 3, 2, b'0', 500),
(125, 56, 3, 2, b'0', 500),
(126, 57, 3, 2, b'0', 500),
(127, 58, 3, 2, b'0', 500),
(128, 59, 3, 2, b'0', 500),
(129, 60, 3, 2, b'0', 500),
(130, 61, 3, 2, b'0', 500),
(131, 62, 3, 2, b'0', 500),
(132, 63, 3, 2, b'0', 500),
(133, 64, 3, 2, b'0', 500),
(134, 65, 3, 2, b'0', 500),
(135, 66, 3, 2, b'0', 500),
(136, 67, 3, 2, b'0', 495),
(137, 29, 3, 2, b'0', 500),
(138, 45, 2, 3, b'0', 500),
(139, 46, 2, 3, b'0', 500),
(140, 47, 2, 3, b'0', 500),
(141, 48, 2, 3, b'0', 500),
(142, 49, 2, 3, b'0', 500),
(143, 50, 2, 3, b'0', 500),
(144, 51, 2, 3, b'0', 500),
(145, 52, 2, 3, b'0', 500),
(146, 53, 2, 3, b'0', 500),
(147, 54, 2, 3, b'0', 500),
(148, 55, 2, 3, b'0', 500),
(149, 56, 2, 3, b'0', 500),
(150, 57, 2, 3, b'0', 500),
(151, 58, 2, 3, b'0', 500),
(152, 59, 2, 3, b'0', 500),
(153, 60, 2, 3, b'0', 500),
(154, 61, 2, 3, b'0', 500),
(155, 62, 2, 3, b'0', 500),
(156, 63, 2, 3, b'0', 476),
(157, 64, 2, 3, b'0', 500),
(158, 65, 2, 3, b'0', 500),
(159, 66, 2, 3, b'0', 500),
(160, 67, 2, 3, b'0', 500),
(161, 29, 2, 3, b'0', 500),
(162, 45, 4, 4, b'0', 600),
(163, 46, 4, 4, b'0', 600),
(164, 47, 4, 4, b'0', 600),
(165, 48, 4, 4, b'0', 600),
(166, 49, 4, 4, b'0', 600),
(167, 50, 4, 4, b'0', 600),
(168, 51, 4, 4, b'0', 600),
(169, 52, 4, 4, b'0', 600),
(170, 53, 4, 4, b'0', 600),
(171, 54, 4, 4, b'0', 600),
(172, 55, 4, 4, b'0', 600),
(173, 56, 4, 4, b'0', 600),
(174, 57, 4, 4, b'0', 600),
(175, 58, 4, 4, b'0', 600),
(176, 59, 4, 4, b'0', 600),
(177, 60, 4, 4, b'0', 600),
(178, 61, 4, 4, b'0', 600),
(179, 62, 4, 4, b'0', 600),
(180, 63, 4, 4, b'0', 593),
(181, 64, 4, 4, b'0', 600),
(182, 65, 4, 4, b'0', 600),
(183, 66, 4, 4, b'0', 600),
(184, 67, 4, 4, b'0', 600),
(185, 29, 4, 4, b'0', 600),
(186, 45, 7, 2, b'0', 700),
(187, 46, 7, 2, b'0', 700),
(188, 47, 7, 2, b'0', 700),
(189, 48, 7, 2, b'0', 700),
(190, 49, 7, 2, b'0', 700),
(191, 50, 7, 2, b'0', 700),
(192, 51, 7, 2, b'0', 700),
(193, 52, 7, 2, b'0', 700),
(194, 53, 7, 2, b'0', 700),
(195, 54, 7, 2, b'0', 700),
(196, 55, 7, 2, b'0', 700),
(197, 56, 7, 2, b'0', 700),
(198, 57, 7, 2, b'0', 700),
(199, 58, 7, 2, b'0', 700),
(200, 59, 7, 2, b'0', 700),
(201, 60, 7, 2, b'0', 700),
(202, 61, 7, 2, b'0', 700),
(203, 62, 7, 2, b'0', 700),
(204, 63, 7, 2, b'0', 700),
(205, 64, 7, 2, b'0', 690),
(206, 65, 7, 2, b'0', 700),
(207, 66, 7, 2, b'0', 700),
(208, 67, 7, 2, b'0', 691),
(209, 29, 7, 2, b'0', 700),
(210, 52, 3, 1, b'0', 620),
(211, 53, 3, 1, b'0', 620),
(212, 54, 3, 1, b'0', 620),
(213, 55, 3, 1, b'0', 620),
(214, 56, 3, 1, b'0', 620),
(215, 57, 3, 1, b'0', 620),
(216, 58, 3, 1, b'0', 620),
(217, 59, 3, 1, b'0', 620),
(218, 60, 3, 1, b'0', 620),
(219, 61, 3, 1, b'0', 620),
(220, 62, 3, 1, b'0', 620),
(221, 63, 3, 1, b'0', 620),
(222, 64, 3, 1, b'0', 620),
(223, 65, 3, 1, b'0', 620),
(224, 66, 3, 1, b'0', 620),
(225, 67, 3, 1, b'0', 619),
(226, 29, 3, 1, b'0', 620),
(272, 68, 3, 1, b'0', 700),
(273, 69, 3, 1, b'0', 700),
(274, 70, 3, 1, b'0', 693),
(275, 71, 3, 1, b'0', 700),
(276, 72, 3, 1, b'0', 667),
(277, 73, 3, 1, b'0', 692),
(278, 74, 3, 1, b'0', 681),
(279, 75, 3, 1, b'0', 700),
(280, 76, 3, 1, b'0', 700),
(281, 77, 3, 1, b'0', 700),
(282, 78, 3, 1, b'0', 700),
(283, 79, 3, 1, b'0', 700),
(284, 80, 3, 1, b'0', 700),
(285, 81, 3, 1, b'0', 700),
(286, 68, 3, 2, b'0', 700),
(287, 69, 3, 2, b'0', 700),
(288, 70, 3, 2, b'0', 700),
(289, 71, 3, 2, b'0', 700),
(290, 72, 3, 2, b'0', 700),
(291, 73, 3, 2, b'0', 700),
(292, 74, 3, 2, b'0', 700),
(293, 75, 3, 2, b'0', 700),
(294, 76, 3, 2, b'0', 700),
(295, 77, 3, 2, b'0', 700),
(296, 78, 3, 2, b'0', 700),
(297, 79, 3, 2, b'0', 700),
(298, 80, 3, 2, b'0', 700),
(299, 81, 3, 2, b'0', 700),
(300, 68, 3, 3, b'0', 700),
(301, 69, 3, 3, b'0', 699),
(302, 70, 3, 3, b'0', 700),
(303, 71, 3, 3, b'0', 700),
(304, 72, 3, 3, b'0', 700),
(305, 73, 3, 3, b'0', 700),
(306, 74, 3, 3, b'0', 700),
(307, 75, 3, 3, b'0', 700),
(308, 76, 3, 3, b'0', 700),
(309, 77, 3, 3, b'0', 700),
(310, 78, 3, 3, b'0', 700),
(311, 79, 3, 3, b'0', 700),
(312, 80, 3, 3, b'0', 700),
(313, 81, 3, 3, b'0', 682),
(314, 68, 3, 4, b'0', 700),
(315, 69, 3, 4, b'0', 700),
(316, 70, 3, 4, b'0', 700),
(317, 71, 3, 4, b'0', 650),
(318, 72, 3, 4, b'0', 650),
(319, 73, 3, 4, b'0', 628),
(320, 74, 3, 4, b'0', 650),
(321, 75, 3, 4, b'0', 650),
(322, 76, 3, 4, b'0', 650),
(323, 77, 3, 4, b'0', 650),
(324, 78, 3, 4, b'0', 650),
(325, 79, 3, 4, b'0', 650),
(326, 80, 3, 4, b'0', 650),
(327, 81, 3, 4, b'0', 650),
(328, 68, 3, 5, b'0', 650),
(329, 69, 3, 5, b'0', 650),
(330, 70, 3, 5, b'0', 650),
(331, 71, 3, 5, b'0', 650),
(332, 72, 3, 5, b'0', 650),
(333, 73, 3, 5, b'0', 650),
(334, 74, 3, 5, b'0', 650),
(335, 75, 3, 5, b'0', 650),
(336, 76, 3, 5, b'0', 650),
(337, 77, 3, 5, b'0', 650),
(338, 78, 3, 5, b'0', 650),
(339, 79, 3, 5, b'0', 650),
(340, 80, 3, 5, b'0', 650),
(341, 81, 3, 5, b'0', 650),
(342, 68, 7, 1, b'0', 650),
(343, 69, 7, 1, b'0', 650),
(344, 70, 7, 1, b'0', 646),
(345, 71, 7, 1, b'0', 650),
(346, 72, 7, 1, b'0', 650),
(347, 73, 7, 1, b'0', 650),
(348, 74, 7, 1, b'0', 648),
(349, 75, 7, 1, b'0', 650),
(350, 76, 7, 1, b'0', 650),
(351, 77, 7, 1, b'0', 650),
(352, 78, 7, 1, b'0', 650),
(353, 79, 7, 1, b'0', 650),
(354, 80, 7, 1, b'0', 650),
(355, 81, 7, 1, b'0', 650),
(356, 68, 7, 2, b'0', 650),
(357, 69, 7, 2, b'0', 650),
(358, 70, 7, 2, b'0', 650),
(359, 71, 7, 2, b'0', 650),
(360, 72, 7, 2, b'0', 650),
(361, 73, 7, 2, b'0', 650),
(362, 74, 7, 2, b'0', 650),
(363, 75, 7, 2, b'0', 650),
(364, 76, 7, 2, b'0', 650),
(365, 77, 7, 2, b'0', 650),
(366, 78, 7, 2, b'0', 650),
(367, 79, 7, 2, b'0', 650),
(368, 80, 7, 2, b'0', 650),
(369, 81, 7, 2, b'0', 650),
(370, 68, 7, 3, b'0', 650),
(371, 69, 7, 3, b'0', 650),
(372, 70, 7, 3, b'0', 650),
(373, 71, 7, 3, b'0', 650),
(374, 72, 7, 3, b'0', 650),
(375, 73, 7, 3, b'0', 650),
(376, 74, 7, 3, b'0', 648),
(377, 75, 7, 3, b'0', 650),
(378, 76, 7, 3, b'0', 650),
(379, 77, 7, 3, b'0', 650),
(380, 78, 7, 3, b'0', 650),
(381, 79, 7, 3, b'0', 650),
(382, 80, 7, 3, b'0', 650),
(383, 81, 7, 3, b'0', 650),
(384, 68, 7, 4, b'0', 650),
(385, 69, 7, 4, b'0', 650),
(386, 70, 7, 4, b'0', 650),
(387, 71, 7, 4, b'0', 650),
(388, 72, 7, 4, b'0', 650),
(389, 73, 7, 4, b'0', 650),
(390, 74, 7, 4, b'0', 650),
(391, 75, 7, 4, b'0', 650),
(392, 76, 7, 4, b'0', 650),
(393, 77, 7, 4, b'0', 650),
(394, 78, 7, 4, b'0', 650),
(395, 79, 7, 4, b'0', 650),
(396, 80, 7, 4, b'0', 650),
(397, 81, 7, 4, b'0', 650),
(398, 68, 4, 1, b'0', 650),
(399, 69, 4, 1, b'0', 648),
(400, 70, 4, 1, b'0', 645),
(401, 71, 4, 1, b'0', 650),
(402, 72, 4, 1, b'0', 650),
(403, 73, 4, 1, b'0', 647),
(404, 74, 4, 1, b'0', 650),
(405, 75, 4, 1, b'0', 650),
(406, 76, 4, 1, b'0', 650),
(407, 77, 4, 1, b'0', 650),
(408, 78, 4, 1, b'0', 650),
(409, 79, 4, 1, b'0', 650),
(410, 80, 4, 1, b'0', 650),
(411, 68, 4, 2, b'0', 650),
(412, 69, 4, 2, b'0', 650),
(413, 70, 4, 2, b'0', 650),
(414, 71, 4, 2, b'0', 650),
(415, 72, 4, 2, b'0', 650),
(416, 73, 4, 2, b'0', 650),
(417, 74, 4, 2, b'0', 650),
(418, 75, 4, 2, b'0', 650),
(419, 76, 4, 2, b'0', 650),
(420, 77, 4, 2, b'0', 650),
(421, 78, 4, 2, b'0', 650),
(422, 79, 4, 2, b'0', 650),
(423, 80, 4, 2, b'0', 650),
(424, 81, 4, 2, b'0', 650),
(425, 68, 4, 3, b'0', 650),
(426, 69, 4, 3, b'0', 650),
(427, 70, 4, 3, b'0', 650),
(428, 71, 4, 3, b'0', 650),
(429, 72, 4, 3, b'0', 650),
(430, 73, 4, 3, b'0', 650),
(431, 74, 4, 3, b'0', 650),
(432, 75, 4, 3, b'0', 650),
(433, 76, 4, 3, b'0', 650),
(434, 77, 4, 3, b'0', 650),
(435, 78, 4, 3, b'0', 650),
(436, 79, 4, 3, b'0', 650),
(437, 80, 4, 3, b'0', 650),
(438, 81, 4, 3, b'0', 650),
(439, 68, 4, 4, b'0', 650),
(440, 69, 4, 4, b'0', 650),
(441, 70, 4, 4, b'0', 650),
(442, 71, 4, 4, b'0', 650),
(443, 72, 4, 4, b'0', 650),
(444, 73, 4, 4, b'0', 650),
(445, 74, 4, 4, b'0', 650),
(446, 75, 4, 4, b'0', 650),
(447, 76, 4, 4, b'0', 650),
(448, 77, 4, 4, b'0', 650),
(449, 78, 4, 4, b'0', 650),
(450, 79, 4, 4, b'0', 650),
(451, 80, 4, 4, b'0', 650),
(452, 81, 4, 4, b'0', 650),
(453, 68, 5, 1, b'0', 650),
(454, 69, 5, 1, b'0', 650),
(455, 70, 5, 1, b'0', 648),
(456, 71, 5, 1, b'0', 650),
(457, 72, 5, 1, b'0', 650),
(458, 73, 5, 1, b'0', 650),
(459, 74, 5, 1, b'0', 650),
(460, 75, 5, 1, b'0', 650),
(461, 76, 5, 1, b'0', 650),
(462, 77, 5, 1, b'0', 650),
(463, 78, 5, 1, b'0', 650),
(464, 79, 5, 1, b'0', 650),
(465, 80, 5, 1, b'0', 650),
(466, 81, 5, 1, b'0', 650),
(467, 68, 5, 2, b'0', 650),
(468, 69, 5, 2, b'0', 650),
(469, 70, 5, 2, b'0', 650),
(470, 71, 5, 2, b'0', 650),
(471, 72, 5, 2, b'0', 650),
(472, 73, 5, 2, b'0', 650),
(473, 74, 5, 2, b'0', 650),
(474, 75, 5, 2, b'0', 650),
(475, 76, 5, 2, b'0', 650),
(476, 77, 5, 2, b'0', 650),
(477, 78, 5, 2, b'0', 650),
(478, 79, 5, 2, b'0', 650),
(479, 80, 5, 2, b'0', 650),
(480, 81, 5, 2, b'0', 650),
(481, 68, 5, 3, b'0', 650),
(482, 69, 5, 3, b'0', 650),
(483, 70, 5, 3, b'0', 650),
(484, 71, 5, 3, b'0', 650),
(485, 72, 5, 3, b'0', 650),
(486, 73, 5, 3, b'0', 650),
(487, 74, 5, 3, b'0', 650),
(488, 75, 5, 3, b'0', 650),
(489, 76, 5, 3, b'0', 650),
(490, 77, 5, 3, b'0', 650),
(491, 78, 5, 3, b'0', 650),
(492, 79, 5, 3, b'0', 650),
(493, 80, 5, 3, b'0', 650),
(494, 81, 5, 3, b'0', 650),
(495, 68, 5, 4, b'0', 650),
(496, 69, 5, 4, b'0', 650),
(497, 70, 5, 4, b'0', 650),
(498, 71, 5, 4, b'0', 650),
(499, 72, 5, 4, b'0', 643),
(500, 73, 5, 4, b'0', 650),
(501, 74, 5, 4, b'0', 650),
(502, 75, 5, 4, b'0', 650),
(503, 76, 5, 4, b'0', 650),
(504, 77, 5, 4, b'0', 650),
(505, 78, 5, 4, b'0', 650),
(506, 79, 5, 4, b'0', 650),
(507, 80, 5, 4, b'0', 650),
(508, 81, 5, 4, b'0', 650);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` varchar(255) NOT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `is_delete`, `name`) VALUES
('admin', b'0', 'ROLE_ADMIN'),
('customer', b'0', 'ROLE_CUSTOMER'),
('staff', b'0', 'ROLE_STAFF');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `id` bigint(20) NOT NULL,
  `idtypesize` bigint(20) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`id`, `idtypesize`, `is_delete`, `name`) VALUES
(1, 1, b'0', 'S'),
(2, 1, b'0', 'M'),
(3, 1, b'0', 'L'),
(4, 1, b'0', 'X'),
(5, 1, b'0', 'XL'),
(6, 1, b'0', 'XXL'),
(7, 2, b'0', '27'),
(8, 2, b'0', '28'),
(9, 2, b'0', '29'),
(10, 2, b'0', '30'),
(11, 2, b'0', '31'),
(12, 2, b'0', '32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `typesize`
--

CREATE TABLE `typesize` (
  `id` bigint(20) NOT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `typesize`
--

INSERT INTO `typesize` (`id`, `is_delete`, `name`) VALUES
(1, b'0', 'size áo'),
(2, b'0', 'size quần');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `id` bigint(20) NOT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `idevent` bigint(20) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `minimum_value` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `voucher`
--

INSERT INTO `voucher` (`id`, `amount`, `discount`, `idevent`, `is_delete`, `minimum_value`, `name`) VALUES
(2, 999996, 10, 1, b'0', 250000, 'Giảm giá 10% khi đơn hàng đạt giá trị tối thiểu đạt 250.000đ'),
(3, 999999, 15, 1, b'0', 500000, 'Giảm giá 15% khi giá trị đơn hàng tối thiểu đạt 500.000đ'),
(4, 999998, 20, 1, b'0', 1000000, 'Giám giá 20% khi giá trị đơn hàng tối thiểu đạt 1.000.000đ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucherbill`
--

CREATE TABLE `voucherbill` (
  `id` bigint(20) NOT NULL,
  `idbill` varchar(255) DEFAULT NULL,
  `idvoucher` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKncl1gtt7t331upcg7rddvj9vj` (`idaccount`),
  ADD KEY `FKi570k7pe9w31qvlcmxt333a1g` (`idrole`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3o67ubbefq5abxtyfgtk4ccah` (`idcustomer`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categorydetail`
--
ALTER TABLE `categorydetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlrh4n5y81q99f1x8gxyiiuqt3` (`idcategory`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1savooi98wcrj0psfl6k58cs4` (`idaccount`);

--
-- Chỉ mục cho bảng `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`idhistory`),
  ADD KEY `FK59nbp0ghx7g8iebodnmks6gkm` (`idmamipay`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKd22a3ngeh8gmdqf6f0o2yyvf4` (`idproduct`);

--
-- Chỉ mục cho bảng `mamipay`
--
ALTER TABLE `mamipay`
  ADD PRIMARY KEY (`idmamipay`),
  ADD KEY `FKjcgsihrxw3gj3s19xnu22t95l` (`idcustomer`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9yjctm2rciajdpa964m9qdgyg` (`idbill`),
  ADD KEY `FKq1mtoptdrshhwlro4ahbyfnn6` (`idquantity`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlbb79r57uo00vilam5nnoiygn` (`idcategorydetail`);

--
-- Chỉ mục cho bảng `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`idproperty`);

--
-- Chỉ mục cho bảng `quantity`
--
ALTER TABLE `quantity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh2qtl7h7ynhxm9wo6yi1n1rjt` (`idproduct`),
  ADD KEY `FKfdrshit48y8m7dpc5o28ycv39` (`idproperty`),
  ADD KEY `FKlvc18d58ymg5styas5jjoutop` (`idsize`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2hl9ad77yxfetcwgaq8hpp0e1` (`idtypesize`);

--
-- Chỉ mục cho bảng `typesize`
--
ALTER TABLE `typesize`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgy12uin6fd3aug5k4x6glw8y2` (`idevent`);

--
-- Chỉ mục cho bảng `voucherbill`
--
ALTER TABLE `voucherbill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKb6p9wwxtwd9k859l99tv5ve7q` (`idbill`),
  ADD KEY `FKtbffdw80q5ttcbasj3viqpwfp` (`idvoucher`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `authority`
--
ALTER TABLE `authority`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `categorydetail`
--
ALTER TABLE `categorydetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `event`
--
ALTER TABLE `event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `idhistory` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT cho bảng `mamipay`
--
ALTER TABLE `mamipay`
  MODIFY `idmamipay` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT cho bảng `property`
--
ALTER TABLE `property`
  MODIFY `idproperty` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `quantity`
--
ALTER TABLE `quantity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=509;

--
-- AUTO_INCREMENT cho bảng `size`
--
ALTER TABLE `size`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `typesize`
--
ALTER TABLE `typesize`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `voucherbill`
--
ALTER TABLE `voucherbill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `authority`
--
ALTER TABLE `authority`
  ADD CONSTRAINT `FKi570k7pe9w31qvlcmxt333a1g` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FKncl1gtt7t331upcg7rddvj9vj` FOREIGN KEY (`idaccount`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK3o67ubbefq5abxtyfgtk4ccah` FOREIGN KEY (`idcustomer`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `categorydetail`
--
ALTER TABLE `categorydetail`
  ADD CONSTRAINT `FKlrh4n5y81q99f1x8gxyiiuqt3` FOREIGN KEY (`idcategory`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK1savooi98wcrj0psfl6k58cs4` FOREIGN KEY (`idaccount`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK59nbp0ghx7g8iebodnmks6gkm` FOREIGN KEY (`idmamipay`) REFERENCES `mamipay` (`idmamipay`);

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FKd22a3ngeh8gmdqf6f0o2yyvf4` FOREIGN KEY (`idproduct`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `mamipay`
--
ALTER TABLE `mamipay`
  ADD CONSTRAINT `FKjcgsihrxw3gj3s19xnu22t95l` FOREIGN KEY (`idcustomer`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `FK9yjctm2rciajdpa964m9qdgyg` FOREIGN KEY (`idbill`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `FKq1mtoptdrshhwlro4ahbyfnn6` FOREIGN KEY (`idquantity`) REFERENCES `quantity` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKlbb79r57uo00vilam5nnoiygn` FOREIGN KEY (`idcategorydetail`) REFERENCES `categorydetail` (`id`);

--
-- Các ràng buộc cho bảng `quantity`
--
ALTER TABLE `quantity`
  ADD CONSTRAINT `FKfdrshit48y8m7dpc5o28ycv39` FOREIGN KEY (`idproperty`) REFERENCES `property` (`idproperty`),
  ADD CONSTRAINT `FKh2qtl7h7ynhxm9wo6yi1n1rjt` FOREIGN KEY (`idproduct`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKlvc18d58ymg5styas5jjoutop` FOREIGN KEY (`idsize`) REFERENCES `size` (`id`);

--
-- Các ràng buộc cho bảng `size`
--
ALTER TABLE `size`
  ADD CONSTRAINT `FK2hl9ad77yxfetcwgaq8hpp0e1` FOREIGN KEY (`idtypesize`) REFERENCES `typesize` (`id`);

--
-- Các ràng buộc cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `FKgy12uin6fd3aug5k4x6glw8y2` FOREIGN KEY (`idevent`) REFERENCES `event` (`id`);

--
-- Các ràng buộc cho bảng `voucherbill`
--
ALTER TABLE `voucherbill`
  ADD CONSTRAINT `FKb6p9wwxtwd9k859l99tv5ve7q` FOREIGN KEY (`idbill`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `FKtbffdw80q5ttcbasj3viqpwfp` FOREIGN KEY (`idvoucher`) REFERENCES `voucher` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
