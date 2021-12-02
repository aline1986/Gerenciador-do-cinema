using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Projeto.Entidades
{
    public class VW_Sessao_Filme_Sala
    {
        public int Id_Sessao { get; set; }
        public int Id_Filme { get; set; }
        public int Id_Sala { get; set; }
        public string NomeFilme { get; set; }
        public string DescricaoFilme { get; set; }
        public int DuracaoFilme { get; set; }
        public string ImagemFilme { get; set; }
        public string NomeSala { get; set; }
        public int QuantidadeDeAssentosSala { get; set; }
        public DateTime DiaFilme { get; set; }
        public int HorarioInicioFilme { get; set; }
        public int HorarioFimFilme { get; set; }
        public string TipoAnimacaoFilme { get; set; }
        public string TipoAudio { get; set; }
        public double Valor { get; set; }
        public int Horario_de_inicio_Minuto { get; set; }
        public int Horario_de_inicio_Segundo { get; set; }
        public int DuracaoMinuto { get; set; }
        public int DuracaoSegundo { get; set; }

        public VW_Sessao_Filme_Sala()
        {

        }

        public VW_Sessao_Filme_Sala(int id_Sessao, int id_Filme, int id_Sala, string nomeFilme, string descricaoFilme, int duracaoFilme, string imagemFilme, string nomeSala, int quantidadeDeAssentosSala, DateTime diaFilme, int horarioInicioFilme, int horarioFimFilme, string tipoAnimacaoFilme, string tipoAudio, double valor, int horario_de_inicio_Minuto, int horario_de_inicio_Segundo, int duracaoMinuto, int duracaoSegundo)
        {
            Id_Sessao = id_Sessao;
            Id_Filme = id_Filme;
            Id_Sala = id_Sala;
            NomeFilme = nomeFilme;
            DescricaoFilme = descricaoFilme;
            DuracaoFilme = duracaoFilme;
            ImagemFilme = imagemFilme;
            NomeSala = nomeSala;
            QuantidadeDeAssentosSala = quantidadeDeAssentosSala;
            DiaFilme = diaFilme;
            HorarioInicioFilme = horarioInicioFilme;
            HorarioFimFilme = horarioFimFilme;
            TipoAnimacaoFilme = tipoAnimacaoFilme;
            TipoAudio = tipoAudio;
            Valor = valor;
            Horario_de_inicio_Minuto = horario_de_inicio_Minuto;
            Horario_de_inicio_Segundo = horario_de_inicio_Segundo;
            DuracaoMinuto = duracaoMinuto;
            DuracaoSegundo = duracaoSegundo;
        }

        public override string ToString()
        {
            return $"Id Sessão: {Id_Sessao}, Id Filme: {Id_Filme}, Id Sala: {Id_Sala}, Nome do Filme: {NomeFilme}," +
                $" Descrição do Filme: {DescricaoFilme}, Duração do Filme: {DuracaoFilme}, Imagem do Filme: {ImagemFilme}, " +
                $"Nome da Sala: {NomeSala}, Quantidade de Assentos: {QuantidadeDeAssentosSala}, Dia do Filme: {DiaFilme.ToString("dd/MM/yyyy")}, " +
                $"Horário do Início do Filme: {HorarioInicioFilme} Horas, Horário do Termino do Filme: {HorarioFimFilme} Horas, " +
                $"Tipo de Áudio: {TipoAudio}, Tipo de Animação do Filme: {TipoAnimacaoFilme}, Valor: R$ {Valor}";
        }
    }
}
