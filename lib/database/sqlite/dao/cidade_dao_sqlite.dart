import 'package:flutter_curso_agenda/database/sqlite/conexao.dart';
import 'package:flutter_curso_agenda/database/sqlite/dao/estado_dao_sqlite.dart';
import 'package:flutter_curso_agenda/view/dto/cidade.dart';
import 'package:flutter_curso_agenda/view/dto/estado.dart';
import 'package:flutter_curso_agenda/view/interface/cidade_interface_dao.dart';
import 'package:sqflite/sqflite.dart'; 

class CidadeDAOSQLite implements CidadeInterfaceDAO{
  @override
  Future<Cidade> consultar(int id) async {
    Database db = await  Conexao.criar();
    Map resultado = (await db.query('cidade',where: 'id = ?',whereArgs: [id])).first;
    if (resultado.isEmpty) throw Exception('Não foi encontrado registro com este id');
    return converter(resultado);
  }

  @override
  Future<List<Cidade>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Map<dynamic,dynamic>> resultadoBD = await db.query('cidade');
    List<Cidade> lista = [];
    for(var registro in resultadoBD){
      var cidade = await converter(registro);
      lista.add(cidade);
    }
    return lista;
  }
  
  @override
  Future<bool> excluir(id) async {
    Database db = await  Conexao.criar();
    var sql ='DELETE FROM cidade WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Cidade> salvar(Cidade cidade) async {
    Database db = await  Conexao.criar();
    String sql;
    if(cidade.id == null){
      sql = 'INSERT INTO cidade (nome, estado_id) VALUES (?,?)';
      int id = await db.rawInsert(sql,[cidade.nome,cidade.estado.id]);
      cidade = Cidade(
        id: id,
        nome: cidade.nome, 
        estado: cidade.estado);
    }else{
      sql = 'UPDATE cidade SET nome = ?, estado_id =? WHERE id = ?';
      db.rawUpdate(sql,[cidade.nome, cidade.estado.id, cidade.id]);
    }
    return cidade;
  }

  Future<Cidade> converter(Map<dynamic,dynamic> resultado) async {
    Estado estado = await EstadoDAOSQLite().consultar(resultado['estado_id']);
    return Cidade(
      id : resultado['id'],
      nome: resultado['nome'],
      estado: estado
    );
  }
}