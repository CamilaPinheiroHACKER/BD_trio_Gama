/* exercicio 2 */
	select count(id) from cliente;

/* exercicio 3 */
	select * from produto where preco = ( select max(preco) from produto);

/*exercicio 4*/
	select * from produto where preco = (select min(preco) from produto);

/*exercicio 5*/
	select * from produto inner join departamento 
		on departamento.codigo = produto.departamento_codigo;
        
/*exercicio 6*/
	select departamento.nome, count(produto.codigo) 
		from produto right outer join departamento
        on produto.departamento_codigo = departamento.codigo
        group by departamento.codigo;
        
/*exercicio 7*/
    select item_pedido.num_sequencial, cliente.nome, produto.nome, 
			item_pedido.quantidade, item_pedido.valor_unitario, 
            item_pedido.valor_total, pedido.data_pedido 
     from cliente 
		inner join pedido on pedido.cliente_id = cliente.id
        inner join item_pedido on item_pedido.pedido_numero = pedido.numero
        inner join produto on produto.codigo = item_pedido.produto_codigo;

/*exercicio 8*/
	select monthname(data_pedido) as "Mês", count(numero) as "Quantidade" from pedido 
	        group by month(data_pedido);
    
/*exercicio 9*/
	select monthname(data_pedido) as "Mês", sum(valor_total)
		from item_pedido
			inner join pedido on item_pedido.pedido_numero = pedido.numero
            group by month(data_pedido);

/*exercicio 10*/
	select departamento.nome, sum(estoque*preco)
		from produto
			inner join departamento on produto.departamento_codigo = departamento.codigo
			group by departamento.nome;
