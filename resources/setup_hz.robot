*** Settings ***
Resource    base.robot
Resource    Helpers.robot
Resource    services.robot
Library	    Collections			
Library	    RequestsLibrary
Library     OperatingSystem

*** Keywords ***  
###################### ITERASYS
Dado que acesso e verifico que estou no site TODO MICROSOFT
    Delete All Cookies
    Execute Javascript                  window.location.reload(true);
    Go To                               ${BASE_URL}
    Wait Until Element Is Visible       ${ID_ICONE_PROFILE}                         30
    Click Element	                    ${ID_ICONE_PROFILE}
    Log to console                      Dado - OK    "###TELA INICIAL"

###################### ITERASYS
Quando acesso e verifico que estou na página de login, insiro um ${email_valido} e uma ${senha_valida} e verifico que o ${nome_usuario_logado} é valido  
    Wait Until Element Is Visible       ${ID_INPUT_EMAIL}                           30   
    Input Text	                        ${ID_INPUT_EMAIL}                           ${email_valido}
    Element Text Should Be              ${DIV_CONFIRMAR_TELA_EMAIL_ENTRAR}          Entrar
    Set Focus To Element                ${ID_BUTTON_PROXIMO} 
    Click Element	                    ${ID_BUTTON_PROXIMO} 
    Log to console                      Email do teste: ${email_valido} 
    Capture Page Screenshot
    ##Senha
    Wait Until Element Is Visible       ${ID_INPUT_SENHA}                           30   
    Input Text	                        ${ID_INPUT_SENHA}                           ${senha_valida}
    Element Text Should Be              ${DIV_CONFIRMAR_TELA_INSERIR_SENHA}         Insira a senha
    Set Focus To Element                ${ID_BUTTON_ENTRAR} 
    Click Element	                    ${ID_BUTTON_ENTRAR} 
    Log to console                      Senha do teste: ${senha_valida} 
    
    Wait Until Element Is Visible       ${ID_ICONE_PROFILE_LOGADO}                   30
    Click Element                       ${ID_ICONE_PROFILE_LOGADO} 
    Wait Until Element Is Visible       ${ID_NOME_USUARIO_LOGADO} 
    Element Text Should Be              ${ID_NOME_USUARIO_LOGADO}                    ${nome_usuario_logado}
    Capture Page Screenshot
    Log to console                      Nome do usuario: ${nome_usuario_logado}

###################### ITERASYS
E crio uma lista chamada ${nome_da_lista}
    Wait Until Element Is Visible       ${ID_INPUT_CRIAR_UMA_LISTA}                  30
    Input Text	                        ${ID_INPUT_CRIAR_UMA_LISTA}                  ${nome_da_lista}    
    Press Keys	                        ${ID_INPUT_CRIAR_UMA_LISTA}		             ENTER            
    Log to console                      Nome da lista: ${nome_da_lista}
    Capture Page Screenshot

E adiciono itens na ${nome_da_lista} com os seguintes nomes ${item_lista_1}, ${item_lista_2} e ${item_lista_3}  
    Wait Until Element Is Visible       ${ID_INPUT_ADICIONAR_ITEM_LISTA} 
    Input Text	                        ${ID_INPUT_ADICIONAR_ITEM_LISTA}                   ${item_lista_1}    
    Press Keys	                        ${ID_INPUT_ADICIONAR_ITEM_LISTA} 		           ENTER            
    Input Text	                        ${ID_INPUT_ADICIONAR_ITEM_LISTA}                   ${item_lista_2}    
    Press Keys	                        ${ID_INPUT_ADICIONAR_ITEM_LISTA} 		           ENTER    
    Input Text	                        ${ID_INPUT_ADICIONAR_ITEM_LISTA}                   ${item_lista_3}    
    Press Keys	                        ${ID_INPUT_ADICIONAR_ITEM_LISTA} 		           ENTER    
    Capture Page Screenshot
    Log to console                      Lista com os itens: ${item_lista_1}, ${item_lista_2} e ${item_lista_3} criados.

E são adicionados itens de uma lista externa
    Log To Console    ${\n}
    FOR   ${INDICE}   ${LIVRO}   IN ENUMERATE   @{MINHA_LISTA_DE_LIVROS}
        Wait Until Element Is Visible       ${ID_INPUT_ADICIONAR_ITEM_LISTA} 
        Input Text	                        ${ID_INPUT_ADICIONAR_ITEM_LISTA}                   ${LIVRO}       
        Press Keys	                        ${ID_INPUT_ADICIONAR_ITEM_LISTA} 		           ENTER       
        Log To Console    LIVRO ADICIONADO: ${INDICE} --> ${LIVRO}.
        No Operation
    END
    Capture Page Screenshot

E os itens: ${item_lista_1},${item_lista_2} e ${item_lista_3} são marcados como importantes e os itens ${item_lista_4} e ${item_lista_5} são informados como concluidos
    Set Global Variable                 ${SPACE*2}           
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_1}']//..//..//div//span[@class='importanceButton']   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_1}']//..//..//div//span[@class='importanceButton']   
        Sleep         2                                  
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_1}']//..//..//div//span[@class='importanceButton']
    Capture Page Screenshot
    Log to console                      Marcado com status favorito: ${item_lista_1} OK.   
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_2}']//..//..//div//span[@class='importanceButton']   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_2}']//..//..//div//span[@class='importanceButton']   
        Sleep         2
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_2}']//..//..//div//span[@class='importanceButton']
    Capture Page Screenshot
    Log to console                      Marcado com status favorito: ${item_lista_2} OK.        
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']   
        Sleep         2
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']
    Capture Page Screenshot
    Capture Page Screenshot
    Log to console                      Marcado com status favorito: ${item_lista_3} OK.
    
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_4}']//..//..//div//span[@class="checkBox big"]   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_4}']//..//..//div//span[@class="checkBox big"]   
        Sleep         2                                  
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_4}']//..//..//div//span[@class="checkBox big"]
    Capture Page Screenshot
    Log to console                      Marcado com status de concluido: ${item_lista_4} OK.   
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_5}']//..//..//div//span[@class="checkBox big"]   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_5}']//..//..//div//span[@class="checkBox big"]  
        Sleep         2
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_5}']//..//..//div//span[@class="checkBox big"]
    Capture Page Screenshot
    
    
E a ${nome_da_lista} é verificada e os itens: ${item_lista_1},${item_lista_2} e ${item_lista_3} são marcados e verificados como importantes e os itens ${item_lista_4} e ${item_lista_5} são informados e verificados como concluidos
        Set Global Variable                 ${SPACE*2}           
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_1}']//..//..//div//span[@class='importanceButton']   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_1}']//..//..//div//span[@class='importanceButton']   
        Sleep         2                                  
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_1}']//..//..//div//span[@class='importanceButton']
    Capture Page Screenshot
    Log to console                      Marcado com status favorito: ${item_lista_1} OK.   
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_2}']//..//..//div//span[@class='importanceButton']   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_2}']//..//..//div//span[@class='importanceButton']   
        Sleep         2
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_2}']//..//..//div//span[@class='importanceButton']
    Capture Page Screenshot
    Log to console                      Marcado com status favorito: ${item_lista_2} OK.        
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']   
        Sleep         2
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']
    Capture Page Screenshot
    Capture Page Screenshot
    Log to console                      Marcado com status favorito: ${item_lista_3} OK.
    
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_4}']//..//..//div//span[@class="checkBox big"]   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_4}']//..//..//div//span[@class="checkBox big"]   
        Sleep         2                                  
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_4}']//..//..//div//span[@class="checkBox big"]
    Capture Page Screenshot
    Log to console                      Marcado com status de concluido: ${item_lista_4} OK.   
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_5}']//..//..//div//span[@class="checkBox big"]   
    Set Focus To Element                //span[@aria-label='Tarefa${SPACE*2}${item_lista_5}']//..//..//div//span[@class="checkBox big"]  
        Sleep         2
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_5}']//..//..//div//span[@class="checkBox big"]

    Element Should Contain              ${DIV_ARVORE_LISTAS_ESQUERDA}                        ${nome_da_lista}
    Element Should Contain              ${H2_TITULO_ITEM}                                    ${nome_da_lista}  
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[0]}
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[1]} 
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[2]} 
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[3]}      
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[4]} 
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[5]} 
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[6]} 
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[7]}    
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[8]}
    Element Should Contain              ${DIV_NOMES_ITENS}                                   ${MINHA_LISTA_DE_LIVROS[9]}  
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${MINHA_LISTA_DE_LIVROS[3]}']//..//..//div//span[@class="importanceButton color-theme"]
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${MINHA_LISTA_DE_LIVROS[5]}']//..//..//div//span[@class="importanceButton color-theme"]
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${MINHA_LISTA_DE_LIVROS[7]}']//..//..//div//span[@class="importanceButton color-theme"]
    Wait Until Element Is Visible       //span[@aria-label='Tarefa Concluída ${MINHA_LISTA_DE_LIVROS[8]}']
    Wait Until Element Is Visible       //span[@aria-label='Tarefa Concluída ${MINHA_LISTA_DE_LIVROS[9]}']
    

E o item ${item_lista_3} é marcado como importante           
    Set Global Variable                 ${SPACE*2}           
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']   
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']
    Capture Page Screenshot
    Log to console                      Marcado com status favorito: ${item_lista_3} OK.

E o item é marcado como importante é verificado se a ${nome_da_lista} existe com seu nome, ${item_lista_1}, ${item_lista_2} e ${item_lista_3} e se ${item_lista_3} está como importante
    Set Global Variable                 ${SPACE*2}           
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']   
    Click Element                       //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class='importanceButton']
    Element Should Contain              ${DIV_ARVORE_LISTAS_ESQUERDA}                         ${nome_da_lista}
    Element Should Contain              ${H2_TITULO_ITEM}                                     ${nome_da_lista}  
    Element Should Contain              ${DIV_NOMES_ITENS}                                    ${item_lista_1} 
    Element Should Contain              ${DIV_NOMES_ITENS}                                    ${item_lista_2} 
    Element Should Contain              ${DIV_NOMES_ITENS}                                    ${item_lista_3}   
    Wait Until Element Is Visible       //span[@aria-label='Tarefa${SPACE*2}${item_lista_3}']//..//..//div//span[@class="importanceButton color-theme"]
    Capture Page Screenshot
    Log to console                      Lista ${nome_da_lista} está presente, seus itens são: ${item_lista_1}, ${item_lista_2} e ${item_lista_3}  e se ${item_lista_3} e status de ${item_lista_3} é favorito.



###################### ITERASYS
Então após verificar que a cor do botão de excluir a lista é vermelho o teste é encerrado com sucesso
    Wait Until Element Is Visible       ${BUTTON_TRES_PONTOS_LISTA}                  20
    Capture Page Screenshot
    Set Focus To Element                ${BUTTON_TRES_PONTOS_LISTA}
    Click Element                       ${BUTTON_TRES_PONTOS_LISTA}
    Wait Until Element Is Visible       ${SPAN_EXCLUIR_LISTA}                        20
    Set Focus To Element                ${SPAN_EXCLUIR_LISTA}
    Click Element                       ${SPAN_EXCLUIR_LISTA}

    Wait Until Element Is Visible       ${SPAN_COR_VERMELHA_EXCLUIR_LISTA}           20
    Set Focus To Element                ${SPAN_COR_VERMELHA_EXCLUIR_LISTA}
    Click Element                       ${SPAN_COR_VERMELHA_EXCLUIR_LISTA}    
    Capture Page Screenshot
    Log to console                      ENTÃO - OK    "###TESTE FINALIZADO"