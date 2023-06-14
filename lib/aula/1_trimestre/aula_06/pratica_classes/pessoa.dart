import 'cidade.dart';

class Pessoa{
  final String nome; 
  final String documento;
  final Cidade cidade;

  Pessoa({required this.nome,
    required this.documento, 
    required this.cidade});
}