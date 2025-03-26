*** Settings ***
Library    SeleniumLibrary


*** variables ***
${Browser}  chrome
${URL}      https://rinaldsmat.github.io/rinaldsmatvejevs_swag_labs_robot/swag_labs.html
${SCREENSHOT_DIR}     ./results/screenshot/



*** Test Cases ***

InputTest
    #Open Browser    ${URL}    browser=${Browser}
    #Capture Page Screenshot    ${SCREENSHOT_DIR}landing_page_test.png

    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-logging--disable-logging

    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}


    Input text    id=username   standard_user
    Input text    id=password   secret_sauce
    Click element    id=login-button
    Wait until element is visible    id=products-grid
    Capture page screenshot    ${SCREENSHOT_DIR}login.png

    Click Button  xpath=//button[@onclick="addToCart(1)"]
    Click Button  xpath=//button[@onclick="addToCart(2)"]
    Click Button  xpath=//button[@onclick="addToCart(3)"]
    Click Button  xpath=//button[@onclick="addToCart(4)"]
    Sleep    1
    Capture page screenshot    ${SCREENSHOT_DIR}shopping_test.png

    Click element    css=.cart-icon
    Input text    id=first-name     Rinalds
    Input text    id=last-name      Mattress
    Input text    id=postal-code    50100
    Sleep    1
    Click button  xpath=//button[@onclick="completeCheckout()"]
    Wait until element is visible    id=confirmation-message
    Capture page screenshot    ${SCREENSHOT_DIR}purchase_complete_test.png


    Close browser



*** Keywords ***
