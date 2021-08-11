*** Settings ***
Library           String
Library           SeleniumLibrary
Library           RPA.Email.ImapSmtp       smtp_server=smtp.gmail.com     smtp_port=587


*** Variables ***
${URL}                    https://developer.clashroyale.com/#/register
${BROWSER}                Chrome
${NAME}                   Yasmin Tiezzi
${CAMPO_NAME}             id=name
${E-MAIL}                 robot.tiezzi@gmail.com
${CAMPO_EMAIL}            id=email
${BUTTON_SUBMIT}          class=ladda-label
${GMAIL_PASSWORD}         Yas1612! 

*** Test Cases ***
Cenario1
    Dado que eu esteja no site
    E digito meus dados
    E clico no botão enviar

Cenario2
    Verificar e-mail de confirmação

*** Keywords ***
Dado que eu esteja no site
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

E digito meus dados 
    Input Text       ${CAMPO_NAME}      ${NAME}
    Input Text       ${CAMPO_EMAIL}     ${E-MAIL}
    
E clico no botão enviar
    Click Element    ${BUTTON_SUBMIT}

Verificar e-mail de confirmação
    [Documentation]     
    Authorize      ${E-MAIL}       ${GMAIL_PASSWORD}
    @{email}     List Messages    SUBJECT "Welcome to the Clash Royale API"
    ${email_body}      Set Variable      ${email}[0][Body]
    ${email_body}      Convert To String     ${email_body}
    ${Links}    Get regexp matches    ${email_body} 
    Log To Console     ${Links}    

Fazer o login
    [Documentation]  
    Go to  ${URL}/login
    Input Text     ${E-MAIL}   ${GMAIL_PASSWORD}
    Click Element     
    sleep    5s


