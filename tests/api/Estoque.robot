*** Settings ***				

Resource    ../../resources/services.robot

Test Setup      Create Session	            FastShop	        http://172.30.40.56:6800

*** Test Cases ***	
Aumentar o estoque dos produtos   
     Aumentar estoque dos produtos Fastshop                      93170258621    12345678        3T2003894VRM2
    
