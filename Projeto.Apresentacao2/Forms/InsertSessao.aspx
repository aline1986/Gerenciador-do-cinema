<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertSessao.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.InsertSessao" %>

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
           <a href="../Home/Logado" class="navbar-brand">Voltar</a>
           
        </div>
        <br />
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav"></ul>
        </div>
    </div>
</div>
<br /><br /><br /><br />
<h2 style="margin-left:100px">Cadastro de Sessão</h2>
<hr />
<form method="post" action="ActionCadastroSessao.aspx">
 
    <div class="row">
        <div class="col-md-4">
            <label style="margin-left: 50px"><font face="arial" size="3">Data da Sessão:</font></label>
            <input type="date" name="Data" style="margin-left: 50px" class="form-control" />
            <br /><br />
            <label style="margin-left: 50px"><font face="arial" size="3">Horário de Início em Horas:</font></label>
            <input type="number" name="Horario_de_inicio" min="0" max="23" style="margin-left: 50px" class="form-control" />
            <br /><br />
            <label style="margin-left: 50px"><font face="arial" size="3">Valor do Ingresso:</font></label>
                   <br /> <table style="margin-left:50px" width="500px"><tr><td>R$:</td><td> <input type="number" min="0.00" max="100000000000.00" name="Valor_do_Ingresso" class="form-control"/></div></td></tr></table>
            <br /><br />
            <label style="margin-left: 50px"><font face="arial" size="3">Tipo de Animação:</font></label>
                <select name="Tipo_de_animacao" style="margin-left: 50px" class="form-control">
                     <option selected="selected" value="">Selecione a Opção</option>
                     <option value="2D">2D</option>
                     <option value="3D">3D</option>
                </select>
            <br /><br />
            <label style="margin-left: 50px"><font face="arial" size="3">Tipo de Áudio:</font></label>
                <select name="Tipo_de_audio" style="margin-left: 50px" class="form-control">
                     <option selected="selected" value="">Selecione a Opção</option>
                     <option value="Dublado">Dublado</option>
                     <option value="Legendado">Legendado</option>
                </select>
            <br /><br />
            <label style="margin-left: 50px"><font face="arial" size="3">Filme:</font></label>
                <select name="Id_Filme" style="margin-left: 50px" class="form-control">
                     <option selected="selected" value="">Selecione a Opção</option>
                     <%@Import Namespace="System.Data"  %>
                <%@Import Namespace="System.Data.SqlClient"  %>
                <%@Import Namespace="System.Configuration"  %>  
                <%@Import Namespace="Projeto.Entidades" %>
            
              
                        <% /// Assemblies Para Entidades e Conexao com a Base %>
            <%                              Gerenciamento_de_filmes gf = new Gerenciamento_de_filmes();
                List<int> dura = new List<int>();
                try
                {

                    /// Inicializacao do Tratamento
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    con.Open();
                    /// Abre a Conexao com a Base
                    SqlCommand com = new SqlCommand("SELECT * FROM Gerenciamento_de_filmes", con);
                    SqlDataReader dr = com.ExecuteReader();
                    /// Conversa com a base
                    %>
            
                    
                    <%

                        while (dr.Read())
                        {



                            gf.Id = Convert.ToInt32(dr["Id"]);
                            gf.Titulo = dr["Titulo"].ToString();
                            gf.Duracao = Convert.ToInt32(dr["Duracao"]);


                            
                            %><option value = "<%: gf.Id %>"><%  dura.Add(gf.Id); %><%: gf.Titulo %> - Duração do Filme: <%: gf.Duracao %> Horas</option>
                            
                    
                 <%
                        

                     }%>
                    </select>       
                  <%}%>
                    
        
                           
                                                
                                                        <%
                                                            catch (Exception e)
                                                            {
                                                                /// Se tiver que da tratamento
                    %> 
            <strong><font color="red">Erro: <%: e.Message %></font></strong>
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>      
         <%  

             try
             {

                 /// Inicializacao do Tratamento
                 SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                 con2.Open();
                 /// Abre a Conexao com a Base
                 SqlCommand com2 = new SqlCommand("SELECT * FROM Gerenciamento_de_filmes Where Id =" + gf.Id, con2);
                 SqlDataReader dr2 = com2.ExecuteReader();
                 /// Conversa com a base
                    %>
            
                    
                    <%

    if(dr2.Read())
    {

        

        
        gf.Duracao = Convert.ToInt32(dr2["Duracao"]);

        if (gf.Duracao != null)
        {

                            %><input type="hidden" name="Duracao" value = "<%: gf.Duracao %>"/>
                   
                  <%   }else{
        }
                 }
        
    }
    catch (Exception ex3)
    {%>
        <%: ex3.Message %>
    <%}%>
           
                           
            <br /><br />
                             <%@Import Namespace="System.Data"  %>
                <%@Import Namespace="System.Data.SqlClient"  %>
                <%@Import Namespace="System.Configuration"  %>  
                <%@Import Namespace="Projeto.Entidades" %>
            
              
                        <% /// Assemblies Para Entidades e Conexao com a Base %>
            

                    
             
            <label style="margin-left: 50px"><font face="arial" size="3">Sala:</font></label>
                <select name="Id_Sala" style="margin-left: 50px" class="form-control">
                     <option selected="selected" value="">Selecione a Opção</option>
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
                    SqlConnection conSala = new SqlConnection(ConfigurationManager.ConnectionStrings["GerenciadorDoCinema"].ConnectionString);
                    conSala.Open();
                    /// Abre a Conexao com a Base
                    SqlCommand comSala = new SqlCommand("SELECT * FROM Lista_de_salas", conSala);
                    SqlDataReader drSala = comSala.ExecuteReader();
                    /// Conversa com a base
                    %>
            
                    
                    <%while (drSala.Read())
                        {

                            Lista_de_salas ls = new Lista_de_salas();

                            ls.Id = Convert.ToInt32(drSala["Id"]);
                            ls.Nome = drSala["Nome"].ToString();
                            


                            %><option value = "<%: ls.Id %>"><%: ls.Nome %></option>
                            <%}%>
                    </select>
            <br /><br />
             <%            conSala.Close();
                     /// Fecha a Conexao
                 }      %>
                                                
                                                        <%
                                                            catch (Exception e)
                                                            {
                                                                /// Se tiver que da tratamento
                    %> 
            <strong><font color="red">Erro: <%: e.Message %></font></strong>
                       
                                           <% /// Gera a mensagem de erro %>     
                <% }
     %>            <input type="submit" style="margin-left: 50px" class="btn btn-primary btn-sm" value="Cadastrar Sessão" />
        </div>
    </div>
</form>