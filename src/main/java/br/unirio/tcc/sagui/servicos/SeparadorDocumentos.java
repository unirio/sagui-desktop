package br.unirio.tcc.sagui.servicos;

import java.io.File;
import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfCopy;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;

import br.unirio.tcc.sagui.dominio.Aluno;
import br.unirio.tcc.sagui.dominio.Curso;

/**
 * Classe que separa os históricos dos alunos em arquivos PDF diferentes
 * 
 * @author Marcio
 */
public class SeparadorDocumentos
{
	public void executa(Curso curso, String reportDirectory) throws Exception
	{
		for (Aluno aluno : curso.getAlunos())
		{
			System.out.println("Separando o histórico de " + aluno.getNome() + " (" + aluno.getMatricula() + ") ...");
			separaDocumentoAluno(aluno, reportDirectory);
		}
	}

	private void separaDocumentoAluno(Aluno aluno, String reportDirectory) throws Exception
	{
		String outFile = reportDirectory + File.separator + aluno.getAnoIngresso() + "-" + aluno.getSemestreIngresso() + File.separator + "pdf" + File.separator + aluno.getMatricula() + " - " + aluno.getNome() + ".pdf";
		criaDiretorios(outFile);
		
		PdfReader reader = new PdfReader(aluno.getArquivoDocumento());
        Document document = new Document(reader.getPageSizeWithRotation(1));

        PdfCopy writer = new PdfCopy(document, new FileOutputStream(outFile));
        document.open();
        
        for (int i = aluno.getPrimeiraPagina(); i <= aluno.getUltimaPagina(); i++)
        {
            PdfImportedPage page = writer.getImportedPage(reader, i);
            writer.addPage(page);
        }

        document.close();
        writer.close();
	}
	
	private void criaDiretorios(String filename)
	{
		File targetFile = new File(filename);
		File parent = targetFile.getParentFile();
		
		if (!parent.exists())
			parent.mkdirs();
	}
}