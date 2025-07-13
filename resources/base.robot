*** Settings ***
Library           SikuliLibrary
Library           OperatingSystem
Library           String
Library           Collections
Library           Process
Library           BuiltIn
Library           FakerLibrary

*** Variables ***


*** Keywords ***

load_images
    Add Image Path    ${EXECDIR}\\resources\\elements

start_session
    Run Process    calc.exe
    Sleep    3s
    load_images
    # Click    icon.png


end_session
    Stop Remote Server

finish_test
    Capture Screen
    Close Application    Calculadora

choose_numbers
    ${a}=    FakerLibrary.Random Int   0    9
    ${b}=    FakerLibrary.Random Int   0    9
    Set Test Variable    ${a}
    Set Test Variable    ${b}

_press_number
    [Arguments]    ${num}
    Click    ${num}.png

_press_operator
    [Arguments]    ${operator}
    Click    ${operator}.png

_copy_result_to_variable
    Key Down    Ctrl
    Press Special Key    c
    Key Up      Ctrl
    Sleep    0.5
    ${clip}=    Evaluate    sys.modules['pyperclip'].paste()
    RETURN    ${clip}

_validate_result
    [Arguments]    ${calc_result}    ${expected_result}
    Should Be Equal As Strings    ${calc_result}    ${expected_result}

add_two_numbers
    choose_numbers
    _press_number    ${a}
    _press_operator  +
    _press_number    ${b}
    _press_operator  equal
    ${result_calc}=  _copy_result_to_variable
    ${result_robot}=    Evaluate    str(${a} + ${b})
    _validate_result    ${result_calc}    ${result_robot}

subtract_two_numbers
    choose_numbers
    _press_number    ${a}
    _press_operator  -
    _press_number    ${b}
    _press_operator  equal
    ${result_calc}=  _copy_result_to_variable
    ${result_robot}=    Evaluate    str(${a} - ${b})
    _validate_result    ${result_calc}    ${result_robot}

multiply_two_numbers
    choose_numbers
    _press_number    ${a}
    _press_operator  x
    _press_number    ${b}
    _press_operator  equal
    ${result_calc}=  _copy_result_to_variable
    ${result_robot}=    Evaluate    str(${a} * ${b})
    _validate_result    ${result_calc}    ${result_robot}

divide_two_numbers
    choose_numbers
    Run Keyword If    '${b}' == '0'    Set Test Variable    ${b}    1
    _press_number    ${a}
    _press_operator  div
    _press_number    ${b}
    _press_operator  equal
    ${result_calc}=  _copy_result_to_variable
    ${result_robot}=    Evaluate    str(round(${a} / ${b}, 10))
    _validate_result    ${result_calc}    ${result_robot}

square_number
    choose_numbers
    _press_number    ${a}
    _press_operator  x2
    _press_operator  equal
    ${result_calc}=  _copy_result_to_variable
    ${result_robot}=    Evaluate    str(${a} ** 2)
    _validate_result    ${result_calc}    ${result_robot}

root_number
    choose_numbers
    _press_number    ${a}
    _press_operator  x2divx
    _press_operator  equal
    ${result_calc}=  _copy_result_to_variable
    ${result_robot}=    Evaluate    str(round(${a} ** 0.5, 10))
    _validate_result    ${result_calc}    ${result_robot}
