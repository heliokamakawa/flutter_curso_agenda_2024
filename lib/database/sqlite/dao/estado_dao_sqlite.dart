import 'package:flutter_curso_agenda/database/sqlite/conexao.dart';
import 'package:flutter_curso_agenda/view/dto/estado.dart';
import 'package:flutter_curso_agenda/view/interface/estado_interface_dao.dart';
import 'package:sqflite/sqflite.dart'; 

class EstadoDAOSQLite implements EstadoInterfaceDAO{
  @override
  Future<Estado> consultar(int id) async {
    Database db = await  Conexao.criar();
    Map resultado = (await db.query('estado',where: 'id = ?',whereArgs: [id])).first;
    if (resultado.isEmpty) throw Exception('Não foi encontrado registro com este id');
    return converter(resultado);
  }

  @override
  Future<List<Estado>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Estado> lista = (await db.query('estado')).map<Estado>(converter).toList();
    return lista;
  }
  
  @override
  Future<bool> excluir(id) async {
    Database db = await  Conexao.criar();
    var sql ='DELETE FROM estado WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Estado> salvar(Estado estado) async {
    Database db = await  Conexao.criar();
    String sql;
    if(estado.id == null){
      sql = 'INSERT INTO estado (nome, sigla) VALUES (?,?)';
      int id = await db.rawInsert(sql,[estado.nome,estado.sigla]);
      estado = Estado(
        id: id,
        nome: estado.nome, 
        sigla: estado.sigla);
    }else{
      sql = 'UPDATE estado SET nome = ?, sigla =? WHERE id = ?';
      db.rawUpdate(sql,[estado.nome, estado.sigla, estado.id]);
    }
    return estado;
  }

  Estado converter(Map<dynamic,dynamic> resultado){
    return Estado(
      id : resultado['id'],
      nome: resultado['nome'],
      sigla: resultado['sigla']
    );
  }
}