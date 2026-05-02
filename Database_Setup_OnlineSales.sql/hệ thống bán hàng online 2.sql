-- 1. Chèn dữ liệu vào Categories (Danh mục)
INSERT INTO Categories (CategoryName, Description) VALUES 
(N'Điện thoại', N'Các dòng Smartphone thế hệ mới'),
(N'Laptop', N'Máy tính xách tay làm việc và đồ họa'),
(N'Phụ kiện', N'Chuột, bàn phím, tai nghe');

-- 2. Chèn dữ liệu vào Products (Sản phẩm)
-- Lưu ý: CategoryID 1=Điện thoại, 2=Laptop, 3=Phụ kiện
INSERT INTO Products (ProductName, CategoryID, Price, StockQuantity, ProductDescription) VALUES 
(N'iPhone 15 Pro', 1, 28000000, 15, N'Màu Titan, 128GB'),
(N'MacBook Air M3', 2, 32000000, 10, N'Chip Apple M3 mới nhất'),
(N'Tai nghe Bluetooth', 3, 1500000, 50, N'Âm thanh sống động, pin 24h'),
(N'Samsung S24 Ultra', 1, 30000000, 8, N'Bút S-Pen thông minh'),
(N'Chuột không dây', 3, 350000, 100, N'Thiết kế công thái học');

-- 3. Chèn dữ liệu vào Users (Người dùng)
INSERT INTO Users (FullName, Email, PasswordHash, PhoneNumber, Address, Role) VALUES 
(N'Nguyễn Phương Linh', 'phuonglinh@gmail.com', 'pass_hashed_1', '0912345678', N'Hà Nội, Việt Nam', 'Admin'),
(N'Trần Văn Nam', 'namtran@gmail.com', 'pass_hashed_2', '0987654321', N'TP. Hồ Chí Minh', 'Customer'),
(N'Lê Thu Hà', 'halethu@gmail.com', 'pass_hashed_3', '0905556667', N'Đà Nẵng, Việt Nam', 'Customer');

-- 4. Chèn dữ liệu vào Orders (Đơn hàng)
-- Giả sử UserID 2 và 3 mua hàng
INSERT INTO Orders (UserID, TotalAmount, Status) VALUES 
(2, 29500000, N'Đã giao hàng'), -- Tổng tiền iPhone + Tai nghe
(3, 350000, N'Đang xử lý');     -- Tổng tiền Chuột

-- 5. Chèn dữ liệu vào OrderItems (Chi tiết đơn hàng)
-- Đơn hàng 1 (OrderID 1): Mua 1 iPhone (ID 1) và 1 Tai nghe (ID 3)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES 
(1, 1, 1, 28000000),
(1, 3, 1, 1500000);

-- Đơn hàng 2 (OrderID 2): Mua 1 Chuột (ID 5)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES 
(2, 5, 1, 350000);