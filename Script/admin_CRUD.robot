*** Settings ***
Library    SeleniumLibrary
Library       DatabaseLibrary

*** Variables ***
${BASE_URL}    https://mirchidigital.co.in/login
${browser}    chrome
${FULL_NAME}   Rohit
${EMAIL}       eshantranaxyz@gmail.com
${PHONE}       7019987500
${file}    xpath://input[@id='attachment']
${UPDATED_NAME}     Eshant Rana
${UPDATED_PHONE}        8894004036
${delete_btn}    xpath://a[@aria-label='Delete']

*** Test Cases ***
Tc_01 Open Browser and login check page load
    Open browser   ${BASE_URL}    ${browser}
    Maximize browser window
    Input text    name:email    super@admin.com
    Input password    name:password    secret
    Click element    xpath://button[normalize-space()='Log in']
   #    check page load Complete
    Execute JavaScript    return document.readyState === 'complete'

TC_02 Verify Empty Table
    [Documentation]    Verify the table displays the "No data available in table" message when empty.
    Mouse down    xpath://html[1]/body[1]/div[1]/ul[1]/div[1]/div[2]/div[1]/div[1]/div[1]/li[8]/a[1]
    Mouse up    xpath://html[1]/body[1]/div[1]/ul[1]/div[1]/div[2]/div[1]/div[1]/div[1]/li[8]/a[1]
    Wait Until Page Contains Element    xpath=//table//td[contains(text(), 'No data available in table')]
    Capture Page Screenshot

TC_03 Add New Entry
    [Documentation]    Test adding a new entry to the table.
    Click element    xpath://i[@class='fas fa-plus-circle']
    Input Text    id=name    ${FULL_NAME}
    Input Text    id=email        ${EMAIL}
    Input Text    id=phone_number        ${PHONE}
    Input Text    xpath://div[@role='textbox']     At AVASO Tech, we simplify complex technology to drive your
    Choose file    ${file}    /Users/eshant/Downloads/unnamed.jpg   # Chose File And Give path
    Select From List By Index    preferred_contact    1
    Select From List By Index     status     1
    Execute javascript    window.scrollTo(0,900)
    Sleep    3s
    Click element    xpath://button[normalize-space()='Create']
    Page should contain    New 'Contact' Added

TC_04 Search for Entry
    [Documentation]     Test the search functionality by searching for an added entry.
    Sleep    1s
    Input Text      xpath://input[@type='search']    ${FULL_NAME}
    Wait Until Page Contains Element 	xpath=//table//td[contains(text(), '${FULL_NAME}')]


TC_05 Update Entry
    [Documentation]  Test editing an existing entry in the table.
    sleep    2s
    Click element    xpath://a[@title='Edit Contact']
    Input Text      id:name    ${UPDATED_NAME}
    Input Text      id=phone_number      ${UPDATED_PHONE}
    Execute javascript    window.scrollTo(0,900)
    Sleep    2s
    Click element    xpath://button[contains(text(), 'Save')]
    Wait Until Page Contains Element        xpath://table//td[contains(text(), '${UPDATED_NAME}')]

TC_06 Delete Entry
    [Documentation]    Test deleting an entry from the table.
    Click element    xpath://a[@title='Edit Contact']
    Execute javascript    window.scrollTo(0,900)
    Sleep    2s
    Wait until element is visible    ${delete_btn}
    Click element    ${delete_btn}
    Wait Until Page Does Not Contain Element 	xpath=//table//td[contains(text(), '${UPDATED_NAME}')]
    Sleep      2s
    Close Browser



