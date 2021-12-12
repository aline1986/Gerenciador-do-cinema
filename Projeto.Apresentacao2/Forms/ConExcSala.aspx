<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConExcSala.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.ConExcSala" %>

<title>Gerenciador de cinema</title>
<link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/modernizr-2.6.2.js"></script>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <br />
        <a href="../Home/Logado" class="navbar-brand">Voltar</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav"></ul>

        </div>

    </div>
</div>
<br /><br /><br /><br />
<strong><font face="arial" size="6">Exclusão de salas</font></strong>
<br /><br />
<hr />
<script>
    function MostrarIagem()
    {
        var html = "";

        html += "<img src='../Imagem/assentos.ingresso.png' />";

        var sala = document.getElementById("sala")

        sala.innerHTML = html
    }

    function Confirmar()
    {
        confirm('Deseja excluir a sala ?');
    }
</script>
<center><p id="sala" /></center>
<form id="form1" runat="server">
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

                    
                    SqlCommand com = new SqlCommand("SELECT * FROM Lista_de_salas", con);
                       SqlDataReader dr = com.ExecuteReader();
                    /// Conversa com a base
                    %>
            
                    <table border style="margin-left: 150px" width="900px" height="300px">
                        <th bgcolor="gray">
                            <td bgcolor="gray"><strong><center>Nome da Sala</center></strong></td>
                            <td bgcolor="gray"><strong><center>Quantidade de Assentos</center></strong></td>
                            <td bgcolor="gray"><strong><center>Imagem da sala</center></strong></td>
                            <td bgcolor="gray"><strong><center>Excluir</center></strong></td>
                        </th>
                    <%while (dr.Read())
                    {

                        Lista_de_salas ls = new Lista_de_salas();

                        ls.Id = Convert.ToInt32(dr["Id"]);
                        ls.Nome = dr["Nome"].ToString();
                        ls.QuantidadeDeAssentos = Convert.ToInt32(dr["QuantidadeDeAssentos"]);
                        ls.ImagemSala = dr["ImagemSala"].ToString();
                        
                        /// Codigo do(a) Usuario(a) Administrador(a)
                            %>
                            <tr>
                              <td></td>  
                               <td><center><%: ls.Nome %></center></td>
                                <td><center><%: ls.QuantidadeDeAssentos %></center></td> 
                                <td><center><button onmousemove="MostrarIagem()" class="btn-primary btn-sm" >Encoste</button></center></td>
                                <td><center><a href="DeleteSala.aspx?Id=<%: ls.Id %>" onclick="Confirmar()" class="btn-danger btn-sm">Clique</a></center></td>
                              
                                </tr>
                        <% } %>
                    
                   
           </table>   
                    
        <% con.Close();
        /// Fecha a Conexao
    }%>
                                                
                                                        <%
                                               catch (Exception e)
                                                {
                                                    /// Se tiver que da tratamento
                    %> 
            <strong><font color="red">Erro: <%: e.Message %></font></strong>
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    </form>
