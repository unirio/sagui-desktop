package br.unirio.tcc.sagui.servicos;

import java.io.PrintWriter;

import br.unirio.tcc.sagui.dominio.Aluno;
import br.unirio.tcc.sagui.dominio.Curso;

/**
 * Classe que gera o índice dos alunos
 * 
 * @author Marcio
 */
public class GeradorIndice
{
	public void executa(Curso curso, String reportDirectory) throws Exception
	{
		for (int i = 2010; i <= 2019; i++)
		{
			geraIndice(i, 1, curso, reportDirectory);
			geraIndice(i, 2, curso, reportDirectory);
		}
	}

	private void geraIndice(int ano, int semestre, Curso curso, String reportDirectory) throws Exception
	{
		String result = "<html>\n";
		result += "<head>\n";
		result += "<meta charset='UTF-8'>\n";
		result += "</head>\n";
		result += "<h3>Alunos de " + ano + "/" + semestre + "</h3>\n";
		result += "<ul>\n";
		
		int count = 0;
		
		for (Aluno aluno : curso.getAlunos())
		{
			if (aluno.getAnoIngresso() == ano && aluno.getSemestreIngresso() == semestre)
			{
				String link = "html/" + aluno.getMatricula() + " - " + aluno.getNome() + ".html";
				result += "<li><a href='" + link + "'>" + aluno.getNome() + "</a>" + " (" + aluno.getMatricula() + ")</li>\n";
				count++;
			}
		}

		result += "</ul>\n";
		result += "</html>\n";

		if (count > 0)
		{
			PrintWriter fileWriter = new PrintWriter(reportDirectory + "/indice-" + ano + "-" + semestre + ".html", "UTF-8");
			fileWriter.print(result);
			fileWriter.close();
		}
	}
}