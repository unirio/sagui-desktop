package br.unirio.tcc.sagui.dominio;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import lombok.Getter;
import lombok.Setter;

/**
 * Classe que representa um aluno
 * 
 * @author Marcio
 */
public class Aluno
{
	private @Getter @Setter String nome;

	private @Getter @Setter String matricula;

	private @Getter @Setter int primeiraPagina;

	private @Getter @Setter int ultimaPagina;

	private @Getter @Setter String arquivoDocumento;

	private @Getter @Setter LocalDate dataAtualizacao;

	private @Getter @Setter int quantidadeSemestresCursados;

	private @Getter @Setter double coeficienteRendimento;

	private List<DisciplinaCursada> disciplinasMatriculadas;

	public Aluno(String nome, String matricula)
	{
		this.nome = nome;
		this.matricula = matricula;
		this.primeiraPagina = 0;
		this.ultimaPagina = 0;
		this.quantidadeSemestresCursados = 0;
		this.coeficienteRendimento = 0.0;
		this.disciplinasMatriculadas = new ArrayList<DisciplinaCursada>();
		this.dataAtualizacao = null;
	}

	public int getAnoIngresso()
	{
		return Integer.valueOf(matricula.substring(0, 4));
	}

	public int getSemestreIngresso()
	{
		return Integer.valueOf(matricula.substring(4, 5));
	}

	public int getVersaoNorma()
	{
		if (getAnoIngresso() < 2014)
			return 1;
		else
			return 2;
	}

	/**
	 * Verifica se o aluno precisa apresentar um plano de integralizacao. Como
	 * existem 2 regulamentos em vigor no BSI e cada um possui uma regra para a
	 * obrigatoriedade de entrega do plano de integralizaÃ§Ã£o, primeiro Ã©
	 * verificado em qual dos regulamentos o aluno se encontra. Caso tenha
	 * entrado na graduaÃ§Ã£o antes do primeiro semestre de 2014 ele precisa
	 * entregar o plano depois de 10 semestres concluidos. Caso tenha entrado na
	 * graduaÃ§Ã£o a partir do primeiro semestre de 2014 ele precisa entregar o
	 * plano depois de 6 semestres concluidos.
	 */
	public boolean verificaSePrecisaDePlano()
	{
		if (getAnoIngresso() < 2014)
			return (this.quantidadeSemestresCursados > 10);

		return (this.quantidadeSemestresCursados > 6);
	}

	public boolean verificaSituacaoCoeficienteRendimentoReprovacoes()
	{
		return (coeficienteRendimento < Constantes.CR_MINIMO_JUBILAMENTO && possuiMaisDeQuatroReprovacoesEmUmaMesmaMateria());
	}

	private boolean possuiMaisDeQuatroReprovacoesEmUmaMesmaMateria()
	{
		Iterable<String> disciplinasReprovadas = filtrarDisciplinasReprovadas();
		
		for (String codigoDisciplina : disciplinasReprovadas)
		{
			int count = contaReprovacoesDisciplina(codigoDisciplina);
			
			if (count >= 4)
				return true;
		}
		
		return false;
	}

	private int contaReprovacoesDisciplina(String codigoDisciplina)
	{
		int count = 0;
		
		for (DisciplinaCursada disciplina : disciplinasMatriculadas)
		{
			if (disciplina.getCodigo().compareTo(codigoDisciplina) == 0)
				if (disciplina.getStatus() == StatusDisciplina.REF || disciplina.getStatus() == StatusDisciplina.REP)
					count++;
		}
		
		return count;
	}

	private Iterable<String> filtrarDisciplinasReprovadas()
	{
		List<String> disciplinasReprovadas = new ArrayList<String>(); 

		for (DisciplinaCursada disciplina : disciplinasMatriculadas)
		{
			if (disciplina.getStatus() == StatusDisciplina.REF || disciplina.getStatus() == StatusDisciplina.REP)
			{
				boolean achou = false;
				
				for (String codigo : disciplinasReprovadas)
				{
					if (codigo.compareTo(disciplina.getCodigo()) == 0)
						achou = true;
				}
				
				if (!achou)
					disciplinasReprovadas.add(disciplina.getCodigo());
			}
		}

		return disciplinasReprovadas;
	}

	public boolean verificaSituacaoMinimoTresDisciplinas()
	{
		int count = 0;

		for (DisciplinaCursada disciplina : disciplinasMatriculadas)
			if (disciplina.getStatus() == StatusDisciplina.ASC)
				count++;

		return (count < 3);
	}

	public boolean verificaSePossuiMaisSemestresQuePrazo()
	{
		if (getAnoIngresso() < 2014)
		{
			if (this.quantidadeSemestresCursados > Constantes.MAXIMO_SEMESTRES_GRADUACAO_ANTIGO)
				return true;
		}
		else
		{
			if (this.quantidadeSemestresCursados > Constantes.MAXIMO_SEMESTRES_GRADUACAO_NOVO)
				return true;
		}
		
		return false;
	}

	public Set<DisciplinaCursada> pegaDisciplinasOptativasAprovadas()
	{
		Set<DisciplinaCursada> resultado = new HashSet<DisciplinaCursada>();

		for (DisciplinaCursada matricula : disciplinasMatriculadas)
		{
			if (matricula.getTipo() == TipoDisciplina.OPTATIVA
					&& (matricula.getStatus() == StatusDisciplina.APV || matricula.getStatus() == StatusDisciplina.DIS))
			{
				resultado.add(matricula);
			}
		}

		return resultado;
	}

	public Set<DisciplinaCursada> pegaDisciplinasOptativasMatriculado()
	{
		Set<DisciplinaCursada> resultado = new HashSet<DisciplinaCursada>();

		for (DisciplinaCursada matricula : disciplinasMatriculadas)
		{
			if (matricula.getTipo() == TipoDisciplina.OPTATIVA && matricula.getStatus() == StatusDisciplina.ASC)
			{
				resultado.add(matricula);
			}
		}

		return resultado;
	}

	public Set<DisciplinaCursada> pegaDisciplinasEletivasAprovadas()
	{
		Set<DisciplinaCursada> resultado = new HashSet<DisciplinaCursada>();

		for (DisciplinaCursada matricula : disciplinasMatriculadas)
		{
			if (matricula.getTipo() == TipoDisciplina.ELETIVA
					&& (matricula.getStatus() == StatusDisciplina.APV || matricula.getStatus() == StatusDisciplina.DIS))
			{
				resultado.add(matricula);
			}
		}

		return resultado;
	}

	public Set<DisciplinaCursada> pegaDisciplinasEletivasMatriculado()
	{
		Set<DisciplinaCursada> resultado = new HashSet<DisciplinaCursada>();

		for (DisciplinaCursada matricula : disciplinasMatriculadas)
		{
			if (matricula.getTipo() == TipoDisciplina.ELETIVA && matricula.getStatus() == StatusDisciplina.ASC)
			{
				resultado.add(matricula);
			}
		}

		return resultado;
	}

	public int contaDisciplinasOptativasAprovadas()
	{
		int resultado = 0;

		for (DisciplinaCursada matricula : disciplinasMatriculadas)
		{
			if (matricula.getTipo() == TipoDisciplina.OPTATIVA
					&& (matricula.getStatus() == StatusDisciplina.APV || matricula.getStatus() == StatusDisciplina.DIS))
			{
				resultado++;
			}
		}

		return resultado;
	}

	public int contaDisciplinasOptativasMatriculado()
	{
		int resultado = 0;

		for (DisciplinaCursada matricula : disciplinasMatriculadas)
		{
			if (matricula.getTipo() == TipoDisciplina.OPTATIVA && matricula.getStatus() == StatusDisciplina.ASC)
			{
				resultado++;
			}
		}

		return resultado;
	}

	public int contaDisciplinasEletivasAprovadas()
	{
		int resultado = 0;

		for (DisciplinaCursada matricula : disciplinasMatriculadas)
		{
			if (matricula.getTipo() == TipoDisciplina.ELETIVA
					&& (matricula.getStatus() == StatusDisciplina.APV || matricula.getStatus() == StatusDisciplina.DIS))
			{
				resultado++;
			}
		}

		return resultado;
	}

	public int contaDisciplinasEletivasMatriculado()
	{
		int resultado = 0;

		for (DisciplinaCursada matricula : disciplinasMatriculadas)
		{
			if (matricula.getTipo() == TipoDisciplina.ELETIVA && matricula.getStatus() == StatusDisciplina.ASC)
			{
				resultado++;
			}
		}

		return resultado;
	}

	public StatusDisciplina pegaUltimoStatusDisciplinaObrigatoria(String codigo)
	{
		DisciplinaCursada matricula = pegaMatriculaDisciplinaCodigo(codigo);

		if (matricula != null)
		{
			if (matricula.getStatus() == StatusDisciplina.APV || matricula.getStatus() == StatusDisciplina.DIS)
				return StatusDisciplina.APV;

			if (matricula.getStatus() == StatusDisciplina.ASC)
				return StatusDisciplina.ASC;

			if (matricula.getStatus() == StatusDisciplina.REP || matricula.getStatus() == StatusDisciplina.REF)
				return StatusDisciplina.REP;
		}

		return null;
	}

	private DisciplinaCursada pegaMatriculaDisciplinaCodigo(String codigo)
	{
		for (int i = disciplinasMatriculadas.size() - 1; i >= 0; i--)
		{
			DisciplinaCursada matricula = disciplinasMatriculadas.get(i);

			if (matricula.getCodigo().compareTo(codigo) == 0)
				return matricula;
		}

		return null;
	}

	public void incluirDisciplinaMatriculada(DisciplinaCursada matricula)
	{
		this.disciplinasMatriculadas.add(matricula);
	}

	public Iterable<DisciplinaCursada> getDisciplinasMatriculadas()
	{
		return disciplinasMatriculadas;
	}
}