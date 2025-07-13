*** Settings ***
Resource           ../resources/base.robot
Suite Setup        start_session
Suite Teardown     end_session

*** Test Cases ***
Root One Random Number
    [Documentation]    Calcula a raiz quadrada de um número aleatório entre 0 e 9 usando a calculadora e valida o resultado.
    root_number
    [Teardown]    finish_test
