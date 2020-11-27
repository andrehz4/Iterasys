*** Settings ***
Resource    base.robot
*** Keywords ***
### Helpers
Convert To Json
    [Arguments]     ${target}

    ${result}=      evaluate        json.loads($target)     json
    [return]        ${result}

### Cadastro 
Criação de massa
Exemplos relacionados a pessoa
  ${NOMEFAKE}                 FakerLibrary.Name
  ${ENDERECOFAKE}             FakerLibrary.Address
  ${TELEFONEFAKE}             FakerLibrary.Phone Number
  ${CPF}                      FakerLibrary.cpf
  ${CIDADEFAKE}               FakerLibrary.City
  ${TRABALHOFAKE}             FakerLibrary.Job
  @{PESSOA}                   Create List    Nome Aleatório: ${NOMEFAKE}  Endereço Aleatório: ${ENDERECOFAKE}
  ...                         Telefone Aleatório: ${TELEFONEFAKE}  Cidade Aleatória: ${CIDADEFAKE}
  ...                         Cpf: ${CPF}   Trabalho: ${TRABALHOFAKE}
  Log Many    @{PESSOA}

Datas
  ${DATAFAKE}                 FakerLibrary.Date
  ${MESFAKE}                  FakerLibrary.Month
  ${ANOFAKE}                  FakerLibrary.Year
  ${DIADASEMANAFAKE}          FakerLibrary.Day Of Week
  ${DIADOMESFAKE}             FakerLibrary.Day Of Month
  @{DATAS}                    Create List    Data Aleatória: ${DATAFAKE}  Mês Aleatório: ${MESFAKE}  Ano Aleatório: ${ANOFAKE}
  ...                         Dia da Semana Aleatório: ${DIADASEMANAFAKE}   Dia do Mês Aleatório: ${DIADOMESFAKE}
  Log Many    @{DATAS}

Diversos
  ${EMAILFAKE}                FakerLibrary.Email
  ${PASSWORDFAKE}             FakerLibrary.Password
  ${CORFAKE}                  FakerLibrary.Color Name
  ${CARTAODECREDITOFAKE}      FakerLibrary.Credit Card Number
  ${PALAVRAFAKE}              FakerLibrary.Word
  @{OUTROS}                   Create List    E-mail Aleatório: ${EMAILFAKE}   Senha Aleatória: ${PASSWORDFAKE}
  ...                         Cor Aleatório: ${CORFAKE}   Cartão de Crédito Aleatório: ${CARTAODECREDITOFAKE}
  ...                         Palavra Aleatória: ${PALAVRAFAKE}
  Log Many    @{OUTROS}
