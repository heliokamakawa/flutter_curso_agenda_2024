import 'package:flutter/material.dart';

import '../../aula_08/layout/tela/primeira_pagina.dart';

class AppAula7 extends StatelessWidget{
  const AppAula7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Aula',
      home: PrimeiraPagina()
    );
  }
}

/*
  Sequência atividade:
  - Criar a classe 
  - realizar a herança
  - verificar o erro indicado e assim criar o método build 
  - criar o widget (MaterialApp)sem o home
  - voltar no main para chamar o runApp

  - definir o widget criado como const
  - definir a classe/construtor const
  - voltar no main para fazer a chamada com const

  - definir home e chamar a nossa primeira tela criada
  - voltar no main para executar e testar

  

  Prática!!!
  Crie mais 2 projetos (sem copiar/colar/aproveitar código);
  Em um dos projetos crie pelo menos 5 interfaces diferentes.

  Atividade I - responda as questões (arquivo 1 e 2)
  Tente realizar sozinho e sem consulta. Caso não consiga pode consultar ou pedir ajuda.
  Para cada questão, identifique se precisou de ajuda (I - consulta internet, C - ajuda dos colegas, P - ajuda do professor, D - discussão)
  
  Atividade II
  Ao terminar, forme duplas e faça a discussão das respostas!!! Concorde e/ou discorde com argumentos! 

  POO
  01 - Caso exista em relação ao código acima, informe:
    a) Nome classe:  b) Nome da classe:   c) Nome interface:
    d) Atributos: e) Métodos:  f) nome constror(es):
  02 - Por qual motivo build é obrigatório?
  03 - Qual é a assinatura do build? Podemos alterar? Explique.
  04 - O que é context? Qual tipo? Podemos alterar para outro nome (justifique)?
  05 - Utilizamos parâmetros? Se sim, onde (explique/detalhe), quais são os tipos e informe se são obrigatórios? 
  06 - O que é const? Para que serve? Por que devemos utilizá-lo?
  07 - Em que caso não se deve definir const? Exemplifique.

  Dart - Widget
  01 - Quais são as opções de importação do StatelessWidget? Explique as diferenças.
  02 - No método build, é possível definir o parâmetro sem o tipo? Se sim, qual seria melhor (com ou sem a definição do tipo)?
*/