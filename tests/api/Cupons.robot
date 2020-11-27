Documentation      CUPOM ANIVERSARIO FASTSHOP
...                FUNCIONALIDADE: Validacao de Cupons atraves da API
...                Como: Usuario do sistema Fastshop
...                Eu quero: Realizar as requisicoes na API Price Card
...                A: Fim de manipular informacoes de cadastro do CUPOM

*** Settings ***				

Resource    ../../resources/services.robot

Test Setup      Create Session	            FastShop	        ${base_url}
*** Test Cases ***	
CUPOM INSERIDO COM SUCESSO - 10%   
    [Tags]                    API_CUPONS
    [Template]                Inserir um cupum e verificar o seu status code                 

    #Produto                  #Cupons                          #Status                  #Mensagem recebida                                                  
    3T2003894VRM2		      10%OFF	                          200                   Operação realizada com sucesso

CUPOM INSERIDO COM SUCESSO - 20%   
    [Tags]                    API_CUPONS
    [Template]                Inserir um cupum e verificar o seu status code                 

    #Produto                  #Cupons                          #Status                  #Mensagem recebida                                                  
    3T2003894VRM2		      20%OFF	                          200                   Operação realizada com sucesso

CUPOM INSERIDO COM SUCESSO - 30%   
    [Tags]                    API_CUPONS
    [Template]                Inserir um cupum e verificar o seu status code                 

    #Produto                  #Cupons                          #Status                  #Mensagem recebida                                                  
    3T2003894VRM2		      30%OFF	                          200                   Operação realizada com sucesso

CUPOM COM CAMPOS VAZIOS  
    [Tags]                    API_CUPONS
    [Template]                Inserir um cupum e verificar o seu status code                 

    #Produto                  #Cupons                          #Status                  #Mensagem recebida                                                  
    3T2003894VRM2		      ${EMPTY}	                          404                   Cupom inválido (expirado, não aplicável aos produtos do carrinho ou com limite de usos atingido).

CUPOM NÃO APLICAVEL    
    [Tags]                    API_CUPONS
    [Template]                Inserir um cupum e verificar o seu status code                 

    #Produto                  #Cupons                          #Status                  #Mensagem recebida                                                  
    3T2003894VRM2		      40%OFF	                           404                   Cupom inválido (expirado, não aplicável aos produtos do carrinho ou com limite de usos atingido).
                                                                                                



