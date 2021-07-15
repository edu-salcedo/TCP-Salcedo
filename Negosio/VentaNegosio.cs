﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;
namespace Negosio
{
    public class VentaNegosio
    {

        public List<Venta> listar()
        {
            try
            {
                List<Venta> listaVenta = new List<Venta>();
                AccesoDatos conexion = new AccesoDatos();
                conexion.conectar();
                conexion.setearQuery("select id, IdUsuario,Fecha,Importe from Venta");
                SqlDataReader lector = conexion.leer();

                while (lector.Read())
                {
                    Venta aux = new Venta();
                    aux.Id = lector.GetInt32(0);
                    aux.idUsuario = lector.GetInt32(1);
                    aux.FechaVenta= (DateTime)lector["Fecha"];
                    aux.Importe= (decimal)lector["Importe"];
                    listaVenta.Add(aux);
                }
                conexion.cerrarConexion();
                return listaVenta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Registrar(Venta nuevo)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                //conexion.setearQuery("insert into usuario ( username,password,idtipo)values( @user, @pass, @nombren, @apellido, @tel, @tipo, @mail)");
                conexion.setearSP("SPInsertVenta");   // procedimiento lamacenado pra registrar un usuario
                conexion.agregarParametro("@idcliente", nuevo.idUsuario);
                conexion.agregarParametro("@fecha", nuevo.FechaVenta);
                conexion.agregarParametro("@Importe", nuevo.Importe);
                conexion.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int BuscarID()
        {

            int IdAux;
            try
            {
                AccesoDatos conexion = new AccesoDatos();
               conexion.setearQuery("select max(id) from Venta"); // buscamos el ultimo id de la tabla venta   
                conexion.conectar();
               conexion.lector = conexion.comando.ExecuteReader();
               conexion.lector.Read(); 
                IdAux = conexion.lector.GetInt32(0);
                conexion.cerrarConexion();
                return IdAux; 
            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}