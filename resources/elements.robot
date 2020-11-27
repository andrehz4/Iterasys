*** Settings ***
Resource         ../resources/setup_hz.robot

*** Variables ***
#LOGIN
${ID_ICONE_PROFILE}                                   id:mectrl_headerPicture

${ID_INPUT_EMAIL}                                     id:i0116
${DIV_CONFIRMAR_TELA_EMAIL_ENTRAR}                    //div[@role='heading']
${ID_BUTTON_PROXIMO}                                  id:idSIButton9

${ID_INPUT_SENHA}                                     id:i0118
${DIV_CONFIRMAR_TELA_INSERIR_SENHA}                   id:loginHeader
${ID_BUTTON_ENTRAR}                                   id:idSIButton9
${ID_ICONE_PROFILE_LOGADO}                            //div[@class='_2KqWkae0FcyhdNhWQ-Cp-M']
${ID_NOME_USUARIO_LOGADO}                             id:mectrl_currentAccount_primary  
${ID_LOGOFF_SAIR}                                     id:mectrl_body_signOut

#LISTA
${ID_INPUT_CRIAR_UMA_LISTA}                           id:baseAddInput-addList
${BUTTON_TRES_PONTOS_LISTA}                           //button[@class='button loadingButton button toolbarButton more'] 
${SPAN_EXCLUIR_LISTA}                                 //span[contains(text(), 'Excluir lista')]
${SPAN_COR_VERMELHA_EXCLUIR_LISTA}                    //button[@class='button red'] 
${ID_INPUT_ADICIONAR_ITEM_LISTA}                      id:baseAddInput-addTask
${DIV_ARVORE_LISTAS_ESQUERDA}                         //div[@class="sortable-lists"]
${H2_TITULO_ITEM}                                     //h2[@class="listTitle"]
${DIV_NOMES_ITENS}                                    //div[@class="tasks"]
@{MINHA_LISTA_DE_LIVROS}                              UM    DOIS    TRES    QUATRO     CINCO     SEIS     SETE     OITO     NOVE     DEZ


