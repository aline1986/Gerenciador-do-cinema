<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateSessao.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.UpdateSessao" %>

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

                    Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();
                    gs.Id = Convert.ToInt32(Request.Form["Id"]);
                    
                    gs.Horario_de_inicio = Convert.ToInt32(Request.Form["Horario_de_inicio"]);
                    gs.Horario_de_fim = Convert.ToInt32(Request.Form["Horario_de_fim"]);
                    gs.Valor_do_ingresso = Convert.ToDouble(Request.Form["Valor_do_ingresso"]);
                    gs.Tipo_de_audio = Request.Form["Tipo_de_audio"].ToString();
                    
                    SqlCommand com = new SqlCommand("UPDATE Gerenciamento_de_sessoes SET " +
                        "Horario_de_inicio = " + gs.Horario_de_inicio + ", Horario_de_fim = " + gs.Horario_de_fim + ", Valor_do_ingresso = " + gs.Valor_do_ingresso + " " +
                        " Where Id = " + gs.Id, con);
                    com.ExecuteReader();



                    /// Conversa com a base
                    %>
            
           <script>
                window.location.href = "../Home/EditarSucessoSessao";
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
                window.location.href = "../Home/EditarErroSessao";
            </script>          
                    
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>
        </div>
    </form>
