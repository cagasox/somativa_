use formativaHogwarts;

create table usuarios(
	id bigint not null auto_increment,
    nome varchar(150) not null,
    email varchar(100) not null,
    dataNascimento date not null,
    senha varchar(50) not null,
    dataCadastro datetime default now(),
    status boolean default true,
	foto_url varchar(150),
    phone varchar(11),
	ocupacaoFK bigint not null,
    primary key(id),
    foreign key(ocupacaoFK) references ocupacao(id)
);

select *from usuarios;
insert into usuarios (phone) values ('19982744837'),('19992745837'),('19982745865'),('19982745834'),('19982745887'),('19948745437');

create table fotos_tarefas(
id bigint not null auto_increment,
fotos_solicitaçoes varchar(150),
primary key (id)
);

select *from fotos_tarefas;
insert into fotos_tarefas (fotos_solicitaçoes) values ('foto cabo'),('foto monitor '),('foto projetor '),('foto maçaneta'),('foto cadeira '),('foto teclado');

create table responsavel (
id bigint not null auto_increment,
usuarioFK bigint not null,
tarefasFK bigint not null,
primary key (id),
foreign key (usuarioFK) references usuarios(id)
);
select *from responsavel;
insert into responsavel (usuarioFK) values ('1'),('2'),('3'),('5'),('6');

create table status_tarefas (
id bigint not null auto_increment,
etapa boolean,
atualizacao datetime default now(),
descricao varchar (300),
fotostatus varchar(150),
progressoFK bigint not null,
primary key (id),
foreign key (progressoFK) references pogresso(id)
);

select *from status_tarefas;


create table progresso(
id bigint not null auto_increment,
nome_do_processo varchar(50),
primary key (id)
);
select *from pogresso;

create table tarefas(
id bigint not null auto_increment,
nome_da_tarefa varchar (100),
descriçao varchar (500),
data_de_solicitacao datetime default now(),
data_de_inicio datetime,
data_de_fim datetime,
prazo_execucao datetime,
localFK bigint  not null,
responsavelFK bigint not null,
statusFK bigint not null,
fotos_tarefasFK bigint not null,
usuaririosFK bigint not null,
primary key (id),
foreign key (localFK) references locais(id),
foreign key (responsavelFK) references responsavel(id),
foreign key (statusFk) references status_tarefas(id),
foreign key (fotos_tarefasFK) references fotos_tarefas(id),
foreign key (usuaririosFK) references usuarios(id)
);

select *from tarefas;

/*Crie uma consulta que mostre todas as tarefas ainda não iniciadas com as informações de seus  respectivos envolvidos no processo*/

select * from tarefas as tf
inner join status_tarefas as st on st.id = tf.statusFK
inner join usuarios as us on us.id = tf.usuaririosFK
where st.progressoFK<2;

/*Crie uma consulta que mostre todos os locais que tiveram associação a mais de duas tarefas*/
select lc.nome, count(tf.id) as todas_as_tarefas  from tarefas as tf
inner join locais as lc on lc.id = tf.localfk
group by lc.nome
having todas_as_tarefas > 1;



/*Crie uma consulta que mostre todos eventos que ainda acontecerão e as tarefas que ainda não
foram executadas nos locais destes eventos (essa consulta ajudará a gestão visualizar se há algum
problema que pode impactar os eventos)*/
select * from tarefas as tf
inner join status_tarefas as st on st.id = tf.statusFK
inner join locais as lc on lc.id = tf.localFK
inner join eventos as ev on lc.id = ev.localFk
where st.etapa = '0';

/*Crie uma consulta que mostre os locais e a quantidade de tarefas existentes (independente do status)*/

select lc.nome, count(tf.id) as todas_as_tarefas from tarefas as tf
inner join locais as lc on lc.id = tf.localFK
group by lc.nome;


/*Crie uma consulta que mostre os locais e a quantidade de tarefas concluídas*/

select lc.nome, count(tf.id) total_tarefas_completas from tarefas as tf
inner join status_tarefas as st on st.id = tf.statusFK
inner join locais as lc on lc.id = tf.localFK
inner join eventos as ev on lc.id = ev.localFk
where st.etapa = '1' and progressoFK = '4' 
group by lc.nome;

/* Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas (independente do status)*/


select us.nome, count(tf.id) as todas_as_tarefas from tarefas as tf
inner join usuarios as us on us.id = tf.responsavelFK
group by us.nome;


/* Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas concluídas */

select us.nome, count(tf.id) tarefas_concluidas  from tarefas as tf
inner join usuarios as us on us.id = tf.responsavelFK
inner join status_tarefas as st on st.id = tf.statusFK
where st.etapa = '1' and progressoFK = '4' 
group by us.nome;

/*Crie uma consulta que mostre a média por mês de quantas tarefas são criadas por local*/
