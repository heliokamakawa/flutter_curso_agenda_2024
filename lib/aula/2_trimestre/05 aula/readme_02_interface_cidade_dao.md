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
<p>Exemplo: No desenvolvimento de widgets para o "CRUD de cidade", a especificidade de comandos de um BD escolhido não importa! Neste momento, talvez a escolha do BD ainda nem esteja definido! Porém, para conseguirmos desenvolver os widgets precisamos ter o "FORMATO" dos métodos definidos:</p>
- Para salvar, o método precisa receber os dados da cidade e retornar a cidade com o id gerado pelo BD;
- Para excluir, o método precisa receber o id da cidade que será excluída e retornar um bool indicando se deu certo;
- Para consultar, o  método precisa receber o id da cidade que será buscada no BD e retornar os seus respectivos dados;
- Para consultarTodos o método não precisa de parâmetro e deve retornar uma lista de dados de todas as cidades.
<p>Com base nestas "necessdiades", definimos a interface abaixo.</p>

```dart
abstract class CidadeInterfaceDAO{
  Future<Cidade> salvar(Cidade cidade); 
  Future<bool> excluir(dynamic id);      
  Future<Cidade> consultar(int id);
  Future<List<Cidade>>  consultarTodos();
}
```
<p>Veja, que agora, mesmo sem o BD ou independente do BD, conseguimos desenvolver os widgtes.</p>

[código completo](cidade_interface_dao.dart)

