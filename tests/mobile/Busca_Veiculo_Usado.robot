Documentation      Exercício 3 - Teste Mobile
...                Utilize o app iCarros (disponível na Play Store e Apple Store) - Você deve criar os testes com o seu usuário logado no app, por padronização. 
...                1) Faça uma consulta de veículos usados


*** Settings ***
Resource           ../../resources/app/android.robot
Resource           ../../resources/app/app_elements.robot
Resource           ../../resources/mobile_hz.robot
Test Setup         Abrir app
Test Teardown      Fechar app


*** Test Cases ***
LOGIN E BUSCA DE VEICULOS USADOS COM SUCESSO NO APLICATIVO ANDROID DO ICARROS 
     [Template]                       Faça uma consulta de veículos usados                                                                        
     [Tags]                           BUSCAVEICULOUSADO1                       PIPEICARROS

     #CPF                             #SENHA           #Nome do veiculo usado  #Nome do veiculo          #Preço  
     provaiterasyshz@gmail.com        S#nha2020        ONIX                    Chevrolet Onix            40,876



*** Keywords ***
Faça uma consulta de veículos usados
    [Arguments]                       ${usuario_existente}                    ${senha_valida}                 ${nome_veiculo_usado}                    ${nome_correto}                    ${preco_desejado}                       
    
    Dado que acesso e verifico que estou no app android do Icarros e logo com um ${usuario_existente} e insiro a sua ${senha_valida} 
    Qundo insiro um ${nome_veiculo_usado} na barra de busca da home
    Então o aplicativo exibe opções de ${nome_veiculo_usado} para compra é verificado se ele trouxe ${nome_correto} com o ${preco_desejado}.
