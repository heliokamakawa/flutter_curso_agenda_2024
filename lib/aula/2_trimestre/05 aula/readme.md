# Tema: CRUD com associação
## MATERIAL DE ESTUDO
- SQLite Foreign Key Support - https://www.sqlite.org/foreignkeys.html
- Flutter (oficial) - DropdownButton<T> class - https://api.flutter.dev/flutter/material/DropdownButton-class.html?gclid=Cj0KCQjwj_ajBhCqARIsAA37s0zcNoOwCky2JtM7EJOdtDS41woKL_1SANSFTn0r_K9SUhutc5rAdpIaAhpeEALw_wcB&gclsrc=aw.ds
- Flutter (oficial) - DropdownMenuItem - https://api.flutter.dev/flutter/material/DropdownMenuItem-class.html
- Equals - https://dart-lang.github.io/linter/lints/hash_and_equals.html
  
## Diário de Aula
2 CRUD BÁSICO FUNCIONANDO; <br>
2 CRUD COM ASSOCIAÇÃO FUNCIONANDO<br>

## Desenvolvimento do Projeto
- 2 CRUD BÁSICO
- 2 CRUD COM ASSOCIAÇÃO 
  
## AULA CRUD com associação
<p>Vou postar o "passo a passo" de um DAO associação - no caso Cidade.</p>
<p>O projeto possui outros DAO's com associção. O código está disponível no projeto. Porém, como todos tem exatamente a mesma dinâmica, não faz sentido e assim, não postarei o "passo a passo" dos demais.</p>
### VERIFIQUE AS Dependências/Bibliotecas → JÁ FIZEMOS 
→ sqflite - biblioteca para trabalhar com sqlite;<br>
→ path - pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO).<br>

 ```cmd
flutter pub add sqflite
flutter pub add path  
```
### [Passo 01 - Definir Script BD](readme_01_script.md)
### [Passo 02 - Definir Interface](readme_02-interface_cidade_dao.md)
### [Passo 03 - Definir DAO](readme_03_dao.md)
### [Passo 04 - Definir a tela de lista da cidade](https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/05%20aula/projeto/final/lib/view/widget/cidade_lista.dart)
### [Passo 05 - Alterar Formulário](projeto/final/lib/view/readme.md)
