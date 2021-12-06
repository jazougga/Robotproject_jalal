*** Settings ***
Library    Telnet
Library    Collections
Library    XML
Library    SeleniumLibrary

*** Variables ***
${url}  https://opensource-demo.orangehrmlive.com/
${Browser1}    firefox
${Browser2}    chrome
# use Xpath with firefox
${CREDENTIALS}  [jallal]  [Eve03-03]
#@{recherche}    test1    test2    test3
*** Test Cases ***
mon cahier de test .
    Ouvrir le browser
    Enter Data
    Recherche employe
    #Close Browser
    log  test completed
    log  this test is runned by %{username} on %{os}
  
*** Keywords ***
Ouvrir le browser
    Open Browser  ${URL}  ${Browser1}
    Maximize Browser Window
Enter Data
    #Click Button    id=openClientSpace
    Input Text    name=txtUsername    admin
    Input Password    name=txtPassword    admin123
    Click Button    name=Submit
    Wait Until Page Contains  Pending Leave Requests
    Click Element    xpath=/html/body/div[1]/div[2]/ul/li[2]/a/b
    Wait Until Page Contains    Employment Status  
Recherche employe
    Input Text    xpath=//*[@id="empsearch_id"]    0103      
    Click Button    id=searchBtn   
    #@{search}=    Get WebElements    xpath=//*[@id="search-results"]/div    
    #Should Not Be Empty    &{search}    





     