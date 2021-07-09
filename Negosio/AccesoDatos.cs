using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negosio
{
    class AccesoDatos
    {
        public SqlDataReader lector { get; set; }
        public SqlConnection conexion { get; set; }
        public SqlCommand comando { get; set; }

        public AccesoDatos()
        {
            conexion = new SqlConnection("data source=.\\SQLEXPRESS; initial catalog = Ecommerce; integrated security=sspi ");                                                                          
            comando = new SqlCommand();
            comando.Connection = conexion;
        }
        public void conectar()
        {
            conexion.Open();
        }

        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }
        public void setearSP(string sp)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = sp;
        }
        public void agregarParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        public SqlDataReader leer()
        {
            lector = comando.ExecuteReader();
            // lector.Read();
            return lector;
        }
        public void ejecutaLector()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }

        }
        public void cerrarConexion()
        {
            conexion.Close();
        }

        internal void ejecutarAccion()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }
    }
}

