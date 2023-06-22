# Tema: Uso de recursos nativos do celular
## MATERIAL DE ESTUDO
- [pub.dev - url_launcher](https://pub.dev/packages/url_launcher)
- [videoaula - Hélio](https://www.youtube.com/watch?v=KDxC061PfDo&list=PLg5-aZqPjMmD6cpPAY1bt6Z3QqbrCKpFh&index=14)

## Diário de Aula 
- em duplas → implementar o uso de recursos nativos (SMS, telefone, e-mail, outros);
- individual → rodar o projeto e projetar o conceito;
  - olhar as datas no diário e escrever/explicitar no git o que será entregue em cada dia
## Desenvolvimento do Projeto
- Continuar o desenvolvimento e implementar os recursos nativos.
  
## AULA - Uso de recursos nativos do celular
1º Passo - [baixar o projeto e resolver as dependências](https://github.com/heliokamakawa/flutter_curso_agenda_2024)<br>
2º Passo - adicionar depedências do URL Launcher<br>
 ```cmd
flutter pub add url_launcher
```
3º Passo - Abra o arquivo "contato_detalhe.dart"
FLUTTER_CURSO_AGENDA_2024
- lib
  - view
    - contato_detalhe.dart
   
4º Passo - Defina o método onTap do método "email" (linha 59)
```dart
  Widget email(Contato contato){
    return Card(  
      child: ListTile( 
        title: const Text('E-mail:'),
        onTap: (){
          launchUrl(Uri(scheme: 'mailto', path: contato.email)); //<<<<<<<<<<<<<<<<<<<<<<<<<<<
        },
        subtitle: Text(contato.email),
      ),
    );
  }
```

5º Passo - Defina o método onPressed do message do painelTelefone (linha 70)
```dart
  Widget painelTelefone(Contato contato){
    return SizedBox(  
      width: 100,
      child:  Row(  
        children: [ 
          IconButton(
            onPressed: (){
              launchUrl(Uri(scheme: 'sms', path: contato.telefone)); //<<<<<<<<<<<<<<<<<<<<<<<<<<<
            }, 
```


6º Passo - Defina o método onPressed do telefone do painelTelefone (linha 70)
```dart
  Widget painelTelefone(Contato contato){
    return SizedBox(  
      width: 100,
      child:  Row(  
        children: [ 
          IconButton(
            onPressed: (){
              launchUrl(Uri(scheme: 'sms', path: contato.telefone));
            }, 
            icon: const Icon(Icons.message)
          ),
          IconButton(
            onPressed: (){
              launchUrl(Uri(scheme: 'tel', path: contato.telefone));  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            }, 
            icon: const Icon(Icons.phone)
          )
```
