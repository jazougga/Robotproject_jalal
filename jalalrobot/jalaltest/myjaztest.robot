*** Settings ***
Library    Telnet
Library    Collections
Library    XML
Library    SeleniumLibrary

*** Variables ***
${url}  https://opensource-demo.orangehrmlive.com/
${Browser}     firefox
${CREDENTIALS}  [jallal]  [Eve03-03]
#@{recherche}    test1    test2    test3
*** Test Cases ***
mon cahier de test .
    Ouvrir le browser
    Enter Data
    #Close Browser
    log  test completed
    log  this test is runned by %{username} on %{os}
  


*** Keywords ***
Ouvrir le browser
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
Enter Data
    #Click Button    id=openClientSpace
    Input Text    name=txtUsername    admin
    Input Password    name=txtPassword    admin123
    Click Button    name=Submit
    Click Element    xpath=//*[@id="menu_pim_viewPimModule"]/b  
    Wait Until Page Contains Element    xpath=//*[@id="footer"]    OrangeHRM 4.8      
    Input Text    id=empsearch_employee_name_empName    Sara Tencrady
    Click Button    id=searchBtn   
    @{search}=    Get WebElements    xpath=//*[@id="search-results"]/div    
    Should Not Be Empty    &{search}    





     