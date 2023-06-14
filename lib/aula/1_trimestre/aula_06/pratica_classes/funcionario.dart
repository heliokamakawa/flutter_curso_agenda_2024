import 'pessoa.dart';

class Fornecedor extends Pessoa{
  String telefone;
  String contato;
  Fornecedor(
    {required super.nome, 
    required super.documento,
    required super.cidade,
    required this.telefone,
    required this.contato});
}