use formativaHogwarts;use formativaHogwarts;
show tables;

# ----------- Update tabela Usuarios ----------- #
select * from usuarios;

ALTER TABLE usuarios
ADD COLUMN image varchar(200);

ALTER TABLE usuarios
ADD COLUMN cellNumber varchar(14);

# ---------- TAREFA ------------ #

create table tarefa(
	id bigint not null auto_increment,
    nomeTarefa varchar(100) not null,
    descricao varchar(400) not null,
    prazoExecucaoDias int not null,
    dataAbertura datetime not null default now(),
    dataFim datetime not null,
    ambienteFK bigint not null,
    solicitanteFK bigint not null,
    foreign key(ambienteFK) references locais(id),
    foreign key(solicitanteFK) references usuarios(id),
    primary key(id)
);

create table responsaveisRealizacao(
	id bigint not null auto_increment,
    tarefaFK bigint not null,
    responsavelFK bigint not null,
    foreign key(tarefaFK) references tarefa(id),
    foreign key(responsavelFK) references usuarios(id),
    primary key(id)
);
create table status(
	id bigint not null auto_increment,
    status varchar(20) not null,
    primary key(id)
);

create table historicoTarefas(
	id bigint not null auto_increment,
    tarefaFK bigint not null,
	statusFK bigint not null,
    dataInicio datetime not null default now(),
    foreign key(tarefaFK) references tarefa(id),
    foreign key(statusFK) references status(id),
    primary key(id)
);

# ------ comentário respectivo em cada status -------- #

create table comentario(
	id bigint not null auto_increment,
    comentario varchar(200) not null,
    tarefaFK bigint not null,
    statusFK bigint not null,
    horaEnvio datetime not null default now(),
    foreign key(tarefaFK) references tarefa(id),
    foreign key(statusFK) references status(id),
    primary key(id)
);

#alter table status
#drop column comentario;

# ----- Além disso, em cada tarefa e em cada status podem ser adicionadas várias fotos de forma independente ---- #

create table fotosTarefas(
	id bigint not null auto_increment,
    image varchar(300) not null,
    tarefaFK bigint not null,
    statusFK bigint not null,
    uploadFoto datetime not null default now(),
    foreign key(tarefaFK) references tarefa(id),
    foreign key(statusFK) references status(id),
    primary key(id)
);

# ------------ Inputs de DADOS ------------ #
select *from status;
select *from locais;
select *from usuarios;
select *from tarefa;

insert into status (status) values ("Aberta"),("Em Andamento"),("Concluida"),("Finalizada");

insert into tarefa (nomeTarefa, descricao, prazoExecucaoDias, dataFim, ambienteFK, solicitanteFK) values 
("Conserto Inversor de Frequência","Dois alunos explodiram a saida do inversor de frequência",7,"9999-12-31 00:00",1,1),
("Trocar Lampada","A lampada lateral Queimou",5,"9999-12-31 00:00",2,3);

insert into historicoTarefa values (tarefaFK, statusFK) values (1,2);





# ----------- CONSULTAS ----------- #














