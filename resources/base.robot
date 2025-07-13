*** Settings ***
Library           SikuliLibrary    mode=NEW
Library           OperatingSystem
Library           String
Library           Collections
Library           Process
Library           BuiltIn
Library           FakerLibrary

*** Variables ***
${SIKULI_JAR}     ${EXECDIR}/sikulixide-2.0.5.jar

*** Keywords ***

load_images
    Add Image Path    ${EXECDIR}/resources/elements

start_session
    Start Sikuli Process
    Sleep    2s
    load_images
    Click    icon.png

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
    Sleep    0.5

_press_operator
    [Arguments]    ${operator}
    Click    ${operator}.png
    Sleep    0.5

_copy_result_to_variable
    Right Click   resultarea.png
    Click    copybutton.png
    Sleep    0.5
    ${clip}=    Evaluate    __import__('pyperclip').paste()
    ${clip}=    Replace String    ${clip}    ,    .    # Converte vírgula decimal para ponto
    Log    Clipboard contains: "${clip}"
    [Return]    ${clip}

_convert_to_number
    [Arguments]    ${value}
    ${value}=    Replace String    ${value}    ,    .
    ${float_value}=    Evaluate    float(${value})
    ${int_result}=    Run Keyword And Ignore Error    Evaluate    int(${float_value})
    Run Keyword If    '${int_result}[0]' == 'PASS' and ${float_value} == ${int_result}[1]    Return From Keyword    ${int_result}[1]
    [Return]    ${float_value}

_compare_numbers
    [Arguments]    ${result1}    ${result2}
    ${num1}=    _convert_to_number    ${result1}
    ${num2}=    _convert_to_number    ${result2}
    Should Be Equal    ${num1}    ${num2}

_validate_result
    [Arguments]    ${calc_result}    ${result_robot}
    _compare_numbers    ${calc_result}    ${result_robot}

add_two_numbers
    choose_numbers
    _press_number    ${a}
    _press_operator  add
    _press_number    ${b}
    _press_operator  equal
    ${result_calc}=  _copy_result_to_variable
    ${result_robot}=    Evaluate    str(${a} + ${b})
    _validate_result    ${result_calc}    ${result_robot}

subtract_two_numbers
    choose_numbers
    _press_number    ${a}
    _press_operator  subt
    _press_number    ${b}
    _press_operator  equal
    ${result_calc}=  _copy_result_to_variable
    ${result_robot}=    Evaluate    str(${a} - ${b})
    _validate_result    ${result_calc}    ${result_robot}

multiply_two_numbers
    choose_numbers
    _press_number    ${a}
    _press_operator  mult
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
