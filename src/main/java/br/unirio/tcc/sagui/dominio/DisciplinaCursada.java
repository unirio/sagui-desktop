package br.unirio.tcc.sagui.dominio;

import lombok.Data;

/**
 * Classe que identifica a matricula de um aluno em uma disciplina
 * 
 * @author Raquel
 */
public @Data class DisciplinaCursada
{
	private String codigo;

	private String nome;

	private TipoDisciplina tipo;

	private int ano;

	private int periodo;

	private StatusDisciplina status;

	private int cargaHoraria = 0;

	private int creditos = 0;

	private int versaoPPC = 1;

	public DisciplinaCursada(String codigo, String nome, TipoDisciplina tipo, int ano, int periodo, StatusDisciplina status)
	{
		this.codigo = codigo;
		this.nome = nome;
		this.tipo = tipo;
		this.ano = ano;
		this.periodo = periodo;
		this.status = status;
	}
}