
Create Procedure ObtenerProductos
as 
Select cProdId,
cProdNombre,
cProdDescripcion,
cProdPrecio from cProductos
go

Create Procedure RegistrarProducto (@Nombre varchar(20), @Descripcion varchar(20), @Precio smallint)
as
insert into cProductos (cProdNombre,
cProdDescripcion,
cProdPrecio) Values (@Nombre, @Descripcion, @Precio)

go


Create Procedure ActualizarProducto (@id int, @Nombre varchar(20), @Descripcion varchar(20), @Precio smallint)
as
update cProductos set
cProdNombre = @Nombre,
cProdDescripcion = @Descripcion,
cProdPrecio = @Precio where cProdId = @id

go

Create Procedure EliminarProducto (@id int )
as
delete from cProductos where cProdId = @id
go

Create Procedure DetalleProducto (@id int)
as 
Select cProdId,
cProdNombre,
cProdDescripcion,
cProdPrecio from cProductos where cProdId = @id
go




