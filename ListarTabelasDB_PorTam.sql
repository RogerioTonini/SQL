/* Script retirado da página: https://dbasqlserverbr.com.br/sql-server-como-saber-quantidade-de-linhas-colunas-e-tamanho-de-cada-tabela-no-banco-de-dados/ */

USE <DATABASE>
GO 
CREATE TABLE #temp
  ( 
     nome_tabela    SYSNAME, 
     linhas     INT, 
     tamanho_reservado VARCHAR(50), 
     tamanho_dados     VARCHAR(50), 
     tamanho_indice    VARCHAR(50), 
     tamanho_naoUsado   VARCHAR(50) 
  ) 
 
SET nocount ON
 
INSERT #temp
EXEC Sp_msforeachtable 
  'sp_spaceused ''?'''
 
SELECT a.nome_tabela, 
       a.linhas, 
       Count(*) AS quantidade_colunas, 
       a.tamanho_dados 
FROM   #temp a 
       INNER JOIN information_schema.columns b 
               ON a.nome_tabela COLLATE database_default = 
                  b.table_name COLLATE database_default 
GROUP  BY a.nome_tabela, 
          a.linhas, 
          a.tamanho_dados 
ORDER  BY Cast(Replace(a.tamanho_dados, ' KB', '') AS INTEGER) DESC

/* Apaga tabela temporária */
DROP TABLE #temp
