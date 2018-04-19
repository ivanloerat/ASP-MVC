using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using ABC_MVC.Models;

namespace ABC_MVC.Controllers
{
    public class ProductosController : Controller
    {

        Conexion.conexionDB objDb = new Conexion.conexionDB();
        // GET: Productos
        [HttpGet]
        public ActionResult Index()
        {
            DataTable db = objDb.ObtenerProductosDB();
            return View(db);               
        }

        // GET: Productos/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View(new ProductosModel());

        }

        // POST: Productos/Create
        [HttpPost]
        public ActionResult Create(ProductosModel prdModel)
        {
            objDb.InsertarProductoDB(prdModel.ProdNombre, prdModel.ProdDescripcion, prdModel.ProdPrecio);
            return RedirectToAction("Index");
            
        }

        // GET: Productos/Edit/5
        public ActionResult Edit(int id)
        {
            ProductosModel prdModel = new ProductosModel();
            DataTable db = objDb.DetalleProductoDB(id);
            if (db.Rows.Count == 1)
            {
                prdModel.ProdId = int.Parse(db.Rows[0][0].ToString());
                prdModel.ProdNombre = db.Rows[0][1].ToString();
                prdModel.ProdDescripcion = db.Rows[0][2].ToString();
                prdModel.ProdPrecio = int.Parse(db.Rows[0][3].ToString());
                return View(prdModel);
            }
            else
                return RedirectToAction("Index");
        
        }

        // POST: Productos/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {

            objDb.ActualizaProductoDB(id, collection["ProdNombre"], collection["ProdNombre"], int.Parse(collection["ProdPrecio"]));
            return RedirectToAction("Index");
            
        }

       

        // POST: Productos/Delete/5
       
        public ActionResult Delete(int id)
        {
            objDb.EliminaProductoDB(id);
            return RedirectToAction("Index");
           
        }
    }
}
