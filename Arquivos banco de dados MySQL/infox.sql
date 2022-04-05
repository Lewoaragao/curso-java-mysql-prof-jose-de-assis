create database dbinfox;
use dbinfox;
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

describe tbusuarios;

insert into tbusuarios(iduser, usuario, fone, login, senha)
values(1, 'Leonardo Aragão', '99999-9999', 'lewoaragao', '123456');
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(2, 'Administrador', '99999-9999', 'admin', 'admin');
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3, 'Bill Gates', '99999-9999', 'bill', '123456');

select * from tbusuarios;

update tbusuarios set fone = '98888-8888' where iduser = 2;

delete from tbusuarios where iduser = 3;

create table tbclientes(
idcli int primary key  auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli, endcli, fonecli, emailcli)
values('Linus Torvalds', 'Rua Tux, 2015', '99999-9999', 'linus@linux.com');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10, 2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos(equipamento, defeito, servico, tecnico, valor, idcli)
values('Notebook', 'Não liga', 'Troca da fonte', 'Zé', 87.50, 1);

select * from tbos;

select
O.os, equipamento, defeito, servico, valor,
C.nomecli, fonecli
from tbos as O
inner join tbclientes as C
on(O.idcli = C.idcli);

select * from tbusuarios where login = 'admin' and senha = 'admin';

insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3, 'Leandro Ramos', '99999-9999', 'leandro', '123');

select * from tbusuarios;

use dbinfox;
describe tbusuarios;
select * from tbusuarios;

alter table tbusuarios add column perfil varchar(20) not null;
alter table tbusuarios drop column perfil;

update tbusuarios set perfil = "admin" where iduser = 1;
update tbusuarios set perfil = "admin" where iduser = 2;
update tbusuarios set perfil = "user" where iduser = 3;

select * from tbusuarios where iduser = 2;

describe tbclientes;
select * from tbclientes;
select * from tbclientes where nomecli like 'j%';

select idcli as ID, nomecli as Nome, endcli Endereço, fonecli as Fone, emailcli as Email from tbclientes;

describe tbos;

select idcli, nomecli, fonecli from tbclientes where nomecli like 'jo%';
select idcli as ID, nomecli as Nome, fonecli as Fone from tbclientes where nomecli like 'jo%';

describe tbos;
alter table tbos add tipo varchar(15) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;

select * from tbos;

select os, date_format(data_os, '%d / %m / %Y - %H:%i'), tipo, situacao, equipamento, defeito, servico, tecnico, valor, idcli from tbos where os = 1;

use dbinfox;
select * from tbclientes;
select * from tbclientes order by nomecli;

select 
OSER.os, data_os, situacao, equipamento, valor, 
CLI.nomecli, fonecli 
from tbos as OSER 
inner join tbclientes as CLI
on (CLI.idcli = OSER.idcli);

select * from tbos;

select max(os) from tbos;