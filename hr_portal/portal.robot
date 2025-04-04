*** Settings ***
Library    SeleniumLibrary
Library    Browser

*** Variables ***
${URl}    https://hr.pulseplaydigital.com/login
${email}    superadmin@hr.com
${Pwd}    superadmin


*** Test Cases ***
TC_001 - Login into Dashboard
    Open browser    ${URL}    Chrome
    Maximize browser window
    Log in
    Page should contain    Dashboard
    ${title}    Get title
    Log to console     Page Title is :${title}
    Homepage loads
    End Time
    Sleep    5s

TC_002 -Leaves - Open 'Employees Leaves' menu and check elements



*** Keywords ***
Log in
    Wait until element is visible    id:data.email
    Input text        id:data.email    ${email}
    Wait until element is visible     id:data.password
    Input password    id:data.password    ${Pwd}
    Click button     xpath://*[@id="form"]/div[2]/div/button
    sleep    5

Homepage loads
    ${start_time}    Get time
    log to console   ${start_time}

End Time
    ${end_time}    Get time
    log to console   ${end_time}
