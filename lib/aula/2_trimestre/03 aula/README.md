Objetivo app:
- passagem de parâmetros entre widgets
 - definindo a lógica de alterar;
 - definindo a lógica de detalhes;
- lista reativa - alterações dinâmicas;

Material de estudo:
- Passagem de argumento pela rota nomeada: https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
- StatelessWidget e StatefullWidget
 - https://www.youtube.com/watch?v=F5BH0neglbc
- Gestão de estado: https://docs.flutter.dev/data-and-backend/state-mgmt/intro


>>>> Roteiro de Aula
- baixar o projeto e executar no EMULADOR → https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/tree/main/2%C2%BA%20trimestre/03%20aula/projeto%20aula/projeto%20inicial
- Já escolha um computador em que o emulador e o projeto estaja executando!!!
- reveja o código do projeto e relembre a lógica;
- rever o DAO - alterações com interação de dados; 

- definindo a lista reativa (statefull);
- definindo o formulário reativo (statefull);

- definindo passagem de parâmetro (arguments) em rota nomeada;
- recebendo o parâmetro ModalRoute.of(context);
```dart
var parametro = ModalRoute.of(context)!.settings.arguments;
```
- Verificando se é nulo ;
```dart
var parametro = ModalRoute.of(context)!.settings.arguments;
if(parametro != null){
 var contato = parametro as Contato;
} 
```
- associando o parâmetro recebindo nos campos; 
```dart
var parametro = ModalRoute.of(context)!.settings.arguments;
if(parametro != null){
 var contato = parametro as Contato;
 preencherCampos(contato);
} 
```
- chamada do método alterar do DAO;

@@@@ Diário de Aula
- Atividade I - implemente o widget detalhes;
- Atividade II - Implemente pelo menos 3 listas do seu projeto.
- Atividade III - Implemente pelo menos 3 formulários do seu projeto.
- Atividade IV - Implemente pelo menos 3 detalhes do seu projeto.

@@@@ Projeto
- Faça a impelementação do conteúdo corrente no seu projeto.



