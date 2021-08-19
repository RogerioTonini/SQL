format(
  cast(
    concat(
      month(COLUNA), 
      '/',
      trim(
        substring(cast(COLUNA as varchar), 5, 2)
      ), 
      '/',
      substring(cast(COLUNA as varchar),8, 4)
    ) 
  AS DATE), 
'd', 'pt-BR') AS DataSolicitada
