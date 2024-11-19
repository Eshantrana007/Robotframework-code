# Verify  the homepage loads and Funtionality
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}    https://example.co.in
${browser}    Chrome
${text}    Make IT Human
${news_btn}    xpath://a[@href='https://mirchidigital.co.in/news-and-announcement/avaso-partners-with-evertreen-for-global-reforestation'][contains(text(),'Know')]

*** Test Cases ***
TC_01 Verify that the homepage loads successfully and correct title displayed.
    [Documentation]    Homepage loads, and title matches the expected value.
    [Tags]    Functional Testing
    Open Browser    ${URL}    ${browser}
    Maximize browser window
    Homepage loads
# Wait for the page load Indication to be visible
    Wait Until Element Is Visible    xpath://body   20s
# Alternatively, wait for page load completion using JavaScript
  Execute JavaScript    return document.readyState === 'complete'
    title matches the expected value
  End Time

TC_02 Verify visibility of main content.
    [Documentation]    Homepage Verify visibility of main content.
    [Tags]    Functional Testing
    Page should contain    ${text}
    Log to console    ${text}  Should be equal    Make IT Human
  sleep    2s

TC_003 Verify all links in main content work.
    [Documentation]    Verify all links in main content work.
    [Tags]    Functional Testing
    # Free Consultation CTA Button
    Click element    xpath://a[contains(text(),'Free')]
    ${free_Consultation}    Get location
    Log to console    Page Title is:${free_Consultation}
  Sleep    2s
    Go back                 # Go back to homepage
# Learn More CTA Button
    Mouse over    xpath://a[contains(text(),'Learn')]               # hover on banner learn more cta button
  Execute javascript    window.scrollTo(0,900)
  Sleep    2s
# About us Section Explore MOre Button
    Wait until element is visible    xpath://a[contains(text(),'Learn')]    timeout=10s
    Mouse over    xpath://a[@class='btn custom-btn btn1 btn3 aos-init aos-animate']
  Sleep    2s

TC_04 Verify the Homepage What we Do Section Slider Behavior.
   [Documentation]    Homepage What we Do Section Slider Behavior.
   [Tags]    Functional Testing
  Execute javascript    window.scrollTo(0,1800)    #scroll down
    Sleep    2s
    Click element    xpath://span[normalize-space()='Accept all']    # Accept Cookies
    Wait until element is visible    xpath://i[contains(@class,'fa-solid fa-circle-chevron-right')]    timeout=10s
    Click element    xpath://i[contains(@class,'fa-solid fa-circle-chevron-right')]
    Click element    xpath://i[contains(@class,'fa-solid fa-circle-chevron-right')]
    Click element    xpath://i[contains(@class,'fa-solid fa-circle-chevron-right')]
    Click element    xpath://i[@class='fa-solid fa-circle-chevron-left']
    Click element    xpath://i[@class='fa-solid fa-circle-chevron-left']
    Wait until element is visible    xpath://a[contains(@class,'card-heading')][contains(text(),'Strategic')]    timeout=10s
    Click element    xpath://a[contains(@class,'card-heading')][contains(text(),'Strategic')]
    ${page_url}    Get location
    Log to console    ${page_url}
    Go back
TC_05 Verify the Homepage Case study Section Functionality.
   [Documentation]    Homepage Case study Section Functionality.
   [Tags]    Functional Testing
   Sleep    2s
    Execute javascript    window.scrollTo(0,2400)
    Wait until element is visible    xpath://a[@href='/case-study/ai-powered-customer-service']     timeout=10s
    Click element    xpath://a[@href='/case-study/ai-powered-customer-service']
    ${case-study_url}    Get location
    Log to console   ${case-study_url}
    Wait For Condition	return document.readyState == "complete"
    Go back

TC_06 Ensure all links in the News & Announcements Section work correctly.
    Sleep    2s
    Execute javascript    window.scrollTo(0,4500)
    Sleep    2s
    Click element   ${news_btn}
    ${news_page}    Get location
    Log to console   ${news_page}
    Wait For Condition	return document.readyState == "complete"
    Go back
    sleep    5s
    Close browser


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


