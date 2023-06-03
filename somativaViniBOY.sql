create database somativaViniBOY;
use somativaViniBOY;

#################################

create table nivelAcesso(
	id bigint not null auto_increment,
    nivel varchar(100) not null,
    descricao varchar(200),
    primary key(id)
);
select *from nivelAcesso;

#################################

create table ocupacao(
	id bigint not null auto_increment,
    titulo varchar(150) not null,
    nivelAcessoFk bigint not null,
    primary key(id),
    foreign key(nivelAcessoFk) references nivelAcesso(id)
);
select *from ocupacao;

#################################

create table usuarios(
	id bigint not null auto_increment,
    nome varchar(150) not null,
    email varchar(150) not null,
	dataNascimento date not null,
    senha varchar(30) not null,
    dataCadastro datetime not null default now(),
    ocupacaoFk bigint not null,
    status boolean not null default true,
    image_perfil mediumtext not null,
    primary key(id),
    foreign key(ocupacaoFk) references ocupacao(id)
);
select *from usuarios;

#################################

create table locais(
	id bigint not null auto_increment,
    nome varchar(150) not null,
    bloco enum('A','B','C','D') not null,
    lotacao int not null,
    primary key(id)
);
select *from locais;

#################################

create table item(
	id bigint not null auto_increment,
    nome varchar(150) not null,    
    primary key(id)
);

#################################

create table checkList(
	id bigint not null auto_increment,
    localFk bigint not null,
    itemFk bigint not null,
    qtd int not null default 1,
    primary key(id),
    foreign key(localFk) references locais(id),
    foreign key(itemFk) references item(id)
);
select *from checkList;

#################################

create table eventos(
	id bigint not null auto_increment,
    nome varchar(200) not null,
    localFk bigint not null,
    inicio datetime not null,
    fim datetime not null,
    inicioCheckIn datetime not null,
    fimCheckIn datetime not null,
    vagas int not null,    
    primary key(id),
    foreign key(localFk) references locais(id)
);
select *from locais;

#################################

create table checkIn(
	id bigint not null auto_increment,    
    eventoFk bigint not null,
    usuarioFk bigint not null,
    data datetime not null default now(),
    primary key(id),
    foreign key(eventoFk) references eventos(id),
    foreign key(usuarioFk) references usuarios(id)
);
select *from checkIn;

#################################

create table responsavel (
	id bigint not null auto_increment,
    responsavel_fk bigint not null,
    primary key(id),
    foreign key (responsavel_fk) references usuarios(id)
);
select *from responsavel;

#################################

create table tarefa (
	id bigint not null auto_increment,
    titulo varchar(50) not null,
    descrisao varchar(500) not null,
	usuarioFk bigint not null,
    responsavel_fk bigint not null,
    prazo date not null,
    locais_FK bigint not null,
    imagens mediumtext,
    primary key(id),
    foreign key(usuarioFk) references usuarios(id),
    foreign key(responsavel_fk) references responsavel(id),
    foreign key(locais_FK) references locais(id)
);
select *from tarefa;

#################################

create table status (
	id bigint not null auto_increment,
    name varchar(100) not null,
    primary key(id)
);
select *from status;

#################################

create table imagens_status (
	id bigint not null auto_increment,
    image mediumtext,
    primary key(id)
);
select *from imagens_status;

#################################

create table progressos (
	id bigint not null auto_increment,
    descrisao varchar(100) not null,
    data datetime not null,
    imagens_status_FK bigint not null,
    tarefa_FK bigint not null,
    status_FK bigint not null,
    primary key(id),
    foreign key(tarefa_FK) references tarefa(id),
	foreign key(status_FK) references status(id),
    foreign key(imagens_status_FK) references imagens_status(id)
);
select *from progressos;

#################################

## Alter TABLE ##

ALTER TABLE usuarios
ADD COLUMN cellNumber varchar(14);
select *from usuarios;

#################################

## Inserts ##

insert into nivelAcesso (nivel,descricao) values 
('Admin','blablá'),('Gestor','blablá'),
('Usuário','blablá'),('Visitante','blablá');

insert into ocupacao (titulo,nivelAcessoFk) values 
('Professor',3),('Secretaria',3),
('Coordenador',2),('Orientador',2),
('Aluno',4),('TI',1);

insert into usuarios (nome,email,senha,dataNascimento,ocupacaoFk,image_perfil) values 
('João','joao@gmail.com','55s888ff','2000-01-01',1,'img1'),
('Mara','mara@gmail.com','554333','1986-01-03',2,'img2'),
('Clarice','clarice@gmail.com','54455s888ff','1999-03-01',3,'img3'),
('Roberto','roberto@gmail.com','6666444','2001-01-21',4,'img4'),
('Miguel','miguel@gmail.com','3354','1995-03-03',1,'img5'),
('Lúcia','lucia@gmail.com','abbbcdd','1970-05-25',2,'img6');

insert into locais (nome,bloco,lotacao) values 
('Laboratório Eletrônica 01','A',16),
('Auditório','C',100),
('Laboratório Eletrônica 02','B',16),
('Laboratório Mecânica 01','A',30),
('Laboratório Informática 01','D',32);

insert into item (nome) values 
('Projetor'),
('Ar condicionado'),
('Lousa digital'),
('Home Theater'),
('Ipad'),
('Ferro de Solda'),
("SigmaRock"),
("Cadeira Gamer");

insert into checkList (localFk,itemFk) values 
(1,1),(1,2),(1,5),
(2,1),(2,5),
(3,3),(3,2),
(4,1),(4,2),(4,3),(4,5);

insert into eventos (nome,localFk,inicio,fim,inicioCheckIn,fimCheckIn,vagas) values 
('Workshop Cloud Iniciante', 5,'2023-07-07 18:45:00','2023-07-07 23:10:00', '2023-06-07 18:45:00','2023-07-07 18:45:00',32),
('Desenho Técnico AutoCAD', 5,'2023-08-01 18:45:00','2023-08-02 23:10:00', '2023-06-08 18:45:00','2023-08-01 18:45:00',32),
('Teste de resistencia Materiais', 4,'2023-12-01 18:45:00','2023-12-02 23:10:00', '2023-12-08 18:45:00','2023-12-01 18:45:00',30),
('Em busca da Casa Automatica The Film', 2,'2023-12-12 18:45:00','2023-12-12 23:10:00', '2023-12-12 18:45:00','2023-12-12 18:45:00',100);

insert into eventos (nome,localFk,inicio,fim,inicioCheckIn,fimCheckIn,vagas) values 
('Como ser um verdadeiro OMEM Singma', 2,'2023-01-01 18:45:00','2023-01-01 23:10:00', '2023-01-01 18:45:00','2023-01-01 18:45:00',16);

insert into checkIn (eventoFk,usuarioFk) values 
(1,1), (1,2), (1,5), 
(2,2), (2,4), (2,5),(2,6), 
(3,1), (3,6),
(4,3), (4,4), (4,5);

insert into checkIn (eventoFk,usuarioFk) values 
(1,5), (1,6);

insert into responsavel (responsavel_fk) values 
(1), (2),(3);

insert into responsavel (responsavel_fk) values 
(1),(2),(3);

insert into tarefa (titulo,descrisao,usuarioFk,responsavel_fk,prazo,locais_FK,imagens) values
('pc','placa-mãe',4,3,'2023-07-31',1,'placaMãeImg'),
('tablet','fio-carregador',4,3,'2023-06-10',2,'fioCarregadorRombidoImg'),
('ipad','fonte',4,3,'2023-10-20',3,'FonteCarregadorIpad'),
('lampada','cabo',5,3,'2023-08-20',4,'BocalLampImg'),
('ar-condicionado','filtro',2,3,'2023-07-20',5,'arImg');

insert into tarefa (titulo,descrisao,usuarioFk,responsavel_fk,prazo,locais_FK,imagens) values
('PC3','quebrado',2,1,'2023-01-01',1,'QuebradoPcIMG'),
('impressora','cartucho',2,5,'2023-02-10',2,'cartuchoImg'),
('Roteador','falhando',4,6,'2023-05-01',5,'RoterImg2'),
('monitor','nao-liga',4,2,'2023-05-01',4,'MonitorImg'),
('teclado','cabo-usb',3,1,'2023-05-01',2,'FioUsbImg');
; 

insert into status (name) values
('aberta'),('Em andamento'),('Concluida'),('Encerrada');
insert into imagens_status (image) values
("img1"),
("img2"),
("img3"),
("img4");

insert into progressos (descrisao,data,imagens_status_FK,tarefa_FK,status_FK) values
('N/A','2023-03-21',1,1,1),
('quase finalizando','2023-04-21',2,1,2),
('N/A','2023-05-10',3,1,3),
('N/A','2023-05-10',3,1,4),
('cabo','2023-05-10',3,2,1);

insert into progressos (descrisao,data,imagens_status_FK,tarefa_FK,status_FK) values
('N/A','2023-03-21',1,3,1),
('ta quase','2023-04-21',2,4,1),
('N/A','2023-05-10',3,6,1),
('N/A','2023-05-10',3,7,1),
('cabo','2023-05-10',3,8,1);


## CONSULTAS ##

#### (1) ##### 
select * from tarefa where id not in
(select t.id from tarefa t join progressos ts on t.id = ts.tarefa_fk);

#### (2) #####
select l.*, count(*) from locais l 
join tarefa t on l.id = t.locais_FK group by t.locais_FK having count(l.id)>2;

#### (3) #####
select u.*,count(*) from tarefa t 
join responsavel r on t.id = r.responsavel_fk 
join usuarios u on r.responsavel_FK = u.id group by u.id having count(u.id)>=2;

#### (4) #####
select e.*,t.* from tarefa t 
join locais l on t.locais_FK = l.id 
join eventos e on l.id = e.localFk 
join progressos ts on t.id = ts.tarefa_fk
where e.inicio > now() and ts.status_FK != '4' group by e.id,t.id;

#### (5) #####
select l.*, count(*) from locais l 
join tarefa t on l.id = t.locais_FK group by l.id;

#### (6) #####
select l.*, count(*) from locais l 
join tarefa t on l.id = t.locais_FK 
join progressos ts on t.id = ts.tarefa_fk 
where ts.status_FK = 4 group by l.id;

#### (7) #####
select u.*,count(*) from usuarios u 
join responsavel tr on u.id = tr.responsavel_fk group by u.id;

#### (8) #####
select u.*,count(*) from usuarios u 
join responsavel tr on u.id = tr.responsavel_fk 
join tarefa t on tr.responsavel_fk = t.id 
join progressos ts on t.id = ts.tarefa_fk 
where ts.status_fk = '4' group by u.id;

#### (9) #####
select *, AVG(d.qnt) from locais l 
join (select locais_FK, month(prazo)as mes,count(*) as qnt from tarefa 
group by mes,locais_FK) d on l.id = d.locais_FK group by d.mes,l.id;