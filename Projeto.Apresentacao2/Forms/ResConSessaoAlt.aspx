<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResConSessaoAlt.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.ResConSessaoAlt" %>

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
           <a href="ConViewSessaoFilmeSala.aspx" class="navbar-brand">Voltar</a>
           
        </div>
        <br />
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav"></ul>
        </div>
    </div>
</div>
<br /><br /><br /><br />
<h2 style="margin-left:100px">Consulta da Sessão Para Alterar os seus Dados</h2>
<hr />
<form method="post" action="UpdateSessao.aspx">
   <%@Import Namespace="System.Data"  %>
                <%@Import Namespace="System.Data.SqlClient"  %>
                <%@Import Namespace="System.Configuration"  %>  
                <%@Import Namespace="Projeto.Entidades" %>
            
              
                        <% /// Assemblies Para Entidades e Conexao com a Base %>
            <%  
                Gerenciamento_de_sessoes gs = new Gerenciamento_de_sessoes();
                try
                {
                
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base

                    string Id = Request.QueryString["Id_Sessao"];
                    SqlCommand com = new SqlCommand("SELECT * FROM Gerenciamento_de_sessoes Where Id = " + Id, con);
                    SqlDataReader dr = com.ExecuteReader();
                    /// Conversa com a base
                    %>
            
                    
                    <%if (dr.Read())
                        {

                            

                            gs.Id = Convert.ToInt32(dr["Id"]);
                            gs.Data = Convert.ToDateTime(dr["Data"]);
                            gs.Horario_de_inicio = Convert.ToInt32(dr["Horario_de_inicio"]);
                            gs.Valor_do_ingresso = Convert.ToInt32(dr["Valor_do_ingresso_reais"]);
                            gs.Valor_do_ingresso_centavos = Convert.ToInt32(dr["Valor_do_ingresso_centavos"]);
                            gs.Tipo_de_animacao = dr["Tipo_de_animacao"].ToString();
                            gs.Tipo_de_audio = dr["Tipo_de_audio"].ToString();
                            gs.Id_filme = Convert.ToInt32(dr["Id_filme"]);
                            gs.Id_sala = Convert.ToInt32(dr["Id_sala"]);
                            
                            gs.Horario_de_inicio_Minuto = Convert.ToInt32(dr["Horario_de_inicio_Minuto"]);
                            gs.Horario_de_Inicio_Segundo = Convert.ToInt32(dr["Horario_de_inicio_Segundo"]);

    %><input type="hidden" name="Id" style="margin-left: 50px"  class="form-control"  value="<%: gs.Id %>">
    <input type="hidden" name="Duracao_Minuto" style="margin-left: 50px"  class="form-control"  value="<%: gs.Duracao_Minuto %>">
    <input type="hidden" name="Duracao_Segundo" style="margin-left: 50px"  class="form-control"  value="<%: gs.Duracao_Segundo %>">
    <div class="row">
        <div class="col-md-4">
            <label style="margin-left: 50px"><font face="arial" size="3">Data da sessão:</font></label>
            <input type="date" name="Data" style="margin-left: 50px" class="form-control"  value="<%: gs.Data %>"/>
            <br /><br />    
            <label style="margin-left: 50px"><font face="arial" size="3">Horário de Início em Horas:</font></label>
            <input type="number" name="Horario_de_inicio" min="0" max="23" style="margin-left: 50px" value="<%: gs.Horario_de_inicio %>" class="form-control" />
            <br /><br />
            <label style="margin-left: 50px"><font face="arial" size="3">Horário de Início em Minuto(s):</font></label>
            <input type="number" name="Horario_de_inicio_Minuto" min="0" max="59" value="<%: gs.Horario_de_inicio_Minuto %>" style="margin-left: 50px" class="form-control" />
            <br /><br />
            <label style="margin-left: 50px"><font face="arial" size="3">Horário de Início em Segundo(s):</font></label>
            <input type="number" name="Horario_de_inicio_Segundo" min="0" max="59" value="<%: gs.Horario_de_Inicio_Segundo %>" style="margin-left: 50px" class="form-control" />
            <br /><br />
            <label style="margin-left: 50px"><font face="arial" size="3">Valor do Ingresso R$:</font></label>
                   <br /> <table style="margin-left:50px" width="500px"><tr><td>Reais:</td><td> <input type="number" min="0" max="100000000000" name="Valor_do_Ingresso" value="<%:gs.Valor_do_ingresso %>" class="form-control"/></div></td></tr></table>
            <br /> <table style="margin-left:50px" width="500px"><tr><td>Centavos:</td><td> <input type="number" min="0" max="99" name="Valor_do_Ingresso_centavos" value="<%:gs.Valor_do_ingresso_centavos %>" class="form-control"/></div></td></tr></table>
            <br /><br />
                        <label style="margin-left: 50px"><font face="arial" size="3">Tipo de Áudio:</font></label>
                <select name="Tipo_de_audio" style="margin-left: 50px" class="form-control">
                     <option value="">Selecione a Opção</option>
                     <option selected="selected" value="<%: gs.Tipo_de_audio %>"><%: gs.Tipo_de_audio %></option>
                     <option value="Dublado">Dublado</option>
                     <option value="Legendado">Legendado</option>
                </select>
            <br /><br />
                  <% } %>
                    
                   
             
                    
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
            <br /><br />

                    <input type="submit" style="margin-left: 50px" class="btn btn-primary btn-sm" value="Alterar dados da sessão" />
        </div>
    </div>
</form>