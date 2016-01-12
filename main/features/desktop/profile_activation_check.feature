Feature: Guru add their currency and commucation
   Scenario: access code page
        I start the args browser with args size
       # I visit "http://localhost:8100/#/university"
        I visit "https://localhost:8100/#/university"
        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
       
    Scenario: Login User
        I fill in the input with selector "[ng-model='signupForm.email']" with "Jason@uguru.me"
        I fill in the input with selector "[ng-model='signupForm.password']" with "launchuguru123"
            And wait 2 seconds
        I click the element with css selector "[ng-click='loginUser()']"
   		    And Wait 5 seconds
        I verify that the url contains "guru"
   Scenario Outline: Open about section in profile
         I click the element with css selector "#cta-box-profile"
             And Wait 2 seconds
         I click the element with css selector "[name='about-btn']"

   Scenario Outline: Checkbox test [0-1]
        I loop and click on list element by css selector "<checkboxType> input" by <count> time
        I refresh browser
            And Wait 2 seconds
        I click the element with css selector "#cta-box-profile"
            And Wait 2 seconds
        I click the element with css selector "[name='about-btn']"
        I check the input "<checkboxType> input" which has checkmark is equal <count>
        I loop and click on list element by css selector "<checkboxType> input" by <count> time

          Examples:
            | checkboxType                | count |
            | [name='communication-check']| 3     |
            | [name='currency-check']     | 5     |