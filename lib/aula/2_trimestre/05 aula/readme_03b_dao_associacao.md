# Implementação DAO com associação (SQFLite)

## Código completo:
- [DAO cidade](cidade_dao_sqlite.dart)<br>
- [DAO contato](contato_dao_sqlite.dart)<br>

## Criar um arquivo no projeto
<p>Crie um arquivo no projeto. Padronize o nome e a organização! Não precisa ser da mesma forma que faço, mas é importante padronizar e organizar!</p>
<p>Para organização, eu criei o arquivo chamado de "contato_dao_sqlite.dart" dentro de uma nova pasta "dao" da pasta "sqlite".
projeto.</p>
<p>Eu defini uma pasta "dao" na pasta "sqlite". Defini o nome "cidade_dao_sqlite".</p>
- lib<br>
-- database<br>
--- sqlite<br>
---- dao<br>
----- cidade_dao_sqlite.dart<br>

### Criar a classe no arquivo criado
```dart
class CidadeDAOSQLite{

}
```
### Implementar a interface "CidadeInterfaceDAO"
→ Implementar a interface que definimos durante o desenvolvimento dos widgets. <br>
>Não esqueça de fazer a importação!
```dart
import 'package:persistencia/view/interface/cidade_interface_dao.dart'; //importanção

class CidadeDAOSQLite implements CidadeInterfaceDAO{

}
```
### Criar os métodos da interface
Ao implementar a interface "CidadeInterfaceDAO" será necessário implementar todos os métodos da interface. Faça da seguinte forma:<br>
→ Com a nome da classe sublinhada em vermelho, clique em sugestões (ícone lâmpada);<br>
→ "Create 4 missing overrrides".<br>
Implementando os métodos, a nossa classe deverá ficar da seguinte forma:
```dart
import 'package:persistencia/view/dto/cidade.dart';
import 'package:persistencia/view/interface/cidade_interface_dao.dart';

class CidadeDAOSQLite implements CidadeInterfaceDAO{
  @override
  Future<Cidade> consultar(int id) {
    // TODO: implement consultar
    throw UnimplementedError();
  }

  @override
  Future<List<Cidade>> consultarTodos() {
    // TODO: implement consultarTodos
    throw UnimplementedError();
  }

  @override
  Future<bool> excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  Future<Cidade> salvar(Cidade cidade) {
    // TODO: implement salvar
    throw UnimplementedError();
  }
}
```
### Implementação consultarTodos
- Antes de mais nada, precisamos entender que na consulta, os dados retornados pelo SQFLite tem o formato de "map<dynamic,dynamic>".<br>
- O primeiro dynamic refere-se ao nome da coluna e o segundo o respectivo valor. <br>
- Implementar o método [converter](readme-converter.md).<br>
Agora sim, implementamos o "consultarTodos".
```dart
  @override
  Future<List<Contato>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Map<dynamic,dynamic>> resultadoBD = await db.query('cidade');
    List<Cidade> lista = [];
    for(var registro in resultadoBD){
      var cidade = await converter(registro);
      lista.add(cidade);
    }
    return lista;
  }
```
### IMPORTANTE SABER!!! - Implementação consultarTodos  
```dart
Database db = await  Conexao.criar(); 
```
<p>Aqui estamos pegando referência de Database - da nossa classe de Conexao.</p> 
<p>Lembre-se que, na 1º vez, database é criado e partir da 2º, o que foi criado na 1º vez, será reutilizado.</p>

```dart
db.query('cidade')) 
```
<p>Método do SQFLite para fazer a consulta de todos os contatos.</p>

```dart
    List<Cidade> lista = [];
    for(var registro in resultadoBD){
      var cidade = await converter(registro);
      lista.add(cidade);
    }
    return lista;
```
(1) definindo lista; <br>
(2) percorrendo o resultadoBD do tipo map que veio da consulta no BD; <br>
(3) chamando o nosso método "converter" para converter map (de cada registro do resultado) para o objeto (classe Cidade); <br>
(4) retornar a lista do tipo cidade.<br>

## Implementação consultar

```dart
  @override
  Future<Cidade> consultar(int id) async {
    Database db = await  Conexao.criar();
    Map resultado = (await db.query('cidade',where: 'id = ?',whereArgs: [id])).first;
    if (resultado.isEmpty) throw Exception('Não foi encontrado registro com este id');
    return converter(resultado);
  }
```
### IMPORTANTE SABER!!! - Implementação consultar

```dart
await db.query('Cidade',where: 'id = ?',whereArgs: [id]);
```
<p>Para consultar uma cidade específica, passamos como parâmetro o nome e o valor do filtro de consulta. </p>
<p>No caso, estamos informando que o nome da coluna é id, e o valor é id que vem do parâmetro.</p>

```dart
if (maps.isEmpty) throw Exception('Não foi encontrado registro com este id');
```
<p>Aqui estamos tratando no caso em que não for encontrato registro do id passado no parâmetro.</p>

```dart
 Map resultado = (await db.query('cidade',where: 'id = ?',whereArgs: [id])).first;
```
Armazenando resultado que está vindo BD na nossa variável "resultado". Utilizamos "first" para indicar que queremos somente o primeiro resultado.

```dart
return converter(resultado);
```
<p>Convertendo com o nosso método e retornando o contato.</p>

## Implementação excluir
```dart
  @override
  Future<bool> excluir(id) async {
    Database db = await  Conexao.criar();
    var sql ='DELETE FROM cidade WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }
```
#### IMPORTANTE SABER!!! - Implementação excluir
```dart
int linhasAfetas = await db.rawDelete(sql, [id]);
return linhasAfetas > 0;
```
O "db.rawDelete" tenta executar o comando e retorna a quantidade de linhas afetadas no BD.<br>
Assim, pegamos a referências de linhas afetadas (int linhasAfetas = ...).<br>
E retornarmos se deu certo (return linhasAfetas > 0) - se linhasAfetadas for maior que 0, significa que a exclusão foi realizada.

### Implementação salvar

```dart
  @override
  Future<Contato> salvar(Contato contato) async {
    Database db = await  Conexao.criar();
    String sql;
    if(cidade.id == null){
      sql = 'INSERT INTO cidade (nome, estado_id) VALUES (?,?)';
      int id = await db.rawInsert(sql,[cidade.nome,cidade.estado.id]);
      cidade = Cidade(
        id: id,
        nome: cidade.nome, 
        estado: cidade.estado);
    }else{
      sql = 'UPDATE cidade SET nome = ?, estado_id =? WHERE id = ?';
      db.rawUpdate(sql,[cidade.nome, cidade.estado.id, cidade.id]);
    }
    return cidade;
  }
```

#### IMPORTANTE SABER!!! - Implementação salvar
O método salvar é utilizado em 2 situações: (1) alteração de um contato existente e (2) inserção de um novo contato. <br>
Assim, precisamos definir uma lógica para tratar estes 2 casos...
```dart
    if(cidade.id == null){  //se id é nulo, então é um novo registro
      [...]                   //desta forma, aqui definimos comandos para salvar um novo contato
    }else{                  //caso contrário, se tiver id, significa que é alteração
      [...]                   //desta forma, aqui definimos comandos para alterar um contato
    }
    return contato;
  }
  ```
  ```dart
  // comando para salvar um novo contato no BD.
      // definindo SQL.
      sql = INSERT INTO cidade (nome, estado_id) VALUES (?,?)';
      // comando para salvar no SQLite (db.rawInsert). 
      // db.rawInsert tenta salvar e se der certo, retorna o id gerado automaticamente
      int id =  await db.rawInsert(sql,[cidade.nome,cidade.estado.id]);
      /*
      definimos a classe Cidade do tipo final - os valroes não podem ser alterados depois de definidos,
      assim, para retornar a cidade com id, precisamos criar uma nova cidade e inserir o id.
      */
      cidade = Cidade(
        id: id,
        nome: cidade.nome, 
        estado: cidade.estado);
```
```dart
    //comando para alterar
      //sql para alterar de forma mais segura, no qual, preparamos os parâmetros (?) para serem inseridos - PreparedStatement
      sql = 'UPDATE cidade SET nome = ?, estado_id =? WHERE id = ?';
      //chamando o método "db.rawUpdate" da biblioteca sqflite para alterar 
      //o método "db.rawUpdate" solicita 2 parâmetros: (1) o SQL de alteração e (2) os parâmetros para substituir '?' do comando SQL.
      db.rawUpdate(sql,[cidade.nome, cidade.estado.id, cidade.id]);
```
