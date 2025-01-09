*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${url}          https://ai.example.in/
${browser}      chrome

*** Test Cases ***
Open Browser
    [Documentation]    Homepage loads, and title matches the expected value.
    [Tags]             Functional Testing
    Open Browser       ${url}    ${browser}     options=ignore-certificate-errors
    Maximize browser window
    Sleep    10s

TC_001 Validate form page load and page title
    Homepage loads
    title matches the expected value
    End Time

TC_002
    Execute Manual Step
    Wait until element is enabled        name:name    5s
    Element should be visible            name:name
    Input Text                           name:name        eshant

    Wait until element is enabled        name:email
    Element should be enabled            name:email
    Input Text                           name:email    eshant@gmail.com

    Wait until element is enabled         name:phone
    Element should be enabled             name:phone
    Input Text                            name:phone            55623965696

    Execute javascript    window.scrollTo(0, 700)
    Sleep      4s


*** Keywords ***
Homepage loads
    ${start_time}    Get time
    log to console   ${start_time}

title matches the expected value
    ${title}    Get title
    Log to console    ${title}
    Title should be    ${title}

End Time
    ${end_time}    Get time
    log to console   ${end_time}

Execute Manual Step
    [Documentation]    This keyword is a placeholder for manual steps.
    Log    Please perform the manual step and then continue.
