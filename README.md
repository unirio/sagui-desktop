# SAGUI: versão desktop


## Como funciona?

O SAGUI carrega um conjunto de arquivos PDF com históricos do BSI (geralmente um arquivo
por semestre) e salva relatórios HTML indicando as disciplinas concluídas pelos alunos e
aquelas que estão faltando. Os relatórios são separados por semestre e ano de ingresso.
O sistema também "quebra" o PDF, separando os arquivos de cada aluno.

Importante: os arquivos utilizados pelo Sagui são históricos completos, não históricos
simplificados, que também podem ser gerados pelo sistema acadêmico.


## Como baixar?

Você pode baixar o arquivo JAR executável executável do SAGUI [aqui](https://github.com/unirio/sagui-desktop/blob/master/deployed/sagui.jar?raw=true).


## Como usar?

* Selecione um diretório qualquer, digamos ```\base```. 

* Salve os PDF no subdiretório "source-pdf", digamos ```\base\source-pdf```. 

* Execute o programa usando o comando ```java -jar sagui.jar \base```, onde o último item é o diretório escolhido.

* Pronto! Os relatórios devem estar salvos dentro do subdiretório "reports" do diretório escolhido.

Matrícula:
Aluno:
(\d{11})

Aluno:\n => Aluno: 