# Cálculo de paridade e correção de erros

> Desenvolver um circuito que calcule o código de correção de erro de dados armazenados em memória e também um circuito que corrija o erro de um bit.

## Introdução

Nesse laboratório, você vai desenvolver circuito para corrigir erros que acontecem na memória de sistemas computacionais ou em transmissões de dados. Esses erros podem ser do tipo 'Hard Error', que significa uma falha permanente com o bit sempre fixo em 0 ou em 1, ou do tipo 'Soft Error', que significa uma falha temporária que trocou um bit de 0 para 1 ou vice-versa. Estamos interessados no segundo caso. Alguns estudos mostram que os erros são causados, majoritariamente, por radiação cósmica, mas também podem ser causados por falhas de fabricação, problemas de alimentação, entre outros. 

### Por que é importante?

A memória é um dos componentes mais importantes de um sistema de computação. Ela armazena os dados e instruções que são utilizados pelo processador. A memória é composta por células de armazenamento que podem armazenar um bit de informação. Cada célula de memória é endereçada por um número único que é utilizado para acessar o conteúdo da célula. Se um bit muda de valor, a informação armazenada na célula de memória pode ser corrompida. A correção de erro de memória é um método que permite detectar e corrigir erros de armazenamento de dados em memória.

### Isso realmente acontece?

Tem [um artigo muito legal](https://en.wikipedia.org/wiki/ECC_memory) na Wikipedia sobre esse assunto. Dois valores interessantes citados no artigo foram o estudo feito no datacenter do Google publicado em 2009 indicando que erros em memória podem chegar a 1 erro de 1 bit por gigabyte de RAM a cada 1,8 horas.

## Definições

Existem inúmeros circuitos que podem detectar e/ou corrigir erros em memória. O mais simples deles é o bit de paridade, que é capaz de detectar se aconteceu um erro, mas não consegue identificar nem corrigir o bit errado. Um mecanismo mais complexo é um código de Hamming, que é capaz não só de detectar um erro quanto corrigir o bit que está errado caso apenas um erro tenha acontecido. Existem códigos ainda mais complexos, como o código de Reed-Solomon, que é capaz de corrigir mais de um erro, mas esses códigos são mais complexos e demandam mais hardware.

## Bit de paridade

O bit de paridade é um método de detecção de erros que consiste em adicionar um bit extra ao final de uma palavra de dados. O valor desse bit é escolhido de forma que o número total de bits 1 na palavra de dados, incluindo o bit de paridade, seja par ou ímpar. Para paridade 'par', se o número de bits 1 na palavra de dados for par, o bit de paridade é 0. Se o número de bits 1 na palavra de dados for ímpar, o bit de paridade é 1. Se um bit de dados é alterado, o número de bits 1 na palavra de dados será alterado e o bit de paridade não será mais compatível com o número de bits 1 na palavra de dados. O bit de paridade é capaz de detectar a ocorrência de um erro, mas não é capaz de identificar qual bit de dados está errado. Para paridade 'ímpar', o oposto acontece, adicionando o bit 1 quando o número de bits 1 na palavra de dados for par.

> Simplificadamente: Paridade par quer um número par de bits 1 no total e paridade ímpar quer um número ímpar de bits 1 no total.

| Dados | Paridade par | Paridade ímpar |
|-------|--------------|----------------|
| 0000  | 0            | 1              |
| 0001  | 1            | 0              |
| 0010  | 1            | 0              |
| 0011  | 0            | 1              |

| Dado com paridade | Paridade par | Paridade ímpar |
|-------------------|--------------|----------------|
| 00000             | correto      | falha          |
| 00001             | falha        | correto        |
| 00110             | correto      | falha          |
| 00111             | falha        | correto        |

> **Tarefa 1**: Desenvolva um circuito que calcule o bit de paridade de uma palavra de 8 bits. O circuito deve ter 8 entradas (os bits da palavra) e uma saída (o bit de paridade). O circuito deve ser capaz de calcular o bit de paridade par para qualquer palavra de 8 bits. O circuito deve ser implementado em Verilog e simulado no DigitalJS e no Icarus Verilog. 

> **Tarefa 2**: Desenvolva um circuito que detecte se houve uma falha de paridade em uma palavra de 8+1 bits (8 bits + um bit de paridade). O circuito deve ter 9 entradas (os 8 bits da palavra e o bit de paridade) e uma saída (um bit que indica se houve erro). O circuito deve ser capaz de detectar a ocorrência de um erro em qualquer palavra de 8 bits. O circuito deve ser implementado em Verilog e simulado no DigitalJS e no Icarus Verilog. Essa tarefa só será submetida junto com a tarefa 5.

## Colocando tudo junto

Agora vamos utilizar os componentes que você fez para testar todo o ambiente. Aqui vamos instanciar os componentes de paridade, o circuito que calcula o código e o que verifica. Entre eles teremos um módulo que injetará erros nos dados (inverter um bit específico do dado). Assim, se esse módulo injetar erro no circuito de paridade, o seu detector deve ser capaz de indicar que houve erro. 

> **Tarefa 3**: Desenvolva um circuito que injete um erro em uma palavra de 9 bits (8 bits de dados e 1 de paridade). O módulo de injeção de erro deve receber os mesmos 9 bits de entrada e gerar 9 bits de saída. Além de ter outras duas entradas, `n` de 4 bits que indica o bit onde injetar o erro e `erro` que quando tiver valor 1 injeta o erro, quando tiver o valor 0, não injeta erro. O circuito deve ser implementado em Verilog e simulado no Icarus Verilog.

## Entrega

Para entregar o projeto, basta fazer um *commit* no repositório do GitHub. O GitHub Classroom já está configurado para verificar a entrega e atribuir a nota dos testes automaticamente. 

> Os testes do GitHub estão embutidos nos arquivos do laboratório. Se quiser saber mais sobre eles, veja o script de correção 'run.sh' do repositório do GitHub. Não altere os arquivos de correção!
