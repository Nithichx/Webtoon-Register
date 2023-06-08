*** Setting ***
Library             SeleniumLibrary
Library             String
Suite Setup         Log  tester
Test Setup          Log  Start
Suite Teardown      Log  Last
Test Teardown       Log  Testlast


*** Variables ***
${locator_Member_Click}             id=btnLogin
${locator_Click_Register}           id=btnSignUp
${locator_Register_Email}           id=email
${locator_Register_Pass}            id=pw
${locator_Register_Repass}          id=retype_pw
${locator_Register_NickName}        id=nickname
${locator_register_css}             css=#content > div > div.inner_wrap > div > a
${locator_confirm_xpath}            xpath=//*[@id="wrap"]/div[5]/div[2]/div/div/h2
${locator_register_confirm_xpath}   xpath=//*[@id="wrap"]/div[5]/div[2]/div/div/a


*** keywords ***
Open webtoons website
	    Set Selenium Speed      0.5s
        Open Browser    https://www.webtoons.com/en/     Chrome      options=add_experimental_option("detach", True)
        Maximize Browser Window

Click Member
	   Click Element 	${locator_Member_Click}


Click Register
        Click Element   ${locator_Click_Register}

Register email
        Wait Until Element Is Visible       ${locator_Register_Email}    10s

Random Number
       ${random_number}     Generate Random String      3    0123456789
       Input text           ${locator_Register_Email}        Tester${random_number}@thaimail.com

Register Pass
        Input text          ${locator_Register_Pass}         20May1234

Register Repass
        Input text          ${locator_Register_Repass}       20May1234

Register Name
        ${random_name}      Generate Random String    5   Lower
        ${random_number_n}  Generate Random String    3   012345
        Input text          ${locator_Register_NickName}     ${random_name}${random_number_n}

Click Register Button

        Click Element       ${locator_register_css}


Verify error message correctly
        Wait Until Element Is Visible      ${locator_confirm_xpath}    10s
        ${txt}=     Get text               ${locator_confirm_xpath}
        Should Be Equal                    ${txt}         Send Confirmation Email

Click Confirm
        Click Element    ${locator_register_confirm_xpath}
        Close Browser


*** Test Cases ***
Test open
    [Documentation]    To verify that you can apply for membership until the confirmation process.

    [Tags]      Test on SIT

	Open webtoons website
	Click Member
    Click Register
    Register email
    Random Number
    Register Pass
    Register Repass
    Register Name
    Click Register Button
    Verify error message correctly
    Click Confirm

