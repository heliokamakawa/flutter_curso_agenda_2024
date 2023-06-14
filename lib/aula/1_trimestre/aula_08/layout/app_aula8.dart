import 'package:flutter/material.dart';
import 'tela/tela_basica.dart';

class AppAula8 extends StatelessWidget{
  const AppAula8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Aula',
      home: TelaBasica()
    );
  }
}
