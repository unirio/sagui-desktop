package br.unirio.tcc.sagui.dominio;

import lombok.Getter;

/**
 * Enumeração dos tipos de disciplina
 * 
 * @author Marcio
 */
public enum TipoDisciplina
{
	OBRIGATORIA("Obrigatória"), 
	OPTATIVA("Optativa"), 
	ELETIVA("Eletiva");

	private @Getter String valor;

	TipoDisciplina(String tipo)
	{
		this.valor = tipo;
	}
}