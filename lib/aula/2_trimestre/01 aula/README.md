Formulários
Material de estudo:
https://docs.flutter.dev/cookbook/forms

>>>>> Diário de Aula
- Contextualização - Todo APP geralmente precisa salvar dados; Operações para manipular dados - CRUD; Relação CRUD com Widget.
- Demonstração prática: Para todo o desenvolvimento do código, ter foco na aplicação de conceitos POO na escrita do código; identificando construtores e os respectivos parâmetros; identificando tipos em parâmetros que não conhecemos.
- Formulário - recursos necessários
	- Para que serve? Diferença e semelhanças entre Form e Container;
	- Sintaxe, semântica e exemplificação prática;
	- Campo: sintaxe, rótulo e dica do campo. Demostração prática; 
	- Botão: sintaxe, rótulo e definindo ação. Demostração prática; 
	- Mensagem (ScaffoldMessenger): sintaxe, por qual motivo precisa-se do context e outros parâmetros. Demonstração prática;
- Como recuperar o valor de um campo e apresentar na mensagem; 
	- Editor do campo (TextEditingController): sintaxe, semântica, demonstração prática; 
	- Associando o editor ao campo;
- Definindo restrições 
	- Validação reativa e passiva: conceitos, diferenças, quando utilizar, como funciona e cuidados necessários;
	- Validações do campo (validate): sintaxe, semântica, cuidados e demonstração prática; 
	- Definindo mensagem de erro; 
- Validação passiva do formulário - demostração prática
	- Passos necessários e a sequência lógica correta para validar campos;
	- Por qual motivo precisamos ter a referência do formulário?
	- Como ter a referência de um formulário  - GlobalKey;
	- Por qual motivo tipar uma chave (GlobalKey<FormState>)?
	- GlobalKey - sintaxe, definição, associação ao Form;
	- Invocando validações dos campos no clique do botão (currentState.validate);
- KeyboardType
	- Importância, usabilidade, sintaxe e demonstração prática;
	- Como definir o tipo numérico, telefone, e-mail e outros (TextInputType);
- Restrigindo quantidade de caracteres (maxLength); 
- Validação de entrada, máscara e formatação
	- Conceitos entre permissão, restrição e formato definido.
	- Restrição pela entrada de dados (inputFormatters)
	- Definindo campo numérico (FilteringTextInputFormatter.digitsOnly)
	- Definindo campo com a entrada do que é permitido (FilteringTextInputFormatter.allow)
	- Definindo campo com a entrada do que não é permitido (FilteringTextInputFormatter.deny)
	- Trabalhando com Expressões Regulares - FilteringTextInputFormatter.allow(RegExp(r'[1235465]')
- Definindo campo com formato definido - CPF, CNPJ, CEP e outros (MaskTextInputFormatter)
	- Conceitos de plugin; 
	- Repositório oficional (pub.dev); 
	- Como escolher um plugin; 
	- Instalação do plugin no projeto. Compatibilidade de versões. Inserção da referência manual. Inserção por meio do comando;
	- Demonstração prática: definindo máscara, inserindo a máscada no campo;
	
	
>>>>>Diário de Aula
 - Faça o seu diário de aula (anotações, exemplos e comentários); 

>>>>>Projeto
	- Faça todos os formulários do projeto.
		- Deve possuir pelo menos 5.
		- Dentre as 5, pelo menos uma com associação.
		- Dentre as 5, pelo menos uma associativa.

***PAPOO → ao digitar o código é importantíssimo prestar atenção nos conceitos de POO (criação de objeto, tipos de parâmetro, como descobrir o tipo/métodos).

Sequência aula
	→ Criar projeto
	→ Criar pasta "view" e arquivo "formulario.dart"
	→ Criar a classe Formulario, definir a herança StatelessWidget, definir o método build. ***PAPOO
	→ Criar o widget Form. ***PAPOO
	
	*** Contextualização - o que é necessário para salvar dados? Quais elementos gráficos são necessários? Quais as sequências de funcionalidades?
	→ Criar campo nome (TextFormField) ***PAPOO
	→ Definindo rótulo - decoration/InputDecoration/label ***PAPOO
	   - Qual é o tipo que a propriedade decoration espera? como criar? 
	   - Definindo dica do campo - InputDecoration/hint ***PAPOO
	→ Criar botão (ElevatedButton). Definindo rótulo e ação vazia.
	
	*** Para salvar é necessário saber pegar o valor dos campos 
	→ criar editor (TextEditingController)
	→ associar ao campo (controller)
	→ criar o widget mensagem
 
```dart
	ScaffoldMessenger.of(context).showSnackBar(
		SnackBar(content: Text('mensagem'),
	);
```
	→ pegar o valor
 
 ```dart
	   ScaffoldMessenger.of(context).showSnackBar(
	      SnackBar(content: Text(editor.text),
	   );
```
	@@@@ Diário de Aula - Atividade I
		- Definir 1 campo sobrenome e mostrar o nome e sobrenome no clique
		- Definir 1 campo de sua preferência mostra todos os valores no clique
		- Definir um DTO, inserir os valores dos campos nos atributos e no clique do botão mostrar o DTO
		Quais widgets trabalhamos?
		O que é e para que serve a key de uma widget? Qual a vantegem de ser tipado?
		O que tem em comum? o que tem de diferente?
		Definir exemplos práticos e comentários de uso.
	
	*** Definindo restrições de um campo 
	→ tornar um campo obrigatório - definindo validação (TextFormField/validator)
```dart
	   validator: (valorDigitado){
	      if(valorDigitado == null || valorDigitado.isEmpty){
                 return 'O campo é obrigatório';
              }
              return null;
           }
```
	
	*** Validação reativa e passiva: diferenças, vantagens, desvantagens, cuidados e quanto utilizar 
	realizando validação passiva - no clique do botão 
	→ definir chave tipada GlobalKey<FormState>
	→ associar ao formulário (key: _formKey)
	→ definir a invocação das validações no clique do botão 
 
```dart
	   onPressed: (){
              if(_formKey.currentState!.validate()){
```
	
	*** Definindo o tipo do teclado
	→ criar um campo idade 
	→ definir o keyboardType (TextFormField/keyboardType: TextInputType.number)
	    - ver quais outros tipos estão disponíveis
	
	*** Restrigindo quantidade de caracteres
	→ Idade tem quantos dígitos? Definir campo idade de 3 dígitos (TextFormField/maxLength)
	------ se copiar e colar letras???
	
	*** Restrigindo na entrada de dados 
	*** diferença entre permição, restrição e formato definido
	→ Definir a restrição na entrada de dados (TextFormField/inputFormatters/FilteringTextInputFormatter)
	→ Definir o campo numérico para idade

 ```dart
	    TextFormField(
	       inputFormatters:[FilteringTextInputFormatter.digitsOnly],
```
	→ Criar um campo código postal que PERMITA a entrada de somente as letras BC e números
 
```dart
	FilteringTextInputFormatter.allow(RegExp(r'[1235465]') // explicar RegExp
```
	→ Criar um campo nome que NÃO ACEITE números

 ```dart
	FilteringTextInputFormatter.deny(RegExp(r'[1234567890]')
```
	------ com estes recursos podemos restrigir ou permitir, mas não conseguimos definir exatamente o formato como CPF, CNPJE, CEP e outros.
	- restringimos o que na entrada de dados, mas não conseguimos restrigir a entrada conforme a posição - formato exato
	
	*** Como definir máscara de um campo 
	→ acessar pub.dev (o que é o site? o que é plugin? como escolher um plugin?) 
	→ buscar MaskTextInputFormatter (mostrar os principais pontos da plugin, como instalar) 
	→ instalar plugin na mão (tem que verificar versão). Deixar a versão vazia (explicar). 
	→ instalar plugin via comando (flutter pub add MaskTextInputFormatter)
	→ criar um campo telefone
	→ definir a máscara

 ```dart
	var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
```
	→ associar a máscara no campo 

 ```dart
	TextFormField(
	   inputFormatters: [mask],
```
	
	@@@@ Diário de Aula - Atividade II
	- crie um novo formulário com os seguintes campos
		- 1 campo CEP
		- 1 campo de código do objeto que não pode conter a letra x e y
		- 1 campo de código de produto que só pode conter letras e os números 9 e 0.
		- 3 de sua preferência com restrições diferentes
	- definir um DTO, inserir os valores dos campos nos atributos e no clique do botão mostrar o DTO
	Quais widgets trabalhamos?
	O que tem em comum? o que tem de diferente?
	Definir exemplos práticos e comentários de uso.
	
	O que é plugin? Para que serve?
	- o que é? vantagens e desvantagens.
	- O que é pub.dev? Como funciona?
	- Como escolher um plugin? Justifique.
	- exemplo de como utilizar/configurar o projeto com explicações passo a passo.
	
	*** Como melhorar a legibilidade do projeto e reaproveitar o código
	→ componentizar um dos campos
	
	@@@@ Desenvolvimento do Projeto
	Definir todos os formulários do projeto (pelo menos 5 formulários).
	Cada formulário deverá possuir:
	- Todas as restrições com os tratamentos dos erros;
	- DTO associado a cada campo.
	- Botão que apresente os valores do DTO.
