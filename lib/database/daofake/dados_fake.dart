import 'package:flutter_curso_agenda/view/dto/cidade.dart';
import 'package:flutter_curso_agenda/view/dto/contato.dart';
import 'package:flutter_curso_agenda/view/dto/estado.dart';

Estado estado = Estado(
  id: 1,
  nome: 'PARANÁ',
  sigla: 'PR'
);

Cidade c1 = Cidade(
  id: 1,
  nome: 'PARANAVAÍ',
  estado: estado
);

Cidade c2 = Cidade(
  id: 1,
  nome: 'MARINGÁ',
  estado: estado
);

List<Contato>  contatos = [
      Contato(id: 1, nome: 'José Pereira', email: 'jose@gmail.com', telefone: '(44) 99852-8569', urlAvatar: 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', cidade: c1)
      ,Contato(id: 2, nome: 'Marco Antonio', email: 'marco@gmail.com', telefone: '(44) 99852-8569', urlAvatar: 'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png', cidade: c2)
      ,Contato(id: 3, nome: 'Maria Rosa', email: 'maria@gmail.com', telefone: '(44) 99852-8569', urlAvatar: 'https://cdn.pixabay.com/photo/2017/04/30/11/42/hijab-2272708_1280.png', cidade: c1)
      ,Contato(id: 4, nome: 'Josefina Santos', email: 'josefina@gmail.com', telefone: '(44) 99852-8569', urlAvatar: 'https://cdn.pixabay.com/photo/2017/03/01/22/18/avatar-2109804_1280.png', cidade: c2)
    ];