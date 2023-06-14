import 'package:flutter/material.dart';
import 'package:flutter_curso_agenda/database/sqlite/dao/cidade_dao_sqlite.dart';
import 'package:flutter_curso_agenda/view/dto/cidade.dart';

class CampoOpcoes extends StatefulWidget {
  Cidade? cidadeSelecionada;
  CampoOpcoes({Key? key}) : super(key: key);
  
  @override
  State<CampoOpcoes> createState() => _CampoOpcoesState();
}

class _CampoOpcoesState extends State<CampoOpcoes> {
  
  void associarCidade(Cidade cidade){
    setState(() {
      widget.cidadeSelecionada = cidade;
    });
  }
  late Future<List<Cidade>> dadosBD;

  @override
  void initState() {
    super.initState();
    dadosBD = CidadeDAOSQLite().consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dadosBD,
      builder: (BuildContext context,AsyncSnapshot<List<Cidade>> resultado){
        if(!resultado.hasData) return const CircularProgressIndicator();
        if(resultado.data == null) return const Text('Faça o cadastro de cidade primeiro.');
        List<Cidade> cidades = resultado.data!;
        List<DropdownMenuItem<Cidade>> itensCidade = cidades.map(
          (cidade) => DropdownMenuItem(
            value: cidade,
            child: Text(cidade.nome))
        ).toList();
        return DropdownButtonFormField<Cidade>(
          hint: const Text('cidade onde mora'),
          isExpanded: true,
          items: itensCidade,
          value: widget.cidadeSelecionada,
          onChanged: (cidadeEscolhida){
            if(cidadeEscolhida != null) associarCidade(cidadeEscolhida);
          }
        );
      }
    );
  }
}

