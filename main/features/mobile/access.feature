Feature: Access testing
    Scenario: put correct access code and enter 
        I visit "localhost:8100/#/university"
        I set the window size to 800 by 400
        Fill in input "#access-code-bar" with "cool",and enter
        a list of "#school-list li" are shown

    Scenario: put with correct access code and click redeem button
        I visit "localhost:8100/#/university"
        I set the window size to 800 by 400
        Fill in input "#access-code-bar" with "cool",and click Redeem btn
        a list of "#school-list li" are shown

    Scenario: put with incorrect access code and enter
        I visit "localhost:8100/#/university"
        I set the window size to 800 by 400
        Fill in input "#access-code-bar" with "ahhaha",and enter
        Wait loading completed
        a list of "#school-list li" are not shown
        #Error message :  "Invalid access code, please try again."


    Scenario: Trying to signup in access code page
        I visit "localhost:8100/#/university"
        I set the window size to 800 by 400
        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
        I click the element with css selector "[ng-click="switchSignupMode()"]"
        Wait loading completed
        "#access-code-bar" are shown
        #Error message :  "Redirecting you back..."

    Scenario: Trying to log in access code page with enter button
        I visit "localhost:8100/#/university"
        I set the window size to 800 by 400
        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
        I fill in the input with name "#email-input" with "jason@uguru.me"
        Fill in input "#password-input" with "launchuguru123",and enter
        Wait loading completed
        #Successed message :  "Login Successful!"
        Does urls change to "http://localhost:8100/#/guru"

    Scenario: Trying to log in access code page by clicking button
        I visit "localhost:8100/#/university"
        I set the window size to 800 by 400
        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
        I fill in the input with name "#email-input" with "jason@uguru.me"
        I fill in the input with name "#password-input" with "launchuguru123"
        I click the element with css selector "[ng-click="loginUser()"]"
        Wait loading completed
        Does urls change to "http://localhost:8100/#/guru"
        #Successed message :  "Login Successful!"
