Feature: check the profile checkmark
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

    Scenario Outline: Service checkmark checks [0-3]
        I fill in the input with selector "<inputName>" with ""
        I click the element with css selector "[name='services-btn']"
        I verify that the element with css selector "<checkmarks>" has a class "checkmark-add-active"
           Examples:
             | inputName                | checkmarks                   |
             | [name='shop-title']      | [name='shop_title-checkmark']|
             | [name='description']     | [name='shop_descp-checkmark']|
             | [name='profile_code']    | [name='code_checkmark']|

    Scenario: alumni-dropdown heckmark checks
         I click the element with css selector "[name='about-btn']"
         I click the element with css selector "[name='alumni-btn']"
             And Wait 1 seconds
         I click the element with css selector "[name='alumni-dropdown'] li"
         I verify that the element with css selector "[name='alumni-checkmark']" has a class "checkmark-add-active"

    Scenario: year-dropdown heckmark checks
         I click the element with css selector "[name='year-btn']"
             And Wait 1 seconds
         I click the element with css selector "[name='year-dropdown'] li"
         I verify that the element with css selector "[name='year-checkmark']" has a class "checkmark-add-active"

    Scenario: major-dropdown heckmark checks
        I fill in the input with selector "[name='userMajor-input']" with ""
         I click the element with css selector "[name='about-btn']"
        I verify that the element with css selector "[name='major-checkmark']" has a class "checkmark-add-active"






    