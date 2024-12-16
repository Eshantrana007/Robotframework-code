*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
html frame
    Select frame  id:content_ifr
    Input Text    xpath=//body[@id='tinymce']    Your desired text here
    Unselect frame
    Current Frame Should Contain     Text(Frame Text To verify)
    Current Frame Should Not Contain    Text(Frame Text To verify)
    Frame should contain    id:content_ifr    Enter text to validate

*** Keywords ***



