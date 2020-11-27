*** Settings ***
Resource    ../resources/app/android.robot
Resource    ../resources/app/app_elements.robot
Resource    ../resources/mobile_hz.robot


*** Keywords ***  
###################### ICARROS - ITERASYS
Dado que acesso e verifico que estou no app android do Icarros e logo com um ${usuario_existente} e insiro a sua ${senha_valida} 
    Log to console                           Abrir Aplcativo Icarros
    Log to console                           Dado - OK
    Click Element                            ${ICONE_LOGIN}
    Wait Until Element Is Visible            ${ENTRAR_CADASTRAR}               ${timeout}    
    Click Element                            ${ENTRAR_CADASTRAR}    
    Wait Until Element Is Visible            ${INFORMAR_EMAIL}                 ${timeout}              
    Input Text	                             ${INFORMAR_EMAIL}                 ${usuario_existente}
    Wait Until Element Is Visible            ${INFORMAR_SENHA}
    Input Text	                             ${INFORMAR_SENHA}                 ${senha_valida}
    Wait Until Element Is Visible            ${BUTTON_ENTRAR}                  ${timeout}
    Click Element                            ${BUTTON_ENTRAR}
    Log to console                           Login - OK


###BUSCA PRODUTO
Qundo insiro um ${nome_veiculo_usado} na barra de busca da home
    Wait Until Element Is Visible            ${TEXTO_BUSCA_VEICULO_HOME}
    Click Element                            ${TEXTO_BUSCA_VEICULO_HOME}
        Sleep                                2
    Wait Until Element Is Visible            ${BUTTON_SEARCH_LARANJA}
    Input Text                               ${TEXTO_BUSCA_VEICULO_TELA_CHEIA}  ${nome_veiculo_usado} 
    Click Element                            ${BUTTON_SEARCH_LARANJA}
    #Press Keycode                            66
    Sleep    5


Então o aplicativo exibe opções de ${nome_veiculo_usado} para compra é verificado se ele trouxe ${nome_correto} com o ${preco_desejado}.
    Wait Until Element Is Visible            ${TEXTO_PRECO_DO_VEICULO}
    ${preco}=	                             Get Text	                                  ${TEXTO_PRECO_DO_VEICULO}
    Wait Until Element Is Visible            ${TEXTO_NOME_VEICULO_BUSCA}
    ${nome}=	                             Get Text	                                  ${TEXTO_NOME_VEICULO_BUSCA}
    
    Capture Page Screenshot
    Should Be Equal As Strings              ${preco}    ${preco_desejado} 
    Should Be Equal As Strings              ${nome}     ${nome_correto} 

