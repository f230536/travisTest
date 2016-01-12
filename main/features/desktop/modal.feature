Feature: all modal test
    
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
        I click the element with css selector "#top-settings"
        I click the element with css selector "[name='setting']"


    Scenario: Referrals
        #open Referrals
        #Check Referrals page is show
        #close Referrals

    Scenario: Term
        #open Term
        #Check Term page is show
        #close Term

    Scenario: FAQ
        #open FAQ
        #Check FAQ page is show
        #close FAQ

    Scenario: Support
        #open Support
        #Check Support page is show
        #close Support

    Scenario: Visibility
        #open Visibility
        #Check Visibility page is show
        #close Visibility