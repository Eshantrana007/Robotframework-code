*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
html frame
    Select frame  id:content_ifr  # Select Iframe id
    Input Text    xpath=//body[@id='tinymce']    Enter your text  # Input Text with HTML Body id locators(The <body> tag usually represents the main content section of a webpage.).
    Unselect frame
    Current Frame Should Contain     Text(Frame Text To verify)
    Current Frame Should Not Contain    Text(Frame Text To verify)
    Frame should contain    id:content_ifr    Enter text to validate

*** Keywords ***



