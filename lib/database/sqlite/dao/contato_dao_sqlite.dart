import 'package:flutter_curso_agenda/database/sqlite/conexao.dart';
import 'package:flutter_curso_agenda/database/sqlite/dao/cidade_dao_sqlite.dart';
import 'package:flutter_curso_agenda/view/dto/cidade.dart';
import 'package:flutter_curso_agenda/view/dto/contato.dart';
import 'package:flutter_curso_agenda/view/interface/contato_interface_dao.dart';
import 'package:sqflite/sqflite.dart'; 

class ContatoDAOSQLite implements ContatoInterfaceDAO{
  @override
  Future<Contato> consultar(int id) async {
    Database db = await  Conexao.criar();
    Map resultado = (await db.query('Contato',where: 'id = ?',whereArgs: [id])).first;
    if (resultado.isEmpty) throw Exception('Não foi encontrado registro com este id');
    return converter(resultado);
  }

  @override
  Future<List<Contato>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Map<dynamic,dynamic>> resultadoBD = await db.query('contato');
    List<Contato> lista = [];
    for(var registro in resultadoBD){
      var contato = await converter(registro);
      lista.add(contato);
    }
    return lista;
  }
  
  @override
  Future<bool> excluir(id) async {
    Database db = await  Conexao.criar();
    var sql ='DELETE FROM contato WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Contato> salvar(Contato contato) async {
    Database db = await  Conexao.criar();
    String sql;
    if(contato.id == null){
      sql = 'INSERT INTO contato (nome, telefone,email,url_avatar,cidade_id) VALUES (?,?,?,?,?)';
      int id = await db.rawInsert(sql,[contato.nome,contato.telefone,contato.email,contato.urlAvatar,contato.cidade.id]);
      contato = Contato(
        id: id,
        nome: contato.nome, 
        telefone: contato.telefone, 
        email: contato.email, 
        urlAvatar: contato.urlAvatar,
        cidade: contato.cidade);
    }else{
      sql = 'UPDATE contato SET nome = ?, telefone =?, email = ?, url_avatar= ?, cidade_id= ? WHERE id = ?';
      db.rawUpdate(sql,[contato.nome, contato.telefone, contato.email, contato.urlAvatar, contato.cidade.id, contato.id]);
    }
    return contato;
  }

  Future<Contato> converter(Map<dynamic,dynamic> resultado) async{
    Cidade cidade = await CidadeDAOSQLite().consultar(resultado['cidade_id']);
    return Contato(
      id : resultado['id'],
      nome: resultado['nome'],
      telefone: resultado['telefone'],
      email: resultado['email'],
      urlAvatar:  resultado['url_avatar'],
      cidade: cidade
    );
  }
}