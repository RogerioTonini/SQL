USE [DATABASE]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE 
	[PROCEDURE] @DataSelecao datetime
AS
 BEGIN

	DECLARE @Cod_Idioma INT, 
		@Lingua     VARCHAR(30)

	SELECT @Cod_Idioma = @@DEFAULT_LANGID
	SELECT @Lingua     = @@LANGUAGE

	/* Se o idioma for diferente do Portugues-BR */ 
	IF @Cod_Idioma <> 27
		BEGIN
			SET LANGUAGE Brazilian
		END

	/* Totaliza a qtde de cheques */ 
	SELECT
		count(*)
	FROM 
		[TABELA]
	WHERE 
		[CAMPO] = @DataSelecao
 
	/* Se o idioma for diferente do Portugues-BR */ 
	IF @Cod_Idioma <> 27
		BEGIN
			SET LANGUAGE @Lingua
		END
END
GO
