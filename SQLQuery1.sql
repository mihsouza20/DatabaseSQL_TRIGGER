-- Thamires Souza 


use master;
drop database teste;
go

create database teste;
go

use teste;

create table tb_pessoas(
	id int,
	nome nvarchar(100),
	telefone nvarchar(100),
	email nvarchar(100))
GO
create table tb_pessoas_cp(
		id int,
		nome nvarchar(100),
		telefone nvarchar(100),
		email nvarchar(100),
		data date);
GO			

CREATE TRIGGER MinhaTrigger On tb_pessoas 
FOR INSERT AS  
DECLARE @id int;
DECLARE @nome varchar(100);
DECLARE @telefone varchar(100);
DECLARE @email varchar(100);



DECLARE @audit_action varchar(100);

SELECT @id = i.id FROM inserted i;
SELECT @nome = i.nome FROM inserted i;
SELECT @telefone = i.telefone FROM inserted i;
SELECT @email = i.email FROM inserted i;

SET @audit_action='Registrado com Sucesso!';

INSERT INTO tb_pessoas_cp (id,nome,telefone,email, data)
VALUES (@id,@nome,@telefone,@email, GETDATE());

PRINT 'Fim da execução da Trigger'
GO

INSERT INTO tb_pessoas (id,nome,telefone,email) VALUES (1,'Thamires Souza',964640309,'mihsouza@gmail.com');
INSERT INTO tb_pessoas (id,nome,telefone,email) VALUES (2,'Beyonce Knowles',964640102,'queenb@gmail.com');
INSERT INTO tb_pessoas (id,nome,telefone,email) VALUES (3,'Emma Watson',964640204,'hemione@gmail.com');
INSERT INTO tb_pessoas (id,nome,telefone,email) VALUES (4,'John Mayer',964640306,'johnzinho@gmail.com');

GO

select * from tb_pessoas;
select * from tb_pessoas_cp;
GO