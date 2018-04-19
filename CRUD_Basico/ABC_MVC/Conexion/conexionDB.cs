using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.ObjectBuilder;


namespace ABC_MVC.Conexion
{
    public class conexionDB
    {

        //Database eCommerce = DatabaseFactory.CreateDatabase("cst");

        // Configure the DatabaseFactory to read its configuration from the .config file
        static DatabaseProviderFactory factory = new DatabaseProviderFactory();
        // Create the default Database object from the factory.
        // The actual concrete type is determined by the configuration settings.
        Database eCommerce = factory.CreateDefault(); 
        
        

        //consultar
        public DataTable ObtenerProductosDB()
        {                    
            return  eCommerce.ExecuteDataSet("ObtenerProductos").Tables[0];
        }

        //Insertar
        public void InsertarProductoDB(string nombre, string detalle, int precio)
        {
            eCommerce.ExecuteNonQuery("RegistrarProducto", new object[] {nombre, detalle, precio });
        }

        //Actualizar       
        public void ActualizaProductoDB(int ID, string nombre, string detalle, int precio)
        {
            eCommerce.ExecuteNonQuery("ActualizarProducto", new object[] { ID, nombre, detalle, precio });
        }
        //Eliminar
        public void EliminaProductoDB(int ID)
        {
            eCommerce.ExecuteNonQuery("EliminarProducto", new object[] { ID });
        }

        //DetalleProducto
        public DataTable DetalleProductoDB(int ID)
        {
            return eCommerce.ExecuteDataSet("DetalleProducto", new object[] { ID }).Tables[0];
        }

    }
}