﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projeto.Apresentacao2.Models
{
    public class Gerenciamento_de_filmes_Consulta_View_Model
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }
        public TimeSpan Duracao { get; set; }
        public string imagem { get; set; }

    }
}