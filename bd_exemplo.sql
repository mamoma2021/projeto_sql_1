create database exemplo;
use exemplo;

create table p_curso(
id_curso int primary key auto_increment,
nome_curso varchar(100),
preco_curso decimal(10,2)
);

insert into p_curso values
(null, 'excel', '500.00'),
(null, 'vba', '280.00'),
(null, 'power bi', '150.00');

select * from p_curso;

delimiter $
create procedure p_atualiza_preco(
novo_preco decimal (10,2),
id int)
begin
update p_curso
set preco_curso = novo_preco
where id_curso = id;
select 'PREÇO ATUALIZADO COM SUCESSO';
END $

delimiter ; 

call p_atualiza_preco(330.00,2);

select * from p_curso;

delimiter $
create procedure p_cadastrar_cursos(
idnovo int,
novo_nome_curso varchar(100),
novo_preco_curso decimal(10,2))
begin
insert into p_curso values
(idnovo, novo_nome_curso, novo_preco_curso);
select 'Curso atualizado com sucesso!';
end $

delimiter ;

call p_cadastrar_cursos(null,'Banco de dados','1000.00');
call p_cadastrar_cursos(null,'python','1200.00');
call p_cadastrar_cursos(null,'Redes','800.00');
select * from p_curso;

delimiter $
create procedure p_acrescimo_geral
(acrescimo decimal (10,2))
begin 
update p_curso
set preco_curso = preco_curso * (1 + acrescimo/100);
select 'ACRESCIMO ATUALIZADO COM SUCESSO' as  situação;
end $

delimiter ; 
 
 call p_acrescimo_geral (10);
 call p_acrescimo_geral (50);
 
 select * from p_curso;

delimiter $
create procedure p_excluir_curso
(id int )
begin
delete from p_curso
where id_curso = id; 
end $

delimiter ;

call p_excluir_curso(6);

select * from p_curso;
 
 delimiter $
 create procedure p_excluir_curso_por_nome
 (nome varchar (100))
 begin
 delete from p_curso
 where nome_curso = nome;
 end $
 
 delimiter ;
 
 call  p_excluir_curso_por_nome ('VBA');
 
 select * from p_curso;
