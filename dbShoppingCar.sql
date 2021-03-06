USE [dbshoppingCar]
GO
/****** Object:  Table [dbo].[tAdmin]    Script Date: 2021/5/12 20:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAdmin](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fUserId] [nvarchar](50) NULL,
	[fPwd] [nvarchar](50) NULL,
 CONSTRAINT [PK_tAdmin] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tMember]    Script Date: 2021/5/12 20:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMember](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fUserId] [nvarchar](50) NULL,
	[fPwd] [nvarchar](50) NULL,
	[fName] [nvarchar](50) NULL,
	[fEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_tMember] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tOrder]    Script Date: 2021/5/12 20:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrder](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fOrderGuid] [nvarchar](50) NOT NULL,
	[fUserId] [nvarchar](50) NULL,
	[fReceiver] [nvarchar](50) NULL,
	[fEmail] [nvarchar](50) NULL,
	[fAddress] [nvarchar](50) NULL,
	[fDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[fOrderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tOrderDetail]    Script Date: 2021/5/12 20:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrderDetail](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fOrderGuid] [nvarchar](50) NULL,
	[fUserId] [nvarchar](50) NULL,
	[fPId] [nvarchar](50) NULL,
	[fName] [nvarchar](50) NULL,
	[fPrice] [int] NULL,
	[fQty] [int] NULL,
	[fIsApproved] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProduct]    Script Date: 2021/5/12 20:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProduct](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fPId] [nvarchar](50) NULL,
	[fName] [nvarchar](50) NULL,
	[fPrice] [int] NULL,
	[fImg] [nvarchar](50) NULL,
	[fContent] [nvarchar](200) NULL,
	[fQuantity] [int] NULL,
 CONSTRAINT [PK_tProduct] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tAdmin] ON 

INSERT [dbo].[tAdmin] ([fId], [fUserId], [fPwd]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[tAdmin] OFF
SET IDENTITY_INSERT [dbo].[tMember] ON 

INSERT [dbo].[tMember] ([fId], [fUserId], [fPwd], [fName], [fEmail]) VALUES (1, N'jim', N'123456', N'jim', N'jim99@gmail.com')
SET IDENTITY_INSERT [dbo].[tMember] OFF
SET IDENTITY_INSERT [dbo].[tProduct] ON 

INSERT [dbo].[tProduct] ([fId], [fPId], [fName], [fPrice], [fImg], [fContent], [fQuantity]) VALUES (1, N'A01', N'关二哥的那根', 999999999, N'A001.png', N'关老爷子手上的终极兵器,手刃颜良文丑,容易上手,下标前请先到关庙掷筊询价。', 2)
INSERT [dbo].[tProduct] ([fId], [fPId], [fName], [fPrice], [fImg], [fContent], [fQuantity]) VALUES (2, N'A02', N'杜X斯泡泡糖(综合口味)', 500, N'A002.png', N'知名品牌杜X斯泡泡糖新品,弹性极佳,吹泡泡绝不破也戳不破,任您吹任您戳,口味有薄合、莓果等...。', 100)
INSERT [dbo].[tProduct] ([fId], [fPId], [fName], [fPrice], [fImg], [fContent], [fQuantity]) VALUES (3, N'A03', N'国产芭乐', 100, N'grenade.png', N'土生土长,有机种植,绝无喷洒农药,清甜可口,嘎嘣脆。', 55)
INSERT [dbo].[tProduct] ([fId], [fPId], [fName], [fPrice], [fImg], [fContent], [fQuantity]) VALUES (4, N'A04', N'濒死C300', 2760000, N'Benz-C300.png', N'C300宝石蓝。双B人人爱,本店双B的品质保证就像执政党的选前政见,订购就送终身残废险。

', 25)
INSERT [dbo].[tProduct] ([fId], [fPId], [fName], [fPrice], [fImg], [fContent], [fQuantity]) VALUES (5, N'A05', N'饱马530i

', 3250000, N'BMW-5.png

', N'530i 亮黑。双B人人爱,本店双B的品质保证就像执政党的选前政见,订购就送终身残废险。', 24)
INSERT [dbo].[tProduct] ([fId], [fPId], [fName], [fPrice], [fImg], [fContent], [fQuantity]) VALUES (6, N'A06', N'网红阿帕契', 88888888, N'helicopter.png', N'知名李姓艺人拍照打卡的阿帕契,耐战好上手,歼灭自己人不手软。', 2)
INSERT [dbo].[tProduct] ([fId], [fPId], [fName], [fPrice], [fImg], [fContent], [fQuantity]) VALUES (7, N'A07', N'抄家武装犀牛', 66666666, N'tank.png', N'总是烦恼被欺负吗?来本店买抄家神器就对了!!现在购买即赠送教战手册。

', 7)
INSERT [dbo].[tProduct] ([fId], [fPId], [fName], [fPrice], [fImg], [fContent], [fQuantity]) VALUES (8, N'A08', N'旅人救世剑', 7878978, N'sword.png', N'旅行必备!!!旅行途中难免会有些不如意之事,身边有把剑也是很符合逻辑。', 87)
INSERT [dbo].[tProduct] ([fId], [fPId], [fName], [fPrice], [fImg], [fContent], [fQuantity]) VALUES (9, N'A09', N'百步穿杨GG枪

', 74745104, N'sniper.png', N'枪如其名,暗杀敌人利器,让使用者百步穿杨,射了就GG。', 78)
SET IDENTITY_INSERT [dbo].[tProduct] OFF
ALTER TABLE [dbo].[tOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tOrder] FOREIGN KEY([fOrderGuid])
REFERENCES [dbo].[tOrder] ([fOrderGuid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tOrderDetail] CHECK CONSTRAINT [FK_tOrderDetail_tOrder]
GO
