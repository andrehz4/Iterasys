*** Settings ***
Documentation      Exercício 2 - Teste Web
...                Utilize o site Microsoft To Do (https://todo.microsoft.com). Você deve criar os testes com o seu usuário logado no site, por padronização.
...                1) Crie a lista Livros
...                2) Na lista Livros, crie os itens A Arte da Guerra, A Cauda Longa e A Torre Negra
...                3) Na lista Livros, marque o item A Torre Negra como importante
...                4) Valide se a lista Livros existe, seu nome, itens e se A Torre Negra está como importante

Resource           ../../../resources/base.robot
Suite Setup        Start Session
Suite Teardown     End Session
Test Teardown      End Test


*** Test Cases ***
CRIAR LISTA DE LIVROS NO SITE TODO MICROSOFT
    [Template]                  Crie a lista Livros 
    [Tags]                      LISTADELIVROS1              PIPELISTADELIVROS
    #E-mail                     #Senha                      #Nome                    #Nome Da Lista                                                                       
    eng.andrehz@gmail.com.       Ole498180@                  André Zimermann          Livros 

CRIAR LISTA DE LIVROS COM OS ITENS NO SITE TODO MICROSOFT
    [Template]                  Na lista Livros, crie os itens A Arte da Guerra, A Cauda Longa e A Torre Negra
    [Tags]                      LISTADELIVROS2              PIPELISTADELIVROS
    #E-mail                     #Senha                      #Nome                    #Nome Da Lista            #Nome Do Item 1            #ome Do Item 2            #ome Do Item 3                                                                             
    eng.andrehz@gmail.com       Ole498180@                  André Zimermann          Livros                    A Arte da Guerra           A Cauda Longa             A Torre Negra   

CRIAR LISTA DE LIVROS, ITENS E MARCAR COMO FAVORITO NO SITE TODO MICROSOFT
    [Template]                  Na lista Livros, marque o item A Torre Negra como importante
    [Tags]                      LISTADELIVROS3              PIPELISTADELIVROS
    #E-mail                     #Senha                      #Nome                    #Nome Da Lista            #Nome Do Item 1            #ome Do Item 2            #ome Do Item 3                                                                             
    eng.andrehz@gmail.com       Ole498180@                  André Zimermann          Livros                    A Arte da Guerra           A Cauda Longa             A Torre Negra   

VALIDAR LISTA DE LIVROS, ITENS E VERICAR STATUS FAVORITO NO SITE TODO MICROSOFT
    [Template]                  Valide se a lista Livros existe, seu nome, itens e se A Torre Negra está como importante
    [Tags]                      LISTADELIVROS4              PIPELISTADELIVROS
    #E-mail                     #Senha                      #Nome                    #Nome Da Lista            #Nome Do Item 1            #ome Do Item 2            #ome Do Item 3                                                                             
    eng.andrehz@gmail.com       Ole498180@                  André Zimermann          Livros                    A Arte da Guerra           A Cauda Longa             A Torre Negra   


*** Keywords ***
Crie a lista Livros 
    [Arguments]                 ${email_valido}                    ${senha_valida}                 ${nome_usuario_logado}            ${nome_da_lista}                   
    
    Dado que acesso e verifico que estou no site TODO MICROSOFT
    Quando acesso e verifico que estou na página de login, insiro um ${email_valido} e uma ${senha_valida} e verifico que o ${nome_usuario_logado} é valido   
    E crio uma lista chamada ${nome_da_lista}
    Então após verificar que a cor do botão de excluir a lista é vermelho o teste é encerrado com sucesso

Na lista Livros, crie os itens A Arte da Guerra, A Cauda Longa e A Torre Negra
    [Arguments]                 ${email_valido}                    ${senha_valida}                 ${nome_usuario_logado}            ${nome_da_lista}            ${item_lista_1}            ${item_lista_2}            ${item_lista_3}                      
    
    Dado que acesso e verifico que estou no site TODO MICROSOFT
    Quando acesso e verifico que estou na página de login, insiro um ${email_valido} e uma ${senha_valida} e verifico que o ${nome_usuario_logado} é valido   
    E crio uma lista chamada ${nome_da_lista}
    E adiciono itens na ${nome_da_lista} com os seguintes nomes ${item_lista_1}, ${item_lista_2} e ${item_lista_3}  
    Então após verificar que a cor do botão de excluir a lista é vermelho o teste é encerrado com sucesso

Na lista Livros, marque o item A Torre Negra como importante
    [Arguments]                 ${email_valido}                    ${senha_valida}                 ${nome_usuario_logado}            ${nome_da_lista}            ${item_lista_1}            ${item_lista_2}            ${item_lista_3}                      
    
    Dado que acesso e verifico que estou no site TODO MICROSOFT
    Quando acesso e verifico que estou na página de login, insiro um ${email_valido} e uma ${senha_valida} e verifico que o ${nome_usuario_logado} é valido   
    E crio uma lista chamada ${nome_da_lista}
    E adiciono itens na ${nome_da_lista} com os seguintes nomes ${item_lista_1}, ${item_lista_2} e ${item_lista_3} 
    E o item ${item_lista_3} é marcado como importante 
    Então após verificar que a cor do botão de excluir a lista é vermelho o teste é encerrado com sucesso

Valide se a lista Livros existe, seu nome, itens e se A Torre Negra está como importante
    [Arguments]                 ${email_valido}                    ${senha_valida}                 ${nome_usuario_logado}            ${nome_da_lista}            ${item_lista_1}            ${item_lista_2}            ${item_lista_3}                      
    
    Dado que acesso e verifico que estou no site TODO MICROSOFT
    Quando acesso e verifico que estou na página de login, insiro um ${email_valido} e uma ${senha_valida} e verifico que o ${nome_usuario_logado} é valido   
    E crio uma lista chamada ${nome_da_lista}
    E adiciono itens na ${nome_da_lista} com os seguintes nomes ${item_lista_1}, ${item_lista_2} e ${item_lista_3} 
    E o item é marcado como importante é verificado se a ${nome_da_lista} existe com seu nome, ${item_lista_1}, ${item_lista_2} e ${item_lista_3} e se ${item_lista_3} está como importante
    Então após verificar que a cor do botão de excluir a lista é vermelho o teste é encerrado com sucesso