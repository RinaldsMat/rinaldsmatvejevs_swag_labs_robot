*** Settings ***
Library    SeleniumLibrary


*** variables ***
${Browser}  chrome
${URL}      file:///C:\C O L L E G E\FINLAND SEMESTER Y2S2\SOFTWARE TESTING - FINLAND\ROBOT TEST\swag_labs (1).html
${SCREENSHOT_DIR}     ./results/screenshot/



*** Test Cases ***

InputTest
    Open Browser    file:///C:/C%20O%20L%20L%20E%20G%20E/FINLAND%20SEMESTER%20Y2S2/SOFTWARE%20TESTING%20-%20FINLAND/ROBOT%20TEST/swag_labs%20(1).html    browser=chrome
    Capture Page Screenshot    ${SCREENSHOT_DIR}landing_page_test.png

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
