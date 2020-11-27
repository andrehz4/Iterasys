*** Settings ***				

Resource    ../../resources/services.robot

Test Setup      Create Session	            FastShop	        ${base_url}

*** Test Cases ***	
ACESSAR A HOME DA FASTSHOP E REALIZAR UMA BUSCA DE UM PRODUTO
                                                                              #PRODUTO                              #STATUS
    ACESSAR A HOME DA FASTSHOP E REALIZAR UMA BUSCA DE UM PRODUTO             8S311310222PTO_PRD                       200        

ACESSAR A HOME DA FASTSHOP LOGAR E REALIZAR UMA BUSCA DE UM PRODUTO 
                                                                              #CPF  #SENHA          #PRODUTO                              #STATUS
    ACESSAR A HOME DA FASTSHOP E REALIZAR UMA BUSCA DE UM PRODUTO                                    8S311310222PTO_PRD                       200        












