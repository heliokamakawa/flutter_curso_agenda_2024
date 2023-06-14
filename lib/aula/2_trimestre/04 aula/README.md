## Conteúdo principal: Persistência logal (SQLite)
→ Implementação da classe de conexão; <br>
→ Implementação do DAO SQLite; <br>

### Material de estudo:
[sqflite](https://pub.dev/packages/sqflite) <br>
[path](https://pub.dev/packages/path) <br>
[Persistência local - balta.io](https://balta.io/blog/flutter-sqlite) <br>
[Persistência local - macoratti](https://www.macoratti.net/19/08/flut_accsqlite1.htm) <br>

## Diário de Aula
 - Descrever os pontos principais da classe de conexão (padrão utilizado, cuidados necessários, como funciona e como utilizar);
 - Descrever os pontos principais da classe DAO (padrão utilizado, cuidados necessários, como funciona e como utilizar);

## Desenvolvimento do Projeto
- Implementar o SQLite no seu projeto.

# Aula
>>>baixe os arquivos e faça o projeto funcionar em um emulador
>>>não esqueça de adicionar a dependência (mask_text_input_formatter)

[Passo 01 - implementação da classe de conexão](projeto/inicial/aula/conexao/readme.md) <br>
[Passo 02 - implementação da classe DAO](projeto/inicial/aula/dao/readme.md) <br>

Passo 03 - altere o dao utilizado<br>
→ Na lista
```dart
class _ContatoListaState extends State<ContatoLista> {
  ContatoInterfaceDAO dao = ContatoDAOSQLite();
  [...]
}
```
→ No form<br>
```dart
class _ContatoFormState extends State<ContatoForm> {
  @override
  Widget build(BuildContext context){
    [...]
  }
  
  Widget criarBotao(BuildContext context){
    return Botao(
      context: context,
      salvar: (){
        [...]
          ContatoInterfaceDAO dao = ContatoDAOSQLite(); //<<<<<<<<<<<<<<<
  }
}
```

## Possíveis erros
### Erro na escrita do script
A escrita errada dos comandos do script BD irá gerar o seguinte erro no Debug Console:<br>
```cmd
E/SQLiteLog( 8492): near "COMANDO ERRADO": syntax error in "texto do comando"
```
### Cria a tabela sem registros
Caso o comando de criação da tabela esteja correta e o de inserção não. Na primeira execução a tabela será criada e a inserção não.<br>
Como ele já rodou a primeira vez, por mais que corrija o script ele não irá executá-lo novamente.
Assim, para que rode novamente os cript, podemos excluir o database
```dart
static Future<Database> criar() async {
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db');  
      deleteDatabase(path);                                    // >>>excluíndo database
      _database = await openDatabase(                
        path,                                         
        version: 1,                                    
        onCreate: (db, v){                            
          db.execute(criarContato);
          insercoesContato.forEach(db.execute);
        }, 
      );
      _fechado = false;
    }
    return _database;
  }
```
### Nome de coluna errada
Em converterContato do DAO, por falta de atenção, pode ter nome de colunas erradas<br>
→ confira o nome de todas as colunas com o script
```dart
Contato converterContato(Map<dynamic,dynamic> resultado){
    return Contato(
      id : resultado['id'],
      // >>>>está nomi ao invés de nome - confira os nomes com o script do BD
      nome: resultado['nomi'],           
      telefone: resultado['telefone'],
      email: resultado['email'],
      urlAvatar:  resultado['url_avatar']
    );
  }
```

