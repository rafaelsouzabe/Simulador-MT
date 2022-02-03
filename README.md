# Simulador-MT
Este trabalho consiste em desenvolver em python um simulador para a Máquina de Turing, dora- vante MT, conforme as especificações que seguem. A sintaxe dos comandos da MT foi inspirada no  formado adotado no simulador disponível em http://morphett.info/turing/turing.html, acres- centada da noção de bloco de comandos para permitir a implementação de componentes modulares  na programação.

#Entrada:
O simulador será iniciado na linha de comando e todas as saídas serão impressas na tela em modo
texto. A sintaxe da linha de comando será: simturing <opções> <programa> , com <programa>
denotando o nome do arquivo (padrão *.MT) que contém o código da MT. As <opções> podem ser:
• -resume (ou -r), executa o programa até o fim em modo silencioso e depois imprime o conteúdo
final da fita.
• -verbose (ou -v), mostra a execução passo a passo do programa até o fim.
• -step <n> (ou -s <n>), mostra n computações passo a passo na tela, depois abre prompt e
aguarda nova opção (-r,-v,-s). Caso não seja fornecida nova opção (entrada em branco), o padrão
é repetir a última opção.
Para prevenir contra loops infinitos, no caso das opções -r ou -v, o simulador abre prompt e aguarda
nova opção depois de executadas 500 computações.
  
#Saída:
A execução passo a passo será apresentada com a impressão da configuração instantânea da MT antes
e depois de cada transição. Cada configuração instantânea será apresentada em modo texto numa
linha da tela no formato:
<bloco>.<estado>: <fita à esquerda><cabeçote><fita à direita>
  
#SOMADOR: 
 Desenvolva um programa para a MT -- para ser executado no simulador implementado no 1o TP -- que permite realizar somas de números inteiros na base 10.
 Exemplos de entrada possíveis:
  #12 + 345 =
  #82734 + 234 =

  As saídas esperadas são as expressões fornecidas na entrada acompanhadas do respectivos resultados:
  #12 + 345 = 357
  #82734 + 234 = 82968

  Entradas inválidas retornam erro:
  #asd * 32    ; exemplo de entrada inválida
  #ERRO         ; saída esperada
