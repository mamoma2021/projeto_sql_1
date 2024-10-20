create database TCL;
use TCL;

create table Dados(
	id int not null auto_increment primary key,
    nome varchar(100),
    endereco varchar (100),
    cpf varchar(12),
    sexo enum('F','M')
);

insert into dados values
(NULL,'Maria Bernadete', 'Av Faria Lima, 101', '33322215378', 'F'),
(NULL,'Jair Santos','Rua Paes Barros, 23', '99988877756','M'),
(NULL,'Antonio Samid','Avenida Brasil, 21','090222122256','M');

SELECT * FROM DADOS;

update dados
set nome = 'Vânia' 
where id = '1';

start transaction;

delete from dados where id = '3';

select * from dados;
rollback;

start transaction;
delete from dados where id = '2';
select * from dados;
commit;
rollback;

