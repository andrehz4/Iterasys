*** Settings ***				

Resource    ../../resources/services.robot

Test Setup      Create Session	            FastShop	        https://www.fastshop.com.br

                                                                 
*** Test Cases ***        
COMPARAR PREÇOS DOS PRODUTOS FASTSHOP         #PRODUTO          #Pricetag
    [Template]                                COMPARAR PREÇOS DOS PRODUTOS FASTSHOP EM PRODUÇÃO

    #PRODUTO                #Pricetag                                                                     
		01AACFT001			        99.00
		01AGBAG001			        99.00








*** Keywords ***
COMPARAR PREÇOS DOS PRODUTOS FASTSHOP EM PRODUÇÃO
    [Arguments]                     ${busca_produto}     ${priceTag} 
    Verificar preço em produção ${busca_produto} ${priceTag}