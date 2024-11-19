*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://mirchidigital.co.in/login
${browser}    chrome

*** Keywords ***
Open my browser
    Open browser    ${url}    ${browser}
    Maximize browser window

Close Browser
    Close all browsers

Open login page
    go to    ${url}

Input username
    [Arguments]    ${username}
    Input text   id:email     ${username}

Input Password
    [Arguments]    ${Password}
    Input text  id:password   ${Password}

Click login Button
    Click element     xpath://button[normalize-space()='Log in']

Click logout Button
    Click element     xpath://a[@href='https://mirchidigital.co.in/logout']

Error Message should be Visible
    Page should contain    Whoops! Something went wrong.

Dashboard Page Should Be Visible
    Page should contain      Dashboard
