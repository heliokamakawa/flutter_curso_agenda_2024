import 'package:flutter/material.dart';
import 'package:flutter_curso_agenda/rota.dart';
import 'package:flutter_curso_agenda/view/cidade_form.dart';
import 'package:flutter_curso_agenda/view/cidade_lista.dart';
import 'package:flutter_curso_agenda/view/contato_detalhe.dart';
import 'package:flutter_curso_agenda/view/contato_form.dart';
import 'package:flutter_curso_agenda/view/contato_lista.dart';
import 'package:flutter_curso_agenda/view/estado_form.dart';
import 'package:flutter_curso_agenda/view/estado_lista.dart';
import 'package:flutter_curso_agenda/view/home.dart';

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
        Rota.home           :(context) => const Home(),
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