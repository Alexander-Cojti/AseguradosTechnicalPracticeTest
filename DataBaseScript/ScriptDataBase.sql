USE [database_test]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20/03/2022 20:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_asegurados]    Script Date: 20/03/2022 20:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_asegurados](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[apellidos] [varchar](120) NOT NULL,
	[fecha_de_nacimiento] [datetime] NOT NULL,
	[edad] [int] NOT NULL,
	[estado_civil] [int] NOT NULL,
	[insertedAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[Status] [varchar](1) NULL,
	[deletedAt] [datetime] NULL,
 CONSTRAINT [PK_t_asegurados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_estado_civil]    Script Date: 20/03/2022 20:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_estado_civil](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](10) NOT NULL,
 CONSTRAINT [PK_t_estado_civil] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_asegurados]    Script Date: 20/03/2022 20:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_asegurados]
as
select a.nombre, a.apellidos,e.descripcion from t_asegurados a join t_estado_civil e on a.estado_civil=e.id
GO
SET IDENTITY_INSERT [dbo].[t_asegurados] ON 
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (1, N'JUAN', N'RODRIGUEZ', CAST(N'2022-03-19T07:22:22.887' AS DateTime), 0, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (2, N'MARCOS', N'LÓPEZ', CAST(N'2022-03-19T07:22:43.883' AS DateTime), 0, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (4, N'MARCOS', N'LÓPEZ CUTZAL', CAST(N'1995-01-01T00:00:00.000' AS DateTime), 26, 1, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (5, N'JUANA', N'HERNANDEZ', CAST(N'1972-03-20T00:00:00.000' AS DateTime), 50, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T19:48:33.210' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (6, N'CARLOS', N'CUMES', CAST(N'2022-03-19T00:00:00.000' AS DateTime), 0, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (7, N'ANTONIO', N'DOMINGUEZ', CAST(N'2022-03-19T00:00:00.000' AS DateTime), 0, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (9, N'juan', N'chacon', CAST(N'2022-03-19T00:00:00.000' AS DateTime), 0, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (10, N'maria', N'toluca', CAST(N'2022-03-19T00:00:00.000' AS DateTime), 0, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (11, N'oswald', N'munich', CAST(N'2022-03-19T00:00:00.000' AS DateTime), 0, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (12, N'samuel', N'urtado', CAST(N'2020-03-11T00:00:00.000' AS DateTime), 2, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (13, N'Geovanni', N'Soloteco', CAST(N'2010-03-10T00:00:00.000' AS DateTime), 12, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (14, N'LUCAS', N'TAÑEDA', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 2, 2, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (15, N'CARLOS', N'SERECH', CAST(N'2002-03-20T00:00:00.000' AS DateTime), 20, 3, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (16, N'OSCAR', N'SUT', CAST(N'1964-03-20T00:00:00.000' AS DateTime), 58, 3, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (17, N'JUSTINO', N'SOCOP', CAST(N'1970-03-20T00:00:00.000' AS DateTime), 52, 4, CAST(N'2022-03-20T18:15:31.000' AS DateTime), CAST(N'2022-03-20T18:15:40.997' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (18, N'ALEXANDER', N'COJTI SEPET', CAST(N'1997-03-20T00:00:00.000' AS DateTime), 24, 2, CAST(N'2022-03-20T18:31:25.247' AS DateTime), CAST(N'2022-03-20T18:33:46.730' AS DateTime), N'A', NULL)
GO
INSERT [dbo].[t_asegurados] ([id], [nombre], [apellidos], [fecha_de_nacimiento], [edad], [estado_civil], [insertedAt], [updatedAt], [Status], [deletedAt]) VALUES (19, N'JOSE ', N'CANTONES', CAST(N'1937-03-20T00:00:00.000' AS DateTime), 85, 1, CAST(N'2022-03-20T19:04:23.920' AS DateTime), CAST(N'2022-03-20T19:04:23.917' AS DateTime), N'A', NULL)
GO
SET IDENTITY_INSERT [dbo].[t_asegurados] OFF
GO
SET IDENTITY_INSERT [dbo].[t_estado_civil] ON 
GO
INSERT [dbo].[t_estado_civil] ([id], [descripcion]) VALUES (1, N'CASADO')
GO
INSERT [dbo].[t_estado_civil] ([id], [descripcion]) VALUES (2, N'SOLTERO')
GO
INSERT [dbo].[t_estado_civil] ([id], [descripcion]) VALUES (3, N'DIVORCIADO')
GO
INSERT [dbo].[t_estado_civil] ([id], [descripcion]) VALUES (4, N'VIUDO')
GO
SET IDENTITY_INSERT [dbo].[t_estado_civil] OFF
GO
ALTER TABLE [dbo].[t_asegurados] ADD  DEFAULT (getdate()) FOR [insertedAt]
GO
ALTER TABLE [dbo].[t_asegurados] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[t_asegurados] ADD  DEFAULT ('A') FOR [Status]
GO
ALTER TABLE [dbo].[t_asegurados]  WITH CHECK ADD  CONSTRAINT [FK_t_asegurados_t_estado_civil] FOREIGN KEY([estado_civil])
REFERENCES [dbo].[t_estado_civil] ([id])
GO
ALTER TABLE [dbo].[t_asegurados] CHECK CONSTRAINT [FK_t_asegurados_t_estado_civil]
GO
/****** Object:  StoredProcedure [dbo].[sp_get_t_asegurados]    Script Date: 20/03/2022 20:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_get_t_asegurados]
as
begin
select a.*,e.descripcion from t_asegurados a join t_estado_civil e on a.estado_civil=e.id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_t_estado_civil]    Script Date: 20/03/2022 20:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_t_estado_civil]
as
begin
select * from  t_estado_civil 
end
GO

create view vw_asegurados  
as  
select a.nombre, a.apellidos,e.descripcion from t_asegurados a join t_estado_civil e on a.estado_civil=e.id

go
create trigger trg_t_asegurados_audit  
on t_asegurados  
AFTER INSERT, UPDATE  
AS  
BEGIN  
DECLARE @Action as char(1);  
    SET @Action = (CASE WHEN EXISTS(SELECT * FROM INSERTED)  
                         AND EXISTS(SELECT * FROM DELETED)  
                        THEN 'U'    
                        WHEN EXISTS(SELECT * FROM INSERTED)  
                        THEN 'I'    
                        WHEN EXISTS(SELECT * FROM DELETED)  
                        THEN 'D'    
                        ELSE NULL    
                    END)  
IF @Action='I'  
begin  
update a  
set a.insertedAt=getdate()  
from t_asegurados a join inserted i on a.id=i.id  
end  
  
IF @Action='U'  
begin  
update a  
set a.updatedAt=getdate()  
from t_asegurados a join inserted i on a.id=i.id  
end  
  
END