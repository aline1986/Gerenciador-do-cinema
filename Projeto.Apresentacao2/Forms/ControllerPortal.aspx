<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControllerPortal.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.ControllerPortal" %>

<!DOCTYPE html> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gerenciador de cinema</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrapMhmuzy.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/modernizr-2.6.2.js"></script>
</head>
<body>
    

        
        
    
    <form id="form1" runat="server">
        <div>
                <%@Import Namespace="System.Data"  %>
                <%@Import Namespace="System.Data.SqlClient"  %>
                <%@Import Namespace="System.Configuration"  %>  
                <%@Import Namespace="Projeto.Entidades" %>
              
                        <% /// Assemblies Para Entidades e Conexao com a Base %>
            <%  
                try
                {
                    string conection = "Data Source=(LocalDB)/MSSQLLocalDB;Initial Catalog=GerenciadorDoCinema;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base
                    string Login = Request.Form["Login"];
                    /// Variavel que lanca a informacao do Login do(a) Usuario(a)
                    string Senha = Request.Form["Senha"];
                    /// Variavel que lanca os dados da senha do(a) Usuario(a), mas protegida
                    SqlCommand com = new SqlCommand("SELECT * FROM USUARIO WHERE LOGIN = '" + Login + "' AND SENHA = '" + Senha + "'", con);
                    SqlDataReader dr = com.ExecuteReader();
                    /// Conversa com a base
                    if (dr.Read())
                    {

                        Usuario u = new Usuario();

                        u.Login = Convert.ToString(dr["Login"]);
                        u.Senha = Convert.ToString(dr["Senha"]);

                        /// Codigo do(a) Usuario(a) Administrador(a)
                            %>
           
              <script>
                window.location.href = "../Home/Logado";
            </script> 
          
                        <% } else { %>
              <script>
                window.location.href = "../Home/Erro";
            </script>
                             <% 

     }
        con.Close();
        /// Fecha a Conexao
    }%>
                                                
                                                        <%
                                               catch (Exception e)
                                                {
                                                    /// Se tiver que da tratamento
                    %> 
            <script>
                window.location.href = "../Home/Catch";
            </script>

                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    </form>
            <center>
                <br />
           
        </center>
            <% /// Informacao da Pagina %>
</body>
</html>
