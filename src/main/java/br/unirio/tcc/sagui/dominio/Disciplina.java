package br.unirio.tcc.sagui.dominio;

import lombok.Data;

/**
 * Classe que representa uma disciplina em um curso
 * 
 * @author Raquel
 */
public @Data class Disciplina
{
	private String codigo;

	private String nome;

	private TipoDisciplina tipoDisciplina;

	private int versaoPPC = 1;

	public Disciplina(String codigo, String nome, TipoDisciplina tipo, int versaoPPC)
	{
		this.codigo = codigo;
		this.nome = nome;
		this.tipoDisciplina = tipo;
		this.versaoPPC = versaoPPC;
	}
}