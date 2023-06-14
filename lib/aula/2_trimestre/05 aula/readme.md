# Tema: CRUD com associação
## MATERIAL DE ESTUDO
- SQLite Foreign Key Support - https://www.sqlite.org/foreignkeys.html
- Flutter (oficial) - DropdownButton<T> class - https://api.flutter.dev/flutter/material/DropdownButton-class.html?gclid=Cj0KCQjwj_ajBhCqARIsAA37s0zcNoOwCky2JtM7EJOdtDS41woKL_1SANSFTn0r_K9SUhutc5rAdpIaAhpeEALw_wcB&gclsrc=aw.ds
- Flutter (oficial) - DropdownMenuItem - https://api.flutter.dev/flutter/material/DropdownMenuItem-class.html
- Equals - https://dart-lang.github.io/linter/lints/hash_and_equals.html
  
## Diário de Aula
2 CRUD BÁSICO FUNCIONANDO; <br>
2 CRUD COM ASSOCIAÇÃO FUNCIONANDO<br>

## Desenvolvimento do Projeto
- 2 CRUD BÁSICO
- 2 CRUD COM ASSOCIAÇÃO 
  
## AULA CRUD com associação
<p>Vou postar o "passo a passo" de um DAO associação - no caso Cidade.</p>
<p>O projeto possui outros DAO's com associção. O código está disponível no projeto. Porém, como todos tem exatamente a mesma dinâmica, não faz sentido e assim, não postarei o "passo a passo" dos demais.</p>
### VERIFIQUE AS Dependências/Bibliotecas → JÁ FIZEMOS 
→ sqflite - biblioteca para trabalhar com sqlite;<br>
→ path - pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO).<br>

 ```cmd
flutter pub add sqflite
flutter pub add path  
```
### [Passo 01 - Definir Script BD](readme_01_script.md)
### [Passo 02 - Definir Interface](readme_02-interface_cidade_dao.md)
### [Passo 03 - Definir DAO](readme_03_dao.md)
### Passo 04 - Implementar os Widgets
- [Passo 04a Definir o campo opções](../../../../lib/view/widget/campo_opcoes_estado.dart)
- [Passo 04b Inserir o campo opções no form](../../../../lib/view/cidade_form.dart)
- [Passo 04c Alterar o widget lista](../../../../lib/view/cidade_lista.dart)
### Passo 05 - Caso queira testar rapidamente, altere rotas
```dart
class Rota{
  static const String estadoForm = 'estado_form';
  static const String estadoLista = 'estado_lista';
  static const String cidadeLista = '/';                //definindo cidade como home
  static const String cidadeForm = 'cidade_form';
  static const String contatoLista = 'contato_lista';   //tirando contao como home
  static const String contatoForm = 'contato_form';
  static const String contatoDetalhe = 'contato_detalhe';
}
```

### verifique se routes do App está configurado
```dart
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Rota.estadoLista    :(context) => const EstadoLista(),
        Rota.estadoForm     :(context) => const EstadoForm(),
        Rota.cidadeLista    :(context) => const CidadeLista(),
        Rota.cidadeForm     :(context) => const CidadeForm(),
        Rota.contatoLista   :(context) => const ContatoLista(),
        Rota.contatoForm    :(context) => const ContatoForm(),
        Rota.contatoDetalhe :(context) => const ContatoDetalhe(),
      }
    );
  }
} 
```