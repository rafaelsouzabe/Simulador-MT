;_________________________________MAIN ___________________________________
bloco main 90
  90 verificaCadeia 91 ; verifica se a entrada esta correta

  91 auxiliar 92 ; adiciona o '#'no inicio da palavra

  ;move o cabeçote ate a esquerda do sinal de  =, para pegar a unidade do segundo numero
  92 = -- = e 93
  92 * -- * d 92

  ; Agora que encontramos o número que vai ser somado, vamos verificar qual é para pode ser feito a soma
  93 0 -- A e 0
  93 1 -- B e 1
  93 2 -- C e 2
  93 3 -- D e 3
  93 4 -- E e 4
  93 5 -- F e 5
  93 6 -- G e 6
  93 7 -- H e 7
  93 8 -- I e 8
  93 9 -- J e 9
  93 + -- + i 900
  93 * -- * e 93


  ; O estado representa o número que vai ser somado, de acordo com o número vai ser mandado para um bloco eespecifico
  0 adiciona0X 94
  1 adiciona1X 94
  2 adiciona2X 94
  3 adiciona3X 94
  4 adiciona4X 94
  5 adiciona5X 94
  6 adiciona6X 94
  7 adiciona7X 94
  8 adiciona8X 94
  9 adiciona9X 94

  ; Move a cabeça da fita para a posição inicial, para poder realizar a soma do proximo número 
  94 # -- # e 95 ; move pra posição a esquerda do #
  94 _ -- _ i 95
  94 * -- * e 94
  95 _ -- _ i 96  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  95 * -- * e 95

  96 * -- * i 92 ; para poder realizar a soma do proximo número 

  900 somaDiferente 901 ; verifica se tem sobra de algum numero em um dos lados e faz o tratamento

  ; organiza substituindo as letras pelos seu respectivo numero
  901 organiza 99

  99 * -- * i pare
fim ; 

;_____________________________ASSOCIAÇÃO_____________________________________________
; A = 0
; B = 1
; C = 2
; D = 3
; E = 4
; F = 5
; G = 6
; H = 7
; I = 8
; J = 9
;_____________________________________________________________________________________

;_________________________________VERIFICA CADEIA ___________________________________
bloco verificaCadeia 9
  ; Valida expressão
  9 0 -- * d 1
  9 1 -- * d 1
  9 2 -- * d 1
  9 3 -- * d 1
  9 4 -- * d 1
  9 5 -- * d 1
  9 6 -- * d 1
  9 7 -- * d 1
  9 8 -- * d 1
  9 9 -- * d 1
  9 * -- * e 3 ; Garante que o primeiro caracter seja de [0-9] e nao[+, =] ou outro caracter
  
  1 0 -- * d 1
  1 1 -- * d 1
  1 2 -- * d 1
  1 3 -- * d 1
  1 4 -- * d 1
  1 5 -- * d 1
  1 6 -- * d 1
  1 7 -- * d 1
  1 8 -- * d 1
  1 9 -- * d 1
  1 + -- * d 2
  1 * -- * e 3 ; do segundo caracter em diante pode ser de [0-9 ou o +] se for + passa pro outro lado da soma
  
  2 0 -- * d 2
  2 1 -- * d 2
  2 2 -- * d 2
  2 3 -- * d 2
  2 4 -- * d 2
  2 5 -- * d 2
  2 6 -- * d 2
  2 7 -- * d 2
  2 8 -- * d 2
  2 9 -- * d 2  ;Recebe um numero ate receber o =
  2 = -- * d 5 ; Manda para o estadio 5, que vai ver se o proximo simbolo é branco, caso não for manda para o estado de erro
  2 * -- * e 3 ; caracter errado, vai para o bloco de erro

  ; valido
  5 _ -- _ e 4 ; apos o = tem receber branco
  5 * -- * e 3 ; apos o = se nao for branco vai pro erro

  3 erro 6

  6 * -- * i pare

  ; volta para o inicio da palavra
  4 * -- * e 4
  4 _ -- _ d retorne
fim ; validaCadeia

;_________________________________ERRO_______________________________________________
bloco erro 1 
  1 * -- * e 1
  1 _ -- _ d 2

  2 * -- _ d 2
  2 _ -- _ e 3

  3 _ -- E d 4
  4 _ -- R d 5
  5 _ -- R d 6
  6 _ -- O d 7

  7 _ -- _ i pare
fim ; 

;_________________________________SIMBOLO AUXILIAR_______________________________________
; Este bloco vai colocar o # no inicio da palavra
bloco auxiliar 1
  1 _ -- # d retorne
  1 * -- * e 1
fim ;

;_________________________________SOMA UM NUMERO COM X_______________________________________
; Realiza a soma de 0 com X
bloco adiciona0X 11
;move o cabecote pra esquerda do +, pra pegar a o primeiro numero
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo
  ;se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12

  ; se o cabecote for # eh porque nao tem mais numero pra somar, entao soma com 0 

  17 igual0 14 

  ; de acordo com o número, vamos mandar para um bloco que representa o resultado da soma
  0 igual0 14
  1 igual1 14
  2 igual2 14
  3 igual3 14
  4 igual4 14
  5 igual5 14
  6 igual6 14
  7 igual7 14
  8 igual8 14
  9 igual9 14

  14 * -- * d retorne
fim ; adiciona0X

; Realiza a soma de 1 com X
bloco adiciona1X 11
  ;move o cabecote pra esquerda do +, pra pegar a o primeiro numero
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12
   
  17 igual1 14  ; se o cabecote for # eh porque nao tem mais numero pra somar, entao soma com 0 

  0 igual1 14
  1 igual2 14
  2 igual3 14
  3 igual4 14
  4 igual5 14
  5 igual6 14
  6 igual7 14
  7 igual8 14
  8 igual9 14
  9 igual10 14

  14 * -- * d retorne
fim ; adiciona1X

bloco adiciona2X 11
  ;move o cabecote pra esquerda do +, pra pegar a o primeiro numero
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12

  0 igual2 14
  1 igual3 14
  2 igual4 14
  3 igual5 14
  4 igual6 14
  5 igual7 14
  6 igual8 14
  7 igual9 14
  8 igual10 14
  9 igual11 14

  14 * -- * d retorne
fim ; adiciona2X

bloco adiciona3X 11
 ;move o cabecote pra esquerda do +, pra pegar a o primeiro numero
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo
  ;se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12
   
  17 igual3 14 

  0 igual3 14
  1 igual4 14
  2 igual5 14
  3 igual6 14
  4 igual7 14
  5 igual8 14
  6 igual9 14
  7 igual10 14
  8 igual11 14
  9 igual12 14

  14 * -- * d retorne
fim ; adiciona3X

bloco adiciona4X 11
 ;move o cabecote pra esquerda do +, pra pegar a o primeiro numero
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12
   
  17 igual4 14 

  0 igual4 14
  1 igual5 14
  2 igual6 14
  3 igual7 14
  4 igual8 14
  5 igual9 14
  6 igual10 14
  7 igual11 14
  8 igual12 14
  9 igual13 14

  14 * -- * d retorne
fim ; adiciona4X

bloco adiciona5X 11
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12

  17 igual5 14 

  0 igual5 14
  1 igual6 14
  2 igual7 14
  3 igual8 14
  4 igual9 14
  5 igual10 14
  6 igual11 14
  7 igual12 14
  8 igual13 14
  9 igual14 14

  14 * -- * d retorne
fim ; adiciona5X

bloco adiciona6X 11
 ;move o cabecote pra esquerda do +, pra pegar a o primeiro numero
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12
   
  17 igual6 14 
  0 igual6 14
  1 igual7 14
  2 igual8 14
  3 igual9 14
  4 igual10 14
  5 igual11 14
  6 igual12 14
  7 igual13 14
  8 igual14 14
  9 igual15 14

  14 * -- * d retorne
fim ; adiciona6X

bloco adiciona7X 11
 ;move o cabecote pra esquerda do +, pra pegar a o primeiro numero
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12
   
  17 igual7 14
  0 igual7 14
  1 igual8 14
  2 igual9 14
  3 igual10 14
  4 igual11 14
  5 igual12 14
  6 igual13 14
  7 igual14 14
  8 igual15 14
  9 igual16 14

  14 * -- * d retorne
fim ; adiciona7X

bloco adiciona8X 11
  ;move o cabecote pra esquerda do +, pra pegar a o primeiro numero
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12
   
  17 igual8 14 
  0 igual8 14
  1 igual9 14
  2 igual10 14
  3 igual11 14
  4 igual12 14
  5 igual13 14
  6 igual14 14
  7 igual15 14
  8 igual16 14
  9 igual17 14

  14 * -- * d retorne
fim ; 

bloco adiciona9X 11
  ;move o cabecote pra esquerda do +, pra pegar a o primeiro numero
  11 + -- + e 12
  11 * -- * e 11

  ; Verifica qual número é e manda para seu estado respectivo  se for uma letra ja marcada, move pra esquerda, a procura no numero
  12 0 -- A d 0 
  12 1 -- B d 1 
  12 2 -- C d 2 
  12 3 -- D d 3 
  12 4 -- E d 4 
  12 5 -- F d 5 
  12 6 -- G d 6 
  12 7 -- H d 7 
  12 8 -- I d 8 
  12 9 -- J d 9 
  12 # -- # d 17
  12 * -- * e 12
   
  17 igual9 14 

  0 igual9 14
  1 igual10 14
  2 igual11 14
  3 igual12 14
  4 igual13 14
  5 igual14 14
  6 igual15 14
  7 igual16 14
  8 igual17 14
  9 igual18 14

  14 * -- * d retorne
fim ; 

;___________________________Resultados SOMA ____________________________________
bloco igual0 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 0 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual0

bloco igual1 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 1 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual1

bloco igual2 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 2 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual2

bloco igual3 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 3 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual3

bloco igual4 1
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 4 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual4

bloco igual5 1
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 5 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual5

bloco igual6 1
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 6 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual6

bloco igual7 1
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 7 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual7

bloco igual8 1
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 8 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual8

bloco igual9 1
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 9 e 3

  3 Resto 4
  4 * -- * i retorne
fim ; igual9

bloco igual10 1 
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 0 e 3 ; O K vai ser subistituido quando realizar a soma do vai 1

  3 Resto 4
  4 adicionaResto 5
  5 * -- * e retorne
fim ; igual10

bloco igual11 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 1 e 3

  3 Resto 4
  4 adicionaResto 5
  5 * -- * e retorne
fim ; igual11

bloco igual12 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 2 e 3

  3 Resto 4
  4 adicionaResto 5
  5 * -- * e retorne
fim ; igual12

bloco igual13 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 3 e 3

  3 Resto 4
  4 adicionaResto 5
  5 * -- * e retorne
fim ; igual13

bloco igual14 0 
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 4 e 3

  3 Resto 4
  
  4 adicionaResto 5
  5 * -- * e retorne
fim ; igual14

bloco igual15 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 5 e 3

  3 Resto 4
  4 adicionaResto 5
  5 * -- * e retorne
fim ; igual15

bloco igual16 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 6 e 3

  3 Resto 4
  4 adicionaResto 5
  5 * -- * e retorne
fim ; igual16

bloco igual17 0 
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 7 e 3

  3 Resto 4
  
  4 adicionaResto 5

  5 * -- * e retorne
fim ; igual17

bloco igual18 0
  0 # -- # e 1 ; move pra posição a esquerda do #
  0 * -- * e 0
  1 _ -- _ i 2  ; verifica se a posição esta vazia, se nao move pra esquerda ate chegar no vazio
  1 * -- * e 1
  2 _ -- 8 e 3

  3 Resto 4
  
  4 adicionaResto 5
  5 * -- * e retorne
fim ; igual18

;_________________________________SOMA RESTANTE_______________________________________
bloco Resto 11 
  11 * -- * d 11
  11 = -- = d 12 ;verficar se ta trocado com a linha de cima

;se for vazio ele nao tem resto, ai vai pro estado 13, se nao for vazio ele tem resto e vai pro estado 14
  12 _ -- _ e 13
  12 1 -- _ e 14

  ; O estado 13 não vai somar nada
  13 * -- * e 13 
  13 _ -- _ d 16

  ; O estado 14 vai realizar a soma com o número
  14 * -- * e 14 ; ele vai percorrer ate o inicio, o vazio da esquerda
  14 _ -- _ d 15

  15 0 -- 1 e 16
  15 1 -- 2 e 16
  15 2 -- 3 e 16
  15 3 -- 4 e 16
  15 4 -- 5 e 16
  15 5 -- 6 e 16
  15 6 -- 7 e 16
  15 7 -- 8 e 16
  15 8 -- 9 e 16
  
  ; como a soma de 9 + 1 vai ter resto ele chama a escreve restante para adicionar o resto
  15 9 -- 0 e 19
  19 adicionaResto 20

  20 * -- * e 20 
  20 _ -- _ d 16 

  16 * -- * i retorne
fim ; Resto
;_________________________________Escreve Resto_______________________________________
bloco adicionaResto 1
  1 * -- * d 1
  1 = -- = d 2

  2 * -- * d 2
  2 _ -- 1 e retorne ;adiciona 1 no resto, depois da igualdade
fim ; adicionaResto

;_________________________________ MOVE Restante_______________________________________
bloco somaDiferente 21 
  ; Volta para o resultado
  21 * -- * e 21
  21 # -- # d 11

  ; Vai para depois do jogo da velha
  22 * -- * d 22
  22 # -- # d 11

  11 * -- * d 11
  11 + -- + d 12
  11 A -- * e 13
  11 B -- * e 13
  11 C -- * e 13
  11 D -- * e 13
  11 E -- * e 13
  11 F -- * e 13
  11 G -- * e 13
  11 H -- * e 13
  11 I -- * e 13
  11 J -- * e 13

; quando tem algum numero a mais de um dos lados ele move pro resultado antes do #
  13 0 -- A e 0
  13 1 -- B e 1
  13 2 -- C e 2
  13 3 -- D e 3
  13 4 -- E e 4
  13 5 -- F e 5
  13 6 -- G e 6
  13 7 -- H e 7
  13 8 -- I e 8
  13 9 -- J e 9
  13 # -- # d retorne

  0 igual0 22
  1 igual1 22
  2 igual2 22
  3 igual3 22
  4 igual4 22
  5 igual5 22
  6 igual6 22
  7 igual7 22
  8 igual8 22
  9 igual9 22

  ; Volta para o inicio
  12 * -- * e 12
  12 # -- # d retorne
fim ; somaDiferente
;_________________________________ Organiza a Saida_______________________________________
bloco organiza 1
  1 _ -- * d 2
  1 * -- * e 1
  2 moveResultado 3
  
  3 A -- 0 d 3
  3 B -- 1 d 3
  3 C -- 2 d 3
  3 D -- 3 d 3
  3 E -- 4 d 3
  3 F -- 5 d 3
  3 G -- 6 d 3
  3 H -- 7 d 3
  3 I -- 8 d 3
  3 J -- 9 d 3

  3 = -- = e 4
  3 + -- + d 3
  
  ; Move para o inicio da palavra
  4 * -- * e 4
  4 _ -- _ d retorne
fim ; organiza

; Este bloco de comandos vai mover o resultado para a posiçao final depois da igualdade
bloco moveResultado 11 
  11 0 -- _ d 0
  11 1 -- _ d 1
  11 2 -- _ d 2
  11 3 -- _ d 3
  11 4 -- _ d 4
  11 5 -- _ d 5
  11 6 -- _ d 6
  11 7 -- _ d 7
  11 8 -- _ d 8
  11 9 -- _ d 9
  
  11 # -- _ d retorne

  0 * -- * d 0
  0 _ -- 0 e 12

  1 * -- * d 1
  1 _ -- 1 e 12

  2 * -- * d 2
  2 _ -- 2 e 12

  3 * -- * d 3
  3 _ -- 3 e 12

  4 * -- * d 4
  4 _ -- 4 e 12

  5 * -- * d 5
  5 _ -- 5 e 12

  6 * -- * d 6
  6 _ -- 6 e 12

  7 * -- * d 7
  7 _ -- 7 e 12

  8 * -- * d 8
  8 _ -- 8 e 12

  9 * -- * d 9
  9 _ -- 9 e 12
  
  12 _ -- * d 11  ; move para o inicio resultado
  12 * -- * e 12
fim ; 
