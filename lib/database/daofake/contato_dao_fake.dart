
import 'package:flutter_curso_agenda/database/daofake/dados_fake.dart';
import 'package:flutter_curso_agenda/view/dto/contato.dart';
import 'package:flutter_curso_agenda/view/interface/contato_interface_dao.dart';

class ContatoDAOFake implements ContatoInterfaceDAO{

  @override
  Future<Contato> consultar(int id) {
    return Future.value(contatos[id-1]);
  }

  @override
  Future<List<Contato>> consultarTodos() {
    return Future.value(contatos);
  }

  @override
  Future<bool> excluir(dynamic id) {
    print('excluir ${contatos[id-1]}');
    contatos.remove(contatos[id-1]);
    return Future.value(true);
  }

  @override
  Future<Contato> salvar(Contato contato) {
    if(contato.id == null){
      contato = Contato( 
        id: contatos.length,
        nome: contato.nome,
        telefone: contato.telefone,
        email: contato.email,
        urlAvatar: contato.urlAvatar,
        cidade: contato.cidade
      );
      contatos.add(contato);
    }else {
      int i = (contato.id as int) -1;
      contatos[i] = contato;
    }
    print(contato);
    return Future.value(contato);
  }
}