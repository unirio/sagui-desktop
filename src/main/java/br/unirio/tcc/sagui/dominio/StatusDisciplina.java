package br.unirio.tcc.sagui.dominio;

import lombok.Getter;

/**
 * Enumeração dos estados ao final de uma disciplina
 * 
 * @author Marcio
 */
public enum StatusDisciplina
{
	REF("Reprovado Por Faltas"), 
	REP("Reprovado por Nota"), 
	APV("Aprovado"), 
	ASC("Matrícula"), 
	DIS("Dispensa Sem Nota");

	private @Getter String valor;

	StatusDisciplina(String status)
	{
		this.valor = status;
	}
}