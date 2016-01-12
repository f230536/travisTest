Feature: Credibility testing
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
   
    # Scenario: Transcript test
    #     I click the element with css selector "#cta-box-credibility"
    #     I click the element with css selector "[name='active-credit']"
    #         And wait 1 seconds
    #     Implenent a file attachment to "#file-input-guru-add-transcript" 
    #         And wait 5 seconds
    #     I verify that the element with css selector ".loading-container" has a class "active"
    #     I check element "#credit-progress .ng-binding" contain text "2/5"
    #     I click the element with css selector "#desktop-credibility header .cta-modal-close"
    #     I check element "#credit-progress .ng-binding" contain text "40%"


   # Scenario: Facebook test- login a facebook account
   #      I click the element with css selector "#cta-box-credibility"
   #      I click the element with css selector "[ng-click="connectWithFacebook()"]"
   #      S-TODO : I login my Facebook account
   #      S-TODO : I look at "#credit-progress .ng-binding" has text "equal" : "2/5" 
   #      I click the element with css selector "#desktop-credibility header .cta-modal-close"
   #      S-TODO : I look at "#cta-box-credibility .credibility-percent" has text "equal" : "40%" 
   #      J-TODO : combine above 2 to : close credibility and see percent is "40%"

    Scenario: Phone test - add a phone number
        I click the element with css selector "#cta-box-credibility"
            And wait 1 seconds
        I click the element with css selector "[name='active-phone']"
            And wait 2 seconds
        I fill in the input with selector "#phone-number-input" with "4085945188"
        I click the element with css selector "#send-confirm-code"
        I verify that the element with css selector ".loading-container" has a class "active"
            And Wait 2 seconds
        I check element "#credit-progress .ng-binding" contain text "2/5"
            And Wait 5 seconds
        I click the element with css selector "[name='credibility-close']"
        I check element "#credit-progress .ng-binding" contain text "40%"
            And wait 1 seconds


    Scenario: Email test - add an Email address
        I click the element with css selector "#cta-box-credibility"
            And wait 1 seconds
        I click the element with css selector "[name='active-email']"
            And wait 2 seconds
        I fill in the input with selector "#user-confirm-email-input" with "jasontest@uguru.me"
        I click the element with css selector "#confirm-email-save-popup-linkx"
        I verify that the element with css selector ".loading-container" has a class "active"
            And Wait 2 seconds
        I check element "#credit-progress .ng-binding" contain text "2/5"
            And Wait 5 seconds
        I click the element with css selector "[name='credibility-close']"
        I check element "#credit-progress .ng-binding" contain text "40%"
            And wait 1 seconds

    Scenario: experience test - add Open Exp and edit it and then close it
        I click the element with css selector "#cta-box-credibility"
        I click the element with css selector "[name='active-exp']"
        I click the element with css selector ".modal-backdrop.active [name='exp-close-btn']"
        I click the element with css selector "[name='active-exp']"
             And wait 1 seconds

        I fill in the input with selector "[name='exp-title']" with "Uguru"
        I selet range of the selector "[name='exp-year']" by 5
        I fill in the input with selector "[name='exp-descp']" with "Uguru Tester"
        I click the element with css selector "[name='save-btn']"
        I verify that the element with css selector ".loading-container" has a class "active"
            And Wait 2 seconds
        I check element "#credit-progress .ng-binding" contain text "3/5"
        I click the element with css selector "[name='credibility-close']"
        I check element "#credit-progress .ng-binding" contain text "40%"




