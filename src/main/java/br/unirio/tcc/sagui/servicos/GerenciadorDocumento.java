package br.unirio.tcc.sagui.servicos;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfReaderContentParser;
import com.itextpdf.text.pdf.parser.SimpleTextExtractionStrategy;
import com.itextpdf.text.pdf.parser.TextExtractionStrategy;

import br.unirio.tcc.sagui.dominio.Aluno;
import br.unirio.tcc.sagui.dominio.Curso;
import br.unirio.tcc.sagui.dominio.Disciplina;
import br.unirio.tcc.sagui.dominio.DisciplinaCursada;
import br.unirio.tcc.sagui.dominio.StatusDisciplina;
import br.unirio.tcc.sagui.dominio.TipoDisciplina;

/**
 * Classe que processa os documentos PDF de histórico
 * 
 * @author Marcio
 */
public class GerenciadorDocumento
{
	private static Pattern padraoCodDisciplina = Pattern.compile("^[a-zA-Z][a-zA-Z][a-zA-Z][0-9][0-9][0-9][0-9].*");

	private static Pattern padraoPeriodoAnalisado = Pattern.compile("[1°|2°].*Período:\\s*");

	private static Pattern padraoTrancamentoGeral = Pattern.compile(".*Trancamento Total.*|.*Mobilidade Acadêmica.*");

	private static Pattern padraoNumeroMatricula = Pattern.compile("[0-9]{11}");

	/**
	 * Percorre um diretório com documentos PDF
	 */
	public void percorreDiretorioDocumentos(Curso curso, String baseDirectory) throws Exception
	{
		File pdfDirectory = new File(baseDirectory + "/source-pdf");
		File[] pdfDirectoryListing = pdfDirectory.listFiles();

		if (pdfDirectoryListing != null)
		{
			for (File pdfDocument : pdfDirectoryListing)
			{
				processaDocumento(curso, pdfDocument.getPath());
			}
		}
	}

	/**
	 * Processa um documento PDF de históricos de um curso
	 */
	private void processaDocumento(Curso curso, String pdfFilename) throws Exception
	{
		if (pdfFilename.endsWith(".pdf"))
		{
			String textFilename = pdfFilename.replace(File.separator + "source-pdf" + File.separator, File.separator + "source-text" + File.separator).replace(".pdf", ".txt");
			
			if (!new File(textFilename).exists())
			{
				String contents = capturaTextoDocumento(pdfFilename);
				contents = contents.replace("TEORIAS E PRÁTICAS DISCURSIVAS NA ESFERA \nACADÊMICA\n", "TEORIAS E PRÁTICAS DISCURSIVAS NA ESFERA ACADÊMICA ");
				contents = contents.replace("FUNDAMENTOS DE REPRESENTAÇÃO DE CONHECIMENTO \nE RACIOCÍNIO\n", "FUNDAMENTOS DE REPRESENTAÇÃO DE CONHECIMENTO E RACIOCÍNIO "); 

				PrintWriter writer = new PrintWriter(textFilename, "UTF-8");
				writer.print(contents);
				writer.close();
			}
			
			System.out.println("Processando " + pdfFilename + " ...");
			String contents = carregaDocumentoTexto(textFilename);
			processaConteudoDocumento(contents, pdfFilename, curso);
		}
	}

	/**
	 * Carrega o conteúdo de um arquivo PDF como um texto
	 */
	private String capturaTextoDocumento(String filename) throws IOException
	{
		PdfReader reader = new PdfReader(filename);
		PdfReaderContentParser parser = new PdfReaderContentParser(reader);
		String contents = "";

		for (int page = 1; page <= reader.getNumberOfPages(); page++)
		{
			TextExtractionStrategy strategy = parser.processContent(page, new SimpleTextExtractionStrategy());
			String currentText = strategy.getResultantText();
			contents += "### START PAGE " + page + "\n";
			contents += currentText + "\n";
		}

		reader.close();
		return contents;
	}
	
	/**
	 * Carrega o documento armazenado em formato texto
	 */
	private String carregaDocumentoTexto(String filename) throws IOException
	{
		File file = new File(filename);
		Scanner reader = new Scanner(file);
		StringBuilder sb = new StringBuilder();
		
		while (reader.hasNextLine())
		{
			String data = reader.nextLine();
			sb.append(data + "\n");
		}
		
		reader.close();
		return sb.toString();
	}

	/**
	 * Processa o conteúdo de um arquivo PDF
	 */
	private void processaConteudoDocumento(String contents, String pdfFilename, Curso curso) throws Exception
	{
		String[] lines = contents.split("\\n");

		int anoCorrente = 0;
		int periodoCorrente = 0;
		int paginaCorrente = 1;
		Aluno alunoCorrente = null;
		LocalDate dataAtualizacao = null;

		for (int lineNumber = 0; lineNumber < lines.length; lineNumber++)
		{
			String line = lines[lineNumber];
			
			try
			{
				if (verificaLinhaInicioPagina(line))
				{
					paginaCorrente = Integer.parseInt(line.substring(15));
				}
				
				if (verificaLinhaMatricula(line))
				{
					if (alunoCorrente != null)
						alunoCorrente.setUltimaPagina(paginaCorrente-1);
					
					alunoCorrente = indicaAlunoAnalisado(line, curso, paginaCorrente, pdfFilename, dataAtualizacao);
				}
	
				else if (verificaLinhaNome(line))
				{
					alunoCorrente.setNome(line.substring(0, line.length()-12));
				}
	
				else if (verificaLinhaDataHistorico(line))
				{
					String dataTexto = line.substring(6).trim();
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
					dataAtualizacao = LocalDate.parse(dataTexto, formatter);
				}
	
				else if (verificaLinhaCoeficienteRendimento(line))
				{
					int index = line.indexOf("Coeficiente de Rendimento:");
	
					if (index > 0)
					{
						String cr = line.substring(0, index-1);
						alunoCorrente.setCoeficienteRendimento(Double.parseDouble(cr.replace(",", ".")));
					}
				}
	
				else if (verificaLinhaPeriodo(line))
				{
					anoCorrente = Integer.valueOf(line.substring(16, 20));
					periodoCorrente = line.startsWith("1°") ? 1 : 2;
					alunoCorrente.setQuantidadeSemestresCursados(alunoCorrente.getQuantidadeSemestresCursados() + 1);
				}
	
				else if (verificaLinhaTrancamento(line))
				{
					alunoCorrente.setQuantidadeSemestresCursados(alunoCorrente.getQuantidadeSemestresCursados() - 1);
				}
	
				else if (verificaLinhaDisciplina(line))
				{
					processaDisciplina(line, curso, alunoCorrente, anoCorrente, periodoCorrente);
				}
			}
			catch (Exception e)
			{
				throw new Exception(pdfFilename + ": Linha #" + (lineNumber+1) + ": " + e.getMessage());
			}
		}
		
		if (alunoCorrente != null)
			alunoCorrente.setUltimaPagina(paginaCorrente);
	}

	/**
	 * Verifica se uma linha contém informações sobre o início de uma página no PDF 
	 */
	private boolean verificaLinhaInicioPagina(String line)
	{
		return (line.startsWith("### START PAGE "));
	}

	/**
	 * Verifica se uma linha contém informações sobre uma matrícula
	 */
	private boolean verificaLinhaMatricula(String line)
	{
		return (line.contains("Matrícula:"));
	}

	/**
	 * Verifica se uma linha contém informações sobre o nome de um aluno
	 */
	private boolean verificaLinhaNome(String line)
	{
		return (line.contains("Nome Aluno:"));
	}

	/**
	 * Verifica se uma linha contém informações sobre a data do histórico
	 */
	private boolean verificaLinhaDataHistorico(String line)
	{
		return (line.contains("Data: "));
	}

	/**
	 * Verifica se uma linha contém informações sobre o CR de um aluno
	 */
	private boolean verificaLinhaCoeficienteRendimento(String line)
	{
		return (line.contains("Coeficiente de Rendimento:"));
	}

	/**
	 * Verifica se uma linha contém informações sobre um período
	 */
	private boolean verificaLinhaPeriodo(String line)
	{
		return padraoPeriodoAnalisado.matcher(line).matches();
	}

	/**
	 * Verifica se uma linha contém informações sobre trancamento
	 */
	private boolean verificaLinhaTrancamento(String line)
	{
		return padraoTrancamentoGeral.matcher(line).matches();
	}

	/**
	 * Verifica se uma linha contém informações sobre uma disciplina
	 */
	private boolean verificaLinhaDisciplina(String line)
	{
		return padraoCodDisciplina.matcher(line).matches();
	}

	/**
	 * Processa uma disciplina cursada
	 */
	private void processaDisciplina(String linha, Curso curso, Aluno aluno, int anoCorrente, int periodoCorrente)
	{
		StatusDisciplina status = pegaStatusDisciplinaCursada(linha);

		if (status != null)
		{
			String[] palavras = linha.split("\\s+");
			String codigo = palavras[0];
			String nome = pegaNomeDisciplina(palavras);
			TipoDisciplina tipo = TipoDisciplina.ELETIVA;

			Disciplina disciplina = curso.pegaDisciplinaCodigo(codigo);

			if (disciplina != null)
			{
				nome = disciplina.getNome();
				tipo = disciplina.getTipoDisciplina();
			}
			
			int cargaHoraria = 0;
			int creditos = 0;
			
			if (!linha.endsWith("APV - Aprovado sem nota 0"))
			{
				cargaHoraria = Integer.valueOf(palavras[palavras.length - 2]);
				creditos = Integer.valueOf(palavras[palavras.length - 1]);
			}
			
			DisciplinaCursada disciplinaMatriculada = new DisciplinaCursada(codigo, nome, tipo, anoCorrente, periodoCorrente, status);
			disciplinaMatriculada.setCargaHoraria(cargaHoraria);
			disciplinaMatriculada.setCreditos(creditos);
			aluno.incluirDisciplinaMatriculada(disciplinaMatriculada);
		}
	}

	/**
	 * Retorna o nome da disciplina a partir da sua descrição
	 */
	private String pegaNomeDisciplina(String[] palavras)
	{
		String nome = palavras[1];
		
		for (int i = 2; i < palavras.length && verificaPalavraValidaNomeDisciplina(palavras[i]); i++)
			nome += " " + palavras[i];			
		
		return nome;
	}

	private boolean verificaPalavraValidaNomeDisciplina(String palavra)
	{
		if (palavra.compareTo("APV-") == 0 || palavra.compareTo("REF-") == 0 || palavra.compareTo("REP-") == 0 || palavra.compareTo("DIS-") == 0)
			return false;

		char c = StringUtils.stripAccents(palavra).charAt(0);
		return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');		
	}

	/**
	 * Pega o status de uma disciplina cursada
	 */
	private StatusDisciplina pegaStatusDisciplinaCursada(String linha)
	{
		if (linha.contains("Matrícula") || linha.contains("Matricula"))
			return StatusDisciplina.ASC;

		if (linha.contains("APV"))
			return StatusDisciplina.APV;

		if (linha.contains("REF"))
			return StatusDisciplina.REF;

		if (linha.contains("REP"))
			return StatusDisciplina.REP;

		if (linha.contains("DIS"))
			return StatusDisciplina.DIS;

		return null;
	}

	/**
	 * Indica o aluno que está sendo analisado
	 */
	private Aluno indicaAlunoAnalisado(String linha, Curso curso, int primeiraPagina, String arquivoDocumento, LocalDate dataAtualizacao) throws Exception
	{
		Matcher matcher = padraoNumeroMatricula.matcher(linha);

		if (!matcher.find())
			throw new Exception("Ocorreu um erro ao tentar capturar a matrícula de um aluno.");

		String matricula = matcher.group(0);
		Aluno aluno = curso.pegaAlunoPorMatricula(matricula);
		
		if (aluno == null)
		{
			aluno = new Aluno("", matricula);
			aluno.setPrimeiraPagina(primeiraPagina);
			aluno.setArquivoDocumento(arquivoDocumento);
			aluno.setDataAtualizacao(dataAtualizacao);
			curso.adicionaAluno(aluno);
		}
		
		return aluno;
	}
}