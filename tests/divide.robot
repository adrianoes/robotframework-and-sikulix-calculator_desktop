*** Settings ***
Resource           ../resources/base.robot
Suite Setup        start_session
Suite Teardown     end_session

*** Test Cases ***
Divide Two Random Numbers
    [Documentation]    Divide dois números aleatórios entre 1 e 9 (evitando zero) usando a calculadora e valida o resultado.
    divide_two_numbers
    [Teardown]    finish_test
