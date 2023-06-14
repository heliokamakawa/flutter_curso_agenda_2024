import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_curso_agenda/database/sqlite/dao/cidade_dao_sqlite.dart';
import 'package:flutter_curso_agenda/database/sqlite/dao/estado_dao_sqlite.dart';
import 'package:flutter_curso_agenda/view/dto/cidade.dart';
import 'package:flutter_curso_agenda/view/dto/estado.dart';
import 'package:flutter_curso_agenda/view/interface/cidade_interface_dao.dart';
import 'package:flutter_curso_agenda/view/widget/botao.dart';
import 'package:flutter_curso_agenda/view/widget/campo_nome.dart';

class CidadeForm extends StatefulWidget{
  const CidadeForm({Key? key}) : super(key: key);

  @override
  State<CidadeForm> createState() => _CidadeFormState();
}

class _CidadeFormState extends State<CidadeForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  late DropdownButtonFormField<Estado> campoOpcoes;
  final _dados = StreamController<List<Estado>>();
  Estado? _estadoSelecionado;
  set estadoSelecionado (Estado estado){
    setState(() {
      _estadoSelecionado = estado;
    });
  }
  
  void buscarEstados() async{
    var estados = await EstadoDAOSQLite().consultarTodos();
    _dados.add(estados);
  }

  @override
  void initState() {
    super.initState();
    buscarEstados();
  }

  @override
  Widget build(BuildContext context){
    receberDadosParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: StreamBuilder<List<Estado>>(
        stream: _dados.stream,
        builder: (BuildContext context,AsyncSnapshot<List<Estado>> snapshot) {
          if(!snapshot.hasData) return const Text('Necessário cadastrar estado primeiro...');
          List<Estado> estados = snapshot.data as List<Estado>;
          return Form(
            key: formKey,
            child: Column( 
              children: [
                campoNome,
                campoOpcoes = criarCampoOpcoes(estados),
                criarBotao(context),
              ],
            )
          );
        }
      )
    );
  }

  Widget criarBotao(BuildContext context){
    return Botao(
      context: context,
      salvar: (){
        var formState = formKey.currentState;
        if(formState != null && formState.validate()){
          var  cidade = preencherDTO();
          CidadeInterfaceDAO dao = CidadeDAOSQLite(); 
          dao.salvar(cidade);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberDadosParaAlteracao(BuildContext context){
    var parametro = ModalRoute.of(context);
    if(parametro != null && parametro.settings.arguments != null){
      Cidade cidade = parametro.settings.arguments as Cidade;
      id = cidade.id;
      preencherCampos(cidade);
    }
  }
  
  DropdownButtonFormField<Estado> criarCampoOpcoes(List<Estado> estados) {
    List<DropdownMenuItem<Estado>> itensEstado = estados.map(
      (estado) => DropdownMenuItem(
        value: estado,
        child: Text(estado.nome))
    ).toList();

    return DropdownButtonFormField<Estado>(
      hint: const Text('estado da cidade'),
      isExpanded: true,
      items: itensEstado,
      value: _estadoSelecionado,
      onChanged: (value) {
        if(value != null) _estadoSelecionado = value;
      } 
    );
  }

  Cidade preencherDTO(){
    return Cidade(
      id: id,
      nome: campoNome.controle.text,
      estado: _estadoSelecionado!
    );
  }

  void preencherCampos(Cidade cidade){
    campoNome.controle.text = cidade.nome;
    estadoSelecionado = cidade.estado;
  }
}
