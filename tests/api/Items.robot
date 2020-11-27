*** Settings ***				

Resource    ../../resources/services.robot

Test Setup      Create Session	            FastShop	        ${base_url}

*** Test Cases ***	
#CONCLUIR UMA COMPRA COM BOLETO
                                                        #PRODUTO                                            #STATUS
#    Efetuar uma compra com pagamento via boleto         57601842967     12345678       AEMWHJ2BZACNZB        200        

#50510034004  94186183031

DELETAR UM PRODUTO DO CARRINHO FastShop    
    Deletar um produto do carrinho FastShop             93170258621    12345678        3T2003894VRM2
    
