
import 'package:flutter/material.dart';
import 'package:flutter_curso_agenda/view/dto/contato.dart';

class FotoContato extends StatelessWidget {
  final Contato contato;
  final double? raio;
  const FotoContato({required this.contato,this.raio,Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String url = contato.urlAvatar;
    if (Uri.tryParse(url)!.isAbsolute) {
      return CircleAvatar(
        backgroundImage: NetworkImage(url),
        radius: raio,
      );
    }else{
      return const CircleAvatar(child: Icon(Icons.person));
    }  
  }
}