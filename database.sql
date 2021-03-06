USE [master]
GO
/****** Object:  Database [Project_2]    Script Date: 11/26/2019 7:07:09 PM ******/
CREATE DATABASE [Project_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Project_2.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Project_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Project_2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Project_2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_2] SET RECOVERY FULL 
GO
ALTER DATABASE [Project_2] SET  MULTI_USER 
GO
ALTER DATABASE [Project_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Project_2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project_2', N'ON'
GO
USE [Project_2]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/26/2019 7:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 11/26/2019 7:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 11/26/2019 7:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Thumbnail] [nvarchar](50) NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Status] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CountViewer] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/26/2019 7:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CountShow] [int] NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/26/2019 7:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Amount] [float] NOT NULL,
	[OrderBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/26/2019 7:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CountShow] [int] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/26/2019 7:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/26/2019 7:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'UEFA Champions League')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Premier League')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'BundesLiga')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Serie A')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Vietnamese football')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Laliga')
INSERT [dbo].[Locations] ([Id], [Name], [UnitPrice], [Image]) VALUES (1, N'A1', 200, N'a1.jpg')
INSERT [dbo].[Locations] ([Id], [Name], [UnitPrice], [Image]) VALUES (2, N'A2', 100, N'a2.jpg')
INSERT [dbo].[Locations] ([Id], [Name], [UnitPrice], [Image]) VALUES (3, N'A3', 80, N'a1.jpg')
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CategoryId], [CountViewer]) VALUES (1016, N'Việt Nam huỷ diệt Brunei 6-0 trận mở màn SEA Games 30', N'Phong độ xuất thần của Hà Đức Chinh giúp U22 Việt Nam khởi đầu thuận lợi trong trận ra quân SEA Games 30 gặp U22 Brunei.', N'<p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; line-height: 20px; border: 0px; font-size: 15px; vertical-align: baseline; background: rgb(255, 255, 255); text-align: justify; overflow-wrap: break-word !important;"><font face="arial">Đúng như&nbsp;<a href="https://thethao247.vn/296-sea-games-30-u22-viet-nam-se-su-dung-doi-hinh-phu-o-tran-ra-quan-d193346.html" target="_blank" style="margin: 0px; padding: 0px; list-style: none; outline: none; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; cursor: pointer; display: inline; line-height: 24px !important; font-size: 16px !important; color: rgb(20, 91, 150) !important; overflow-wrap: break-word !important;">tuyên bố</a>&nbsp;trước đó, HLV Park đã cất toàn bộ những cầu thủ chủ chốt như Quang Hải, Hùng Dũng, Văn Hậu,... trên băng ghế dự bị nhưng với các nhân tố có mặt trên sân, U22 Việt Nam vẫn đủ sức áp đảo đối thủ U22 Brunei.</font></p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; line-height: 20px; border: 0px; font-size: 15px; vertical-align: baseline; background: rgb(255, 255, 255); text-align: justify; overflow-wrap: break-word !important;"><font face="arial">Với mũi công Đức Chinh đá cao nhất, mọi đường bóng được dồn đến chân cầu thủ SHB Đà Nẵng. Ngay ở giây thứ 16, Đức Chinh đã có pha uy hiếp khung thành đối phương nhưng cú sút đi không chính xác.</font></p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; line-height: 20px; border: 0px; font-size: 15px; vertical-align: baseline; background: rgb(255, 255, 255); text-align: justify; overflow-wrap: break-word !important;"><font face="arial">Cơ hội thứ hai đến ngay sau đó khi Tấn Sinh được giao trách nhiệm sút phạt, cú sút căng như kẻ chỉ đã bị Asmin Jabidi xuất sắc cản phá. Dẫu có hay đến mấy thì thủ thành này cũng khó có thể đỡ được tất cả các cú sút của cầu thủ U22 Việt Nam.</font></p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; line-height: 20px; border: 0px; font-size: 15px; vertical-align: baseline; background: rgb(255, 255, 255); text-align: justify; overflow-wrap: break-word !important;"><font face="arial">Trong lần thứ hai có cơ hội, Đức Chinh đã không bỏ lỡ. Phút thứ 10, Hoàng Đức và Thái Quý phối hợp đá phạt ở biên trước khi mở góc rất thoáng đưa bóng vào trong cho Đức Chinh bật cao đánh đầu.</font></p>', N'chin_zing_1.jpg', N'Tran thanh', CAST(N'2019-11-25' AS Date), 1, 5, 2)
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CategoryId], [CountViewer]) VALUES (1017, N'Ghi 3 bàn trong 7 phút, MU hòa Sheffield sau 90 phút ''điên rồ''', N'Một cơn mưa bàn thắng điên rồ đã diễn ra trên SVĐ Bramall Lane, trong trận đấu mà MU chỉ chơi tốt trong 20 phút cuối trước đối thủ Sheffield đầy bản lĩnh. ', N'<p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 17px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: &quot;Times New Roman&quot;, Georgia, serif, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 25px !important; overflow-wrap: break-word !important;">Với phong độ ấn tượng gần đây, chủ nhà Sheffield nhập cuộc đầy tự tin trong cuộc đón tiếp MU. Lundstram và các đồng đội dồn ép đối thủ ngay từ tiếng còi khai cuộc, và rồi liên tiếp những cơ hội ăn bàn đến với đội chủ nhà.</p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 17px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: &quot;Times New Roman&quot;, Georgia, serif, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 25px !important; overflow-wrap: break-word !important;">Sau 3 cơ hội mười mươi bị khước từ bởi sự xuất sắc của De Gea, cuối cùng thì Sheffield cũng đã có được điều mình cần. Phút 19, từ một tình huống phối hợp nhanh, cú đá của Lundstram bị cản phá bởi De Gea trước khi Fleck lao vào đá bồi chính xác, mở tỷ số trận đấu.</p>', N'1.jpg', N'Tran thanh', CAST(N'2019-11-25' AS Date), 1, 2, 0)
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CategoryId], [CountViewer]) VALUES (1018, N'''Cướp'' bàn thắng của Ronaldo, Ramsey đi vào lịch sử Juventus', N'Aaron Ramsey đã ''cướp trắng'' bàn thắng của người đồng đội Ronaldo trong một tình huống bóng lăn trên vạch vôi, bàn thắng này đã đưa Ramsey đi vào lịch sử Juventus.', N'<p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 17px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: &quot;Times New Roman&quot;, Georgia, serif, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 25px !important; overflow-wrap: break-word !important;">Ramsey chính là cầu thủ hiện tên lên bảng điện tử trong bàn thắng mở tỉ số của Juventus. Đây là trận đấu mà&nbsp;<a href="https://thethao247.vn/317-ket-qua-lokomotiv-moscow-vs-juventus-vong-bang-cup-c1-2019-2020-d192044.html" target="_blank" style="margin: 0px; padding: 0px; list-style: none; outline: none; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; cursor: pointer; display: inline; line-height: 25px !important; color: rgb(20, 91, 150) !important; overflow-wrap: break-word !important;">Juve nhọc nhằn giành chiến thắng trên sân của Lokomotiv Moscow</a>, với 2 pha lập công của Ramsey và Douglas Costa. Điều đáng nói, bàn thắng Ramsey ghi được nhờ công lớn của Ronaldo.</p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 17px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: &quot;Times New Roman&quot;, Georgia, serif, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 25px !important; overflow-wrap: break-word !important;">Ngay phút thi đấu thứ 5, Juventus được hưởng quả đá phạt cố định chếch về phía bên trái. Như thường lệ, CR7 là người thực hiện. Pha dứt điểm sau đó của Ronaldo là không khó nhưng thủ thành Guilherme bên phía Lokomotiv đã lóng ngóng xử lí lỗi. Anh bắt trượt, để bóng lọt qua 2 chân. Trong tình huống này, bóng trên đà lăn từ từ vào gôn trước sự nỗ lực băng về cản phá của Guilherme. Tưởng như bàn thắng đã được ghi cho CR7, thì người đồng đội Aaron Ramsey nhanh chân băng vào đá bồi. Dù sau đó Ramsey có ý hướng về phía Ronaldo với thông điệp "số 7" mới là người ghi bàn, nhưng bảng tỉ số vẫn hiện tên của cầu thủ xứ Wales.</p>', N'EItXmbfXYAE2jGe.jpg', N'Tran thanh', CAST(N'2019-11-25' AS Date), 1, 1, 0)
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CategoryId], [CountViewer]) VALUES (1019, N'Đè bẹp Dortmund, Bayern Munich chứng minh ai mới là kẻ mạnh', N'Bayern Munich có thể sa sút, nhưng mỗi khi đối đầu với Dortmund thì họ luôn trở lại là một CLB hùng mạnh nhất. Trận đấu ở vòng 11 Bundesliga đã chứng minh điều đó.', N'<p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 17px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: &quot;Times New Roman&quot;, Georgia, serif, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 25px !important; overflow-wrap: break-word !important;">Tiếp đà hưng phấn, Bayern Munich liên tục tổ chức tấn công về phía khung thành Dortmund nhưng chưa thể đem về bàn thắng thứ 2. Sau đó đội chủ nhà chủ động cầm bóng chắc để thăm dò sơ hở của Dortmund khi nhận thấy đội bóng này chấp nhận chơi phòng ngự.</p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 17px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: &quot;Times New Roman&quot;, Georgia, serif, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 25px !important; overflow-wrap: break-word !important;">Dortmund thậm chí còn không có cú dứt điểm nào trúng đích trong hiệp 1 và đành chấp nhận kết quả 1-0 của hiệp 1.</p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 17px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: &quot;Times New Roman&quot;, Georgia, serif, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 25px !important; overflow-wrap: break-word !important;">Sang hiệp 2, Bayern Munich tiếp tục thể hiện sự tinh quái hơn so với các cầu thủ non nớt của Dortmund. Khi mà đội bóng áo vàng đen dâng cao thì bất ngờ nhận phải đòn phản công của Bayern Munich. Thomas Muller lên bóng đầy tốc độ bên cánh trái rồi căng ngang cho Gnabry dứt điểm tung lưới Burki ở phút 47.</p>', N'gettyimages-1186549288-612x612.jpg', N'Tran thanh', CAST(N'2019-11-25' AS Date), 1, 3, 0)
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CategoryId], [CountViewer]) VALUES (1020, N'Vắng Ronaldo, Juve lội ngược dòng hú vía nhờ sao thất sủng', N'Gặp phải rất nhiều khó khăn khi nhận bàn thua sớm ở hiệp 2 và thiếu vắng Ronaldo, Juve đã lội ngược dòng trước Atalanta nhờ cái tên từng bị hắt hủi.', N'<p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 17px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: &quot;Times New Roman&quot;, Georgia, serif, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 25px !important; overflow-wrap: break-word !important;">Thiếu vắng Ronaldo, nhưng Juventus của HLV Maurizio Sarri nhập cuộc khá mạch lạc. Về phần Atalanta, họ không hề chọn cách phòng ngự trước nhà ĐKVĐ mà sẵn sàng đôi công, xứng đáng là đội từng cầm hòa Man City của Pep.</p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 17px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: &quot;Times New Roman&quot;, Georgia, serif, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 25px !important; overflow-wrap: break-word !important;">Thậm chí, Juventus suýt nữa phải ôm hận khi cầu thủ Atalanta bị đốn ngã trong vòng cấm. Rất may là sau đó Barrow đã đưa bóng chạm xà ngang trong tình huống đá phạt đền.</p>', N'gettyimages-1184125718-612x612.jpg', N'Tran thanh', CAST(N'2019-11-25' AS Date), 1, 4, 0)
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CategoryId], [CountViewer]) VALUES (1022, N'Bảng xếp hạng bóng đá SEA Games 30: U22 Việt Nam đầu bảng', N'Bảng xếp hạng bóng đá SEA Games 30 - Với chiến thắng hủy diệt trước U22 Brunei, U22 Việt Nam đã vươn lên dẫn đầu bảng B.', N'<span style="margin: 0px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 16px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 24px !important; overflow-wrap: break-word !important;">Tại SEA Games 2019, U22 Việt Nam nằm tại bảng B cùng U22 Thái Lan, U22 Indonesia, U22 Singapore, U22 Lào và U22 Brunei. Chúng tôi sẽ liên tục cập nhật&nbsp;</span><em style="margin: 0px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 16px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 24px !important; overflow-wrap: break-word !important;">lịch thi đấu, kết quả, bảng xếp hạng bóng đá Seagames 30</em><span style="margin: 0px; padding: 0px; list-style: none; outline: 0px; border: 0px; font-size: 16px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(34, 34, 34); text-align: justify; line-height: 24px !important; overflow-wrap: break-word !important;">&nbsp;của U22 Việt Nam...</span><br>', N'2312.jpg', N'Tran thanh', CAST(N'2019-11-25' AS Date), 1, 1, 0)
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CategoryId], [CountViewer]) VALUES (1023, N'Đương kim Á quân SEA Games gây thất vọng ở trận mở màn', N'Được đánh giá cao hơn nhưng trước một U22 Myanmar thi đấu đầy quả cảm, U22 Malaysia đã không thể có chiến thắng ở trận ra quân SEA Games 30.', N'<p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; line-height: 20px; border: 0px; font-size: 15px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: Roboto, Arial, Helvetica, sans-serif; text-align: justify; overflow-wrap: break-word !important;">Với tư cách là những nhà đương kim Á quân SEA Games, U22 Malaysia nhập cuộc đầy tự tin, nhưng chính U22 Myanmar mới là đội gây nên bất ngờ.</p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; line-height: 20px; border: 0px; font-size: 15px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: Roboto, Arial, Helvetica, sans-serif; text-align: justify; overflow-wrap: break-word !important;">Đoàn quân của HLV Popov là đội kiểm soát thế trận tốt hơn, và rất nhiều cơ hội được các cầu thủ Myanmar tạo ra về phía khung thành U22 Malaysia. Phút 13, điều gì cần đến cũng phải đến. Từ một tình huống phối hợp phạt góc, Soe Moe Kyaw đánh đầu chính xác mở tỷ số cho đội bóng bị đánh giá thấp hơn.</p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; line-height: 20px; border: 0px; font-size: 15px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: Roboto, Arial, Helvetica, sans-serif; text-align: justify; overflow-wrap: break-word !important;">Những phút sau đó, U22 Myanmar tiếp tục là đội chơi dồn ép. Họ liên tiếp tạo ra những cơ hội ăn bàn, thế nhưng chỉ một tình huống mất tập trung đã khiến Myanmar phải trả giá.</p><p style="margin-bottom: 14px; padding: 0px; list-style: none; outline: 0px; line-height: 20px; border: 0px; font-size: 15px; vertical-align: baseline; background: rgb(255, 255, 255); font-family: Roboto, Arial, Helvetica, sans-serif; text-align: justify; overflow-wrap: break-word !important;">Phút 24, hậu vệ Myanmar chuyền bóng hớ hênh ở sân nhà, tạo điều kiện cho U22 Malaysia cướp bóng chớp nhoáng trước khi Hadi Fayyadh đánh đầu quân bình tỷ số 1-1.</p>', N'u22-malaysia-vs-u22-myanmar.jpg', N'Tran thanh', CAST(N'2019-11-26' AS Date), 1, 5, 1)
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CategoryId], [CountViewer]) VALUES (1024, N'Đức Chinh tạo nên cột mốc mới dưới thời HLV Park Hang-seo', N'Với 4 pha lập công trong trận gặp U22 Brunei, Đức Chinh là người đầu tiên ghi hơn 2 bàn mỗi trận kể từ khi ông Park Hang-seo trở thành HLV trưởng các đội tuyển quốc gia Việt Nam.', N'<span style="font-family: &quot;Noto Serif&quot;, serif; font-size: 17.6px; background-color: rgb(255, 255, 255);">Chiều 25/11, U22 Việt Nam bắt đầu hành trình "săn vàng" SEA Games 30 bằng trận đấu với U22 Brunei. Trên sân Binan, các học trò của HLV Park đã giành chiến thắng 6-0, với 4 bàn thắng của Đức Chinh.&nbsp;</span><br>', N'chinh_zing.jpg', N'Tran thanh', CAST(N'2019-11-26' AS Date), 1, 5, 0)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [UnitPrice], [Quantity], [CountShow], [Image], [OrderId], [ProductId], [Status]) VALUES (17, 1000, 5, 436, N'qua-tang-mua-he.jpg', 46, 60, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderDate], [Amount], [OrderBy]) VALUES (46, CAST(N'2019-11-26' AS Date), 1000, N'Sir Alex Ferguson')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [UnitPrice], [Quantity], [CountShow], [Image], [LocationId]) VALUES (1, 200, 1, 5, N'4.jpg', 1)
INSERT [dbo].[Products] ([Id], [UnitPrice], [Quantity], [CountShow], [Image], [LocationId]) VALUES (60, 200, 1, 100, N'qua-tang-mua-he.jpg', 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'user')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'journalist')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (4, N'client')
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'addUser', N'1234567', N'test@gmail.com', N'user.png', 2)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'admin', N'123456', N'admin@gmail.com', N'user.png', 1)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'Bui Duc Thang', N'123456', N'buducthang@gmail.com', N'user.png', 3)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'client', N'123456', N'client@gmail.com', N'client.png', 4)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'Client 2', N'123456', N'client@gmail.com', N'CH5Z3597_1.jpg', 2)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'fanmu147', N'123456', N'fanmu@gmail.com', N'user.png', 2)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'nhabao', N'123456', N'nhabao@gmail.com', N'nhabao.png', 3)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'nhabao_2', N'123456', N'nhabao_2@gmail.com', N'e1.jpg', 3)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'nhabao2', N'123456', N'nhabao2@gmail.com', N'nhabao.png', 3)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'ronaldo', N'123456', N'ronaldo@gmail.com', N'images.jpg', 2)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'Sir Alex Ferguson', N'123456', N'SirAlexFerguson@gmail.com', N'sir-alex-ferguson.jpg', 4)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'test', N'123456', N'test@gmail.com', N'cover.png', 1)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'test 2', N'123456', N'thinht@gmail', N'user.png', 1)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'Tran Le Thanh Thinh', N'1234567', N'thinh@gmail.com', N'user.png', 1)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'Tran thanh', N'123456', N'tranthanh@gmail.com', N'qua-tang-mua-he.jpg', 3)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'Tran Van Teo', N'123456', N'teotv@gmail.com', N'user.png', 4)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'TrieuVy', N'123456', N'', N'user.png', 3)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'user1', N'123456', N'user@gmail.com', N'user1.png', 2)
INSERT [dbo].[Users] ([Id], [Password], [Email], [Photo], [RoleId]) VALUES (N'user123', N'123456789', N'user123@gmail.com', N'0_FILEPHOTOPremierLeagueArsenalvCrystalPalace.jpg', 2)
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Project_2] SET  READ_WRITE 
GO
