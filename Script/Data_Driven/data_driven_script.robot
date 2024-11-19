*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/resources.robot
Suite Setup    Open my browser
Suite Teardown    Close Browser
Test Template    Invalid Login


*** Test Cases ***                      Username                    Password
Right Username and Right Password       super@admin.com             secret
Wrong Username and Right Password       super123@gmail.com          secret
Right Username and wrong Password       super@admin.com             Password@123
Right Username and Empty Password       super@admin.com             ${EMPTY}
Empty Username and Right Password       ${EMPTY}                    secret
Empty Username and Empty Password       ${EMPTY}                    ${EMPTY}

*** Keywords ***
Invalid Login
    [Arguments]   ${username}       ${Password}
    Input username    ${username}
    Input Password      ${Password}
    Click login Button
    Dashboard Page Should Be Visible
    Click logout Button
    Error Message should be Visible



