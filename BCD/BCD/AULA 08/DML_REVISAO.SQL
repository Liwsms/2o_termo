-- Active: 1788351677590@@127.0.0.1@3306@smartcoffee_dml_julia
USE SMARTCOFFEE_DML_JÚLIA;

--INSERINDO DADOS NO BD
--DML : INSERTS, UPDATE , DELETE
INSERT INTO cliente (nome,email,telefone,cidade,ativo)VALUES
('Adryan Costa','adryan@email.com','199999901','Limeira',TRUE),
('Ana Francisca','ana@email.com','199999902','Lençois Paulista', TRUE),
('Anna Julia','anaj@email.com','199999903','Limeira',TRUE),
('Beatriz Barros','beatrizb@email.com','199999904','Limeira',TRUE),
('Beatriz Santana','beatrizs@email.com','199999905','Limeira',TRUE),
('Bruno Dias','bruno@email.com','199999906','Limeira',TRUE),
('Cristopher da  Costa','cristopher@email.com','199999907','Mogi Guaçu',TRUE),
('Davi','davi@email.com',NULL,'Limeira',TRUE),
('Gabriel Lucio','gabriel@email.com','199999908','Limeira',TRUE),
('Gabriela Lima','gabriela@email.com','199999909','Curitiba',TRUE),
('Giovana Santana','giovana@email.com',NULL,'Juqueropólis',FALSE),
('Gustavo Couto','gustavo@email.com','199999910','Limeira',TRUE),
('Isabeli Souza','jaco@email.com',NULL,'Limeira',TRUE),
('Jacó de Souza','jaco@email.com','199999911','Limeira',TRUE),
('João Moreira','joao@email.com','199999912','Limeira',TRUE),
('John Pierre','john@email.com','199999913','cap haitien',TRUE),
('Jonas Dawid','jonas@email.com','199999914','Rio Janeiro',TRUE),
('Juan','juan@email.com','199999915','Limeira',TRUE),
('Júlia Fernanda','julia@email.com','199999916','Limeira',TRUE);


INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Manteiga Giovana',14.00,TRUE,12)

INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'ABERTO',14.00,118)

SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

---------------------------------------------------------------------------

-- ATUALIZANDO OU MODIFICSNFO FSFOD NO BD
-- EX 1: ATUALIZANDO INFORMAÇÕES INDIVIDUAIS
UPDATE cliente
SET telefone = '19999888801'
WHERE id_cliente = 20;

UPDATE cliente
SET ativo = TRUE
WHERE   id_cliente = 18;

--NUNCA, JAMAIS,NEVER ESQUEÇAM DE UTILIZAR O WHERE

-- REGRA DE OURO
-- PRIMEIRA ETAPA
SELECT * FROM cliente
WHERE id_cliente = 18;

-- SEGUNDA ETAPA
UPDATE cliente
SET ativo = FALSEWHERE id_cliente =18;

-- EX 2: ATUALIZANDO MAIS DO QUE UM CAMPO
UPDATE cliente
SET telefone = '1999888016',
    cidade = 'Campinas'
WHERE id_cliente =18; 

--EX 3:ATUALIZANDO COM CONDICIONAIS
UPDATE produto
SET preco = preco * 1.50
WHERE id_categoria =1;

--APAGANDO DADOS 
-- EX 1: APAGAR DADOS SEM CONTER INFORMAÇÕES
DELETE FROM cliente;

-- EX 2: APAGAR DADOS COM CONDIÇÕES
DELETE FROM cliente
WHERE id_cliente = 18; 

-- EX 3: APAGANDO DADOS DE TODA TABELA
TRUNCATE TABLE cliente;

-- EX 4: APAGAR DE FORMA REPRESENTATIVA OU LÓGICA
UPDATE produto
SET ativo = FALSE
where id_produto = 19;

-- REALIZANDO PASSOS PARA UMA COMPRA NO SMARTCOFFEE
-- PASSO 1: CADASTRAR UM NOVO CLIENTE
INSERT INTO cliente (nome,email,telefone,cidade, ativo) VALUES
('Bruno A' 'brunoa@email.com','1999123456', 'Piracicaba', TRUE);
SET @cliente = LAST_INSERT_ID();

-- PASSO 2: CRIAR O PEDIDO
INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(), 'ABERTO',0.00,102);
SET @pedido = LAST_INSERT_ID();

-- PASSO 3: INSERIR ITENS NO PEDIDO
INSERT INTO item_pedido (id_pedido, id_produto,quantidade,preco_unitario) VALUES
(@pedido,20,26,18.50),
(@pedido,18,7.00
);

-- PASSO 4: ATUALIZAR O TOTAL E STATUS
UPDATE pedido
SET valor_total = 84.38,
    status = 'Preparando'
WHERE id_pedido = @pedido;

-- PASSO 5: REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido,id_forma_pagamento,valor,data_pagamento) VALUES
(@pedido,1,84.38, NOW());

delete from pagamento
where id_pagamento = 1;


--CONSULTAR DADOS EM TABELAS BD
-- CONSULTAR TODA A TABELA
SELECT * FROM produto;
--CONSULTAR INDIVIDUAL POR ID
DELETE  FROM cliente
WHERE id_cliente = 115;




INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Espresso', 7.00, TRUE, 1), ('Café Duplo', 10.00, TRUE, 1),
('Café com Leite', 9.50, TRUE, 1), ('Cappuccino', 13.00, TRUE, 1),
('Mocha Chocolate', 15.50, TRUE, 1), ('Cold Brew', 14.00, TRUE, 2),
('Frappé de Chocolate', 18.00, TRUE, 2), ('Suco de Laranja', 11.00, TRUE, 2),
('Brownie', 9.00, TRUE, 3), ('Cheesecake', 14.50, TRUE, 3),
('Cookie de Chocolate', 7.50, TRUE, 3), ('Pão de Queijo', 6.50, TRUE, 4),
('Croissant', 12.00, TRUE, 4), ('Sanduíche Natural', 16.00, TRUE, 4),
('Combo Café + Pão de Queijo', 12.50, TRUE, 5),
('Combo Cappuccino + Brownie', 20.00, TRUE, 5), ('Torta Especial', 22.00, FALSE, 3);

INSERT INTO categoria (nome) VALUES
('Cafés'), ('Bebidas Geladas'), ('Doces'), ('Salgados'), ('Combos');