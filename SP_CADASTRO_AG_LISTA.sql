Go
If Exists (Select * From SYSOBJECTS Where ID = Object_ID(N'SP_CADASTRO_AG_LISTA') and OBJECTPROPERTY(id, N'IsProcedure') = 1) Drop PROCEDURE SP_CADASTRO_AG_LISTA
Go

/*-----------------------------------------------------------------------------------------------------------------
	
	EXEC SP_CADASTRO_AG_LISTA
		  null						-- @p_CodIni int	= Null
		 ,null						-- @p_CodFin int	= Null
	
-----------------------------------------------------------------------------------------------------------------*/

Create Procedure SP_CADASTRO_AG_LISTA

	 @p_CodIni int = null
	,@p_CodFin int = null

With Encryption

AS 

Set NOCOUNT On

Begin

	select id
		 , nome_client
		 , tel_client
		 , email_client 
	from cadClient 
	where @p_CodIni is null or id between @p_CodIni and @p_CodFin

End