package br.unirio.tcc.sagui.servicos;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import br.unirio.tcc.sagui.dominio.Aluno;
import br.unirio.tcc.sagui.dominio.Curso;
import br.unirio.tcc.sagui.dominio.DisciplinaCursada;
import br.unirio.tcc.sagui.dominio.StatusDisciplina;

/**
 * Classe responsável por gerar o fluxograma de um aluno
 * 
 * @author Marcio
 */
public class GeradorFluxograma
{
	private static final String WHITE = "#ffffff";

	private static final String RED = "#ff0000";

	private static final String GREEN = "#00ff00";

	private static final String YELLOW = "#ffff00";

	private int numeroDisciplinasOptativasAprovadas;
	
	private int numeroDisciplinasOptativasMatriculadas;
	
	private int numeroDisciplinasEletivasAprovadas;
	
	private int numeroDisciplinasEletivasMatriculadas;

	/**
	 * Gera o fluxograma para todo o curso
	 */
	public void geraFluxograma(Curso curso, String svgPath, String reportDirectory) throws Exception
	{
		for (Aluno aluno : curso.getAlunos())
		{
			System.out.println("Gerando o fluxograma de " + aluno.getNome() + " (" + aluno.getMatricula() + ") ...");
			geraFluxogramaAluno(aluno, svgPath, reportDirectory);
		}
	}

	/**
	 * Gera o fluxograma para um aluno
	 */
	private void geraFluxogramaAluno(Aluno aluno, String svgPath, String reportDirectory) throws Exception
	{
		this.numeroDisciplinasOptativasAprovadas = aluno.contaDisciplinasOptativasAprovadas();
		this.numeroDisciplinasOptativasMatriculadas = aluno.contaDisciplinasOptativasMatriculado();
		this.numeroDisciplinasEletivasAprovadas = aluno.contaDisciplinasEletivasAprovadas();
		this.numeroDisciplinasEletivasMatriculadas = aluno.contaDisciplinasEletivasMatriculado();

		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc;
		
		try
		{
			File fXmlFile = new File(svgPath);
			doc = dBuilder.parse(fXmlFile);
		}
		catch(Exception e)
		{
			InputStream in = getClass().getResourceAsStream("/resources/grade_curricular.svg"); 
			doc = dBuilder.parse(in);
		}
		
		doc.getDocumentElement().normalize();
		pintaDisciplinas(aluno, doc);

	    TransformerFactory tf = TransformerFactory.newInstance();
	    Transformer transformer = tf.newTransformer();

        StringWriter stringWriter = new StringWriter();
        transformer.transform(new DOMSource(doc), new StreamResult(stringWriter));
        String xmlString = stringWriter.getBuffer().toString();   

        String result = "<html>\n";
        result += "<h3 style='margin-bottom: 0px'>" + aluno.getNome() + "</h3>\n";
        result += "<h5 style='margin-top: 6px'>Matrícula: <span style='color: gray'>" + aluno.getMatricula() + "</span> | <a href='../pdf/" + aluno.getMatricula() + " - " + aluno.getNome() + ".pdf'>Histórico</a> | <a href='#disciplinas'>Tabela</a></h5>\n";
        result += apresentaJubilamento(aluno);
        result += xmlString + "\n";
        result += apresentaTabelaDisciplinas(aluno);
        result += "</html>";

		String outFile = reportDirectory + File.separator + aluno.getAnoIngresso() + "-" + aluno.getSemestreIngresso() + File.separator + "html" + File.separator + aluno.getMatricula() + " - " + aluno.getNome() + ".html";
		criaDiretorios(outFile);
		
		PrintWriter fileWriter = new PrintWriter(outFile, "UTF-8");
		fileWriter.print(result);
		fileWriter.close();
	}

	/**
	 * Apresenta a situação de jubilamento do aluno
	 */
	private String apresentaJubilamento(Aluno aluno)
	{
		String result = "";
		
		if (aluno.verificaSePossuiMaisSemestresQuePrazo())
			result += "<p><b>Situação de Jubilamento:</b> O aluno está a mais semestres do que o prazo permitido.</p>\n";
		
		if (aluno.verificaSituacaoCoeficienteRendimentoReprovacoes())
			result += "<p><b>Situação de Jubilamento:</b> O aluno está com CR abaixo do mínimo e tem quatro reprovações na mesma disciplina.</p>\n";
		
		return result;
	}

	/**
	 * Apresenta uma tabela com as disciplinas cursadas
	 */
	private String apresentaTabelaDisciplinas(Aluno aluno)
	{
		String result = "<table id='disciplinas' style='width:80%;border:1px solid black' border='1'>\n";
        result += "<tr><th>Código</th><th>Nome</th><th>Tipo</th><th>Período</th><th>Status</th></tr>\n";
        
        for (DisciplinaCursada matricula : aluno.getDisciplinasMatriculadas())
        {
            result += "<tr><td>" + matricula.getCodigo() + "</td><td>" + matricula.getNome() + "</td><td>" + matricula.getTipo() + "</td><td>" + matricula.getPeriodo() + "/" + matricula.getAno() + "</td><td>" + matricula.getStatus() + "</td></tr>\n";
        }
        
        result += "</table>\n";
		return result;
	}

	/**
	 * Pinta as disciplinas cursadas por um aluno
	 */
	private void pintaDisciplinas(Aluno aluno, Document document)
	{
		NodeList pathNodes = document.getElementsByTagName("path");
		
		for (int i = 0; i < pathNodes.getLength(); i++)
		{
			Element pathNode = (Element) pathNodes.item(i);
			Node pathAttribute = pathNode.getAttributes().getNamedItem("id");
			
			if (pathAttribute != null)
			{
				String pathId = pathAttribute.getNodeValue();
				
				if (pathId.matches("[A-Z]{3}[0-9]{4}"))
				{
					pintaDisciplinaObrigatoria(pathNode, pathId, aluno);
				}
				else if (pathId.contains("OPTATIVA"))
				{
					pintaDisciplinaOptativa(pathNode);
				}
				else if (pathId.contains("ELETIVA"))
				{
					pintaDisciplinaEletiva(pathNode);
				}
			}
		}
	}

	/**
	 * Pinta uma disciplina obrigatória
	 */
	private void pintaDisciplinaObrigatoria(Element pathElement, String pathId, Aluno aluno)
	{
		StatusDisciplina status = aluno.pegaUltimoStatusDisciplinaObrigatoria(pathId);
		
		// Disciplina de IHC pode ter 2 codigos presentes. Devemos tratar os 2 pois no svg está o codigo antigo
		if (status == null && pathId.compareTo("TIN0010") == 0)
			status = aluno.pegaUltimoStatusDisciplinaObrigatoria("TIN0110");
		
		if (status == StatusDisciplina.APV)
		{
			pintaNoGrafo(pathElement, GREEN);
		}
		else if (status == StatusDisciplina.REP || status == StatusDisciplina.REF)
		{
			pintaNoGrafo(pathElement, RED);
		}
		else if (status == StatusDisciplina.ASC)
		{
			pintaNoGrafo(pathElement, YELLOW);
		}
	}

	/**
	 * Pinta uma disciplina optativa
	 */
	private void pintaDisciplinaOptativa(Element pathElement)
	{
		if (numeroDisciplinasOptativasAprovadas > 0)
		{
			numeroDisciplinasOptativasAprovadas--;
			pintaNoGrafo(pathElement, GREEN);
		}
		else if (numeroDisciplinasOptativasMatriculadas > 0)
		{
			numeroDisciplinasOptativasMatriculadas--;
			pintaNoGrafo(pathElement, YELLOW);
		}
	}

	/**
	 * Pinta uma disciplina eletiva
	 */
	private void pintaDisciplinaEletiva(Element pathElement)
	{
		if (numeroDisciplinasEletivasAprovadas > 0)
		{
			numeroDisciplinasEletivasAprovadas--;
			pintaNoGrafo(pathElement, GREEN);
		}
		else if (numeroDisciplinasEletivasMatriculadas > 0)
		{
			numeroDisciplinasEletivasMatriculadas--;
			pintaNoGrafo(pathElement, YELLOW);
		}
	}

	/**
	 * Pinta um nó do SVG
	 */
	private void pintaNoGrafo(Element pathElement, String color)
	{
		Node styleNode = pathElement.getAttributes().getNamedItem("style");
		
		if (styleNode != null)
		{
			String value = styleNode.getNodeValue();
			value = value.replaceAll(WHITE, color);
			styleNode.setNodeValue(value);
		}
	}
	
	/**
	 * Cria os diretórios necessários para salvar um arquivo
	 */
	private void criaDiretorios(String filename)
	{
		File targetFile = new File(filename);
		File parent = targetFile.getParentFile();
		
		if (!parent.exists())
			parent.mkdirs();
	}
}