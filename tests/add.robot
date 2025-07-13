*** Settings ***
Resource           ../resources/base.robot
Suite Setup        start_session
Suite Teardown     end_session

*** Test Cases ***
Add Two Random Numbers
    [Documentation]    Soma dois números aleatórios entre 0 e 9 usando a calculadora e valida o resultado.
    add_two_numbers
    [Teardown]    finish_test
