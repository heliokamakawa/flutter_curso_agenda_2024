# Tema: Uso de recursos nativos do celular
## MATERIAL DE ESTUDO
- [pub.dev - url_launcher](https://pub.dev/packages/url_launcher)
- [videoaula - Hélio](https://www.youtube.com/watch?v=KDxC061PfDo&list=PLg5-aZqPjMmD6cpPAY1bt6Z3QqbrCKpFh&index=14)

## Diário de Aula 
- em duplas → implementar o uso de recursos nativos (SMS, telefone, e-mail, outros);
- individual → rodar o projeto e projetar o conceito;

## Desenvolvimento do Projeto
- Continuar o desenvolvimento e implementar os recursos nativos.
  
## AULA - Uso de recursos nativos do celular
1º Passo - [baixar o projeto e resolver as dependências](https://github.com/heliokamakawa/flutter_curso_agenda_2024/tree/main)<br>
2º Passo - adicionar depedências do URL Launcher<br>
 ```cmd
flutter pub add sqflite
flutter pub add path
flutter pub add url_launcher
```

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

### Verifique se routes do App está configurado
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
