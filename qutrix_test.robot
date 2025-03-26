* Settings *
Library           SeleniumLibrary
Suite Setup       Open Browser To Qutrix
Suite Teardown    Close Browser

* Variables *
${URL}            https://qutrix.io
${BROWSER}        Chrome
${CAREER_MENU}    xpath://a[text()='Company']
${CAREER_OPTION}  xpath://a[text()='Explore Career']
# This locator is more flexible if there's extra spacing or slightly different text
${CLICK_HERE_BUTTON}  xpath://a[contains(normalize-space(.), 'Click here')]
${SCREENSHOT}     qutrix_self_assessment.png

* Test Cases *
Capture Qutrix Self-Assessment Page
    Navigate To Career Section
    Scroll And Click Self Assessment
    Capture Screenshot

* Keywords *
Open Browser To Qutrix
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Navigate To Career Section
    Click Element    ${CAREER_MENU}
    Click Element    ${CAREER_OPTION}
    # Wait until the button is found on the page
    Wait Until Page Contains Element    ${CLICK_HERE_BUTTON}    10s

Scroll And Click Self Assessment
    # Scroll to the bottom of the page
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2
    # Make sure the button is visible and enabled
    Wait Until Element Is Visible    ${CLICK_HERE_BUTTON}    10s
    Wait Until Element Is Enabled    ${CLICK_HERE_BUTTON}    10s
    # Click the button
    Click Element    ${CLICK_HERE_BUTTON}
    Sleep    2
    # If a new tab/window opens, switch to it
    Switch Window    NEW

Capture Screenshot
    # Capture screenshot of the new page
    Capture Page Screenshot    ${SCREENSHOT}