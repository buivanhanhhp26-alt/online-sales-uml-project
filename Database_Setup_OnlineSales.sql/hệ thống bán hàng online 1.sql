-- 1. Tạo bảng Danh mục sản phẩm (Categories)
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255)
);

-- 2. Tạo bảng Sản phẩm (Products)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(200) NOT NULL,
    CategoryID INT,
    Price DECIMAL(18, 2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    ProductDescription NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 3. Tạo bảng Người dùng/Khách hàng (Users)
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15),
    Address NVARCHAR(255),
    Role NVARCHAR(20) DEFAULT 'Customer', -- Admin hoặc Customer
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- 4. Tạo bảng Đơn hàng (Orders)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(18, 2),
    Status NVARCHAR(50) DEFAULT 'Pending', -- Đang xử lý, Đã giao, Hủy...
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- 5. Tạo bảng Chi tiết đơn hàng (OrderItems)
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);