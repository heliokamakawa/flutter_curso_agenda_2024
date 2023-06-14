/* Sequência de Atividades:

criar projeto;
separar/organizar o código (main, app, home);
criar uma widget "cadastro de usuário"
CADASTRO DE USUÁRIO → definir Scaffold com título "Cadastro de Usuário"
HOME → definir Scaffold com um ElevetedButton
definir rotas
** ROUTE ** Antes de mais nada, se pretendemos mudar de tela, precisamos de uma ROTA! Para definir uma rota (Route), utilizamos a classe MaterialPageRoute. Exemplo: Route rota = MaterialPageRoute( builder: (context) => const Tela1() );

EXEMPLIFICAÇÃO PRÁTICA - definir a rota da primeira página; → SOMENTE ROTA (sem Navigator)

PRÁTICA - definir rota de mais 4 páginas; → SOMENTE ROTA (sem Navigator)

Agora que temos uma ROTA, podemos "navegar" nesta rota. → Em Flutter/DDM é muito comum gerenciar ROTAS na estrutura de PILHA!!!

1º que entra é o último que sai;
Push/Pop → Em DDM é muito comum possuir a opção "voltar" de forma nativa ou em widgets (exemplo: Scaffold)
Para trabalhar com rotas em Flutter, são necessários:

Navigator, BuildContext e Route.
** Navigator ** → É uma classe usada para redirecionar uma tela para outra - ROTAS

→ Métodos

push, pop, pushReplacementNamed, popAndPushNamed
pushReplacementNamed → redefine a raiz da pilha
popAndPushNamed →
→ BuildContext - para definir o contexto do Navigator temos duas opções:

Navigator.of(context).método(...)
Navigator.método(context, ....)
→ PUSH

EXEMPLIFICAÇÃO PRÁTICA - definir o Navigator no clique do botão PRÁTICA - definir 4 páginas → tela de login, cadastro, lista de usuário, detalhes - definir Navigator das páginas; - Login → cadastro → lista → detalhes;

→ A implementação anônima é muito comum em Dart

EXEMPLIFICAÇÃO PRÁTICA - redefinir o Navigator com referência Anônima PRÁTICA - redefinir Navigator com referência Anônima das 2 páginas; - Faça pelo menos UMA sem copiar e colar/aproveitar o código.

→ pushReplacementNamed

EXEMPLIFICAÇÃO PRÁTICA - redefinir o Navigator com referência Anônima

Login (push replacement) → Home (Home se torna raíz)
PRÁTICA - defina uma tela introdutória (deve aparecer só uma vez) com botão iniciar e redefina a navegação dos widgets de forma lógica.

→ VOLTAR PÁGINA

pop, popAndPushNamed
EXEMPLIFICAÇÃO PRÁTICA do pop e popAndPushNamed - Home → Cadastro → Lista (popAndPushNamed) ← Home PRÁTICA - implemente um exemplo contextualizado do popAndPushNamed

** NAMED ROUTE ** https://docs.flutter.dev/cookbook/navigation/named-routes

recomendadas para a maioria dos aplicativos;
associa nomes com as rotas em um único ponto - facilita manutenção;
continua utilizando Route e MaterialPageRoute de forma implícita;
→ MAP (As rotas são definidas em Map) - Coleções de dados organizados em um formato chave-valor. - A Chave relaciona o Valor. - Úteis quando precisamos relacionar o elemento com um identificador único. >>>EXEMPLIFICAÇÃO PRÁTICA do map - criar um map pessoa >>>PRÁTICA - implemente 3 exemplos contextualizado do map

→ routes → Passos necessários: (1) Em App, substituir o parâmetro home com routes em MaterialApp; (2) associar nomes com rotas. >>>EXEMPLIFICAÇÃO PRÁTICA - definir rotas nomeadas para login >>>PRÁTICA - implemente as rotas nomeadas.

→ DASAFIO
  - Em relação as rotas nomeadas, pense em uma maneira de facilitar o uso e a manutenção.
1)Implemente a navegação de pelo menos 10 widgets do SEU projeto.

Lembre-se que o projeto deve ser único, relevante e coerente - deve estar validada pelo professor!
De prioridade na lógica de navegação e no sentido dos widgets - por enquanto não precisa "desenhar" completamente;
Se der tempo, vai tentando implementar e caso não consiga, faça a prototipação por meio de outro recurso (pode ser no caderno). 2)Em flutter, o que é rotas (Route)? Para que serve? 3)Para definir uma rota (Route) é necessário utilizar qual classe? O construtor requer parâmetro (se sim, indique o tipo e objetivo)? 4)Em flutter, o que é necessário para implementar uma "navegação"? 5)Quais são os principais métodos de navegação? Explique detalhadamente a assinatura do método. 6)O "context" é necessário para realizar uma das operações do Navigator. Neste contexto, qual é o seu tipo e para por qual motivo ele é necessário? 7)Exemplifique (sem copiar e colar) o uso de Navigator com e sem a referência anônima. Na sua opinião: qual a diferença? qual é a mais fácil? é possível entender as duas? 8)Qual a diferença entre push e pushReplacedNamed? Em que caso utilizamos cada uma? 9)Qual a diferença entre pop e popAndPushNamed? Em que caso utilizamos cada uma? 10)O que são e para que servem as rotas nomeadas?
Em relação as rotas, deste as formas apresentadas, qual seria a melhor? Justifique.
Em relação ao push e pashNamed: qual a diferença? os parametros são posicionais ou nomeados?
REALIZAR ATIVIDADES QUE CONSTA EM: layout/lib/tela/primeira_pagina.dart */
