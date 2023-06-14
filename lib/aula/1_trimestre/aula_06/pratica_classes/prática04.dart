class OverClock{
  acessarBios(){
    // ...
  }
  acessarAbaMemoriaRAM(){
    // ...
  }
  aumentarFrequencia(){
    // ...
  }
  testar(){
    // ...
  }
}

class Marca{
  final String nome;
  final String descricao;
  Marca({required this.nome,required this.descricao});
}

class Memoria {
  final String nome;
  final Marca marca;
  final int velocidade; 
  final int capacidade;
  final Function overClock;
  Memoria(
    {required this.nome, required this.marca, 
    required this.velocidade, required this.capacidade, 
    required this.overClock});
}

void main(List<String> arguments){
  /*
  Crie e altere as classes complementares com atributos que julgar necessário
  - diferente dos colegas
  - defina métodos criativos e funcionais

  Objetivo final é criar um objeto do tipo computador!!!
  */
  print('${
    Memoria( 
      nome: 'Memória Kingston Fury Beast',
      marca: Marca(
        nome: 'Kingston',
        descricao: 'Kingston Corporation'
      ),
      overClock: (){
        var overClock = OverClock();
        overClock.acessarBios();
        overClock.acessarAbaMemoriaRAM(); 
        overClock.aumentarFrequencia();
        overClock.testar();
      },
      capacidade: 8,
      velocidade: 3200
    )
  }');
}