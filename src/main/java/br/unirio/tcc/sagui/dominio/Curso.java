package br.unirio.tcc.sagui.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;

public class Curso
{
	private @Getter String nome;
	
	private List<Disciplina> disciplinas;
	
	private List<Aluno> alunos;
	
	public Curso(String nome)
	{
		this.nome = nome;
		this.disciplinas = new ArrayList<Disciplina>();
		this.alunos = new ArrayList<Aluno>();
	}
	
	public void adicionaDisciplina(String codigo, String nome, TipoDisciplina tipo, int versaoPPC)
	{
		disciplinas.add(new Disciplina(codigo, nome, tipo, versaoPPC));
	}

	public Aluno pegaAlunoPorMatricula(String matricula)
	{
		for (Aluno aluno : alunos)
			if (aluno.getMatricula().compareTo(matricula) == 0)
				return aluno;
		
		return null;
	}

	public void removeAluno(Aluno aluno)
	{
		alunos.remove(aluno);
	}

	public Disciplina pegaDisciplinaCodigo(String codigo)
	{
		for (Disciplina disciplina : disciplinas)
			if (disciplina.getCodigo().compareTo(codigo) == 0)
				return disciplina;
		
		return null;
	}

	public void adicionaAluno(Aluno aluno)
	{
		alunos.add(aluno);
	}

	public Iterable<Aluno> getAlunos()
	{
		return alunos;
	}
}