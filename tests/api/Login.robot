*** Settings ***				

Resource    ../../resources/services.robot

Test Setup      Create Session	            FastShop	        ${base_url}

*** Test Cases ***	
Login com sucesso na FastShop 
                        #CPF            #SENHA          #STATUS
    Logar na FastShop   64102978313     12345678        201        

Login com senha inválida na FastShop 
                        #CPF            #SENHA          #STATUS
    Logar na FastShop   70749717076     123456789       404 

Login com cpf inválido na FastShop 
                        #CPF            #SENHA          #STATUS
    Logar na FastShop   04186183031     123456789       404 

Login com cpf em branco na FastShop 
                        #CPF            #SENHA          #STATUS
    Logar na FastShop   ${EMPTY}        123456789       404 

Login com cpf em branco na FastShop 
                        #CPF            #SENHA          #STATUS
    Logar na FastShop   70749717076     ${EMPTY}        404    

Login com cpf e senha em branco na FastShop 
    Logar na FastShop   ${EMPTY}        ${EMPTY}        404    

#Visualizar o carrinho FASTSHOP
#    Visualizar o carrinho FASTSHOP   70749717076     12345678    

Deletar dois produtos do carrinho FastShop
                                                      #CPF            #SENHA          #PRODUTO1           #PRODUTO2
    Deletar dois produtos do carrinho FastShop        70749717076     12345678        PANAF160B5W1        8S311310222PTO    
