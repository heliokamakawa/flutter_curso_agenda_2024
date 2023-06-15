# Tema: CRUD com associação
## MATERIAL DE ESTUDO
- SQLite Foreign Key Support - https://www.sqlite.org/foreignkeys.html
- Flutter (oficial) - DropdownButton<T> class - https://api.flutter.dev/flutter/material/DropdownButton-class.html?gclid=Cj0KCQjwj_ajBhCqARIsAA37s0zcNoOwCky2JtM7EJOdtDS41woKL_1SANSFTn0r_K9SUhutc5rAdpIaAhpeEALw_wcB&gclsrc=aw.ds
- Flutter (oficial) - DropdownMenuItem - https://api.flutter.dev/flutter/material/DropdownMenuItem-class.html
- Equals - https://dart-lang.github.io/linter/lints/hash_and_equals.html

## Informes
### Conteúdo - Persistência
<p>A previsão era de trabalharmos com persistência local e remota (Firebase e com REST API). Para não atropelar o conteúdo e respeitar as dificuldades, vamos trabalhar com mais tranquilidade a persistênica local. Da forma que trabalhamos, está fácil de adotar outras tecnologias.</p>
<p>Para a remota: (1) vou disponibilizar materiais; (2) colocar como desafio para recuperação do diário/conceito - o conteúdo é bem tranquilo! (3) fico a disposição para ajudar (aulas, atendimento, e-mail).</p>

### Afastamento
<p>Há possibilidade de eu conseguir a Licença Capacidatação. Assim, é provável que a professora Angelica assuma o 3º trimestre - é certo que irá trabalhar outras tecnologias de DDM (react).</p>

## Diário de Aula - REVISÃO
19h20 às 20h15 - EM DUPLAS
- Verificar:
  - Datas de avaliação;
  - Quantidade de aulas e o período que resta;
  - Progresso do seu projeto;
- Atividade do Sábado Letivo - consegue? se não elabore uma possível atividade;
- Fazer o orçamento do projeto;
- Coloque tudo em um texto e valide com o professor.

19h20 às 21h00 - EM DUPLAS
- Baixar este projeto e fazer funcionar;
- 2 CRUD COM ASSOCIAÇÃO FUNCIONANDO (1 de cada projeto - sem copiar e colar);
- Elaborar o tutorial com explicação dos pontos cruciais;

### Orçamento
- Projeto? (1) complexidade; (2) progresso; (3) dedicação (o que implementou fora da aula, diferente das aulas); (4) periodicidade.
- Desempenho aula? (1) presenças; (2) Horário; (3) Produtividade.
- Aprendizagem? (1) conhecimento; (2) implementação sem ajuda/copiar/colar; (3) fundamento; (4) validação contínua/assiduidade.

## Desenvolvimento do Projeto
19h20 às 21h00
- Implementar um CRUD com relacionamento de muitos para muitos
  
## AULA CRUD com associação
<p>Vou postar o "passo a passo" de um DAO associação - no caso Cidade.</p>
<p>O projeto possui outros DAO's com associção. O código está disponível no projeto. Porém, como todos tem exatamente a mesma dinâmica, não faz sentido e assim, não postarei o "passo a passo" dos demais.</p>
### VERIFIQUE AS Dependências/Bibliotecas (JÁ FIZEMOS)
- sqflite → biblioteca para trabalhar com sqlite;
- path → pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO).

 ```cmd
flutter pub add sqflite
flutter pub add path  
```
### [Passo 01 - Definir Script BD](readme_01_script.md)
### [Passo 02 - Definir Interface](readme_02_interface_cidade_dao.md)
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