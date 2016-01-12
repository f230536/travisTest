Feature: Guru add their public link
   Scenario: access code page
        I start the args browser with args size
        I visit "http://localhost:8100/#/university"
        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
       
    Scenario: Login User
        I fill in the input with selector "[ng-model='signupForm.email']" with "Jason@uguru.me"
        I fill in the input with selector "[ng-model='signupForm.password']" with "launchuguru123"
            And wait 2 seconds
        I click the element with css selector "[ng-click='loginUser()']"
   		    And Wait 5 seconds
        I verify that the url contains "guru"

    Scenario: activate profile
        I click the element with css selector "#cta-box-profile"
        I click the element with css selector "[name='services-btn']"

    Scenario: empty public link
        I clear text in element with css selector "[name='profile_code']"
        I fill in the input with selector "[name='profile_code']" with ""
        I click the element with css selector "[name='services-btn']"
            And wait 1 seconds
        I verify that the element with css selector ".loading-container" has a class "active"
        ## I verify that the element with css selector "[name='code_checkmark']" has a class "checkmark-add-active"
        I verify that the element with css selector "[name='code_checkmark']" should not "checkmark-add-active"
    
    Scenario: exist public link : jason
        I clear text in element with css selector "[name='profile_code']"
        I fill in the input with selector "[name='profile_code']" with "jason"
        I click the element with css selector "[name='services-btn']"
            And wait 1 seconds
        I verify that the element with css selector ".loading-container" has a class "active"
        ## I verify that the element with css selector "[name='code_checkmark']" has a class "checkmark-add-active"
        I verify that the element with css selector "[name='code_checkmark']" should not "checkmark-add-active"

    Scenario: changeback original public link : jason1
        I clear text in element with css selector "[name='profile_code']"
        I fill in the input with selector "[name='profile_code']" with "jason1"
        I click the element with css selector "[name='services-btn']"
            And wait 1 seconds
        I verify that the element with css selector ".loading-container" should not "active"
        I verify that the element with css selector "[name='code_checkmark']" has a class "checkmark-add-active"
