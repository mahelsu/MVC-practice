USE [master]
GO
/****** Object:  Database [DocumentControl]    Script Date: 21/04/2021 06:58:27 p. m. ******/
CREATE DATABASE [DocumentControl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DocumentControl', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DocumentControl.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DocumentControl_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DocumentControl_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DocumentControl] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DocumentControl].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DocumentControl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DocumentControl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DocumentControl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DocumentControl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DocumentControl] SET ARITHABORT OFF 
GO
ALTER DATABASE [DocumentControl] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DocumentControl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DocumentControl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DocumentControl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DocumentControl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DocumentControl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DocumentControl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DocumentControl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DocumentControl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DocumentControl] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DocumentControl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DocumentControl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DocumentControl] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DocumentControl] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DocumentControl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DocumentControl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DocumentControl] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DocumentControl] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DocumentControl] SET  MULTI_USER 
GO
ALTER DATABASE [DocumentControl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DocumentControl] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DocumentControl] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DocumentControl] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DocumentControl] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DocumentControl] SET QUERY_STORE = OFF
GO
USE [DocumentControl]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 21/04/2021 06:58:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[siglas] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 21/04/2021 06:58:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](25) NULL,
	[idEmpleado] [int] NULL,
	[dptOrigen] [varchar](25) NULL,
	[dptDestino] [varchar](25) NULL,
	[secuencia] [varchar](25) NULL,
	[fecha] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/04/2021 06:58:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](15) NULL,
	[correo] [varchar](30) NULL,
	[idDpt] [int] NULL,
	[cargo] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departamento] ON 
GO
INSERT [dbo].[Departamento] ([id], [nombre], [siglas]) VALUES (15, N'Tecnología ', N'TTG')
GO
INSERT [dbo].[Departamento] ([id], [nombre], [siglas]) VALUES (16, N'Contabilidad', N'CNT')
GO
INSERT [dbo].[Departamento] ([id], [nombre], [siglas]) VALUES (17, N'Finanzas', N'FN')
GO
SET IDENTITY_INSERT [dbo].[Departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[Documento] ON 
GO
INSERT [dbo].[Documento] ([id], [tipo], [idEmpleado], [dptOrigen], [dptDestino], [secuencia], [fecha]) VALUES (13, N'Memorandum', 13, N'Contabilidad', N'Tecnología', N'2021-CNT-TTG-01', N'17/04/2021')
GO
INSERT [dbo].[Documento] ([id], [tipo], [idEmpleado], [dptOrigen], [dptDestino], [secuencia], [fecha]) VALUES (14, N'CARTA', 14, N'Tecnología', N'Contabilidad', N'2021-TTG-CNT-02', N'17/04/2021')
GO
INSERT [dbo].[Documento] ([id], [tipo], [idEmpleado], [dptOrigen], [dptDestino], [secuencia], [fecha]) VALUES (15, N'Memorandum', 14, N'Contabilidad', N'Tecnología', N'2021-CNT-TTG-03', N'19/04/2021')
GO
INSERT [dbo].[Documento] ([id], [tipo], [idEmpleado], [dptOrigen], [dptDestino], [secuencia], [fecha]) VALUES (16, N'Acto', 14, N'Finanzas', N'Contabilidad', N'2021-FN-CNT-04', N'20/04/2021')
GO
INSERT [dbo].[Documento] ([id], [tipo], [idEmpleado], [dptOrigen], [dptDestino], [secuencia], [fecha]) VALUES (18, N'Memorandum', 14, N'Finanzas', N'Tecnología', N'2021-FN-TTG-05', N'20/04/2021')
GO
INSERT [dbo].[Documento] ([id], [tipo], [idEmpleado], [dptOrigen], [dptDestino], [secuencia], [fecha]) VALUES (19, N'Memorandum', 16, N'Finanzas', N'Tecnología', N'2021-FN-TTG-06', N'20/04/2021')
GO
INSERT [dbo].[Documento] ([id], [tipo], [idEmpleado], [dptOrigen], [dptDestino], [secuencia], [fecha]) VALUES (20, N'Acto de venta', 16, N'Tecnología', N'Finanzas', N'2021-TTG-FN-07', N'20/04/2021')
GO
SET IDENTITY_INSERT [dbo].[Documento] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([id], [nombre], [correo], [idDpt], [cargo]) VALUES (13, N'Huascar ', N'kkkk@gmail.com', 15, N'Desarrollador')
GO
INSERT [dbo].[Usuario] ([id], [nombre], [correo], [idDpt], [cargo]) VALUES (14, N'Jairo Melo', N'knksjsalkd@asgasga.com', 17, N'Gerente')
GO
INSERT [dbo].[Usuario] ([id], [nombre], [correo], [idDpt], [cargo]) VALUES (16, N'Kevin Feliz', N'kfeliz06@gmail.com', 17, N'Administrador')
GO
INSERT [dbo].[Usuario] ([id], [nombre], [correo], [idDpt], [cargo]) VALUES (17, N'Ramon Liriano', N'Rmon@gmail.com', 16, N'Gerente')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idDpt])
REFERENCES [dbo].[Departamento] ([id])
GO
/****** Object:  StoredProcedure [dbo].[rptDoc]    Script Date: 21/04/2021 06:58:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rptDoc]
as 
SELECT Documento.tipo as 'Tipo', Usuario.nombre as 'Empleado', Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia as 'Secuencia o código', Documento.fecha 'Fecha de expedio' from Documento
inner join Usuario on Documento.idEmpleado = Usuario.id
GO
/****** Object:  StoredProcedure [dbo].[rptDocD]    Script Date: 21/04/2021 06:58:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rptDocD]
		@dptD varchar(40) 
as 
SELECT Documento.tipo, Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia, Documento.fecha as 'Fecha de expedio' from Documento
WHERE Documento.dptDestino = @dptD
GO
/****** Object:  StoredProcedure [dbo].[rptDocFecha]    Script Date: 21/04/2021 06:58:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rptDocFecha]
	@Fdesde varchar(10) , @Fhasta varchar(10)
as 
SELECT  Documento.fecha as 'Fecha de expedio', Documento.tipo as 'Tipo', Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia as 'Secuencia o código' from Documento
WHERE Documento.fecha between @Fdesde and @Fhasta
GO
/****** Object:  StoredProcedure [dbo].[rptDocO]    Script Date: 21/04/2021 06:58:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rptDocO]
		@dptO varchar(40) 
as 
SELECT Documento.tipo, Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia, Documento.fecha as 'Fecha de expedio' from Documento
WHERE Documento.dptOrigen = @dptO
GO
/****** Object:  StoredProcedure [dbo].[rptEmpDoc]    Script Date: 21/04/2021 06:58:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rptEmpDoc]
	@name varchar(40) 
as 
SELECT Documento.tipo as 'Tipo', Usuario.nombre as 'Empleado', Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia as 'Secuencia o código', Documento.fecha 'Fecha de expedio' from Documento
inner join Usuario on Documento.idEmpleado = Usuario.id
WHERE Usuario.nombre = @name
GO
/****** Object:  StoredProcedure [dbo].[rptEmpDpt]    Script Date: 21/04/2021 06:58:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rptEmpDpt]
	
as 
SELECT Usuario.id, Usuario.nombre as 'Nombre', Departamento.nombre as 'Departamento', Usuario.cargo as 'Cargo', Usuario.correo as 'Correo' from Usuario
inner join Departamento on Usuario.idDpt = Departamento.id
GO
USE [master]
GO
ALTER DATABASE [DocumentControl] SET  READ_WRITE 
GO
