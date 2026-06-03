# Linguagem LIP

## Dependências

- Java 17+
- JFlex 1.9.1
- Java CUP 11b

## Estrutura

LIP.flex
LIP.cup
Main.java
input.txt

## Compilação Linux

./run.sh

## Compilação Windows

build.bat

## Execução interativa

java -cp ".:lib/*" Main

## Execução por arquivo

java -cp ".:lib/*" Main input.txt

## Recursos implementados

- Variáveis
- Constantes
- Expressões aritméticas
- If / Else
- Funções
- Comentários
- Consulta de valores

## Exemplo

var x

x = 10

if(x)
(
    1
)
else
(
    0
)

