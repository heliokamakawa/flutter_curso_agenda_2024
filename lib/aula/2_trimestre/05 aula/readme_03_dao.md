# Defina os DAOs necessários
## Código completo:
- [DAO do estado - sem associção](estado_dao_sqlite.dart)<br>
- [DAO do cidade - tem associação com estado](cidade_dao_sqlite.dart)<br>
- [DAO do contato - tem associação com cidade](contato_dao_sqlite.dart)<br>

# Entendendo o código
<p>Hoje em dia é muito comum utilizarmos framework de ORM (como Hibernate) que faz tudo! É maravilhoso! Porém, ao mesmo tempo é péssimo! Pois geralemnte não entendemos o código/processo envolvido. Sem entender, é mais difícil otimizar/melhorar o código, além de que, terá maiores dificuldades de aprender e adaptar novos frameworks.</p>
<p>Desenvolvendo tudo na mão como estamos fazendo neste projeto (sem framework de mapeamento ORM), temos a oportunidade de entender passo a passo!</p>

## Qual a diferença entre DAO com ou sem associação?
<p>DAO sem associação → os "dados" envolvidos no projeto são idênticas no BD. Aí fica fácil!!! É só enviar e receber como está!</p>
DAO com associação → aqui a coisa é diferente! O projeto é Orientado a Objeto (OO) e o BD é relacional. Assim:<br>
- No projeto: a associação da Cidade é do tipo <b>OBJETO</b> estado);
- No BD: a associação é uma <b>Foreign Key</b> (FK) - uma coluna do tipo int. 
<p>Ou seja:</p>
- Quando enviamos dados do projeto para o BD (salvar e alterar): precisamos converter o <b>OBJETO</b> para <b>FK</b>;
- Quando enviamos dados do BD para o projeto (consultar): precisamos converter a <b>FK</b> para <b>OBJETO</b>;
<><strong>É esta diferença entre o projeto e o BD (OBJETO - OO x FK - relacional) que precisamos entender!</strong> É por isso que precisamos definir o método CONVERTER.</p>

## Entenda o ponto principal
<p>O principal ponto a entender é a >>>ASSOCIAÇÃO<<< - entendendo isso ficará fácil e saberá como qualquer framework funciona! Então preste atenção neste ponto e vamos aos detalhes do código!!!</p>

# DAO com associação:
- [método converter](readme_03a_converter.md)<br>
- [DAO com associação](readme_03b_dao_associacao.md)<br>
