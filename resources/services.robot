*** Settings ***
Library	    Collections			
Library	    RequestsLibrary
Library     OperatingSystem
Library     lib/cortar_endereco.py

Resource    Helpers.robot
Resource    base.robot

*** Variables ***
${cpf_api}      94186183031                          


*** Keywords ***
### /sessions
Acessar e navegação no site da Petz logado
    Create Session	                    Petz	        https://www.petz.com.br
    [Arguments]                         ${resp.status_code_page}  
    &{headers}=	                        Create Dictionary	        Upgrade-Insecure-Requests=1    Origin=https://www.petz.com.br       Content-Type=application/x-www-form-urlencoded       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36        Accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9     
    ${payload}=                         Convert To String           action=Login&logar=true&login=provaiterasys%40gmail.com&manter=on&senha=S%23nha2020&tipoUser=CLIENTE
    Log                                 ${payload}

    ${resp}=	                        Post Request                Petz       /indexLogado_Loja.html     data=${payload}     headers=${headers}     
    Log To Console                      ${\n}             
    Log to console                      Status: ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}


Busca de produtos
    Create Session	                    Petz	        https://www.petz.com.br
    [Arguments]                         ${produto}                  ${resp.status_code_page}  
    &{headers}=	                        Create Dictionary	        Upgrade-Insecure-Requests=1        User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36        Accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9     
    ${payload}=                         Convert To String           ${EMPTY}
    Log                                 ${payload}

    ${resp}=	                        Get Request     Petz       /busca?q=${produto}    data=${payload}     headers=${headers}     
    Log To Console                      Produto procurado:${produto} 
    Log To Console                      ${\n}  
    Log to console                      Status: ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

import requests

url = "https://api.segment.io/v1/t"

payload="{\"timestamp\":\"2020-11-28T00:27:41.326Z\",\"integrations\":{},\"context\":{\"page\":{\"path\":\"/comprarAgora_Loja.html\",\"referrer\":\"https://www.petz.com.br/produto/coleira-petz-jujuba-para-gatos-151827\",\"search\":\"\",\"title\":\"Carrinho | Petz\",\"url\":\"https://www.petz.com.br/comprarAgora_Loja.html\"},\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36\",\"locale\":\"pt-BR\",\"library\":{\"name\":\"analytics.js\",\"version\":\"4.0.4\"}},\"properties\":{\"cart_id\":\"166568181\",\"product\":{\"product_id\":\"151827\",\"sku\":\"20031110000331\",\"category\":\"Coleiras\",\"name\":\"Coleira Petz Jujuba para Gatos\",\"brand\":\"Petz\",\"variant\":\"\",\"price\":29.99,\"quantity\":1,\"position\":0,\"value\":29.99,\"url\":\"https://petz.com.br/produto/coleira-petz-jujuba-para-gatos-151827\",\"image_url\":\"https://staticpetz.stoom.com.br/fotos/1572381297482.jpg\"}},\"event\":\"Product Added\",\"messageId\":\"ajs-39e67f6c5afcda83077729fca72bf909\",\"anonymousId\":\"f092b200-d792-4db0-8fe7-aeceaaaa57d0\",\"type\":\"track\",\"writeKey\":\"x7a5ftBXuhYuVkSO32T4PTWpZRv0EESp\",\"userId\":null,\"sentAt\":\"2020-11-28T00:27:41.329Z\",\"_metadata\":{\"bundled\":[\"Appboy\",\"Google Tag Manager\",\"Segment.io\"],\"unbundled\":[]}}"
headers = {
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36',
  'Content-Type': 'text/plain',
  'Accept': '*/*'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)


Adicionar um produto no carrinho PETZ
    Create Session	                    Petz	                    https://api.segment.io
    [Arguments]                         ${resp.status_code_page}  
    &{headers}=	                        Create Dictionary	        Upgrade-Insecure-Requests=1    Origin=https://www.petz.com.br       Content-Type=application/x-www-form-urlencoded       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36        Accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9     
    ${payload}=                         Convert To Json             {\"timestamp\":\"2020-11-28T00:27:41.326Z\",\"integrations\":{},\"context\":{\"page\":{\"path\":\"/comprarAgora_Loja.html\",\"referrer\":\"https://www.petz.com.br/produto/coleira-petz-jujuba-para-gatos-151827\",\"search\":\"\",\"title\":\"Carrinho | Petz\",\"url\":\"https://www.petz.com.br/comprarAgora_Loja.html\"},\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36\",\"locale\":\"pt-BR\",\"library\":{\"name\":\"analytics.js\",\"version\":\"4.0.4\"}},\"properties\":{\"cart_id\":\"166568181\",\"product\":{\"product_id\":\"151827\",\"sku\":\"20031110000331\",\"category\":\"Coleiras\",\"name\":\"Coleira Petz Jujuba para Gatos\",\"brand\":\"Petz\",\"variant\":\"\",\"price\":29.99,\"quantity\":1,\"position\":0,\"value\":29.99,\"url\":\"https://petz.com.br/produto/coleira-petz-jujuba-para-gatos-151827\",\"image_url\":\"https://staticpetz.stoom.com.br/fotos/1572381297482.jpg\"}},\"event\":\"Product Added\",\"messageId\":\"ajs-39e67f6c5afcda83077729fca72bf909\",\"anonymousId\":\"f092b200-d792-4db0-8fe7-aeceaaaa57d0\",\"type\":\"track\",\"writeKey\":\"x7a5ftBXuhYuVkSO32T4PTWpZRv0EESp\",\"userId\":null,\"sentAt\":\"2020-11-28T00:27:41.329Z\",\"_metadata\":{\"bundled\":[\"Appboy\",\"Google Tag Manager\",\"Segment.io\"],\"unbundled\":[]}}
    Log                                 ${payload}

    ${resp}=	                        Post Request                Petz       /v1/t     data=${payload}     headers=${headers}     
    Log To Console                      ${\n}             
    Log to console                      Status: ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}