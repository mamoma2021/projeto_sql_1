 /*
case 
when condicao1 then resultado1
when condicao2 then resultado2
when condicaon then resultadon3
else resultado
end;
*/

use comercio;

select * from cliente;

select
	*,
    case
    when sexo = 'M' then 'Masculino'
    else 'Feminino'
    end as 'Sexo2'
    from cliente;
    
    
    use diversas_tabelas;
    select * from pedidos;
    
    select
    *,
    case
    when receita_venda >=3000 then 'Faturamento alto' 
    when receita_venda>=1000 then 'Faturamento medio'
    else ' Faturamento Baixo'
    end as 'Status'
    from pedidos;
    
    /*
    case
    when condicao1 and condicao2 then resultado1
    else resultado2
    end
    */
    # sintaxe(or)
    /*
    case
    when condicao1 or condicao2 then resultado1
    else resultado2
    end;
    */
    
    use diversas_tabelas;
    select * from clientes;
    
    select
    *,
    case 
    when sexo = 'F' and Qtd_Filhos > 0 then 'Recebera oferta dia das mães'
    when sexo ='M' and Qtd_Filhos > 0 then 'Recebera oferta de dia dos pais'
    else ' Não receberá oferta'
    end as 'Situação'
    from clientes;
    
    select * from produtos;
    
    select
    *,
    case 
    when Marca_Produto = 'DELL' or Marca_Produto ='SANSUNG ' then ' Receberá desconto de 15%' 
    else 'Não receberá desconto'
    end as 'Desconto?'
    from produtos;
    
    
      select
    *,
    case 
    when Marca_Produto = 'DELL' or Marca_Produto ='SANSUNG ' then (1-0.15)* Custo_Unit
    else 'Custo_Unit'
    end as'Valor_Preco_Desconto?'
    from produtos;
    
    
      select
    *,
    case 
    when Marca_Produto in ('DELL','SANSUNG')then (1-0.15)* Custo_Unit
    else 'Custo_Unit'
    end as'Valor_Preco_Desconto?'
    from produtos;
    
    select * from produtos;
    
    set @varDataVencimento = '2023-06-10';
    set @varDataAtual = '2023-05-10';
    select
    
    case
    when  @varDataAtual >  @varDataVencimento then 'Produto Vencido'
    else('Na validade')
    end as 'Situação';    
    
    
    
   use diversas_tabelas; 
    select * from clientes;
    
    select 
    id_cliente,
    nome,
    estado_civil,
    renda_anual,
    
    case
when Renda_Anual > 80000   then
case
when Estado_Civil = 'c' then '0.07'
else 0.05
end 
when Renda_Anual >= 60000 then '0.1'
when Renda_Anual >= 40000 then  '0.15'
when Renda_Anual  < 40000 then '0.2'

end as 'Bonus'
from clientes;


select * from clientes;

select
 *,
 case
when Renda_Anual >= 80000 then 
case
when Estado_civil = 'C' then ('Bonus de 7%')
else('Bonus de 5%')
END
WHEN Renda_Anual >= 60000 THEN ('BONUS DE 10%')
WHEN Renda_Anual >= 40000 THEN ('BONUS DE 15%')
WHEN Renda_Anual < 4000 THEN ('BONUS DE 20%')
end as 'valor do bonus'
from clientes;


select
 *,
 case
when Renda_Anual >= 80000 then 
case
when Estado_civil = 'C' then (1 + 0.7)* Renda_Anual
else (1 + 0.05)* Renda_Anual
END
WHEN Renda_Anual >= 60000 THEN (1 + 0.1)* Renda_Anual
WHEN Renda_Anual >= 40000 THEN (1 + 0.15)* Renda_Anual
WHEN Renda_Anual < 4000 THEN (1 + 0.20)* Renda_Anual
end as 'preço com bonus'
from clientes;




delimiter $
create function fn_BoasVindas(nome varchar(100))
returns varchar (100) deterministic
begin
return concat('Bem vindo', nome, 'tudo bem?');
end $
delimiter ;
select fn_BoasVindas('Maria') as 'Bom dia!';

delimiter $
create function fn_Faturamento(preco Decimal(10,2), quantidade int)
returns decimal (10,2) DETERMINISTIC 		
BEGIN
return preco * quantidade;
end$
delimiter ;
select fn_faturamento(133,7) as 'Faturamento';

#CurDate = Data corrente

#Start Transaction = Inicia uma transação no banco de dados

#ommit = para salvar alterações no seu BDA

#rollback = desfaz as alterações e desfaz a transação

#SubQuery = quando há uma consulta dentro de outra'''

use diversas_tabelas;

select * from lojas;



select * from pedidos where id_loja = (select id_loja from lojas where gerente = @varnomegerente);

delimiter $
create function fn_RemoveAcentos(texto varchar(100))
returns varchar(100) deterministic
begin set
	texto = replace(texto,'à','a'),
	texto = replace(texto,'á','a'),
    texto = replace(texto,'â','a'),
    texto = replace(texto,'ã','a'), -- A
    texto = replace(texto,'é','e'),
    texto = replace(texto,'ê','e'),
    texto = replace(texto,'è','e'), -- E
    texto = replace(texto,'í','i'),
    texto = replace(texto,'ì','i'), -- I
    texto = replace(texto,'ó','o'),
    texto = replace(texto,'ô','o'),
    texto = replace(texto,'õ','o'),
    texto = replace(texto,'ò','o'), -- O
    texto = replace(texto,'ú','u'),
    texto = replace(texto,'û','u'),
    texto = replace(texto,'ù','u'), -- U
	texto = replace(texto,'ç','c'); -- C

    return texto;
end $
delimiter ;
select fn_RemoveAcentos('à aliança da discípula alemã') as Remove_Acento;
select fn_RemoveAcentos('olá! você está bem?') as Remove_Acento;
select fn_RemoveAcentos('João entrou no ônibus com o carrinho de rolemã') as Remove_Acento;

delimiter $
create function datahoje()
returns date deterministic
	begin return curdate(); -- CURDATE = data corrente
end$$
delimiter ;
select datahoje() as 'Data';

delimiter $
create function data_mais_20()
returns date deterministic
begin
	return date_add(curdate(),interval 20 day);
end$
delimiter ;
select data_mais_20();

delimiter $
	create function data_mais_2_anos_5_meses_18_dias()
		returns date deterministic
		begin
			return date_add(curdate(),interval 2 year)+ interval 5 month + interval 18 day;
		end$
delimiter ;


select data_mais_2_anos_5_meses_18_dias();

select * from funcionarios;

delimiter $
create function tempo_servico(data_inicio date)
returns int deterministic
	begin
		declare data_atual date;
        select current_date()into data_atual;
        return year(data_atual) - year(data_inicio);
	end$
delimiter ;

select id_funcionario,nome,sobrenome,tempo_servico(data_contratacao) as 'Tempo de serviço' from funcionarios;



