*** Settings ***
Library	    Collections			
Library	    RequestsLibrary
Library     OperatingSystem
Library     lib/cortar_endereco.py

Resource    Helpers.robot
Resource    base.robot

*** Variables ***
${base_url}     https://apiqa.fastshop.com.br
                #https://apiqa.fastshop.com.br
                #https://apiqa.fastshop.com.br
                #https://www.fastshop.com.br]
${cpf_api}      94186183031                          


*** Keywords ***
### /sessions
Post Session
    [Arguments]     ${payload}

    &{headers}=	    Create Dictionary	Content-Type=application/json

    ${resp}=	    Post Request     FastShop      /fastshop-qa/wcs/resources/v1/auth/login     data=${payload}     headers=${headers}
    [return]        ${resp}
    Log             ${payload} 
    Log             ${headers}
    Log             ${resp} 


Logar na FastShop
    [Arguments]                         ${cpf_api}              ${senha_api}    ${resp.status_code_page}               
    ${payload}=                         Convert To Json         {"document":"${cpf_api}","password":"${senha_api}"}
    ${resp}=	                        Post Session            ${payload}
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page} 


Visualizar o carrinho FASTSHOP
   
    [Arguments]                         ${cpf_api}          ${senha_api}               
    ${payload}=                         Convert To Json     {"document":"${cpf_api}","password":"${senha_api}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}       WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                        Get Request         FastShop      /v1/checkout/cart/self     data=${payload}     headers=${headers}     
    
    Should Be Equal As Strings          ${resp.status_code}     200
    

Deletar um produto do carrinho FastShop                  
    [Arguments]                         ${cpf}    ${senha}    ${busca_produto} 
    
    Create Session	                    FastShop	        https://apiqa.fastshop.com.br
    ${payload}=                         Convert To Json     {"document":"${cpf}","password":"${senha}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                          Delete Request         FastShop      /fastshop-qa/checkout/cart/${busca_produto}    data=${payload}     headers=${headers}     
    Log to console                      ${resp}        
 

Deletar dois produtos do carrinho FastShop
   
    [Arguments]                         ${cpf}          ${senha}        ${busca_produto}    ${busca_produto_dois}               
    ${payload}=                         Convert To Json     {"document":"${cpf}","password":"${senha}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                          Delete Request         FastShop      /v1/checkout/cart/${busca_produto}    data=${payload}     headers=${headers}     
    Log to console                      ${resp}        
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                          Delete Request         FastShop      /v1/checkout/cart/${busca_produto_dois}    data=${payload}     headers=${headers}     
    Log to console                      ${resp}   
  



  #Wishlist
Inserir um produto em favoritos no carrinho FASTSHOP
   
    [Arguments]                         ${cpf_api}          ${senha_api}            ${busca_produto}        ${resp.status_code_page}                       
    ${payload}=                         Convert To Json     {"document":"${cpf_api}","password":"${senha_api}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}       WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     [{"sku":"${busca_produto}","quantity":1,"url":"/p/d/JBLGO2PTOB/iphone-11-branco-com-tela-de-61-4g-64-gb-e-camera-de-12-mp-mwlu2bra"}]
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /v1/checkout/cart/wishList?deleteCartItem=false        data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}

    &{headers}=	                        Create Dictionary	    storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                        Delete Request          FastShop      /v1/checkout/cart/wishList/${busca_produto}    data=${payload}     headers=${headers}     
    Log to console                      ${resp}   
  
#UPDATES
Atualizar o endereço do usuario1
    [Arguments]                         ${cpf_api}          ${senha_api}              ${resp.status_code_page}                               
    ${payload}=                         Convert To Json     {"document":"${cpf_api}","password":"${senha_api}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}       WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"name":"Rua Maria De Castro Mesquita 84","nickName":"API-TESTE-FASTSHOP","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":54,"complement":"Rua Maria De Castro ","district":"Rua Maria De Castro Mesquita 8","city":"GUARULHOS","state":"SP","telephone":"(11) 98748-8174","housingType":"1","country":"Brasil","cellphone":"(11) 98748-8174"}
    Log                                 ${payload}
    ${resp}=	                        Post Request             FastShop      /fastshop-qa/wcs/resources/v1/customer/addresses/create     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "Endereco cadastrado" ${resp}  

    &{headers}=	                        Create Dictionary	    storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp    
    ${payload}=                         Convert To Json         {}
    Log to console                      ${payload}  
    ${resp}=	                        Get Request          FastShop      /fastshop-qa/wcs/resources//v1/customer/addresses        data=${payload}     headers=${headers}     
    ${addressId}=                       Convert To String   ${resp.json()['addresses']}
    Log to console                      ${addressId}
    ${addressId2}=                      cortar_addressId     ${addressId}
    Log to console                      "Numero ID endereço" ${addressId2}

    ${resp}=	                        Put Request          FastShop      /fastshop-qa//checkout/cart/updateAddress/${addressId2}        data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}  200


#UPDATES
1Atualizar o endereço do usuario
    [Arguments]                         ${cpf_api}          ${senha_api}              ${resp.status_code_page}                           
    ${payload}=                         Convert To Json     {"document":"${cpf_api}","password":"${senha_api}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}       WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"name":"Rua Maria De Castro Mesquita 84","nickName":"API -TESTE","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":54,"complement":"Rua Maria De Castro ","district":"Rua Maria De Castro Mesquita 8","city":"GUARULHOS","state":"SP","telephone":"(11) 98748-8174","housingType":"1","country":"Brasil","cellphone":"(11) 98748-8174"}

    &{headers}=	                        Create Dictionary	    storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp    
    ${payload}=                         Convert To Json         {}
    Log to console                      ${payload}  
    ${resp}=	                        Get Request          FastShop      /fastshop-qa/wcs/resources//v1/customer/addresses        data=${payload}     headers=${headers}     
    ${addressId}=                       Convert To String    ${resp.json()['addresses']}
    ${addressId2}=                      cortar_addressId     ${addressId}
    Log to console                      ${addressId2}
          
    
    ${resp}=	                        Put Request          FastShop      /fastshop-qa//checkout/cart/updateAddress/${addressId2}           data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}  200


### create
Cadastro criar um usuario com sucesso
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}_hz@fastshopteste.com","password":"12345678","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}_hz@fastshopteste.com","passwordVerify":"12345678","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${resp.status_code}
    Log to console                      ${payload}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}


CPF INVÁLIDO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

FORMULÁRIO EM BRANCO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"","birthday":"","gender":"","tradeName":"","companyName":"","ie":"","telephone":"","cellphone":"","email":"","password":"","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"","passwordVerify":"","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}


FORMULÁRIO EM BRANCO DADOS DE ENTREGA - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"","streetName":"","number":"","complement":"","district":"","city":"","state":"","housingType":"","country":""}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

APENAS PRIMEIRO NOME - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"ANDRE","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

DATA INVÁLIDA - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"0000-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

TELEFONE INCOMPLETO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 9874","cellphone":"(11) 9874","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

E-MAIL INVÁLIDO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488174","cellphone":"(11) 987488174","email":"${PALAVRAFAKE}fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

SENHA MENOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"123","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"123","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

CEP INCOMPLETO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"071","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

CEP INVÁLIDO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"00000000","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}


COMPLEMENTO MAIOR QUE 20 CARACTERES - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"1234567891011121314151617181920","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

CEP MAIOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"0000000000000000","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}


Cadastro criar uma empresa CNPJ
    [Arguments]                         ${CNPJ}                     ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CNPJ}","name":"${NOMEFAKE}","birthday":"","gender":"","tradeName":"${PALAVRAFAKE}","companyName":"${PALAVRAFAKE}","ie":"andre","telephone":"(11) 98748-8174","cellphone":"(11) 98748-8174","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cnpj":"${CNPJ}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"55","complement":"aa","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"1","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}

   
#HOME
Acessar a home da Fastshop e realizar uma busca de um produto
    [Arguments]                         ${busca_produto}        ${resp.status_code_page}  
    Create Session	                    FastShop	            https://cfagfast.fastshop.com.br/
    &{headers}=	                        Create Dictionary	    Connection=Connection               authority=cfagfast.fastshop.com.br               accept=application/json, text/plain, */*"   User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36     origin=http://webapp2-qa.fastshop.com.br    sec-fetch-site=cross-site   sec-fetch-mode=cors sec-fetch-dest=empty    referer=http://webapp2-qa.fastshop.com.br/web/s/SGQN55Q60RAB    accept-language=pt-BR,pt;q=0.9,en;q=0.8,en-US;q=0.7 cache-control=no-cache
    ${resp}=	                        Get Request             FastShop                            products?products=${busca_produto}_PRD           headers=${headers}     
    Log to console                      ${resp}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}

#Acessar a home da Fastshop logar e realizar uma busca de um produto


#Cart
Efetuar uma compra com pagamento via boleto
   
    [Arguments]                         ${cpf_api}          ${senha_api}            ${busca_produto}        ${resp.status_code_page} 
                          
    ${payload}=                         Convert To Json         {"document":"${cpf_api}","password":"${senha_api}"}
    Log                                 ${payload}
    ${resp}=                            Post Session            ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    Log to console                      "#0-Log com sucsso" >>>>>>>${resp.status_code}   
    ${WCToken}=                         Convert To String       ${resp.json()['WCToken']}
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String       ${resp.json()['WCTrustedToken']}
    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String       ${resp.json()['userID']}
    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	    Connection=keep-alive       WCTrustedToken=${WCTrustedToken}        User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36    userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36   WCToken=${WCToken}      Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp       storeId=10151      ip=172.84.04                                                                    
    ${payload}=                         Convert To Json         {"sku":"${busca_produto}","quantity":1}
    Log                                 ${payload}
    #1-ADICIONAR PRODUTO NO CARRINHO FASTSHOP
    ${resp}=	                        Post Request            FastShop                    /v1/checkout/cart/items                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "#1-ADICIONAR PRODUTO NO CARRINHO FASTSHOP >>>>>>>"${resp.status_code}  
    #2-DELETAR PRODUTO NO CARRINHO FASTSHOP
    ${resp}=	                        Delete Request            FastShop                    /fastshop-qa/checkout/cart/${busca_produto}                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "#2-DELETAR PRODUTO NO CARRINHO FASTSHOP >>>>>>>"${resp.status_code}  
    #3-ADICIONAR PRODUTO NO CARRINHO FASTSHOP
    ${resp}=	                        Post Request            FastShop                    /v1/checkout/cart/items                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "#3-ADICIONAR PRODUTO NO CARRINHO FASTSHOP >>>>>>>"${resp.status_code}             
    #4-Visualizar carrinho FASTSHOP
    ${resp}=	                        Get Request             FastShop      /v1/checkout/cart/self     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "#4-Visualizar carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    #5-Alterando a quantidade no carrinho FASTSHOP
    #${payload}=                         Convert To Json        {"quantity":1,"sku":"${busca_produto}"}
    ${resp}=	                        Put Request             FastShop      /fastshop-qa/checkout/cart/     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "5-#Alterando a quantidade no carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    #6-Inserir serviço suporte técnico
    ${payload}=                         Convert To Json        [{"quantity":1,"sku":"GY00HELPDESK","productSku":"${busca_produto}","type":"DIGISUPPORT","isClickCollect":false}]
    ${resp}=	                        Post Request            FastShop      /fastshop-qa/checkout/cart/addListItem     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "6-#Inserir serviço suporte técnico >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #7-Deletar serviço de suporte tecnico no carrinho FASTSHOP
    ${payload}=                         Convert To Json        [{"sku":"GY00HELPDESK"}]
    ${resp}=	                        Delete Request             FastShop      /fastshop-qa/checkout/cart/items         data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "7-#Deletar serviço de suporte tecnico no carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    #8-Inserir serviço garantia estendida
    ${payload}=                         Convert To Json        [{"quantity":1,"sku":"GXAEMWHJ2BZACN-${busca_produto}","productSku":"${busca_produto}","type":"WARRANTY","isClickCollect":false}]
    ${resp}=	                        Post Request            FastShop      /fastshop-qa/checkout/cart/addListItem     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "8-#Inserir serviço garantia estendida >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #9-Deletar serviço de garantia estendida carrinho FASTSHOP
    ${payload}=                         Convert To Json        [{"sku":"GXAEMWHJ2BZACN-${busca_produto}"}]
    ${resp}=	                        Delete Request         FastShop      /fastshop-qa/checkout/cart/items    data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "9-#Deletar serviço de garantia estendida carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #10-Inserir serviço de seguro
    ${payload}=                         Convert To Json        [{"quantity":1,"sku":"GSAEMWHJ2BZACN-${busca_produto}","productSku":"${busca_produto}","type":"THEFT","isClickCollect":false}]
    ${resp}=	                        Post Request            FastShop      /fastshop-qa/checkout/cart/addListItem     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "10-#Inserir serviço de seguro >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #11-Deletar serviço de seguro carrinho FASTSHOP
    ${payload}=                         Convert To Json        [{"sku":"GXAEMWHJ2BZACN-${busca_produto}"}]
    ${resp}=	                        Delete Request             FastShop      /fastshop-qa/checkout/cart/items    data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "11-#Deletar serviço de seguro carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #12-Quantidade no carrinho FASTSHOP
    ${resp}=	                        Get Request             FastShop      /v1/checkout/cart/summaryOfQuantity                       data=${payload}     headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                       "#12-Quantidade no carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    #13-Quantidade maxima no carrinho FASTSHOP 
    ${resp}=	                        Get Request             FastShop      /v1/checkout/parametrization/findByName/QTD_ITENS_MAX     data=${payload}     headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "#13-Quantidade maxima no carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #ENDEREÇO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    #15-Visualizar carrinho FASTSHOP 
    ${resp}=	                        Get Request             FastShop      /v1/checkout/cart/self     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "#15-Visualizar carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}   
    #16-Verificar o CEP 
    ${resp}=	                        Get Request             FastShop      /fastshop-qa/wcs/resources//v1/customer/searchAddress/07110-040     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "#Verificar o CEP >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #17-Criar um endereço do cliente no carrinho FASTSHOP 
    ${payload}=                         Convert To Json         {"name":"Rua Maria De Castro Mesquita 84","nickName":"API-TESTE-FASTSHOP","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":54,"complement":"Rua Maria De Castro ","district":"Rua Maria De Castro Mesquita 8","city":"GUARULHOS","state":"SP","telephone":"(11) 98748-8174","housingType":"1","country":"Brasil","cellphone":"(11) 98748-8174"}
    Log                                 ${payload}
    ${resp}=	                        Post Request            FastShop      /fastshop-qa/wcs/resources/v1/customer/addresses/create     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     204
    Log to console                      "#17-Criar um endereço do cliente no carrinho FASTSHOP  >>>>>>>"${resp.status_code}  
    ${payload}=                          Convert To Json         {}    
    #18-Criar um endereço do cliente no carrinho FASTSHOP 
    ${payload}=                         Convert To Json         {"name":"Rua Maria De Castro Mesquita 84","nickName":"API-TESTE-FASTSHOP","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":54,"complement":"Rua Maria De Castro ","district":"Rua Maria De Castro Mesquita 8","city":"GUARULHOS","state":"SP","telephone":"(11) 98748-8174","housingType":"1","country":"Brasil","cellphone":"(11) 98748-8174"}
    Log                                 ${payload}
    ${resp}=	                        Post Request            FastShop      /fastshop-qa/wcs/resources/v1/customer/addresses/create     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     204
    Log to console                      "#18-Criar um endereço do cliente no carrinho FASTSHOP  >>>>>>>"${resp.status_code}  
    ${payload}=                          Convert To Json         {}    
    #19-Visualizar carrinho FASTSHOP 
    ${resp}=	                        Get Request             FastShop      /v1/checkout/cart/self     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "#19-Visualizar carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}   
    #20-Atualizar o endereço do cliente no carrinho FASTSHOP 
    ${resp}=	                        Get Request              FastShop      /fastshop-qa/wcs/resources//v1/customer/addresses        data=${payload}     headers=${headers}     
    ${addressId}=                       Convert To String        ${resp.json()['addresses']}
    Log to console                      ${addressId}
    ${addressId2}=                      cortar_addressId         ${addressId}
    Log to console                      "Numero ID endereço"     ${addressId2}
    #21-DELETAR ENDEREÇO NO CARRINHO FASTSHOP
    ${resp}=	                        Delete Request            FastShop                    /fastshop-qa/wcs/resources/v1/customer/addresses/delete/${addressId2}                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}       400
    Log to console                      "#21-DELETAR ENDEREÇO NO CARRINHO FASTSHOP >>>>>>>"${resp.status_code}  
    #22-Atualizar o endereço do cliente no carrinho FASTSHOP 
    ${resp}=	                        Get Request              FastShop      /fastshop-qa/wcs/resources//v1/customer/addresses        data=${payload}     headers=${headers}     
    ${addressId}=                       Convert To String        ${resp.json()['addresses']}
    Log to console                      ${addressId}
    ${addressId2}=                      cortar_addressId         ${addressId}
    Log to console                      Numero ID endereço ${addressId2}
    #23-PUT Atualizar o endereço do cliente no carrinho FASTSHOP 
    ${resp}=	                        Put Request              FastShop      /fastshop-qa//checkout/cart/updateAddress/${addressId2}        data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}      200
    Log to console                      "#23-PUT Atualizar o endereço do cliente no carrinho FASTSHOP   >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}   
    #Entrega Normal, agendada ou economica >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    #24-Visualizar carrinho FASTSHOP 
    ${resp}=	                        Get Request             FastShop      /v1/checkout/cart/self     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "#24-Visualizar carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    ${payload}=                         Convert To Json         {}
    #25-Atualizar o cep 
    ${resp}=	                        Get Request             FastShop      /fastshop-qa/wcs/resources//v1/customer/searchAddress/07110-040     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "#25-Atualizar o cep >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #26-Endereço do cliente no carrinho FASTSHOP 
    ${resp}=	                        Get Request             FastShop     /fastshop-qa/wcs/resources//v1/customer/addresses                       data=${payload}     headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "#26-Endereço do cliente no carrinho FASTSHOP >>>>>>>"${resp.status_code}  
    ${payload}=                          Convert To Json         {} 
    #27-PUT Atualizar para entrega economica FASTSHOP 
    ${payload}=                         Convert To Json        [{"deliveryCode":"FAST-01-33","shipModeName":"Economica","addressId":"${addressId2}","sku":null}]
    ${resp}=	                        Put Request              FastShop      /fastshop-qa/checkout/cart/shippingMode/            data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}      200
    Log to console                      "#27-PUT Atualizar para entrega economica FASTSHOP    >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}   
    #28-PUT Atualizar para entrega agendada FASTSHOP         
    ${datadehoje}=                      datadehoje
    ${datadehoje2}=                     Convert To String       ${datadehoje}
    ${payload}=                         Convert To Json        [{"deliveryCode":"FAST-01-33","shipModeName":"Agendada","periodDescription":"MANHA","availableDate":"${datadehoje2[0:10]}T00:00:00","addressId":"${addressId2}","sku":null}]
    ${resp}=	                        Put Request              FastShop      /fastshop-qa/checkout/cart/shippingMode/            data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}      200
    Log to console                      "#28-PUT Atualizar para entrega agendada FASTSHOP    >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {} 
    #Serviços instalar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    #29-Visualizar carrinho FASTSHOP 
    ${resp}=	                        Get Request             FastShop      /v1/checkout/cart/self     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "#29-Visualizar carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {} 
    #30-Instalação de serviços no carrinho FASTSHOP 
    ${resp}=	                         Get Request             FastShop      /v2/installation-service/searchEligibility?skuProducts=${buscaproduto}&zipCode=02550000&platform=WEB     data=${payload}     headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}      200
    Log to console                      "#30-Instalação de serviços no carrinho FASTSHOP  >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {} 
    #31-Serviços no carrinho FASTSHOP
    ${resp}=	                         Get Request             FastShop      /fastshop-qa/wcs/resources/v5/products/services/byPartNumber/${busca_produto}     data=${payload}     headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}      200
    Log to console                      "#31-Serviços no carrinho FASTSHOP >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #PAGAMENTO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    #32-OBTER FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP
    ${resp}=	                        Get Request             FastShop      /fastshop-qa/checkout/cart/payments     data=${payload}     headers=${headers}
    ${paymentMethods}=                  Convert To String                       ${resp.json()['paymentMethods']}
    #Log to console                      ${paymentMethods}
    ${Value_cartao_de_credito}=         cortar_valor_cartao_de_credito                   ${paymentMethods}
    ${Value_multiplos_cartoes}=         cortar_valor_multiplos_cartao_de_credito         ${paymentMethods}
    ${Value_boleto}=                    cortar_valor_boleto                              ${paymentMethods}
    ${Value_lista_casamento}=           cortar_valor_lista_casamento                     ${paymentMethods}
    Log to console                      Valor a pagar em Multiplos Cartões de Crédito: ${Value_multiplos_cartoes}
    Log to console                      Valor a pagar no Cartão: ${Value_cartao_de_credito}
    Log to console                      Valor a pagar no Boleto: ${Value_boleto}
    Log to console                      Valor a pagar no Lista de casamento: ${Value_lista_casamento}
    Should Be Equal As Strings          ${resp.status_code}      200
    Log to console                      "#32-OBTER FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP >>>>>>>"${resp.status_code}   
    ${payload}=                          Convert To Json         {}
    #33-ESCOLHER BOLETO EM FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP
    ${payload}=                         Convert To Json         [{"paymentMethodId":"5007","paymentMethodName":"Boleto Bradesco","paymentTypeDescription":"Boleto","paymentTypeName":"Boleto","value":${Value_boleto},"installmentNumber":null}]
    ${resp}=	                        Post Request            FastShop           /fastshop-qa/checkout/cart/payments                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "#33-ESCOLHER BOLETO EM FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP >>>>>>>"${resp.status_code}
    ${payload}=                          Convert To Json         {}  
    #34-ESCOLHER CARTÃO DE CRÉDITO EM FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP
    ${payload}=                         Convert To Json         [{"paymentMethodId":"5010","paymentMethodName":"Cartão de Crédito Amex 15x","paymentTypeDescription":"Adicionar Cartão de Crédito","paymentTypeName":"Cartão de Crédito","cardNumber":"5161541224057189","tokenId":null,"value":null,"installmentNumber":null}]
    ${resp}=	                        Post Request            FastShop           /fastshop-qa/checkout/cart/payments                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "#34-ESCOLHER CARTÃO DE CRÉDITO EM FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP >>>>>>>"${resp.status_code}
    ${payload}=                          Convert To Json         {}  
    #35-ESCOLHER MULTIPLOS CARTÕES DE CRÉDITO EM FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP
    ${payload}=                         Convert To Json         [{"paymentMethodId":"5004","paymentMethodName":"Cartão de Crédito somente 1x","paymentTypeDescription":"em 1x no Cartão","paymentTypeName":"Cartão de Crédito somente 1x","installmentNumber":1,"value":10}]
    ${resp}=	                        Post Request            FastShop           /fastshop-qa/checkout/cart/payments                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "#35-ESCOLHER MULTIPLOS CARTÕES DE CRÉDITO EM FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP  >>>>>>>"${resp.status_code}
    ${payload}=                          Convert To Json         {}      
    #36-ESCOLHER LISTA DE CASAMENTO EM FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP
    ${payload}=                         Convert To Json         [{"paymentMethodId":"5108","paymentMethodName":"Crédito de Lista de Casamento","paymentTypeDescription":"Crédito de Lista de Casamento","paymentTypeName":"Crédito de Lista de Casamento","value":${Value_lista_casamento},"installmentNumber":null}]
    ${resp}=	                        Post Request            FastShop           /fastshop-qa/checkout/cart/payments                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "#36-ESCOLHER LISTA DE CASAMENTO EM FORMAS DE PAGAMENTO NO CARRINHO FASTSHOP >>>>>>>"${resp.status_code}
    ${payload}=                          Convert To Json         {}  
    #36-PAGAR POR BOLETO
    ${payload}=                         Convert To Json         [{"paymentMethodId":"5007","paymentMethodName":"Boleto Bradesco","paymentTypeDescription":"Boleto","paymentTypeName":"Boleto","value":${Value_boleto},"installmentNumber":null,"cardNumber":null,"expirationMonth":null,"expirationYear":null,"securityCode":null,"creditCardOwner":null,"document":null,"registeredCard":null,"tokenId":null}]
    ${resp}=	                        Post Request            FastShop           /fastshop-qa/checkout/cart/sendPayments                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "#36-PAGAR POR BOLETO >>>>>>>"${resp.status_code}
    ${payload}=                         Convert To Json         {}  

Verificar preço em produção ${busca_produto} ${priceTag} 
    &{headers}=	                        Create Dictionary	    Connection=keep-alive               User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36    userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36         Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp       storeId=10151      ip=172.84.04                                                                    
    ${payload}=                         Convert To Json         {"sku":"${busca_produto}","quantity":1}
    Log                                 ${payload}
    
    #GET PRODUTO
    ${resp}=	                        Get Request             FastShop      /wcs/resources/v2/products/byPartNumber/${busca_produto}     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}                  200
    #Should Be Equal As Strings          ${resp.json()['priceOffer']}         ${Priceoffer}
    #Log to console                      ${resp.json()['priceOffer']}  igual  ${Priceoffer} 
    Should Be Equal As Strings          ${resp.json()['priceTag']}           ${priceTag}
    Log to console                      "######################################################################################################################################################################"*PREÇO - PRODUÇÃO: ${resp.json()['priceTag']} PREÇO NA PLANILHA: ${priceTag} - SKU: ${busca_produto} FASTSHOP ###################################################################################################################################################################### 
    Log                                 "######################################################################################################################################################################"*PREÇO - PRODUÇÃO: ${resp.json()['priceTag']} PREÇO NA PLANILHA: ${priceTag} - SKU: ${busca_produto} FASTSHOP ###################################################################################################################################################################### 


E altero a quantidade dos produtos via api ${} ${} ${busca_produto} a quantidade no carrinho FASTSHOP
    Create Session	                    FastShop	            https://apiqa.fastshop.com.br
    ${payload}=                         Convert To Json         {"document":"${cpf}","password":"${senha}"}
    Log                                 ${payload}
    ${resp}=                            Post Session            ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    Log to console                      "#0-Log com sucsso" >>>>>>>${resp.status_code}   
    ${WCToken}=                         Convert To String       ${resp.json()['WCToken']}
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String       ${resp.json()['WCTrustedToken']}
    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String       ${resp.json()['userID']}
    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	    Connection=keep-alive       WCTrustedToken=${WCTrustedToken}        User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36    userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36   WCToken=${WCToken}      Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp       storeId=10151      ip=172.84.04                                                                    
    ${payload}=                         Convert To Json         {"sku":"${busca_produto}","quantity":1}
    Log                                 ${payload}
    
    
    #${payload}=                         Convert To Json        {"quantity":1,"sku":"${busca_produto}"}
    ${resp}=	                        Put Request             FastShop      /fastshop-qa/checkout/cart/     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}     200
    Log to console                      "5-#Alterando a quantidade no carrinho FASTSHOP >>>>>>>"${resp.status_code}   


E Deleto a quantidade dos produtos via api ${} ${} ${busca_produto} a quantidade no carrinho FASTSHOP
    Create Session	                    FastShop	            ${BASE_URL_API}
    ${payload}=                         Convert To Json         {"document":"${cpf}","password":"${senha}"}
    Log                                 ${payload}
    ${resp}=                            Post Session            ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    Log to console                      "#0-Log com sucsso" >>>>>>>${resp.status_code}   
    ${WCToken}=                         Convert To String       ${resp.json()['WCToken']}
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String       ${resp.json()['WCTrustedToken']}
    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String       ${resp.json()['userID']}
    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	    Connection=keep-alive       WCTrustedToken=${WCTrustedToken}        User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36    userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36   WCToken=${WCToken}      Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp       storeId=10151      ip=172.84.04                                                                    
    ${payload}=                         Convert To Json         {"sku":"${busca_produto}","quantity":1}

    ${resp}=	                        Delete Request            FastShop                    /fastshop-qa/checkout/cart/${busca_produto}                     data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}
    Log to console                      "#2-DELETAR PRODUTO NO CARRINHO FASTSHOP >>>>>>>"${resp.status_code}  

#CUPONS
Inserir um cupum e verificar o seu status code
    [Arguments]                         ${busca_produto}                  ${cupons}                    ${status}          ${mensagem_recebida}       
    Log to console                      TESTE COM O CUPOM: ${cupons} 
    &{headers}=	                        Create Dictionary	    Connection=keep-alive               User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36    userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36         Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp       storeId=10151      ip=172.84.04                                                                    
    ${payload}=                         Convert To Json         { "channel": "webapp", "cpf": "19644209036", "houseNumber": "12", "store": "fastshop", "zipCode": "06850120", "partner": null, "couponCodes": [ "${cupons}" ], "items": [ { "freightValue": 9.90, "offerPrice": 3679.13, "taxFee": null, "marketPlaceText": null, "sku": "${busca_produto}", "typeDelivery": "Normal", "quantity": 1, "fulfillmentCenter": "14", "street": null, "campaign": null, "promotions": [ { "tag": "Aniversário Fastshop", "methodPayment": null, "description": null, "sku": null, "value": 3679.13, "paymentTypeName": null, "paymentMethodName": null, "isPromotionApplied": true } ], "isClickCollect": false, "isM1": false, "isGift": false, "isMarketPlace": false, "isPlan": false, "isService": false } ], "selectedPayments": [], "selectedCard": { "bin": 555566, "maxPayments": 0, "paymentMethodId": null, "paymentMethodName": null, "paymentTypeName": null, "value": null, "installmentNumber": null } }
    Log                                 ${payload}
    
    #GET PRODUTO
    ${resp}=	                        Post Request             FastShop      /price-management/api/v1/price-promotion/price-cart?     data=${payload}                headers=${headers}
    Should Be Equal As Strings          ${resp.status_code}                    ${status}
    ${description}=                     Convert To String                      ${resp.json()}
    Should Contain	                    ${description}                         ${mensagem_recebida}
    Log to console                      Mensagem recebida está na resposta: "${mensagem_recebida}"
    Log to console                      Status: "${resp.status_code}"
    #Should Be Equal As Strings          ${resp.json()['priceTag']}           ${priceTag}
    #Log to console                      "*PREÇO - PRODUÇÃO: ${resp.json()['priceTag']} PREÇO NA PLANILHA: ${priceTag} - SKU: ${busca_produto} FASTSHOP 
    #Log                                 "*PREÇO - PRODUÇÃO: ${resp.json()['priceTag']} PREÇO NA PLANILHA: ${priceTag} - SKU: ${busca_produto} FASTSHOP 

Deletar um produto do carrinho FastShop ${cpf} ${senha} ${busca_produto}                  
    
    ${payload}=                         Convert To Json     {"document":"${cpf}","password":"${senha}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                          Delete Request         FastShop      /v1/checkout/cart/${busca_produto}    data=${payload}     headers=${headers}     
    Log to console                      ${resp}        
 

 Aumentar estoque dos produtos Fastshop                  
    [Arguments]                         ${cpf}    ${senha}    ${busca_produto} 
    
    ${payload}=                         Convert To Json      {"isClickCollect":null,"pickupStore":null,"dateTime":"2020-08-17 10:33:51","SKU":"SGWD11M44530W1","DistributionCenterID":"33","Quantity":999,"JustInTime":"N","Datetime":"2020-08-17 10:33:51","FulfillmentCenter":null}
    &{headers}=	                        Create Dictionary	 Accept=application/json    
    ${resp}=	                        Post Request         FastShop      /esb/api/incrementalstock                 data=${payload}     headers=${headers}     
    Log to console                      ${resp}        
 