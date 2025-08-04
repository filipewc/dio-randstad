CREATE  procedure [dbo].[p_Fato_ConversasIniciadas_Blip]                                                            
as         

begin

TRUNCATE TABLE Fato_ConversasIniciadas_Blip;


DECLARE 
    @dt date, 
    @IdClient varchar(max),
    @IdBlockMulti int,
    @TipoFluxo varchar(max),
    @ChatOperation varchar(max),
    @Campanha varchar (max),
    @loop_BlockMulti int,
    @loop_TipoFluxo varchar(max);

			
DECLARE csr_Fato_BlipHistory_Multiempresas CURSOR
    FOR 			
SELECT CAST(MAX(a.ChatDate) AS DATE) dt, a.IdClient, MAX(a.IdBlockMulti) IdBlockMulti, 
		   CASE MAX(a.IdBlockMulti)		
				WHEN 1	THEN 'Conversa Iniciada'
				WHEN 2	THEN 'CEP enviado'
				WHEN 3	THEN 'Número Enviado'
				WHEN 4	THEN 'Cria Lead'
				WHEN 5	THEN 'Complemento Enviado'
				WHEN 6	THEN 'Endereço Confirmado'
				WHEN 7	THEN 'Produto Escolhido'
				WHEN 8	THEN 'Nome / Razão Social Informado'
				WHEN 9	THEN 'Informou Documento'
				WHEN 10	THEN 'Data de Nascimento/Constituição'
				WHEN 11	THEN 'Telefone 2 Informado'
				WHEN 12	THEN 'Email Enviado'
				WHEN 13	THEN 'Step 1'
				WHEN 14	THEN 'Nome da Mãe Informado'
				WHEN 15	THEN 'Step 4'
				WHEN 16	THEN 'Data Vencimento Escolhido'
				WHEN 17	THEN 'Método Pagamento Escolhido'
				WHEN 18	THEN 'Aceitou os Termos de Uso'
				WHEN 19	THEN 'Step 5'
			END as TipoFluxo, a.ChatOperation, MAX(a.Campanha) Campanha
	FROM Fato_BlipHistory_Multiempresas a
	WHERE a.IdBlockMulti != 99
	GROUP BY a.IdClient, a.ChatOperation;

OPEN csr_Fato_BlipHistory_Multiempresas;

FETCH NEXT FROM csr_Fato_BlipHistory_Multiempresas INTO 
    @dt, 
    @IdClient,
    @IdBlockMulti,
    @TipoFluxo,
    @ChatOperation,
    @Campanha;

WHILE @@FETCH_STATUS = 0
    BEGIN
	    SET @loop_BlockMulti = 1
	    SET @loop_TipoFluxo = 'Conversa Iniciada'
	    WHILE @loop_BlockMulti < @IdBlockMulti
		BEGIN
			INSERT INTO Fato_ConversasIniciadas_Blip VALUES (@dt, @IdClient, @loop_BlockMulti, @loop_TipoFluxo, @ChatOperation, @Campanha);
			SET @loop_BlockMulti = @loop_BlockMulti + 1
			SET @loop_TipoFluxo = CASE @loop_BlockMulti 
				WHEN 1	THEN 'Conversa Iniciada'
				WHEN 2	THEN 'CEP enviado'
				WHEN 3	THEN 'Número Enviado'
				WHEN 4	THEN 'Cria Lead'
				WHEN 5	THEN 'Complemento Enviado'
				WHEN 6	THEN 'Endereço Confirmado'
				WHEN 7	THEN 'Produto Escolhido'
				WHEN 8	THEN 'Nome / Razão Social Informado'
				WHEN 9	THEN 'Informou Documento'
				WHEN 10	THEN 'Data de Nascimento/Constituição'
				WHEN 11	THEN 'Telefone 2 Informado'
				WHEN 12	THEN 'Email Enviado'
				WHEN 13	THEN 'Step 1'
				WHEN 14	THEN 'Nome da Mãe Informado'
				WHEN 15	THEN 'Step 4'
				WHEN 16	THEN 'Data Vencimento Escolhido'
				WHEN 17	THEN 'Método Pagamento Escolhido'
				WHEN 18	THEN 'Aceitou os Termos de Uso'
				WHEN 19	THEN 'Step 5'
			END
	END
		
INSERT INTO Fato_ConversasIniciadas_Blip VALUES (@dt, @IdClient, @loop_BlockMulti, @loop_TipoFluxo, @ChatOperation, @Campanha);
FETCH NEXT FROM csr_Fato_BlipHistory_Multiempresas INTO 
    @dt, 
    @IdClient,
    @IdBlockMulti,
    @TipoFluxo,
    @ChatOperation,
    @Campanha;
END;
           
CLOSE csr_Fato_BlipHistory_Multiempresas;

DEALLOCATE csr_Fato_BlipHistory_Multiempresas;

end;