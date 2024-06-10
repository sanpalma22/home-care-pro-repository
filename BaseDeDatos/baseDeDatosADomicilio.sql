USE [master]
GO
/****** Object:  Database [baseDeDatosADomicilio]    Script Date: 10/6/2024 09:41:50 ******/
CREATE DATABASE [baseDeDatosADomicilio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'baseDeDatosADomicilio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\baseDeDatosADomicilio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'baseDeDatosADomicilio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\baseDeDatosADomicilio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [baseDeDatosADomicilio] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [baseDeDatosADomicilio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [baseDeDatosADomicilio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET ARITHABORT OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET RECOVERY FULL 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET  MULTI_USER 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [baseDeDatosADomicilio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [baseDeDatosADomicilio] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'baseDeDatosADomicilio', N'ON'
GO
ALTER DATABASE [baseDeDatosADomicilio] SET QUERY_STORE = OFF
GO
USE [baseDeDatosADomicilio]
GO
/****** Object:  User [alumno]    Script Date: 10/6/2024 09:41:50 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Caso]    Script Date: 10/6/2024 09:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caso](
	[IdCaso] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdPrestador] [int] NOT NULL,
	[IdPrestacion] [int] NOT NULL,
	[FechaOcurrencia] [date] NOT NULL,
	[FechaSolicitud] [date] NOT NULL,
	[Diagnostico] [varchar](50) NOT NULL,
	[CantDias] [int] NOT NULL,
	[CantHorasDias] [int] NOT NULL,
 CONSTRAINT [PK_Caso] PRIMARY KEY CLUSTERED 
(
	[IdCaso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 10/6/2024 09:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[IdEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[IdEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformeDia]    Script Date: 10/6/2024 09:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformeDia](
	[IdInformeDia] [int] IDENTITY(1,1) NOT NULL,
	[IdCaso] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_InformeDia] PRIMARY KEY CLUSTERED 
(
	[IdInformeDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insumo]    Script Date: 10/6/2024 09:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insumo](
	[IdInsumo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Insumo] PRIMARY KEY CLUSTERED 
(
	[IdInsumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsumoXCaso]    Script Date: 10/6/2024 09:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsumoXCaso](
	[IdInsumoXCaso] [int] IDENTITY(1,1) NOT NULL,
	[IdInsumo] [int] NOT NULL,
	[IdCaso] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_InsumoXCaso] PRIMARY KEY CLUSTERED 
(
	[IdInsumoXCaso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 10/6/2024 09:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Dni] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Localidad] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestacion]    Script Date: 10/6/2024 09:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestacion](
	[IdPrestacion] [int] IDENTITY(1,1) NOT NULL,
	[IdEspecialidad] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ValorHora] [int] NOT NULL,
 CONSTRAINT [PK_Prestacion] PRIMARY KEY CLUSTERED 
(
	[IdPrestacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestador]    Script Date: 10/6/2024 09:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestador](
	[IdPrestador] [int] IDENTITY(1,1) NOT NULL,
	[IdEspecialidad] [int] NOT NULL,
	[Dni] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Localidad] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Genero] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prestador] PRIMARY KEY CLUSTERED 
(
	[IdPrestador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Caso] ON 

INSERT [dbo].[Caso] ([IdCaso], [IdPaciente], [IdPrestador], [IdPrestacion], [FechaOcurrencia], [FechaSolicitud], [Diagnostico], [CantDias], [CantHorasDias]) VALUES (2, 5, 2, 1, CAST(N'2023-08-20' AS Date), CAST(N'2023-08-22' AS Date), N'Le duele mucho la panza', 2, 1)
INSERT [dbo].[Caso] ([IdCaso], [IdPaciente], [IdPrestador], [IdPrestacion], [FechaOcurrencia], [FechaSolicitud], [Diagnostico], [CantDias], [CantHorasDias]) VALUES (3, 7, 3, 2, CAST(N'2023-08-30' AS Date), CAST(N'2023-09-01' AS Date), N'Tiene zarpullidos en la cara', 4, 1)
SET IDENTITY_INSERT [dbo].[Caso] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidad] ON 

INSERT [dbo].[Especialidad] ([IdEspecialidad], [Nombre]) VALUES (1, N'Pediatra')
INSERT [dbo].[Especialidad] ([IdEspecialidad], [Nombre]) VALUES (2, N'Dermatologa')
INSERT [dbo].[Especialidad] ([IdEspecialidad], [Nombre]) VALUES (3, N'Traumatologo')
INSERT [dbo].[Especialidad] ([IdEspecialidad], [Nombre]) VALUES (4, N'Kinesiologia')
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[InformeDia] ON 

INSERT [dbo].[InformeDia] ([IdInformeDia], [IdCaso], [Fecha], [Descripcion]) VALUES (1, 2, CAST(N'2023-08-24' AS Date), N'Tiene una infezzion en la panza, se le va a aplicar un remedio')
INSERT [dbo].[InformeDia] ([IdInformeDia], [IdCaso], [Fecha], [Descripcion]) VALUES (2, 2, CAST(N'2023-08-28' AS Date), N'Se le fue la infeccion, y ya no le duele mas la panza')
INSERT [dbo].[InformeDia] ([IdInformeDia], [IdCaso], [Fecha], [Descripcion]) VALUES (3, 3, CAST(N'2923-09-04' AS Date), N'Se lo nota con zarpullidos leves en la cara, se le va a aplicar un remedio y una crema a usar durante cuatro semanas')
INSERT [dbo].[InformeDia] ([IdInformeDia], [IdCaso], [Fecha], [Descripcion]) VALUES (4, 3, CAST(N'2023-09-11' AS Date), N'El zarpullido es menor, el remedion esta haciendo efecto positivo')
INSERT [dbo].[InformeDia] ([IdInformeDia], [IdCaso], [Fecha], [Descripcion]) VALUES (5, 3, CAST(N'2923-09-18' AS Date), N'Ha empeorado el zarpullido se le indicara un remedio mas fuerte')
SET IDENTITY_INSERT [dbo].[InformeDia] OFF
GO
SET IDENTITY_INSERT [dbo].[Insumo] ON 

INSERT [dbo].[Insumo] ([IdInsumo], [Nombre], [Precio]) VALUES (1, N'Termometro', 2000)
INSERT [dbo].[Insumo] ([IdInsumo], [Nombre], [Precio]) VALUES (2, N'Tensiometro', 5000)
INSERT [dbo].[Insumo] ([IdInsumo], [Nombre], [Precio]) VALUES (3, N'Oximetro de pulso para dedo', 7500)
INSERT [dbo].[Insumo] ([IdInsumo], [Nombre], [Precio]) VALUES (4, N'Estestocopio', 6500)
SET IDENTITY_INSERT [dbo].[Insumo] OFF
GO
SET IDENTITY_INSERT [dbo].[InsumoXCaso] ON 

INSERT [dbo].[InsumoXCaso] ([IdInsumoXCaso], [IdInsumo], [IdCaso], [Cantidad]) VALUES (1, 1, 2, 1)
INSERT [dbo].[InsumoXCaso] ([IdInsumoXCaso], [IdInsumo], [IdCaso], [Cantidad]) VALUES (2, 3, 2, 1)
INSERT [dbo].[InsumoXCaso] ([IdInsumoXCaso], [IdInsumo], [IdCaso], [Cantidad]) VALUES (3, 4, 2, 1)
SET IDENTITY_INSERT [dbo].[InsumoXCaso] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([IdPaciente], [Dni], [Nombre], [Apellido], [Direccion], [Localidad], [Telefono], [FechaNacimiento]) VALUES (5, 23456789, N'Fernando', N'Gomez', N'San Martin 4576', N'CABA', 12349876, CAST(N'3333-06-12' AS Date))
INSERT [dbo].[Paciente] ([IdPaciente], [Dni], [Nombre], [Apellido], [Direccion], [Localidad], [Telefono], [FechaNacimiento]) VALUES (7, 76767676, N'Juan Cruz', N'Martinez', N'Av. Corrientes 2222', N'CABA', 83746574, CAST(N'1989-10-03' AS Date))
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[Prestacion] ON 

INSERT [dbo].[Prestacion] ([IdPrestacion], [IdEspecialidad], [Nombre], [ValorHora]) VALUES (1, 1, N'Dante', 2000)
INSERT [dbo].[Prestacion] ([IdPrestacion], [IdEspecialidad], [Nombre], [ValorHora]) VALUES (2, 2, N'Axel', 5000)
INSERT [dbo].[Prestacion] ([IdPrestacion], [IdEspecialidad], [Nombre], [ValorHora]) VALUES (3, 3, N'Julian', 2600)
INSERT [dbo].[Prestacion] ([IdPrestacion], [IdEspecialidad], [Nombre], [ValorHora]) VALUES (4, 4, N'Martin', 9000)
SET IDENTITY_INSERT [dbo].[Prestacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Prestador] ON 

INSERT [dbo].[Prestador] ([IdPrestador], [IdEspecialidad], [Dni], [Nombre], [Apellido], [Direccion], [Localidad], [Telefono], [Email], [Genero]) VALUES (2, 1, 22222222, N'Franco', N'Reifut', N'Av. Gaona 1019', N'CABA', 34567890, N'francoreifut@gmail.com', N'Masculino')
INSERT [dbo].[Prestador] ([IdPrestador], [IdEspecialidad], [Dni], [Nombre], [Apellido], [Direccion], [Localidad], [Telefono], [Email], [Genero]) VALUES (3, 2, 66666666, N'Santiago', N'LoGuiudice', N'Av. Cordoba 2422', N'CABA', 87654302, N'santiagologuiudice@gmail.com', N'Masculino')
INSERT [dbo].[Prestador] ([IdPrestador], [IdEspecialidad], [Dni], [Nombre], [Apellido], [Direccion], [Localidad], [Telefono], [Email], [Genero]) VALUES (4, 3, 88888888, N'Jimena', N'Gutierrez', N'Av. Cabildo 1022', N'CABA', 98170367, N'jimenagutierrez@gmail.com', N'Femenino')
SET IDENTITY_INSERT [dbo].[Prestador] OFF
GO
ALTER TABLE [dbo].[Caso]  WITH CHECK ADD  CONSTRAINT [FK_Caso_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[Caso] CHECK CONSTRAINT [FK_Caso_Paciente]
GO
ALTER TABLE [dbo].[Caso]  WITH CHECK ADD  CONSTRAINT [FK_Caso_Prestacion] FOREIGN KEY([IdPrestacion])
REFERENCES [dbo].[Prestacion] ([IdPrestacion])
GO
ALTER TABLE [dbo].[Caso] CHECK CONSTRAINT [FK_Caso_Prestacion]
GO
ALTER TABLE [dbo].[Caso]  WITH CHECK ADD  CONSTRAINT [FK_Caso_Prestador] FOREIGN KEY([IdPrestador])
REFERENCES [dbo].[Prestador] ([IdPrestador])
GO
ALTER TABLE [dbo].[Caso] CHECK CONSTRAINT [FK_Caso_Prestador]
GO
ALTER TABLE [dbo].[InformeDia]  WITH CHECK ADD  CONSTRAINT [FK_InformeDia_Caso] FOREIGN KEY([IdCaso])
REFERENCES [dbo].[Caso] ([IdCaso])
GO
ALTER TABLE [dbo].[InformeDia] CHECK CONSTRAINT [FK_InformeDia_Caso]
GO
ALTER TABLE [dbo].[InsumoXCaso]  WITH CHECK ADD  CONSTRAINT [FK_InsumoXCaso_Caso] FOREIGN KEY([IdCaso])
REFERENCES [dbo].[Caso] ([IdCaso])
GO
ALTER TABLE [dbo].[InsumoXCaso] CHECK CONSTRAINT [FK_InsumoXCaso_Caso]
GO
ALTER TABLE [dbo].[InsumoXCaso]  WITH CHECK ADD  CONSTRAINT [FK_InsumoXCaso_Insumo] FOREIGN KEY([IdInsumo])
REFERENCES [dbo].[Insumo] ([IdInsumo])
GO
ALTER TABLE [dbo].[InsumoXCaso] CHECK CONSTRAINT [FK_InsumoXCaso_Insumo]
GO
ALTER TABLE [dbo].[Prestacion]  WITH CHECK ADD  CONSTRAINT [FK_Prestacion_Especialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [dbo].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [dbo].[Prestacion] CHECK CONSTRAINT [FK_Prestacion_Especialidad]
GO
ALTER TABLE [dbo].[Prestador]  WITH CHECK ADD  CONSTRAINT [FK_Prestador_Especialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [dbo].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [dbo].[Prestador] CHECK CONSTRAINT [FK_Prestador_Especialidad]
GO
USE [master]
GO
ALTER DATABASE [baseDeDatosADomicilio] SET  READ_WRITE 
GO
