stages:
  - Service Component Test
  - Acceptance Tests Frontend
  - Acceptance Tests Frontend II
  - Acceptance Tests Frontend III
  - Acceptance Tests Mobile

#######################################################################################################################################
####################################### API ###########################################################################################
#######################################################################################################################################

# # API Testes com Docker+Pipeline Create
# Testes Api com Docker+Pipeline Create:
#     stage: Service Component Test
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/api/Create.robot

# # API Testes com Docker+Pipeline Create
# Aumentar o estoque dos produtos com Docker+Pipeline Create:
#     stage: Service Component Test
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome ./tests/api/Estoque.robot

# # API Testes com Docker+Pipeline Wishlist
# Testes Api com Docker+Pipeline Wishlist:
#     stage: Service Component Test
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/api/Wishlist.robot


# # API Testes com Docker+Pipeline Search
# Testes Api com Docker+Pipeline Search:
#     stage: Service Component Test
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/api/Search.robot


# # API Testes com Docker+Pipeline Login
# Testes Api com Docker+Pipeline Login:
#     stage: Service Component Test
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/api/Login.robot


# # API Testes com Docker+Pipeline Items
# Testes Api com Docker+Pipeline Items:
#     stage: Service Component Test
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/api/Items.robot        


# # API Testes com Docker+Pipeline byPartNumber
# Testes Api com Docker+Pipeline byPartNumber:
#     stage: Service Component Test
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/api/byPartNumber.robot 

# # API Testes com Cupons
# Testes Api com Cupons:
#     stage: Service Component Test
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/api/Cupons.robot

#######################################################################################################################################
####################################### NAVEGAÇÃO #####################################################################################
#######################################################################################################################################

# WEB Testes com Docker+Pipeline CADASTRO
Testes Web com Docker+Pipeline CADASTRO:
    stage: Acceptance Tests Frontend
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome ./tests/web/frontend/CADASTRO.robot

        
# WEB Testes com Docker+Pipeline HOME
Testes Web com Docker+Pipeline HOME:
    stage: Acceptance Tests Frontend
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome ./tests/web/frontend/HOME.robot

# # WEB Testes com Docker+Pipeline INSERIR_PRODUTO_CARRINHO
# Testes Web com Docker+Pipeline INSERIR_PRODUTO_CARRINHO:
#     stage: Acceptance Tests Frontend
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/frontend/INSERIR_PRODUTO_CARRINHO.robot

# WEB Testes com Docker+Pipeline LISTA_DE_FAVORITOS
Testes Web com Docker+Pipeline LISTA_DE_FAVORITOS:
    stage: Acceptance Tests Frontend
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome ./tests/web/frontend/LISTA_DE_FAVORITOS.robot

# WEB Testes com Docker+Pipeline LOGIN_PESSOA_FISICA
Testes Web com Docker+Pipeline LOGIN_PESSOA_FISICA:
    stage: Acceptance Tests Frontend
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome ./tests/web/frontend/LOGIN_PESSOA_FISICA.robot

# # WEB Testes com Docker+Pipeline CUPONS
# Testes Web com Docker+Pipeline CUPONS:
#     stage: Acceptance Tests Frontend
#     image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
#     tags:
#         - gitlab-runner-docker01
#     artifacts:
#         when: on_failure 
#         paths:
#             - ./results
#         expire_in: 1 week
#     script:
#         - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/CUPONS.robo        
#######################################################################################################################################
####################################### ADICIONAR AO CARRINHO #########################################################################
#######################################################################################################################################

# WEB - Boleto Testes com Docker+Pipeline ADICIONAR AO CARRINHO
Testes Web - Boleto com Docker+Pipeline ADICIONAR AO CARRINHO:
    stage: Acceptance Tests Frontend II
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/adicionar_ao_carrinho/BOLETO.robot

# WEB - Cartão Testes com Docker+Pipeline ADICIONAR AO CARRINHO
Testes Web - Cartão de Crédito com Docker+Pipeline ADICIONAR AO CARRINHO:
    stage: Acceptance Tests Frontend II
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/adicionar_ao_carrinho/CARTAO_DE_CREDITO.robot

# WEB - Parcelado no Cartão Testes com Docker+Pipeline ADICIONAR AO CARRINHO
Testes Web - Parcelado no Cartão de Crédito com Docker+Pipeline ADICIONAR AO CARRINHO:
    stage: Acceptance Tests Frontend II
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/adicionar_ao_carrinho/PARCELADO_CARTAO_DE_CREDITO.robot

# WEB - Condição Especial no Cartão Testes com Docker+Pipeline ADICIONAR AO CARRINHO
Testes Web - Condição Especial no Cartão de Crédito com Docker+Pipeline ADICIONAR AO CARRINHO:
    stage: Acceptance Tests Frontend II
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/adicionar_ao_carrinho/CONDICAO_ESPECIAL_CARTAO_DE_CREDITO.robot


# WEB - Dois Cartões de Crédito com Docker+Pipeline ADICIONAR AO CARRINHO
Testes Web - Dois Cartões de Crédito com Docker+Pipeline ADICIONAR AO CARRINHO:
    stage: Acceptance Tests Frontend II
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/adicionar_ao_carrinho/DOIS_CARTOES_DE_CREDITO.robot

# WEB - Parcelado Dois Cartões de Crédito com Docker+Pipeline ADICIONAR AO CARRINHO
Testes Web - Parcelado Dois Cartões de Crédito com Docker+Pipeline ADICIONAR AO CARRINHO:
    stage: Acceptance Tests Frontend II
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/adicionar_ao_carrinho/PARCELADO_DOIS_CARTOES_DE_CREDITO.robot


# WEB - Condição especial para Dois Cartões de Crédito com Docker+Pipeline ADICIONAR AO CARRINHO
Testes Web - Condição especial para Dois Cartões de Crédito com Docker+Pipeline ADICIONAR AO CARRINHO:
    stage: Acceptance Tests Frontend II
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/adicionar_ao_carrinho/CONDICAO_ESPECIAL_DOIS_CARTOES_DE_CREDITO.robot

# WEB - Lista de casamento com Docker+Pipeline ADICIONAR AO CARRINHO
Testes Web - Lista de casamento com Docker+Pipeline ADICIONAR AO CARRINHO:
    stage: Acceptance Tests Frontend II
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/adicionar_ao_carrinho/LISTA_DE_CASAMENTO.robot

# WEB - Lista de casamento mais cartão de crédito com Docker+Pipeline ADICIONAR AO CARRINHO
Testes Web - Lista de casamento mais cartão de crédito com Docker+Pipeline ADICIONAR AO CARRINHO:
    stage: Acceptance Tests Frontend II
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/adicionar_ao_carrinho/LISTA_DE_CASAMENTO_MAIS_CARTAO_DE_CREDITO.robot

#######################################################################################################################################
####################################### BOTÃO COMPRAR #################################################################################
#######################################################################################################################################

# WEB - Boleto Testes com Docker+Pipeline BOTÃO COMPRAR
Testes Web - Boleto com Docker+Pipeline BOTÃO COMPRAR:
    stage: Acceptance Tests Frontend III
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/botao_comprar/BOLETO.robot

# WEB - Cartão Testes com Docker+Pipeline BOTÃO COMPRAR
Testes Web - Cartão de Crédito com Docker+Pipeline BOTÃO COMPRAR:
    stage: Acceptance Tests Frontend III
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/botao_comprar/CARTAO_DE_CREDITO.robot

# WEB - Parcelado no Cartão Testes com Docker+Pipeline BOTÃO COMPRAR
Testes Web - Parcelado no Cartão de Crédito com Docker+Pipeline BOTÃO COMPRAR:
    stage: Acceptance Tests Frontend III
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/botao_comprar/PARCELADO_CARTAO_DE_CREDITO.robot

# WEB - Dois Cartões de Crédito com Docker+Pipeline BOTÃO COMPRAR
Testes Web - Dois Cartões de Crédito com Docker+Pipeline BOTÃO COMPRAR:
    stage: Acceptance Tests Frontend III
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/botao_comprar/DOIS_CARTOES_DE_CREDITO.robot

# WEB - Parcelado Dois Cartões de Crédito com Docker+Pipeline BOTÃO COMPRAR
Testes Web - Parcelado Dois Cartões de Crédito com Docker+Pipeline BOTÃO COMPRAR:
    stage: Acceptance Tests Frontend III
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/botao_comprar/PARCELADO_DOIS_CARTOES_DE_CREDITO.robot


# WEB - Lista de casamento com Docker+Pipeline BOTÃO COMPRAR
Testes Web - Lista de casamento com Docker+Pipeline BOTÃO COMPRAR:
    stage: Acceptance Tests Frontend III
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/botao_comprar/LISTA_DE_CASAMENTO.robot

# WEB - Lista de casamento mais cartão com Docker+Pipeline BOTÃO COMPRAR
Testes Web - Lista de casamento mais cartão com Docker+Pipeline BOTÃO COMPRAR:
    stage: Acceptance Tests Frontend III
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/web/pagamentos/botao_comprar/LISTA_DE_CASAMENTO_MAIS_CARTAO_DE_CREDITO.robot


#######################################################################################################################################
####################################### MOBILE ########################################################################################
#######################################################################################################################################

# MOBILE Testes com Docker+Pipeline cadastro
Testes Mobile com Docker+Pipeline cadastro:
    stage: Acceptance Tests Mobile
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/mobile/cadastro.robot


# MOBILE Testes com Docker+Pipeline login
Testes Mobile com Docker+Pipeline login:
    stage: Acceptance Tests Mobile
    image: code.fastshopdev.com:4567/fastshop/qa/dockerfastshopqa:latest
    tags:
        - gitlab-runner-docker01
    artifacts:
        when: on_failure 
        paths:
            - ./results
        expire_in: 1 week
    script:
        - robot -d ./results -v BROWSER:headlesschrome -i COMESTOQUE ./tests/mobile/login.robot