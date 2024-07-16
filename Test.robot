*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections

*** Variables ***
${URL}     https://www.indiamobilecongress.com/aspire


*** Test Cases ***
Check For Broken Images
    [Documentation]    This test case checks all images on the web page for broken links.
    Open Browser    ${URL}    Chrome
    ${images}=    Get WebElements    xpath://img
    ${total_images}=    Get Length    ${images}
    ${broken_images}=    Create List
    FOR    ${image}    IN    @{images}
        ${src}=    Get Element Attribute    ${image}    src
        ${is_image}=    is_actual_image    ${src}
        Run Keyword If    ${is_image}    Check And Append Broken Image    ${src}    ${broken_images}
    END
    ${broken_image_count}=    Get Length    ${broken_images}
    Log to console    Total Images: ${total_images}
    Log to console    Broken Images: ${broken_image_count}
    Run Keyword If    ${broken_image_count} > 0    Fail    Broken images found: ${broken_image_count}\n${broken_images}
    Log to console    No broken images found.
    [Teardown]    Close Browser

*** Keywords ***
Get Request Status Code
    [Arguments]    ${url}
    ${response}=    Get    ${url}
    ${status_code}=    Convert To Integer    ${response.status_code}
    RETURN    ${status_code}

is_actual_image
    [Arguments]    ${url}
    ${result}=    Run Keyword And Return Status    Should Match Regexp    ${url}    ^.*\.(jpg|jpeg|png|gif)$
    RETURN    ${result}

Check And Append Broken Image
    [Arguments]    ${src}    ${broken_images}
    ${status_code}=    Get Request Status Code    ${src}
    Run Keyword If    ${status_code} != 200    Append To List    ${broken_images}    ${src}
