Go
If Exists (Select * From SYSOBJECTS Where ID = Object_ID(N'SP_CADASTRO_AG_OPERACAO') and OBJECTPROPERTY(id, N'IsProcedure') = 1) Drop PROCEDURE SP_CADASTRO_AG_OPERACAO
Go

/*-------------------------------------------------------------------------------------------------------------------------------------------
	
	EXEC SP_CADASTRO_AG_OPERACAO 'I'					--  @p_Tipo			char(1)			= null (I - Insert; U - Update; D - Delete)
								,null					-- ,@p_Codigo		int				= null
								,'Janaina'				-- ,@p_Nome			varchar(80)		= null
								,'email11@email.com'	-- ,@p_Email		varchar(100)	= null
								,'119775-8899'			-- ,@p_Fone			varchar(20)		= null
								--,null					-- ,@p_IdRet		int output
	
-------------------------------------------------------------------------------------------------------------------------------------------*/

Create Procedure SP_CADASTRO_AG_OPERACAO
	 @p_Tipo		char(1)			= null
	,@p_Codigo		int				= null
	,@p_Nome		varchar(80)		= null
	,@p_Email		varchar(100)	= null
	,@p_Fone		varchar(20)		= null
	--,@p_IdRet       int output

With Encryption

AS 

Set NOCOUNT On

Begin
	
	If (@p_Tipo = 'I') Begin
		
		insert into cadClient ( nome_client, email_client, tel_client )
		values ( @p_Nome, @p_Email , @p_Fone)

	End

	Else If (@p_Tipo = 'U') Begin
	
		update cadClient
		set  nome_client	= @p_Nome
			,email_client	= @p_Email
			,tel_client		= @p_Fone
		where id = @p_Codigo
		
	End

	Else If (@p_Tipo = 'D') Begin

		delete from cadClient where id = @p_Codigo

	End

	return

End