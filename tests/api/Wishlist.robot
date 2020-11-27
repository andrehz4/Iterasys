*** Settings ***				

Resource    ../../resources/services.robot

Test Setup      Create Session	            FastShop	        ${base_url}

*** Test Cases ***	
Inserir um produto em favoritos no carrinho FASTSHOP e deletá-lo 
                                                                #CPF            #SENHA         #PRODUTO                              #STATUS
    Inserir um produto em favoritos no carrinho FASTSHOP        02871956430     12345678       8S311310222PTO_PRD                       200        
    Inserir um produto em favoritos no carrinho FASTSHOP        02871956430     12345678       JBLCHARGE4VRM_PRD                        200  
    Inserir um produto em favoritos no carrinho FASTSHOP        02871956430     12345678       LG50UM7510PSBB                           200        
    Inserir um produto em favoritos no carrinho FASTSHOP        02871956430     12345678       SGQN55Q80RAB                             200  
    Inserir um produto em favoritos no carrinho FASTSHOP        02871956430     12345678       UXX512FABR569B                           200        
    Inserir um produto em favoritos no carrinho FASTSHOP        02871956430     12345678       UXX512FJEJ225B                           200  
    Inserir um produto em favoritos no carrinho FASTSHOP        43710625980     12345678       UXX512FJEJ228B                           200        
    Inserir um produto em favoritos no carrinho FASTSHOP        43710625980     12345678       UXX512FABR568B                           200  
    Inserir um produto em favoritos no carrinho FASTSHOP        43710625980     12345678       JBLFREEXBTPTO                            200        
    Inserir um produto em favoritos no carrinho FASTSHOP        43710625980     12345678       NLC30BRPTO1                              200  
    Inserir um produto em favoritos no carrinho FASTSHOP        43710625980     12345678       SGQN55Q60RAB                             200        
    Inserir um produto em favoritos no carrinho FASTSHOP        43710625980     12345678       UXX512FJEJ227B                           200  
    Inserir um produto em favoritos no carrinho FASTSHOP        43710625980     12345678       SGWD11M44530W1                           200        
    Inserir um produto em favoritos no carrinho FASTSHOP        43710625980     12345678       SGNP760XBEXW1B                           200  

















