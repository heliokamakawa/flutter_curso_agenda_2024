import 'package:flutter/material.dart';
import 'package:flutter_curso_agenda/view/dto/contato.dart';
import 'package:flutter_curso_agenda/view/widget/foto_contato.dart';

class ContatoDetalhe extends StatelessWidget {
  const ContatoDetalhe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contato contato = receberContato(context);
    return Scaffold(
      body: ListView( 
        padding: const EdgeInsets.all(60),
        children: [
          FotoContato(contato: contato, raio: 150),
          nome(contato),
          telefone(contato),
          email(contato),
        ],
      ),
      floatingActionButton: botaoVoltar(context),
    );
  }

  Contato receberContato(BuildContext context){
    var parametro = ModalRoute.of(context);
    if(parametro != null){
      Contato contato = parametro.settings.arguments as Contato;
      return contato;
    } else {
      throw Exception('Problemas em receber o contato');
    }
  }

  Widget nome(Contato contato){
    return Center( 
      child: Text(
        contato.nome, 
        style: const TextStyle(fontSize: 30)
      )
    );
  }

  Widget telefone(Contato contato){
    return Card( 
      child: ListTile(  
        title: const Text('Telefone:'),
        subtitle: Text(contato.telefone),
        trailing: painelTelefone(contato),
      ),
    );
  }

  Widget email(Contato contato){
    return Card(  
      child: ListTile( 
        title: const Text('E-mail:'),
        onTap: (){},
        subtitle: Text(contato.email),
      ),
    );
  }

  Widget painelTelefone(Contato contato){
    return SizedBox(  
      width: 100,
      child:  Row(  
        children: [ 
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.message)
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.phone)
          )
        ],
      ),
    );
  }
  Widget botaoVoltar(BuildContext context){
    return FloatingActionButton( 
      child: const Icon(Icons.arrow_back),
      onPressed: ()=>Navigator.pop(context),
    );
  }
}