*** Settings ***
Documentation      Exercício 2 - Teste Web
...                Utilize o site Microsoft To Do (https://todo.microsoft.com). Você deve criar os testes com o seu usuário logado no site, por padronização.
...                1) Crie a lista Meus Livros
...                2) Na lista Meus Livros, a partir de uma massa de teste em formato csv, json ou xml, crie 10 itens com nomes de livros a sua escolha
...                3) Na lista Meus Livros, marque 3 itens (livros) como importantes e outros 2 como concluídos
...                4) Valide se a lista Meus Livros existe, seu nome, itens e se os 3 itens (livros) estão como importantes e os outros 2 estão como concluídos


Resource           ../../../resources/base.robot
Suite Setup        Start Session
Suite Teardown     End Session
Test Teardown      End Test


*** Test Cases ***
CRIAR LISTA MEUS LIVROS NO SITE TODO MICROSOFT
    [Template]                  Crie a lista Meus Livros 
    [Tags]                      MEUSLIVROS1                 PIPELISTADEMEUSLIVROS
    #E-mail                     #Senha                      #Nome                    #Nome Da Lista                                                                       
    eng.andrehz@gmail.com       S#nha2020                   André Zimermann          Meus Livros 

CRIAR LISTA MEUS LIVROS COM 10 ITENS DE UMA FONTE EXTERNA NO SITE TODO MICROSOFT
    [Template]                  Na lista Meus Livros, a partir de uma massa de teste em formato csv, json ou xml, crie 10 itens com nomes de livros a sua escolha
    [Tags]                      MEUSLIVROS2                 PIPELISTADEMEUSLIVROS
    #E-mail                     #Senha                      #Nome                    #Nome Da Lista            
    eng.andrehz@gmail.com       S#nha2020                   André Zimermann          Meus Livros                  

CRIAR LISTA MEUS LIVROS COM 10 ITENS, FAVORITAR 3 E MARCAR 2 COMO LEITURA CONCLUIDA NO SITE TODO MICROSOFT
    [Template]                  Na lista Meus Livros, marque 3 itens (livros) como importantes e outros 2 como concluídos
    [Tags]                      MEUSLIVROS3                 PIPELISTADEMEUSLIVROS
    #E-mail                     #Senha                      #Nome                    #Nome Da Lista            #FAVORITOS                        #CONCLUIDOS                                                                             
    eng.andrehz@gmail.com       S#nha2020                   André Zimermann          Meus Livros               QUATRO    SEIS     OITO           NOVE    DEZ   

VALIDAR LISTA DE LIVROS, ITENS E VERICAR STATUS FAVORITO NO SITE TODO MICROSOFT
    [Template]                  Valide se a lista Meus Livros existe, seu nome, itens e se os 3 itens (livros) estão como importantes e os outros 2 estão como concluídos
    [Tags]                      MEUSLIVROS4                 PIPELISTADEMEUSLIVROS
    #E-mail                     #Senha                      #Nome                    #Nome Da Lista            #FAVORITOS                        #CONCLUIDOS                                                                             
    eng.andrehz@gmail.com       S#nha2020                  André Zimermann          Meus Livros               QUATRO    SEIS     OITO           NOVE    DEZ 



*** Keywords ***
Crie a lista Meus Livros 
    [Arguments]                 ${email_valido}                    ${senha_valida}                 ${nome_usuario_logado}            ${nome_da_lista}                   
    
    Dado que acesso e verifico que estou no site TODO MICROSOFT
    Quando acesso e verifico que estou na página de login, insiro um ${email_valido} e uma ${senha_valida} e verifico que o ${nome_usuario_logado} é valido   
    E crio uma lista chamada ${nome_da_lista}
    Então após verificar que a cor do botão de excluir a lista é vermelho o teste é encerrado com sucesso

Na lista Meus Livros, a partir de uma massa de teste em formato csv, json ou xml, crie 10 itens com nomes de livros a sua escolha
    [Arguments]                 ${email_valido}                    ${senha_valida}                 ${nome_usuario_logado}            ${nome_da_lista}
    
    Dado que acesso e verifico que estou no site TODO MICROSOFT
    Quando acesso e verifico que estou na página de login, insiro um ${email_valido} e uma ${senha_valida} e verifico que o ${nome_usuario_logado} é valido   
    E crio uma lista chamada ${nome_da_lista}
    E são adicionados itens de uma lista externa
    Então após verificar que a cor do botão de excluir a lista é vermelho o teste é encerrado com sucesso

Na lista Meus Livros, marque 3 itens (livros) como importantes e outros 2 como concluídos
    [Arguments]                 ${email_valido}                    ${senha_valida}                 ${nome_usuario_logado}            ${nome_da_lista}            ${item_lista_1}            ${item_lista_2}            ${item_lista_3}        ${item_lista_4}        ${item_lista_5}                      
    
    Dado que acesso e verifico que estou no site TODO MICROSOFT
    Quando acesso e verifico que estou na página de login, insiro um ${email_valido} e uma ${senha_valida} e verifico que o ${nome_usuario_logado} é valido   
    E crio uma lista chamada ${nome_da_lista}
    E são adicionados itens de uma lista externa
    E os itens: ${item_lista_1},${item_lista_2} e ${item_lista_3} são marcados como importantes e os itens ${item_lista_4} e ${item_lista_5} são informados como concluidos 
    Então após verificar que a cor do botão de excluir a lista é vermelho o teste é encerrado com sucesso

Valide se a lista Meus Livros existe, seu nome, itens e se os 3 itens (livros) estão como importantes e os outros 2 estão como concluídos
    [Arguments]                 ${email_valido}                    ${senha_valida}                 ${nome_usuario_logado}            ${nome_da_lista}            ${item_lista_1}            ${item_lista_2}            ${item_lista_3}        ${item_lista_4}        ${item_lista_5} 
    
    Dado que acesso e verifico que estou no site TODO MICROSOFT
    Quando acesso e verifico que estou na página de login, insiro um ${email_valido} e uma ${senha_valida} e verifico que o ${nome_usuario_logado} é valido   
    E crio uma lista chamada ${nome_da_lista}
    E são adicionados itens de uma lista externa
    E a ${nome_da_lista} é verificada e os itens: ${item_lista_1},${item_lista_2} e ${item_lista_3} são marcados e verificados como importantes e os itens ${item_lista_4} e ${item_lista_5} são informados e verificados como concluidos
    Então após verificar que a cor do botão de excluir a lista é vermelho o teste é encerrado com sucesso


    