*** Settings ***
Resource           ../resources/base.robot
Suite Setup        start_session
Suite Teardown     end_session

*** Test Cases ***
Square One Random Number
    [Documentation]    Eleva ao quadrado um número aleatório entre 0 e 9 usando a calculadora e valida o resultado.
    square_number
    [Teardown]    finish_test
