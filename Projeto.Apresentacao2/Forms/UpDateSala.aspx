<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpDateSala.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.UpDateSala" %>

<link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/modernizr-2.6.2.js"></script>
  
<form id="form1" action="#" runat="server" style="margin-left: 50px">
        <div>
                <%@Import Namespace="System.Data"  %>
                <%@Import Namespace="System.Data.SqlClient"  %>
                <%@Import Namespace="System.Configuration"  %>  
                <%@Import Namespace="Projeto.Entidades" %>
                 <%@Import Namespace="System.IO"  %>
              
                        <% /// Assemblies Para Entidades e Conexao com a Base %>
            <%  
                try
                {
                   
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    Lista_de_salas ls = new Lista_de_salas();
                    ls.Id = Convert.ToInt32(Request.Form["Id"]);
                    ls.Nome = Request.Form["Nome"].ToString();
                    ls.QuantidadeDeAssentos = Convert.ToInt32(Request.Form["QuantidadeDeAssentos"]);
                   


                    

                        SqlCommand com = new SqlCommand("UPDATE Lista_de_salas SET Nome = '" + ls.Nome + "', QuantidadeDeAssentos = '" + ls.QuantidadeDeAssentos + "'  Where Id = " + ls.Id, con);
                        com.ExecuteReader();

                    

                    /// Conversa com a base
                    %>
            
           <script>
                window.location.href = "../Home/EditarSucessoSala";
            </script>       
                    
                    
        <% con.Close();
        /// Fecha a Conexao
    }%>
                                                
                                                        <%
                                               catch (Exception e)
                                                {
                                                    /// Se tiver que da tratamento
                    %> 
             <script>
                window.location.href = "../Home/EditarErroSala";
            </script>          
                    
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    </form>

