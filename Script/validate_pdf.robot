*** Settings ***
Library    SeleniumLibrary
Documentation    Download and Validate PDF

*** Variables ***

${url}    https://www.indiamobilecongress.com/exhibitor   # Open Website
${browser}    safari
${expected_pdf_text}    Exhibit_Directory_2022 (for web).cdr    # Text you want to validate

*** Test Cases ***
Open Browser
    [Documentation]   Download and Validate PDF
    [Tags]    Functional Testing
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

# Verify Page Text
    Page should contain      Exhibitor Directory
    ${text} =    Get Text    xpath://h1
    log    ${text}


# Validate Form to Download Pdf
    Element Should Be Visible       xpath://input[@name='name']
    Execute javascript    window.scrollTo(0 , 600)
    Sleep   2s
    Input text     xpath://input[@name='name']      Eshant Rana         # Fill Form and Click Sumbit Button
    Input text    xpath://input[@name='email']      eshantrana00234@gmail.com
    Input text    xpath://input[@name='mobile_number']      7018387500
    Input text    xpath://input[@name='organisation_name']     PulsePlay Digital
    Select From List By Index    year    0
    Select From List By Index    type    0
    Click button    xpath://button[normalize-space()='Submit']
    sleep    10s

 # Wait for PDF Viewer to be Present
    ${url}   Get location
    Log to console    Page Url is:${url}




