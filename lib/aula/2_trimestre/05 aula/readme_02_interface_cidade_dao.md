# Implementação Interface DAO

## O Princípio de Inversão de Dependência (DIP)
Aplicamos DIP com 2 objetivos: 
- Módulos de VISÃO não depender de módulos de persistência de dados; e 
- Abstrações (uso de dados) não devem depender de detalhes (tecnologia BD), mas detalhes devem depender de abstrações.

## Como???
<p>Ao invés de implementar uma biblioteca específica de BD, definimos abstrações.</p>
<p>Abstrair significa se ater ao que realmente importa! E para o nosso projeto, desenvolvendo interface o que realmente importa?</p>
- salvar, alterar, excluir e consultar dados (CRUD);
- a tecnologia/ferramente não deveria ser relevante!!!
<p>Como abstraímos??? Definindo INTERFACE!!! Ditamos o que precisamos, definindo o formato (assinatura do método) sem definir o "produto" (implementação) - especificaidade de uma tecnologia.</p>

<p>No projeto, quando precisamos desenvolver as telas para o CRUD de uma cidade preciamos SALVAR, ALTERAR, EXCLUIR e CONSULTAR.</p>
<p>Para quem está desenvolvendo as telas, não importa detalhes específicos de como estas operações devem ser realizadas, massss..... </p>
<p>Precisa saber o FORMATO destes métodos para fazer a chamada e tratar o respectivo retorno da chamada.</p>
Exemplo1: No desenvolvimento da "tela salvar cidade", pouco importa como vai ser, mas precisamos saber qual o formato: nome do método, o que deve ser passado no parâmetro e o que retorna<br>

```dart
abstract class CidadeInterfaceDAO{
  // precisa receber os dados da cidade e retorna a cidade com o id gerado pelo BD
  Future<Cidade> salvar(Cidade cidade); 
  
  // precisa receber o id da cidade que será excluída e retorna um bool indicando se deu certou
  Future<bool> excluir(dynamic id);      
  
  // precisa receber o id da cidade que será buscada no BD e retorna os seus respectivos dados
  Future<Cidade> consultar(int id);
  
  // retorna uma lista de dados das cidades
  Future<List<Cidade>>  consultarTodos();
}
```
[código completo](cidade_interface_dao.dart)

