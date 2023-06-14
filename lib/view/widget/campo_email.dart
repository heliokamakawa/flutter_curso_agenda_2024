import 'package:flutter/material.dart';

class CampoEmail extends StatelessWidget {
  final TextEditingController controle;
  const CampoEmail({required this.controle, Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.emailAddress,
      validator: (valorDigitado){
        var msnErro = 
          ehVazio(valorDigitado) ?? 
          temArroba(valorDigitado);
        return msnErro;
      },
      decoration: const InputDecoration( 
        label: Text('E-mail:'),
        hintText: 'email@dominio.com'
      ),
    );
  }

  String? ehVazio(String? valorDigitado){
    if(valorDigitado == null || valorDigitado.isEmpty) return 'O campo é obrigatório';
    return null;
  }

  String? temArroba(String? valorDigitado){
    if(!valorDigitado!.contains('@')) return 'E-mail deve porruir "@".';
    return null;
  }
}