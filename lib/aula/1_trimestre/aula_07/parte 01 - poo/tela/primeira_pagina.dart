import 'package:flutter/material.dart';

class PrimeiraPagina extends StatelessWidget{
  const PrimeiraPagina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primeira Página'),
      ),
    );
  }
}

/*
  Sequência atividade:
  - Criar a classe 
  - realizar a herança
  - criar o widget (MaterialApp)
  - criar o Scaffold (MaterialApp)
  - criar o AppBar (MaterialApp)
  - definir o título
  - voltar no app para definir home

  - Realizar atividades!!!


  01 - Explique em detalhes, o title (o que é, de quem é, como é, o que se espera)?
  02 - Em relação ao código acima, quantos objetos foram criados? Justifique.
  03 - Por que utilizou-se const no contrutor da classe? Qual vantagem?
  04 - Em que caso não devemos utilizar const no contrutor da classe?
  05 - O que é e para que serve o key?
  06 - Em relação ao Scaffold:
    (a) Todos os parâmetros que definimos no construtor do Scaffold são obrigatórios? Explique.
    (b) Cite 2 restrições dos parâmetros. 
    (c) Informe o nome de 1 parâmetro de valor de 1 parâmetro de referência.
    (d) Em relação ao código, defina mais 2 parâmetros - 1 que não gere o impacto visual.

  
*/