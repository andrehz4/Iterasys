*** Settings ***				

Resource    ../../resources/services.robot

Test Setup      Create Session	            FastShop	        ${base_url}

*** Test Cases ***	
CADASTRO COM SUCESSO                                                                        #STATUS
    Cadastro criar um usuario com sucesso                                                       201

CADASTRO DE UM CNPJ COM SUCESSO             CNPJ                                            #STATUS
    Cadastro criar uma empresa CNPJ         18096773000189                                      455    

CPF INVÁLIDO - Cadastro criar um usuario com dados inválidos                                #STATUS
    CPF INVÁLIDO - Cadastro criar um usuario com dados inválidos                                400

FORMULÁRIO EM BRANCO - Cadastro criar um usuario com dados inválidos                        #STATUS  
    FORMULÁRIO EM BRANCO - Cadastro criar um usuario com dados inválidos                        430   

FORMULÁRIO EM BRANCO DADOS DE ENTREGA - Cadastro criar um usuario com dados inválidos       #STATUS
    FORMULÁRIO EM BRANCO DADOS DE ENTREGA - Cadastro criar um usuario com dados inválidos       432

APENAS PRIMEIRO NOME - Cadastro criar um usuario com dados inválidos                        #STATUS
    APENAS PRIMEIRO NOME - Cadastro criar um usuario com dados inválidos                        455    

DATA INVÁLIDA - Cadastro criar um usuario com dados inválidos                               #STATUS
    DATA INVÁLIDA - Cadastro criar um usuario com dados inválidos                               457

TELEFONE INCOMPLETO - Cadastro criar um usuario com dados inválidos                         #STATUS
    TELEFONE INCOMPLETO - Cadastro criar um usuario com dados inválidos                         455
    
E-MAIL INVÁLIDO - Cadastro criar um usuario com dados inválidos                             #STATUS
    E-MAIL INVÁLIDO - Cadastro criar um usuario com dados inválidos                             457

SENHA MENOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos                #STATUS
    SENHA MENOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos                455

CEP INCOMPLETO - Cadastro criar um usuario com dados inválidos                              #STATUS
    CEP INCOMPLETO - Cadastro criar um usuario com dados inválidos                              455

CEP INVÁLIDO - Cadastro criar um usuario com dados inválidos                                #STATUS
    CEP INVÁLIDO - Cadastro criar um usuario com dados inválidos                                455

COMPLEMENTO MAIOR QUE 20 CARACTERES - Cadastro criar um usuario com dados inválidos         #STATUS
    COMPLEMENTO MAIOR QUE 20 CARACTERES - Cadastro criar um usuario com dados inválidos         453

CEP MAIOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos                  #STATUS
    CEP MAIOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos                  455


    
    
