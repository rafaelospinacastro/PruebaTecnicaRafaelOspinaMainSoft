USE [master]
GO
/****** Object:  Database [Prueba]    Script Date: 30/03/2023 4:41:22 p. m. ******/
CREATE DATABASE [Prueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaDoubleV', FILENAME = N'O:\Data\PruebaDoubleV.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaDoubleV_log', FILENAME = N'R:\Logplanilla\PruebaDoubleV_log.ldf' , SIZE = 68608KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Prueba] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prueba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prueba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prueba] SET RECOVERY FULL 
GO
ALTER DATABASE [Prueba] SET  MULTI_USER 
GO
ALTER DATABASE [Prueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prueba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prueba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prueba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Prueba', N'ON'
GO
ALTER DATABASE [Prueba] SET QUERY_STORE = OFF
GO
USE [Prueba]
GO
/****** Object:  Table [dbo].[autores]    Script Date: 30/03/2023 4:41:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NULL,
	[apellidos] [varchar](45) NULL,
 CONSTRAINT [PK_autores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[autores_has_libros]    Script Date: 30/03/2023 4:41:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autores_has_libros](
	[autores_id] [int] NOT NULL,
	[libros_ISBN] [int] NOT NULL,
 CONSTRAINT [PK_autores_has_libros] PRIMARY KEY CLUSTERED 
(
	[autores_id] ASC,
	[libros_ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[editoriales]    Script Date: 30/03/2023 4:41:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[editoriales](
	[id] [int] NOT NULL,
	[nombre] [varchar](45) NULL,
	[sede] [varchar](45) NULL,
 CONSTRAINT [PK_editoriales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[libros]    Script Date: 30/03/2023 4:41:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[libros](
	[ISBN] [int] NOT NULL,
	[editoriales_id] [int] NULL,
	[titulo] [varchar](45) NULL,
	[sinopsis] [text] NULL,
	[n_paginas] [varchar](45) NULL,
 CONSTRAINT [PK_libros] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 30/03/2023 4:41:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[NumeroIdentificacion] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[TipoIdentificacion] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
	[TipoNumIdentificacion]  AS ([TipoIdentificacion]+[NumeroIdentificacion]),
	[NombresApellidos]  AS (([Nombres]+' ')+[Apellidos]),
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/03/2023 4:41:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[autores_has_libros] ADD  CONSTRAINT [DF_autores_has_libros_autores_id]  DEFAULT ((10)) FOR [autores_id]
GO
ALTER TABLE [dbo].[autores_has_libros] ADD  CONSTRAINT [DF_autores_has_libros_libros_ISBN]  DEFAULT ((13)) FOR [libros_ISBN]
GO
ALTER TABLE [dbo].[editoriales] ADD  CONSTRAINT [DF_editoriales_id]  DEFAULT ((10)) FOR [id]
GO
ALTER TABLE [dbo].[libros] ADD  CONSTRAINT [DF_libros_ISBN]  DEFAULT ((13)) FOR [ISBN]
GO
ALTER TABLE [dbo].[libros] ADD  CONSTRAINT [DF_libros_editoriales_id]  DEFAULT ((10)) FOR [editoriales_id]
GO
ALTER TABLE [dbo].[autores_has_libros]  WITH CHECK ADD  CONSTRAINT [FK_autores_has_libros_autores] FOREIGN KEY([autores_id])
REFERENCES [dbo].[autores] ([id])
GO
ALTER TABLE [dbo].[autores_has_libros] CHECK CONSTRAINT [FK_autores_has_libros_autores]
GO
ALTER TABLE [dbo].[autores_has_libros]  WITH CHECK ADD  CONSTRAINT [FK_autores_has_libros_libros] FOREIGN KEY([libros_ISBN])
REFERENCES [dbo].[libros] ([ISBN])
GO
ALTER TABLE [dbo].[autores_has_libros] CHECK CONSTRAINT [FK_autores_has_libros_libros]
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD  CONSTRAINT [FK_libros_libros] FOREIGN KEY([ISBN])
REFERENCES [dbo].[libros] ([ISBN])
GO
ALTER TABLE [dbo].[libros] CHECK CONSTRAINT [FK_libros_libros]
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarUsuarios]    Script Date: 30/03/2023 4:41:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ConsultarUsuarios]	
AS
BEGIN
	select [Nombres], [Apellidos], [NumeroIdentificacion], [Email], [TipoIdentificacion], [FechaCreacion], [TipoNumIdentificacion], [NombresApellidos]
	from [dbo].[Persona]
END
GO
USE [master]
GO
ALTER DATABASE [Prueba] SET  READ_WRITE 
GO
