Objetivo app:
- interface dao - como isolar a dependência do BD (inversão de dependência); 
- definindo lista (widget ListView)
    → interando dados no widget;
- widget item da lista (widget ListTile)
    → definindo painel de botões (excluir e alterar);
    → excluir → chamada do método excluir do dao;
    → alterar → chamada do formulário.

Material de estudo:
- formulário reativo 
    → https://pub.dev/packages/reactive_forms
    → https://morioh.com/p/66a3491516d1
- Lista → https://api.flutter.dev/flutter/widgets/ListView-class.html
- Item da Lista → https://api.flutter.dev/flutter/material/ListTile-class.html?gclid=Cj0KCQjwpPKiBhDvARIsACn-gzCOmlEkpiegHYJQAgCKlV-kmPDlbpzxYDF7bgm0Bkn-tm8jdN3re5EaAhX5EALw_wcB&gclsrc=aw.ds
- Classes abstratas e interfaces → https://flutterbyexample.com/lesson/abstract-classes-and-interfaces
- onTap e ListTile
    → https://www.youtube.com/watch?v=sZBJun7oU-o
- programação assíncrona; await, async, Future, delayed, Duration (onde e quando utilizar).
    → vídeo aula - https://www.youtube.com/watch?v=Qa7zno-2SFw
- DAO → https://www.youtube.com/watch?v=mCoqJPal7Zk

>>>>>Roteiro de Aula
- baixar o projeto e executar no EMULADOR 
    → https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/tree/main/2%C2%BA%20trimestre/02%20aula/projeto%20da%20aula/projeto%20inicial/lib
- aula função assíncrona
- criar DTO
- criar interface DAO; 
- criar DAO Fake;
- entenda a importância da Inversão de Dependência
- Widget lista - FutureBuilder future/builder/AsyncSnapshot - trazer dados;
    - se não tiver dados; 
    - se for nulo;
    - definir lista de contatos;
- lista - ListView.builder itemCount/itemBuilder
    - definir item com Text
- criar um método criarItemLista 
- definir ListTile leading/CircleAvatar/backgroundImage, title, subtitle

@@@@ Diário de Aula
 - Atividade I - implemente 2 listas no seu projeto; 

>>>>>Roteiro de Aula
- definir alterar e excluir 
- detalhes onTap

@@@@ Diário de Aula
 - Atividade II - implemente alterar, excluir e detalhes no seu projeto; 

@@@@ Desenvolvimento do Projeto
- Elabore a lista, cadastro, alterar e detalhes do seu projeto (pelo menos 5 formulários).

