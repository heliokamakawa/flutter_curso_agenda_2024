import 'package:flutter/material.dart';

class TelaBasica extends StatelessWidget{
  const TelaBasica({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(  
        title: const Text('Aula'),
      ),
      body: Container( 
        color: Colors.blue[100],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  }, 
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(  
          color: Colors.green,
          height: 50,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}