USE [master]
GO
/****** Object:  Database [Mandiri]    Script Date: 11/06/2022 12:30:48 ******/
CREATE DATABASE [Mandiri]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mandiri', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Mandiri.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Mandiri_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Mandiri_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Mandiri] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mandiri].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mandiri] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mandiri] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mandiri] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mandiri] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mandiri] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mandiri] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mandiri] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mandiri] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mandiri] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mandiri] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mandiri] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mandiri] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mandiri] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mandiri] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mandiri] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mandiri] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mandiri] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mandiri] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mandiri] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mandiri] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mandiri] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mandiri] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mandiri] SET RECOVERY FULL 
GO
ALTER DATABASE [Mandiri] SET  MULTI_USER 
GO
ALTER DATABASE [Mandiri] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mandiri] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mandiri] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mandiri] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mandiri] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mandiri] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Mandiri', N'ON'
GO
ALTER DATABASE [Mandiri] SET QUERY_STORE = OFF
GO
USE [Mandiri]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[skillID] [int] IDENTITY(1,1) NOT NULL,
	[skillName] [varchar](500) NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[skillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillLevel]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillLevel](
	[skillLevelID] [int] IDENTITY(1,1) NOT NULL,
	[skillLevelName] [varchar](505) NULL,
 CONSTRAINT [PK_SkillLevel] PRIMARY KEY CLUSTERED 
(
	[skillLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[username] [nvarchar](50) NOT NULL,
	[name] [varchar](50) NULL,
	[address] [nvarchar](500) NULL,
	[bod] [date] NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSkills]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSkills](
	[userSkillId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[skillID] [int] NULL,
	[skillLevelID] [int] NULL,
 CONSTRAINT [PK_UserSkills] PRIMARY KEY CLUSTERED 
(
	[userSkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([skillID], [skillName]) VALUES (2, N'admin')
INSERT [dbo].[Skill] ([skillID], [skillName]) VALUES (3, N'admin2')
INSERT [dbo].[Skill] ([skillID], [skillName]) VALUES (4, N'admin3')
SET IDENTITY_INSERT [dbo].[Skill] OFF
GO
SET IDENTITY_INSERT [dbo].[SkillLevel] ON 

INSERT [dbo].[SkillLevel] ([skillLevelID], [skillLevelName]) VALUES (1, N'Test123')
SET IDENTITY_INSERT [dbo].[SkillLevel] OFF
GO
INSERT [dbo].[User] ([username], [password]) VALUES (N'admin', N'admin')
INSERT [dbo].[User] ([username], [password]) VALUES (N'admin2', N'Mandiri123')
INSERT [dbo].[User] ([username], [password]) VALUES (N'admin3', N'Mandiri123')
INSERT [dbo].[User] ([username], [password]) VALUES (N'adminzxc', N'Mandiri123')
INSERT [dbo].[User] ([username], [password]) VALUES (N'June', N'Mandiri123')
GO
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'admin', N'Tariq', N'Jakarta', CAST(N'2022-06-11' AS Date), N'tariqalfath@gmail.com')
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'admin2', N'name', N'address', CAST(N'2022-01-21' AS Date), N'tariqalfath@gmail.com')
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'admin3', N'name', N'address', CAST(N'2022-01-21' AS Date), N'tariqalfath@gmail.com')
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'adminzxc', N'admin123', N'1', CAST(N'2022-06-21' AS Date), N'tariqalfath@gmail.com')
INSERT [dbo].[UserProfile] ([username], [name], [address], [bod], [email]) VALUES (N'June', N'June123', N'Jakarta, Cakung', CAST(N'2021-06-11' AS Date), N'JuneFajar@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[UserSkills] ON 

INSERT [dbo].[UserSkills] ([userSkillId], [username], [skillID], [skillLevelID]) VALUES (1, N'admin', 3, 1)
INSERT [dbo].[UserSkills] ([userSkillId], [username], [skillID], [skillLevelID]) VALUES (2, N'June', 3, 1)
SET IDENTITY_INSERT [dbo].[UserSkills] OFF
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_User]
GO
ALTER TABLE [dbo].[UserSkills]  WITH CHECK ADD  CONSTRAINT [FK_UserSkills_Skill] FOREIGN KEY([skillID])
REFERENCES [dbo].[Skill] ([skillID])
GO
ALTER TABLE [dbo].[UserSkills] CHECK CONSTRAINT [FK_UserSkills_Skill]
GO
ALTER TABLE [dbo].[UserSkills]  WITH CHECK ADD  CONSTRAINT [FK_UserSkills_SkillLevel] FOREIGN KEY([skillLevelID])
REFERENCES [dbo].[SkillLevel] ([skillLevelID])
GO
ALTER TABLE [dbo].[UserSkills] CHECK CONSTRAINT [FK_UserSkills_SkillLevel]
GO
ALTER TABLE [dbo].[UserSkills]  WITH CHECK ADD  CONSTRAINT [FK_UserSkills_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[UserSkills] CHECK CONSTRAINT [FK_UserSkills_User]
GO
/****** Object:  StoredProcedure [dbo].[CreateSkill]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateSkill]
@skillName varchar(500)
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into Skill (skillName) values(@skillName);

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[CreateSkillLevel]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateSkillLevel]
@skillLevelName varchar(500)
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into SkillLevel (skillLevelName) values(@skillLevelName);

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUserSkills]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateUserSkills]
@username varchar(50),
@skillID int,
@skillLevelID int
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	
	INSERT INTO UserSkills (username,skillID,skillLevelID) values (@username,@skillID,@skillLevelID);

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSkill]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSkill]
@skillID int
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE Skill WHERE skillID = @skillID;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSkillLevel]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSkillLevel]
@skillLevelID int
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE SkillLevel WHERE skillLevelID = @skillLevelID;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserSkills]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUserSkills]
@userSkillId int
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	
	Delete UserSkills where userSkillId = @userSkillId;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[GetSkills]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSkills]
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM Skill;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[GetSkillsByID]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSkillsByID]
@skillID int
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM Skill WHERE skillID = @skillID;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[GetSkillsLevel]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSkillsLevel]
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM SkillLevel;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[GetSkillsLevelByID]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSkillsLevelByID]
@skillLevelID int
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM SkillLevel WHERE skillLevelID = @skillLevelID;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[Register]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Register]
@username varchar(50),
@name varchar(50),
@address varchar(500),
@bod date,
@email varchar(50)
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into [User] (username,password) values(@username,'Mandiri123');

	insert into UserProfile (username,name,address,bod,email) values(@username,@name,@address,@bod,@email)

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UPDATE]
@username varchar(50),
@name varchar(50),
@address varchar(500),
@bod date,
@email varchar(50)
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE UserProfile set name = @name,address = @address,bod = @bod,email = @email where username = @username;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSkill]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSkill]
@skillID int,
@skillName varchar(500)
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Skill set skillName = @skillName WHERE skillID = @skillID;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSkillLevel]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSkillLevel]
@skillLevelID int,
@skillLevelName varchar(500)
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE SkillLevel set skillLevelName = @skillLevelName WHERE skillLevelID = @skillLevelID;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSkillLevelUserSkills]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSkillLevelUserSkills]
@username varchar(500),
@skillLevelID int
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	
	UPDATE UserSkills SET skillLevelID = @skillLevelID where username = @username;

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserSkills]    Script Date: 11/06/2022 12:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserSkills]
@userSkillId int,
@username varchar(50),
@skillID int,
@skillLevelID int
AS
BEGIN
	BEGIN TRANSACTION
	SET NOCOUNT ON
	
	UPDATE UserSkills set username = @username, skillID = @skillID, skillLevelID = @skillLevelID WHERE userSkillId = @userSkillId;

	COMMIT
END
GO
USE [master]
GO
ALTER DATABASE [Mandiri] SET  READ_WRITE 
GO
