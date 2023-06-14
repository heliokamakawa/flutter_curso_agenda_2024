class Estado{
  final dynamic id;
  final String nome;
  final String sigla;
  Estado({
    required this.id,
    required this.nome,
    required this.sigla
  });

  @override
  bool operator ==(other) => 
    other is Estado && 
    other.nome == nome && 
    other.id == id;

  @override
  String toString() {
    return '''
      $id
      $nome 
      $sigla 
    ''';
  }
}