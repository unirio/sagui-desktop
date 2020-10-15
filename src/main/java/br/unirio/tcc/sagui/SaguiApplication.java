package br.unirio.tcc.sagui;

import java.io.File;

import br.unirio.tcc.sagui.dominio.Curso;
import br.unirio.tcc.sagui.dominio.TipoDisciplina;
import br.unirio.tcc.sagui.servicos.GeradorFluxograma;
import br.unirio.tcc.sagui.servicos.GeradorIndice;
import br.unirio.tcc.sagui.servicos.GerenciadorDocumento;
import br.unirio.tcc.sagui.servicos.SeparadorDocumentos;

public class SaguiApplication
{
	private static String BASE_DIRECTORY = "\\Users\\User\\Desktop\\historico";
	
	public static void main(String[] args) throws Exception
	{
		Curso curso = criaCursoBachareladoSistemasInformacao();

		new GerenciadorDocumento().percorreDiretorioDocumentos(curso, BASE_DIRECTORY);
		
		System.out.println();
		new SeparadorDocumentos().executa(curso, BASE_DIRECTORY + File.separator + "reports");
		
		System.out.println();
		new GeradorFluxograma().geraFluxograma(curso, "src/main/resources/grade_curricular.svg", BASE_DIRECTORY + File.separator + "reports");
		
		new GeradorIndice().executa(curso, BASE_DIRECTORY + File.separator + "reports");
	}

	private static Curso criaCursoBachareladoSistemasInformacao()
	{
		Curso curso = new Curso("BSI");
		curso.adicionaDisciplina("TIN0054", "ATIVIDADES CURRICULARES DE EXTENSÃO 1", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0055", "ATIVIDADES CURRICULARES DE EXTENSÃO 2", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0056", "ATIVIDADES CURRICULARES DE EXTENSÃO 3", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0057", "ATIVIDADES CURRICULARES DE EXTENSÃO 4", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0117", "ADMINISTRAÇÃO FINANCEIRA", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TME0015", "ÁLGEBRA LINEAR", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0118", "ANÁLISE DE ALGORITMO", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0115", "ANÁLISE DE SISTEMAS", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0013", "ANÁLISE EMPRESARIAL E ADMINISTRAÇÃO", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0120", "BANCO DE DADOS I", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0169", "BANCO DE DADOS II", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TME0112", "CÁLCULO DIFERENCIAL E INTEGRAL I", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TME0113", "CÁLCULO DIFERENCIAL E INTEGRAL II", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0106", "DESENVOLVIMENTO DE PÁGINAS WEB", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0130", "EMPREENDEDORISMO", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TME0115", "ESTATÍSTICA", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0114", "ESTRUTURAS DE DADOS I", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0168", "ESTRUTURAS DE DADOS II", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0109", "ESTRUTURAS DISCRETAS", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0112", "FUNDAMENTOS DE SISTEMAS DE INFORMAÇÃO", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0132", "GERÊNCIA DE PROJ. DE INFORMÁTICA", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0010", "INTERAÇÃO HUMANO-COMPUTADOR", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0110", "INTERAÇÃO HUMANO-COMPUTADOR", TipoDisciplina.OBRIGATORIA, 1);		// Segundo código da mesma disciplina
		curso.adicionaDisciplina("TIN0105", "INTRODUÇÃO À LÓGICA COMPUTACIONAL", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0119", "LINGUAG. FORMAIS E AUTÔMATOS", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TME0101", "MATEMÁTICA BÁSICA", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0108", "ORGANIZAÇÃO DE COMPUTADORES", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TME0114", "PROBABILIDADE", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0122", "PROCESSOS DE SOFTWARE", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0121", "PROGRAMAÇÃO MODULAR", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0131", "PROJETO DE GRADUAÇÃO I", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0133", "PROJETO DE GRADUAÇÃO II", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0171", "PROJETO E CONSTRUÇÃO DE SISTEMAS", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0125", "PROJETO E CONSTRUÇÃO DE SISTEMAS COM SGBD", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0123", "REDES DE COMPUTADORES I", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0126", "REDES DE COMPUTADORES II", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0116", "SISTEMAS OPERACIONAIS", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0107", "TÉCNICAS DE PROGRAMAÇÃO I", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0011", "TÉCNICAS DE PROGRAMAÇÃO II", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("HTD0058", "TEORIAS E PRÁTICAS DISCURSIVAS", TipoDisciplina.OBRIGATORIA, 1);
		curso.adicionaDisciplina("TIN0135", "ADMINISTRAÇÃO DE BANCO DE DADOS", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0144", "ALGORITMOS PARA PROBLEMAS COMBINATÓRIOS", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0150", "AMBIENTE OPERACIONAL UNIX", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0146", "COMPILADORES", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0149", "COMPUTAÇÃO GRÁFICA", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0138", "COMUNICAÇÃO E SEGURANÇA DE DADOS", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0158", "DESENVOLVIMENTO DE SERVIDOR WEB", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0143", "FLUXOS EM REDES", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0147", "FUNDAMENTOS DE REPRESENTAÇÃO DE CONHECIMENTO E RACIOCÍNIO", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0136", "GERÊNCIA DE DADOS EM AMBIENTES DISTRIBUÍDOS E PARALELOS", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0160", "GESTÃO DE PROCESSOS DE NEGÓCIOS", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0128", "INFORMÁTICA NA EDUCAÇÃO", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0172", "INTELIGÊNCIA ARTIFICIAL", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0142", "PROGRAMAÇÃO LINEAR", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0159", "SISTEMAS COLABORATIVOS", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0148", "SISTEMAS MULTIMÍDIA", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0145", "TÓPICOS AVANÇADOS EM ALGORITMOS I", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0137", "TÓPICOS AVANÇADOS EM BANCO DE DADOS I", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0162", "TÓPICOS AVANÇADOS EM BANCO DE DADOS II", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0163", "TÓPICOS AVANÇADOS EM BANCO DE DADOS III", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0161", "TÓPICOS AVANÇADOS EM ENGENHARIA DE SOFTWARE I", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0166", "TÓPICOS AVANÇADOS EM ENGENHARIA DE SOFTWARE II", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0141", "TÓPICOS AVANÇADOS EM REDES DE COMPUTADORES I", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0164", "TÓPICOS AVANÇADOS EM REDES DE COMPUTADORES II", TipoDisciplina.OPTATIVA, 1);
		curso.adicionaDisciplina("TIN0165", "TÓPICOS AVANÇADOS EM REDES DE COMPUTADORES III", TipoDisciplina.OPTATIVA, 1);
		return curso;
	}
}