using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Projeto.Entidades;

namespace Projeto.DAL
{
    public class Gerenciamento_de_sessoes_Repository : Conexao
    {
        public void Insert(Gerenciamento_de_sessoes G)
        /// Declaracao do Metodo Gerenciamento_de_sessoes
        {
            OpenConnection();
            /// Abre a Conexao
            string query = "INSERT INTO Gerenciamento_de_sessoes (Data, Horario_de_inicio, Horario_de_fim, Valor_do_ingresso, Tipo_de_animação, Tipo_de_audio, Id_sala, Id_filme)" +
                " VALUES (GetDate(), @Horario_de_inicio, @Horario_de_fim, @Valor_do_ingresso, @Tipo_de_animação, @Tipo_de_audio, @Id_sala, @Id_filme')";
           
            /// Conversa com a Base
            com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            //com.Parameters.AddWithValue("@NOME", F.Nome);
            /// Campo Nome
            //com.Parameters.AddWithValue("@E_MAIL", F.Email);
            /// Campo E - mail
            //com.Parameters.AddWithValue("@TELEFONE", F.Telefone);
            /// Campo Telefone
            //com.Parameters.AddWithValue("@DESCRICAO", F.Descricao);
            /// Campo Descricao
            com.ExecuteNonQuery();
            /// Roda a Querie
            CloseConnection();
            /// Fecha a Conexao 
        }

        //public void Update(FaleConosco f)
        /// Declaracao do Metodo de Editar os Dados do Fale Conosco
        //{
        //    OpenConnection();
            /// Abre a Conexao
            //string query = "UPDATE FALE_CONOSCO SET NOME = @NOME, E_MAIL = @E_MAIL, TELEFONE = @TELEFONE, DESCRICAO = @DESCRICAO WHERE CODIGO = @CODIGO";
            /// Conversa com a Base
            //com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            //com.Parameters.AddWithValue("@NOME", f.Nome);
            /// Campo Nome
            //com.Parameters.AddWithValue("@E_MAIL", f.Email);
            /// Campo E - mail
            //com.Parameters.AddWithValue("@TELEFONE", f.Telefone);
            /// Campo Telefone
            //com.Parameters.AddWithValue("@DESCRICAO", f.Descricao);
            /// Campo Descricao
            //com.Parameters.AddWithValue("@CODIGO", f.Codigo);
            /// Campo Codigo
            //com.ExecuteNonQuery();
            /// Roda a Querie
            //CloseConnection();
            /// Fecha a Conexao
        //}

        //public void Delete(FaleConosco f)
        /// Metodo de Desligamento do Fale Conosco da Aplicacao
        //{
            //OpenConnection();
            /// Abre a Conexao com a Base
            //string query = "UPDATE FALE_CONOSCO SET STATUS = @STATUS WHERE CODIGO = @CODIGO";
            /// Conversa com a Base
            //com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            //com.Parameters.AddWithValue("@CODIGO", f.Codigo);
            /// Parametro Codigo do Fale Conosco
            //com.ExecuteNonQuery();
            /// Roda a Query
            //CloseConnection();
            /// FEcha a Conexao
        //}

        //public List<FaleConosco> FindAll()
        /// Metodo de Listagem
        //{
            //OpenConnection();
            /// Abre a Conexao
            //string query = "SELECT * FROM FALE_CONOSCO WHERE STATUS = 'ABERTO'";
            /// Conversa com a Base
            //com = new SqlCommand(query, con);
            /// Instancia do SqlCommand
            //dr = com.ExecuteReader();
            /// Leitura dos Dados
            //List<FaleConosco> lista = new List<FaleConosco>();
            /// Instancia do Lista com a Entidade FaleConosco
            //while (dr.Read())
            //{
                /// Leitura dos Dados
                //FaleConosco F = new FaleConosco();
                /// Instancia da Entidade Fale Conosco
                //F.Nome = Convert.ToString(dr["NOME"]);
                /// Campo Nome
                //F.Descricao = Convert.ToString(dr["DESCRICAO"]);
                /// Campo Descricao
                //F.Email = Convert.ToString(dr["E_MAIL"]);
                /// Campo E - mail
                //F.Telefone = Convert.ToString(dr["TELEFONE"]);
                /// Campo Telefone

                //lista.Add(F);
            //}

            //CloseConnection();
            /// Fecha a Conexao
            //return lista;
            /// Retorna Para a Lista
        //}
        //public FaleConosco FindById(int codigo)
        /// Metodo de Consulta Filtrada
        //{
            //OpenConnection();
            /// Abre a Conexao
            //string query = "SELECT * FROM FALE_CONOSCO WHERE CODIGO = @CODIGO";
            /// Conversa com a Base
            //com = new SqlCommand(query, con);
            /// Instancia do sqlCommand
            //com.Parameters.AddWithValue("@CODIGO", codigo);
            /// Campo Codigo do Fale Conosco
            //dr = com.ExecuteReader();
            /// Leitura dos Dados
            //FaleConosco f = null;
            /// Instancia da Entidade Fale Conosco
            //if (dr.Read())
            //{
                /// Leitura dos Dados
                //f = new FaleConosco();

                //f.Codigo = Convert.ToInt32(dr["CODIGO"]);
                /// Campo Codigo
                //f.Nome = Convert.ToString(dr["NOME"]);
                /// Campo Nome
                //f.Telefone = Convert.ToString(dr["TELEFONE"]);
                /// Campo Telefone
                //f.Email = Convert.ToString(dr["E_MAIL"]);
                /// Campo E - mail
                //f.Descricao = Convert.ToString(dr["DESCRICAO"]);
                /// Campo Descricao
            //}

            //CloseConnection();
            /// Fecha a Conexao
            //return f;
            /// Retorna a Entidade
        //}

    //}
}
}
