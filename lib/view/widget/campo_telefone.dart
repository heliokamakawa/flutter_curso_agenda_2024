import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CampoTelefone extends StatelessWidget {
  final mascara = '(##) # ####-####';
  final TextEditingController controle;
  const CampoTelefone({required this.controle, Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.phone,
      inputFormatters: [MaskTextInputFormatter(mask: mascara)],
      validator: (valorDigitado) => ehVazio(valorDigitado),
      decoration: const InputDecoration( 
        label: Text('Telefone:'),
        hintText: '(DD) 99999-9999'
      ),
    );
  }

  String? ehVazio(String? valorDigitado){
    if(valorDigitado == null || valorDigitado.isEmpty) return 'O campo é obrigatório';
    return null;
  }
}