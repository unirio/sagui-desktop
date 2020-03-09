package br.unirio.tcc.sagui.dominio;

public enum SituacaoJubilamento {

	MENOS_3_DISCIPLINAS("Menos de 3 disciplinas matriculadas"), 
	MAIS_SEMESTRES("Aluno cursou mais Semestres do que o prazo"), 
	CR_MENOR_4_E_REPROVACOES("CR menor do que 4,0 e houve 4 ou mais reprovações na mesma disciplina");

	private String valor;

	SituacaoJubilamento(String situacao) {
		this.valor = situacao;
	}

	public String getValor() {
		if (this.equals(CR_MENOR_4_E_REPROVACOES)) {
			return "CR menor do que " + Constantes.CR_MINIMO_JUBILAMENTO + " e houve "
					+ Constantes.MAXIMO_REPROVACOES_MESMA_MATERIA
					+ " ou mais reprovações na mesma disciplina";
		} else {
			return valor;
		}
	}
}