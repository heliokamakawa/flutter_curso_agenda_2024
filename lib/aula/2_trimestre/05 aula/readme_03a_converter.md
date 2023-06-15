<style type="text/css">
    span { color: Blue; }
</style>

# Método converter
<p>Precisamos criar o método converter para organizar os dados <span>Orientado a Objeto</span> (no projeto) que vem do BD que é <span>relacional</span> (que é uma FK).</p>

## Implementação do método converter
<p>A conversão pode ser uma classe a parte ou um método dentro do DAO. Para este projeto vamos implementar como um método dentro do DAO.</p>

>>>DESAFIO! Descreva no diário a diferença/vantagens/desvantagens de implementação de converter como classe e método

### converter - PARÂMETRO
<p>O método deve RECEBER como PARÂMETRO o resultado que vem do BD.</p>

```dart
 converter(Map<dynamic,dynamic> resultado) async {
```
<p>Atualmente as bibliotecas de BD retornam um tipo Map<dynamic, dynamic> em que, o primeiro dynamic é o nome da coluna e o segundo, o valor.</p> 
<p>O resultado traz os valores da tabela cidade (no formato Map), que tem a associçaão como uma <b>FK</b>, ou seja, a tabela "cidade" tem a coluna "estado_id". Lembre-se que o "estado_id" é a coluna do BD que possui um valor do tipo int, >>>NÃO É O OBJETO ESTADO.</p> 
>>>Exemplo: A cosulta do registro da cidade Maringá da tabela cidade retornaria: <br>
{id: 5, nome: Maringá, estado_id: 1}<br>
Veja que estado_id é 1 referente ao estado do Paraná. <b>NÃO É O OBJETO ESTADO</b>. 

## converter - RETORNO
O método deve RETORNAR o OBJETO Cidade com o respectivo OBJETO Estado, pois o nosso projeto é Orientado a Objeto.<br>
```dart
Future<Cidade> converter...
//o objeto cidade precisa ter o OBJETO estado e não a coluna do tipo int.
```
Neste contexto, precisamos "converter" a Foreign Key que vem do BD para um Objeto Estado! Como???<br>

## converter - CONVERSÃO
(1) criamos um objeto estado;<br>
(2) para preencher este objeto, usamos o método consultar por id do DAO do estado.<br>

```dart
    Estado estado = await EstadoDAOSQLite().consultar(resultado['estado_id']);
```
- await → como o método é assíncrono, ordenamos "esperar" (await)
- EstadoDAOSQLite().consultar →  consultar do dao estado
- resultado['estado_id'] → o id do estado específico da cidade
- o método consultar do DAO do estado irá:
    (1) irá buscar os dados estado conforme o id (estado_id) que passamos;
    (2) converter os dados para o objeto estado;
    (3) retornar o objeto estado preenchido!!!
   
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