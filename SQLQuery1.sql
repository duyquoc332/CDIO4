-- Tạo bảng DanhMuc trước vì SanPham phụ thuộc vào nó
CREATE TABLE [DanhMuc] (
    [MaDanhMuc] varchar(50) NOT NULL PRIMARY KEY,
    [TenDanhMuc] nvarchar(100) NOT NULL
);
GO

-- Tạo bảng SanPham 
CREATE TABLE [SanPham] (
    [MaSanPham] varchar(50) NOT NULL PRIMARY KEY,
    [MaDanhMuc] varchar(50) NULL,
    [TenSanPham] nvarchar(200) NOT NULL,
    [Gia] decimal(18,0) DEFAULT 0, -- Dùng decimal cho tiền tệ chuẩn hơn float
    [MoTa] nvarchar(MAX) NULL,     -- nvarchar(MAX) thay cho ntext
    [TonKho] int DEFAULT 0,
    [HinhAnh] nvarchar(500) NULL,  -- Cột lưu đường dẫn ảnh (VD: ~/Images/sp1.jpg)
    
    CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY ([MaDanhMuc]) REFERENCES [DanhMuc] ([MaDanhMuc])
);
GO

CREATE TABLE [NguoiDung] (
    [MaNguoiDung] varchar(50) NOT NULL PRIMARY KEY,
    [HoTen] nvarchar(50) NOT NULL, -- Dùng nvarchar cho tên có dấu
    [Email] varchar(100) UNIQUE,
    [MatKhau] varchar(255) NOT NULL,
    [SDT] varchar(15) NULL,
    [DiaChi] nvarchar(255) NULL,
    [VaiTro] varchar(20) NOT NULL, -- Admin/User
    [NgayTao] datetime DEFAULT GETDATE()
);
GO

CREATE TABLE [GioHang] (
    [MaGioHang] varchar(50) NOT NULL PRIMARY KEY,
    [MaNguoiDung] varchar(50) NULL,
    [MaSanPham] varchar(50) NULL,
    [SoLuong] int NOT NULL DEFAULT 1,

    CONSTRAINT [FK_GioHang_NguoiDung] FOREIGN KEY ([MaNguoiDung]) REFERENCES [NguoiDung] ([MaNguoiDung]),
    CONSTRAINT [FK_GioHang_SanPham] FOREIGN KEY ([MaSanPham]) REFERENCES [SanPham] ([MaSanPham])
);
GO

CREATE TABLE [DonHang] (
    [MaDonHang] varchar(50) NOT NULL PRIMARY KEY,
    [MaNguoiDung] varchar(50) NULL,
    [NgayDat] datetime DEFAULT GETDATE(),
    [TongTien] decimal(18,0) DEFAULT 0,
    [Trangthai] nvarchar(50) DEFAULT N'Chờ xử lý',
    [DiaChiGiao] nvarchar(255) NOT NULL,

    CONSTRAINT [FK_DonHang_NguoiDung] FOREIGN KEY ([MaNguoiDung]) REFERENCES [NguoiDung] ([MaNguoiDung])
);
GO

CREATE TABLE [ChiTietDonHang] (
    [MaChiTiet] int IDENTITY(1,1) PRIMARY KEY, -- Tự động tăng ID
    [MaDonHang] varchar(50) NULL,
    [MaSanPham] varchar(50) NULL,
    [SoLuong] int DEFAULT 1,
    [DonGia] decimal(18,0) DEFAULT 0,

    CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY ([MaDonHang]) REFERENCES [DonHang] ([MaDonHang]),
    CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY ([MaSanPham]) REFERENCES [SanPham] ([MaSanPham])
);
GO

CREATE TABLE [ThanhToan] (
    [MaThanhToan] varchar(50) NOT NULL PRIMARY KEY,
    [MaDonHang] varchar(50) NULL,
    [PhuongThuc] nvarchar(50) NOT NULL, -- VD: COD, Chuyen khoan
    [SoTien] decimal(18,0) NOT NULL,
    [NgayThanhToan] datetime DEFAULT GETDATE(),

    CONSTRAINT [FK_ThanhToan_DonHang] FOREIGN KEY ([MaDonHang]) REFERENCES [DonHang] ([MaDonHang])
);
GO

CREATE TABLE [DanhGia] (
    [MaDanhGia] int IDENTITY(1,1) PRIMARY KEY, -- Tự động tăng ID
    [MaSanPham] varchar(50) NULL,
    [MaNguoiDung] varchar(50) NULL,
    [DiemSo] int NOT NULL CHECK (DiemSo >= 1 AND DiemSo <= 5), -- Ràng buộc điểm 1-5
    [BinhLuan] nvarchar(500) NULL,
    [NgayDanhGia] datetime DEFAULT GETDATE(),

    CONSTRAINT [FK_DanhGia_NguoiDung] FOREIGN KEY ([MaNguoiDung]) REFERENCES [NguoiDung] ([MaNguoiDung]),
    CONSTRAINT [FK_DanhGia_SanPham] FOREIGN KEY ([MaSanPham]) REFERENCES [SanPham] ([MaSanPham])
);
GO