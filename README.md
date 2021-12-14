# Gerenciador-do-cinema

Para montar o Sistema para poder usá-lo

1- Disco c: você vai clonar o repositório 

vai abrir o git bash e vai dar um cd c:

e depois vai digitar este comando: git clone https://github.com/aline1986/Gerenciador-do-cinema.git

2- Depois vai em cd Gerenciador-do-cinema

3- vai digitar no git bash: Git pull

4- Criar o banco de dados:

Você vai abrir o Visual studio o 2017 versão 4.6.1 ,

Vai na opção view

vai em SQL Server Explorer

vai clicar no bullet da opção SQL Server

vai clicar no bullet da opção Local

Na pasta data base você vai clicar com o botão direito do mouse 

E vai em Add New Database

Ele vai abrir um pop - up para colocar o nome do Database você vai colocar o nome eu recomendo colocar GerenciadorDoCinema

e vai salvar

Depois você vai no gist dos scripts vai selecionar todos os scripts e vai no banco de dados que foi criado e clicar com 

O botão direito do mouse e  em new query; Depois vai colar os scripts e depois rodar  dar( ctrl + shift + e)

5- Conectar o banco: 

Nesse item do banco de dados você vai clicar duas vezes nesse simbolo do banco de dados e vai em connection string vai copiar esse caminho

depois vai abrir outro visual studio para colocar o código, vai abrir o projeto e na parte de apresentação vai clicar na web.config debaixo do arquivo packages.config

e lá na tag connection string dentro do add na linha 48 você vai selecionar tudo que está dentro de aspas duplas "" e vai apagar e vai colar aquele caminho da connection string 

que você pegou do banco.

6- Configurar o ambiente da imagem:

Você vai na pasta de imagem clicar em cima dela com o botão direito do mouse, ela fica em Projeto.Apresentacao2 e vai em open folder, vai aparaecer a janela do windows 

O caminho do diretório do browser da pasta da windows você vai copiar ele e você vai na pasta forms em ActionCadastroFilme.aspx vai nesse arquivo do Programa, vai na linha 41 do comando File.Copy, o caminho que está em aspas duplas "" dentro dessas aspas você vai apagar o que está dentro e vai colar aquele caminho que pegou no windows 

, vai depois tambem na pasta forms em UpdateFilmeImg fazer a mesma coisa na linha 40 e depois salva ;

7- Ativar o projeto apresentação: 

Você vai clicar com o botão direito do mouse em Projeto.Apresentacao2 e vai em iniciar como projeto de inicialização; 

8- Se logar:

Com o insert que estava no script você vai ver o login e senha e vai no portal e colocar estes dados;

9- Mandar imagem :
Você vai ter que colocar a imagem no disco c, fazer ctrl + c e ctrl + v e depois vai clicar no botão do cadastro do filme de imagem, tanto no cadastro 

qunato na alteração da imagem do filme. 


Qualquer dúvida entrar em contato:

e-mail: aline.santana001@gmail.com



