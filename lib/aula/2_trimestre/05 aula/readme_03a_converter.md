# Método converter
<p>Precisamos criar o método converter para organizar os dados Orientado a Objeto (no projeto) que vem do BD que é relacional (que é uma FK).</p>

## Implementação do método converter
<p>A conversão pode ser uma classe a parte ou um método dentro do DAO. Para este projeto vamos implementar como um método dentro do DAO.</p>

>DESAFIO! Qual a diferença, vantagens e desvantagens da implementação de converter como classe e método?

### converter - PARÂMETRO
<p>O método deve RECEBER como PARÂMETRO o resultado que vem do BD.</p>

```dart
 converter(Map<dynamic,dynamic> resultado) async {
```
<p>Atualmente as bibliotecas de BD retornam um tipo Map<dynamic, dynamic> em que, o primeiro dynamic é o nome da coluna e o segundo, o valor.</p> 
<p>O resultado traz os valores da tabela cidade (no formato Map), que tem a associçaão como uma <b>FK</b>, ou seja, a tabela "cidade" tem a coluna "estado_id". Lembre-se que o "estado_id" é a coluna do BD que possui um valor do tipo int, >>>NÃO É O OBJETO ESTADO.</p> 

>Exemplo: A cosulta do registro Maringá da tabela cidade retornaria: 
>><p>{id: 5, nome: Maringá, estado_id: 1}</p>
>>Note que "estado_id" é 1, referente à Paraná da tabela Estado. <b>NÃO É O OBJETO ESTADO</b>. 

### converter - RETORNO
O método deve RETORNAR o OBJETO Cidade com o respectivo OBJETO Estado associado, pois o nosso projeto é Orientado a Objeto.<br>
```dart
Future<Cidade> converter...
//o objeto cidade precisa ter o OBJETO estado associado e não a coluna do tipo int.
```
Neste contexto, precisamos "converter" a Foreign Key que vem do BD para um Objeto Estado! Como???<br>

## converter - CONVERSÃO
Na consulta de cidade no projeto:
- precisamos trazer a cidade com o objeto estado;
- o objeto estado precisa dos dados de TODOS os atributos do estado (id, nome e sigla);
- o resultado da consulta no BD da cidade, traz somente a FK do estado associado;
- a FK só tem o id do estado;
- então, para ter os demais dados deste estado, precisamos fazer uma nova consulta;
- é por isto que utilizamos o dao estado.

Veja o código:

```dart
    Estado estado = await EstadoDAOSQLite().consultar(resultado['estado_id']);
```
1. `Estado estado =` → declarando a varíavel do objeto estado;
2. `EstadoDAOSQLite()` → criando dado estado;
3. `await` → como o método é assíncrono, ordenamos "esperar"
4. `.consultar(` → método de consulta do dao estado;
5. `resultado['estado_id']` → código do estado associado a cidade que queremos buscar;

O método consultar do DAO do estado irá buscar os dados estado conforme o id (estado_id) passado, converter os dados para o objeto estado e retornar o objeto estado preenchido!!!
   
## converter - ASSSOCIAÇÃO
Agora que temos o OBJETO estado e não a Foreign Key, inserimos/associamos a cidade que será retornada
```dart
    return Cidade(
      id : resultado['id'],
      nome: resultado['nome'],
      estado: estado   // associando o OBJETO estado a cidade
    );
```

## converter - CÓDIGO COMPLETO
```dart
Future<Cidade> converter(Map<dynamic,dynamic> resultado) async {
    
    Estado estado = await EstadoDAOSQLite().consultar(resultado['estado_id']);
    return Cidade(
      id : resultado['id'],
      nome: resultado['nome'],
      estado: estado
    );
  }
```
[voltar](https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/tree/main/2%C2%BA%20trimestre/05%20aula/projeto/final/lib/database/sqlite/dao)
