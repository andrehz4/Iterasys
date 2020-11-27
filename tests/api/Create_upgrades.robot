*** Settings ***				

Resource    ../../resources/services.robot

Test Setup      Create Session	            FastShop	        ${base_url}

*** Test Cases ***	
Atualizar o endereço do usuario1
                                                     #CPF            #SENHA           #STATUS          #UPDATE      
    Atualizar o endereço do usuario1                 70749717076     12345678             204          #11759062 
















