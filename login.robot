*** Settings ***
Library                     SeleniumLibrary
Test Setup                  Open Browser            ${base_url}             ${browser_type}
Test Teardown               Close Browser

*** Variables ***
${base_url}             https://pub-eish-dev.keponet.com/frontend/login
${browser_type}         Chrome
${email_user}           jenareishsatu@yopmail.com
${password_user}        12345678

*** Test Cases ***
I am Login Menu with Valid Email and Valid Password

     Maximize Browser Window
     Input Text                         //input[@id="email"]                    jenareishsatu@yopmail.com
     Input Text                         //input[@id="password"]                 12345678
     Click Element                      //img[@src="https://pub-eish-dev.keponet.com/img/visibility.svg"]
     Click Element                      //button[@type="submit"]
     Element Should Be Visible          //img[@id="menu-logo"]

I am Login Menu with Valid Email and Invalid Password

     Maximize Browser Window
     Input Text                         //input[@id="email"]                    jenareishsatu@yopmail.com
     Input Text                         //input[@id="password"]                 123456asdva
     Click Element                      //img[@src="https://pub-eish-dev.keponet.com/img/visibility.svg"]
     Click Element                      //button[@type="submit"]
     Element Text Should Be             //div[@class="alert alert-danger text-danger"]                          Email yang dimasukkan atau password salah, silahkan cek input anda.        
     

I am Login Menu with Invalid Email and Valid Password

     Maximize Browser Window
     Input Text                         //input[@id="email"]                    jenaru@yopmail.com
     Input Text                         //input[@id="password"]                 12345678
     Click Element                      //img[@src="https://pub-eish-dev.keponet.com/img/visibility.svg"]
     Click Element                      //button[@type="submit"]
     Element Should Be Visible          //input[@id="email"]

I am Login Menu with Invalid Email and Invalid Password

     Maximize Browser Window
     Input Text                         //input[@id="email"]                    jenaru@yopmail
     Input Text                         //input[@id="password"]                 123456
     Click Element                      //img[@src="https://pub-eish-dev.keponet.com/img/visibility.svg"]
     Click Element                      //button[@type="submit"]
     Element Should Be Visible          //input[@id="email"]
     Element Should Be Visible          //input[@id="password"]

I am Login Menu with Empty Email and Empty Password

     Maximize Browser Window
     Clear Element Text                  //input[@id="email"]
     Clear Element Text                  //input[@id="password"]
     Click Element                       //img[@src="https://pub-eish-dev.keponet.com/img/visibility.svg"]
     Click Element                       //button[@type="submit"]
     Element Should Be Visible           //input[@id="email"]

I am Login with Menu Forget Password for email not registered

     Maximize Browser Window
     Click Element                      //p[@id="forgot-password-container"]                
     Input Text                         //input[@id="email"]                    cobaemailnotregister@aaaa.com
     Click Element                      //button[@type="submit"]
     Element Text Should Be             //span[@class="invalid-feedback"]       The selected email is invalid.
    

I am Login with Menu Forget Password for Invalid email

     Maximize Browser Window
     Click Element                      //p[@id="forgot-password-container"]
     Input Text                         //input[@id="email"]                    cobainvalid@email
     Click Element                      //button[@type="submit"]
     Element Text Should Be             //span[@class="invalid-feedback"]       The email must be a valid email address.