<%@ Page Language="C#" AutoEventWireup ="true" CodeBehind="Portal.aspx.cs" Inherits="Projeto.Apresentacao2.Forms.Portal" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciador de cinema</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/modernizr-2.6.2.js"></script>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header"> 
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="../Home/Index" class="navbar-brand">Voltar</a>
                <a href="#" style="margin-left: 50px" class="navbar-brand">Cadastrar</a>
               </div>
            <br />
            
            <table  align="right" >
            <tr >
                <td><font color="White" face="arial" size="3"><%: DateTime.Now.DayOfWeek %> - <%:DateTime.Now.Day%> / <%: DateTime.Now.Month%> / <%:DateTime.Now.Year%>  <%:DateTime.Now.Hour%> : <%:DateTime.Now.Minute %> Hrs</font></td>
            </tr>
        </table>

            <!Implementacao do relogio na Aplicacao>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav"></ul>
           
            </div>

        </div>

    </div>
            <% /// Menu da Pagina %>
    <div class="container body-content">
        @RenderBody()
        <hr />
            <% /// Divisoria da Pagina %>
        <div>
         <form id="form1"  action="ControllerPortal.aspx" runat="server">   
        <table style="margin-top: 75px"  align="center" width="300px" bgcolor="black">
                <% /// Inicializacao do Portal da Pagina %>
            <thead>
                <tr align="center">
                    <td colspan="2" bgcolor="gray">
                        <strong>Area Restrita</strong>
                    </td>
                        <% /// Aviso de Area Restrita acesso somente para Funcionarios %>
                </tr>
                <tr>
                    <td bgcolor="beige">Login: <input type="text" name="Login" class="form-control" /><br />
                            <% /// Campo Login %>
                        Senha: <input type="password" name="Senha" class="form-control" /><br />
                            <% /// Campo Senha %>
                    </td>
                </tr>
                
                <tr align="center" bgcolor="gray">
                    <td colspan="2">
                        <input type="submit" class="btn btn-primary btn-sm" data-toggle="collapse" data-target=".navbar-collapse" value="Acessar" />
                    </td>
                </tr>
                </thead>
                    <% /// Botao de se logar %>
</table>
                <% /// Finalizacao da tabela do Portal %>
        <br />
            
        </div>
    </form>
        <hr style="margin-top: 200px" />  
        <center>
            <footer>
                <p>&copy; <%= DateTime.Now.Year %> - Gerenciador de cinema</p>
            </footer>
        </center>
    </div>

    <script src="~/Scripts/jquery-1.10.2.min.js"></script>
    <script src="~/Scripts/bootstrap.min.js"></script>
</body>
</html>>

