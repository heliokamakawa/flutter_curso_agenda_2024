import 'package:flutter/material.dart';
import 'package:flutter_curso_agenda/view/cidade_lista.dart';
import 'package:flutter_curso_agenda/view/contato_lista.dart';
import 'package:flutter_curso_agenda/view/estado_lista.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agenda'),
          bottom: opcoes()
        ),
        body: const TabBarView(
          children: <Widget>[
            EstadoLista(),
            ContatoLista(),
            CidadeLista(),
          ],
        ),
      ),
    );
  }

  TabBar opcoes(){
    return const TabBar(
      tabs: <Widget>[
        Tab(icon: Icon(Icons.reduce_capacity_outlined)),
        Tab(icon: Icon(Icons.person)),
        Tab(icon: Icon(Icons.location_city_outlined)),
      ],
    );
  }
}