Feature: billing studnent
    
    Scenario: access code page
        I start the args browser with args size
        I visit "http://localhost:8100/#/university"
        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
       
    Scenario: Login User
        I fill in the input with selector "[ng-model='signupForm.email']" with "Jason@uguru.me"
        I fill in the input with selector "[ng-model='signupForm.password']" with "launchuguru123"
            And wait 2 seconds
        I click the element with css selector "[ng-click='loginUser()']"
        Wait 5 seconds
        I verify that the url contains "guru"
    

    Scenario: Select Billing
        #open billing
        I click the element with css selector "#cta-box-billing"
            And wait 2 seconds
        #Check Billing page is show
        I verify that the selector ".modal-backdrop.active" contains 1 element
        #close billing
        I click the element with css selector "#desktop-billing a:nth-child(2)"
        I verify that the selector ".modal-backdrop.active" contains 0 element