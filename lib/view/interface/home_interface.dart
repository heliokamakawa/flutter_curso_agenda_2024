import 'package:flutter_curso_agenda/view/dto/cidade.dart';

abstract class HomeInterface{
  Future<Cidade> buscar(Cidade cidade);
  Future<bool> excluir(dynamic id);
  Future<Cidade> consultar(int id);
  Future<List<Cidade>>  consultarTodos();
}