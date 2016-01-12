Feature: Guru add their experience
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

    Scenario: add experience
        ## Open Profile
        save current length of list "[name='exp-list'] li"
        I click the element with css selector "#cta-box-profile"
            And Wait 2 seconds
        I click the element with css selector "[name='about-btn']"
        I click the element with css selector "[name='exp-add-btn']"
            And Wait 1 seconds

        I fill in the input with selector "[name='exp-title']" with "Uguru"
        I selet range of the selector "[name='exp-year']" by 5

        I fill in the input with selector "[name='exp-descp']" with "Uguru Tester"
        I click the element with css selector "[name='save-btn']"
        I verify that the element with css selector ".loading-container" has a class "active"
            And Wait 2 seconds
        check length of list "[name='exp-list'] li" is "increased"

    Scenario: edit experience
        I click the element with css selector "[name='exp-list'] li"
        I clear text in element with css selector "[name='exp-title']"
        I fill in the input with selector "[name='exp-title']" with "Uguru Edit"
       
        I clear text in element with css selector "[name='exp-descp']"
        I fill in the input with selector "[name='exp-descp']" with "Uguru edit Tester"
        I click the element with css selector "[name='update-btn']"
        I verify that the element with css selector ".loading-container" has a class "active"

    Scenario: remove experience
        save current length of list "[name='exp-list'] li"
        I click the element with css selector "[name='remove-btn']"
        I verify that the element with css selector ".loading-container" has a class "active"
            And Wait 1 seconds
        check length of list "[name='exp-list'] li" is "decreased"

    Scenario: Edge test
        I click the element with css selector "[name='exp-list'] li"
        I click the element with css selector "[name='exp-close-btn']"
        I click the element with css selector "[name='exp-add-btn']"
        I check element "[name='exp-close-btn']" contain text "add an experience"
        I check input "[name='exp-title']" contain text ""
        I check input "[name='exp-descp']" contain text ""
    Scenario: Refresh browser and see list is updated
        I refresh browser
            And Wait 2 seconds
        ## Open Profile
        I click the element with css selector "#cta-box-profile"
            And Wait 2 seconds
        I click the element with css selector "[name='about-btn']"
        check length of list "[name='exp-list'] li" is "decreased"










