# SAGUI: versão desktop

## Como funciona?

O SAGUI carrega um conjunto de arquivos PDF com históricos do BSI, geralmente um arquivo
por semestre, e salva relatórios HTML indicando as disciplinas concluídas pelos alunos e
aquelas que estão faltando. Os relatórios são separados por semestre e ano de ingresso.
O sistema também "quebra" o PDF, separando os arquivos de cada aluno.

## Como usar?

Primeiro, salve os PDF no diretório ~/Desktop/source-pdf.

Em seguida, crie o diretório ~/Desktop/source-text. Os PDF serão convertidos em texto e
salvos neste diretório.

Em seguida, rode o programa para gerar os arquivos texto. Por conta da forma como os PDF foram gerados, o sistema gera arquivos texto que precisam ser corrigidos manualmente. Com o tempo, poderemos melhorar o programa para resolver os problemas de forma automática, mas hoje, as disciplinas de "PRÁTICAS DE TEXTO NA ESFERA ACADÊMICA" e "???" precisam ser corrigidas manualmente nos arquivos texto.

Por fim, rode o programa novamente para gerar os relatórios e confira alguns exemplos.
