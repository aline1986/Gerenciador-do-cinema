<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateFilmeImg.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.UpdateFilmeImg" %>

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
                    string conection = "Data Source=(LocalDB)/MSSQLLocalDB;Initial Catalog=GerenciadorDoCinema;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                    gf.Id = Convert.ToInt32(Request.Form["Id"]);
                    gf.Imagem = Request.Form["Imagem"].ToString();
                    
                    string img = "c:/" + gf.Imagem;

                    if(Directory.Exists("C://"))
                    {

                        Directory.GetFiles("c:/", gf.Imagem, SearchOption.TopDirectoryOnly);

                        if (!Directory.Exists("C:/Imgs/"))
                        {
                            Directory.CreateDirectory("C:/Imgs/");
                        }
                         File.Copy("C:/" + gf.Imagem, "C:/Gerenciador_do_Cinema_2021/Gerenciador-do-cinema/Projeto.Apresentacao2/Imagem/" + gf.Imagem);

                    }
                    

                        SqlCommand com = new SqlCommand("UPDATE Gerenciamento_de_filmes SET Imagem = '" + gf.Imagem + "'  Where Id = " + gf.Id, con);
                        com.ExecuteReader();

                    

                    /// Conversa com a base
                    %>
            
          <script>
                window.location.href = "../Home/EditarSucessoImgFilme";
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
                window.location.href = "../Home/EditarErroImgFilme";
            </script>          
                    
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    </form>
