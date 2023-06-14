# Defina os DAOs necessários
## Código completo:
- [DAO do estado - sem associção](estado_dao_sqlite.dart)<br>
- [DAO do cidade - tem associação com estado](cidade_dao_sqlite.dart)<br>
- [DAO do contato - tem associação com cidade](contato_dao_sqlite.dart)<br>

# Entendendo o código
<p>Hoje em dia é muito comum utilizarmos framework de ORM (como Hibernate) - ele faz tudo! É maravilhoso! Porém, ao mesmo tempo é péssimo! Pois geralemnte não entendemos o código/processo envolvido.</p>
<p>Desenvolvendo tudo na mão como estamos fazendo neste projeto (sem framework de mapeamento ORM), temos a oportunidade de entender passo a passo!</p>

## Qual a diferença entre DAO com ou sem associação?
<p>DAO sem associação → tem atributos que geralmente são idênticas tanto no projeto como no BD - não muita dificuldade.</p>
<p>DAO com associação → precisamos entender que o projeto é Orientado a Objeto e o BD é relacional.</p> 
- Projeto de Software é ORIENTADO A OBJETO (exemplo: Cidade tem o atributo do tipo objeto Estado);
- BD é RELACIONAL! Assim é uma tabela em que a associação é uma Foreign Key - uma coluna do tipo int (exemplo: tabela Cidade tem a coluna do tipo int → estado_id). 
<p>Desta forma, logicamente, como há diferença entre o projeto e o BD, precisamos entender!</p>
<p>A busca de dados (consulta) é realizada pelo projeto! No projeto precisamos de dados organizado em Objetos e não Relacional do BD.</p>
<p>É por isso que precisamos definir o método CONVERTER.</p>

## Entenda o ponto principal
O principal ponto a entender é a >>>ASSOCIAÇÃO<<< - entendendo isso ficará fácil e saberá como qualquer framework funciona!<br>
Então preste atenção neste ponto e vamos aos detalhes do código!!!<br>

# DAO com associação:
- [método converter](readme-converter.md)<br>
- [DAO com associação](readme-dao-associacao.md)<br>
