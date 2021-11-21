using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace Projeto.DAL
{
    public class Conexao
    {
        protected SqlConnection con;
        /// <summary>
        /// Atributo Conexao
        /// </summary>
        protected SqlCommand com;
        /// <summary>
        /// Atrubuto Conversa com a Base
        /// </summary>
        protected SqlDataReader dr;
        /// <summary>
        /// Atributo Letura dos dados
        /// </summary>
        protected SqlTransaction tr;
        ///<summary>
        /// Atributo de transacao
        ///</summary>
        protected string Connection = GetConnection();
        /// <summary>
        /// Caminho para o banco de dados
        /// </summary>
        protected void OpenConnection()
        /// Metodo de Abrir Conexao
        {
            con = new SqlConnection(Connection);
            con.Open();
            ///Abrindo a conexao
        }
        private static string GetConnection()
        {
            return "Data Source=(LocalDB)/MSSQLLocalDB;Initial Catalog=GerenciadorDoCinema;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            ///o endereço do caminho banco de dados
        }
        protected void CloseConnection()
        {
            con.Close();
            /// Fecha conexao
        }

    }
}
