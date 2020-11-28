Documentation      Exercício 1 - Teste de API​
...                Formato da requisição: x-www-form-urlencoded
...                Logar com um usario no site Petz
...                curl --location --request POST 'https://www.petz.com.br/indexLogado_Loja.html' \
...                --header 'Upgrade-Insecure-Requests: 1' \
...                --header 'Origin: https://www.petz.com.br' \
...                --header 'Content-Type: application/x-www-form-urlencoded' \
...                --header 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36' \
...                --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
...                --data-urlencode 'action=Login' \
...                --data-urlencode 'logar=true' \
...                --data-urlencode 'login=provaiterasys@gmail.com' \
...                --data-urlencode 'manter=on' \
...                --data-urlencode 'senha=S#nha2020' \
...                --data-urlencode 'tipoUser=CLIENTE'

*** Settings ***				

Resource           ../../resources/services.robot

#Test Setup      Create Session	            Petz	        https://www.petz.com.br

*** Test Cases ***	
LOGIN COM SUCESSO NO SITE PETZ                                                                   #STATUS
    Acessar e navegação no site da Petz logado                                                   200

BUSCAR UM PRODUTO NO SITE PETZ                   #PRODUTO                                        #STATUS
    Busca de produtos                            Coleira                                         200                                             

ADICIONAR UM PRODUTO COM SUCESSO NO CARRINHO PETZ                                                #STATUS
    Adicionar um produto no carrinho PETZ                                                        200      
