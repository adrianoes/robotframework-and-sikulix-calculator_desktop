*** Settings ***
Resource           ../resources/base.robot
Suite Setup        start_session
Suite Teardown     end_session

*** Test Cases ***
Multiply Two Random Numbers
    [Documentation]    Multiplica dois números aleatórios entre 0 e 9 usando a calculadora e valida o resultado.
    multiply_two_numbers
    [Teardown]    finish_test
