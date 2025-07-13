*** Settings ***
Resource           ../resources/base.robot
Suite Setup        start_session
Suite Teardown     end_session

*** Test Cases ***
Subtract Two Random Numbers
    [Documentation]    Subtrai dois números aleatórios entre 0 e 9 usando a calculadora e valida o resultado.
    subtract_two_numbers
    [Teardown]    finish_test
