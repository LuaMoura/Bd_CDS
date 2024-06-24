create database db_cds;
use db_cds;

create table Tb_Artista (
	Cod_Art int not null,
    constraint Pk_Cod_Art primary key (Cod_Art),
    Nome_Art varchar (100) not null unique
);

describe Tb_Artista;

create table Tb_Gravadora (
	Cod_Grav int not null,
    constraint Pk_Cod_Grav primary key (Cod_Grav),
    Nome_Grav varchar (50) not null unique
);

describe Tb_Gravadora;

create table Tb_Categoria (
	Cod_Cat int not null,
    constraint Pk_Cod_Cat primary key (Cod_Cat),
    Nome_Cat varchar (50) not null unique
);

describe Tb_Categoria;

create table Tb_Estado (
	Sigla_Est char (2) not null,
    constraint Pk_Sigla_Est primary key (Sigla_Est),
    Nome_Est char (50) not null unique
);

describe Tb_Estado;

create table Tb_Cidade (
	Cod_Cid int not null,
    constraint Pk_Cod_Cid primary key (Cod_Cid),
    Sigla_Est char (2) not null
);

use db_cds;

describe Tb_Cidade;

alter table Tb_Cidade add Nome_Cid Varchar(100) not null comment 'Nome da cidade';

describe Tb_Cidade;

create table Tb_Cliente (
    Cod_Cli int Comment 'Código do Cliente' not null auto_increment,
    Cod_Cid int Comment 'Código da Cidade' not null,
    Nome_Cli Varchar(100) not null comment 'Nome da cidade',
    End_Cli Varchar(200) not null comment'Endereço do Cliente',
    Renda_Cli decimal(10,2) comment 'Renda do Cliente' not null default 0.00,
    Sexo_Cli enum('M', 'F') comment 'Sexo do Cliente' not null default 'F',
	constraint Renda_Cli check (Renda_Cli >- 0),
	constraint Cod_CLi primary key (Cod_Cli),
    constraint Cod_Cid foreign key (Cod_Cli)
	references Tb_Cidade (Cod_Cid)    
);

describe Tb_Cliente;

create table Tb_Conjuge (
    Cod_Cli int Comment 'Código do Cliente' not null,
    Nome_Conj Varchar(100) not null comment 'Nome do Conjugue',
    Renda_Conj decimal(10,2) comment 'Renda do Cliente' not null default 0.00,
    Sexo_Conj enum('M', 'F') comment 'Sexo do Cliente' not null default 'M' 
);

create table Tb_Funcionario (
    Cod_Func int comment 'Código do Funcionário' not null,
    constraint Pk_Cod_Func primary key (Cod_Func),
    Nome_Func varchar(100) not null comment 'Nome do Funcionário',
    End_Func varchar(200) not null comment 'Endereço do Funcionário',
    Sal_Func decimal(10,2) comment 'Salário do Funcionário' not null default 0.00,
    Sexo_Func enum('M', 'F') COMMENT 'Sexo do Funcionário' not null default 'M',
    constraint chk_Sal_Func check (Sal_Func >= 0)
);

alter table Tb_Conjuge add constraint Pk_Cod_Cli primary key (Cod_Cli);

create table Tb_Dependente (
    Cod_Dep int comment 'Código do Dependente' not null,
    constraint Pk_Cod_Dep primary key (Cod_Dep),
    Cod_Func int comment 'Código do Funcionário' not null,
	Nome_Dep varchar(100) not null comment 'Nome do Funcionário',
    Sexo_Dep enum('M', 'F') comment 'Sexo do Funcionário' not null default 'M'
);

create table Tb_Pedido (
    Num_Ped int COMMENT 'Código do Pedido' NOT NULL auto_increment,
	constraint Pk_Num_Ped primary key (Num_Ped),
    Cod_Cli int comment 'Código do Cliente' not null,
	Cod_Func int comment 'Código do Funcionário' not null,
	Data_Ped datetime not null comment 'Data do Pedido',
    Val_Ped decimal (10,2) comment 'Valor do Pedido' not null default 0
);

create table Tb_Titulo_Pedido (
    Tit_Ped int comment 'Código do Pedido' not null,
    constraint Pk_Tit_Ped primary key (Tit_Ped),
    Cod_Tit int comment 'Código do Titulo' not null,
	Cod_Func int comment 'Código do Funcionário' not null,
	Qtd_Estq int comment 'Quantidade de CD de cada Titulo em Estoque' not null,
    Val_CD decimal (10,2) comment 'Valor do Pedido' not null default 0
);

create table Tb_Titulo_Artista (
	Tit_Art int comment 'Código do Titulo' not null,
    constraint Pk_Tit_Art primary key (Tit_Art),
    Cod_Art int comment 'Código do Artista' not null
);














