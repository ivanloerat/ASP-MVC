USE [eCommerce]
GO
/****** Object:  Table [dbo].[cProductos]    Script Date: 13/04/2018 02:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cProductos](
	[cProdId] [int] IDENTITY(1,1) NOT NULL,
	[cProdNombre] [varchar](20) NULL,
	[cProdDescripcion] [varchar](500) NULL,
	[cProdPrecio] [smallint] NULL,
 CONSTRAINT [pk_cProdId] PRIMARY KEY CLUSTERED 
(
	[cProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cProveedores]    Script Date: 13/04/2018 02:04:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cProveedores](
	[cProvId] [int] IDENTITY(1,1) NOT NULL,
	[cProvNombre] [varchar](80) NULL,
	[cProvTelefono] [varchar](20) NULL,
 CONSTRAINT [pk_cProvId] PRIMARY KEY CLUSTERED 
(
	[cProvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rProductoxProveedor]    Script Date: 13/04/2018 02:04:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rProductoxProveedor](
	[rProdxProvId] [int] IDENTITY(1,1) NOT NULL,
	[cProdId] [int] NULL,
	[cProvId] [int] NULL,
 CONSTRAINT [pk_rProdxProvId] PRIMARY KEY CLUSTERED 
(
	[rProdxProvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cProductos] ON 
GO
INSERT [dbo].[cProductos] ([cProdId], [cProdNombre], [cProdDescripcion], [cProdPrecio]) VALUES (2, N'Lapiz', N'Lapiz', 5)
GO
INSERT [dbo].[cProductos] ([cProdId], [cProdNombre], [cProdDescripcion], [cProdPrecio]) VALUES (1002, N'Caja', N'Caja', 50)
GO
INSERT [dbo].[cProductos] ([cProdId], [cProdNombre], [cProdDescripcion], [cProdPrecio]) VALUES (1003, N'caja 2', N'caja 2', 50)
GO
SET IDENTITY_INSERT [dbo].[cProductos] OFF
GO
ALTER TABLE [dbo].[rProductoxProveedor]  WITH CHECK ADD  CONSTRAINT [fk_cProdId] FOREIGN KEY([cProdId])
REFERENCES [dbo].[cProductos] ([cProdId])
GO
ALTER TABLE [dbo].[rProductoxProveedor] CHECK CONSTRAINT [fk_cProdId]
GO
ALTER TABLE [dbo].[rProductoxProveedor]  WITH CHECK ADD  CONSTRAINT [fk_cProvId] FOREIGN KEY([cProvId])
REFERENCES [dbo].[cProveedores] ([cProvId])
GO
ALTER TABLE [dbo].[rProductoxProveedor] CHECK CONSTRAINT [fk_cProvId]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 13/04/2018 02:04:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[ActualizarProducto] (@id int, @Nombre varchar(20), @Descripcion varchar(20), @Precio smallint)
as
update cProductos set
cProdNombre = @Nombre,
cProdDescripcion = @Descripcion,
cProdPrecio = @Precio where cProdId = @id









GO
/****** Object:  StoredProcedure [dbo].[DetalleProducto]    Script Date: 13/04/2018 02:04:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DetalleProducto] (@id int)
as 
Select cProdId,
cProdNombre,
cProdDescripcion,
cProdPrecio from cProductos where cProdId = @id
GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 13/04/2018 02:04:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[EliminarProducto] (@id int )
as
delete from cProductos where cProdId = @id
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductos]    Script Date: 13/04/2018 02:04:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ObtenerProductos]
as 
Select cProdId,
cProdNombre,
cProdDescripcion,
cProdPrecio from cProductos


GO
/****** Object:  StoredProcedure [dbo].[RegistrarProducto]    Script Date: 13/04/2018 02:04:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[RegistrarProducto] (@Nombre varchar(20), @Descripcion varchar(20), @Precio smallint)
as
insert into cProductos (cProdNombre,
cProdDescripcion,
cProdPrecio) Values (@Nombre, @Descripcion, @Precio)
GO
/****** Object:  StoredProcedure [dbo].[RegistrarProductos]    Script Date: 13/04/2018 02:04:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[RegistrarProductos] @Nombre varchar(20), @Descripcion varchar(20), @Precio smallint
as
insert into cProductos (cProdNombre,
cProdDescripcion,
cProdPrecio) Values (@Nombre, @Descripcion, @Precio)
GO
