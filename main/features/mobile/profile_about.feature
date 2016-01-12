Feature: Guru edits their profile for the first time
   Scenario: access code page
        I start the args browser with args size
        I visit "http://localhost:8100/#/university"
        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
       
    Scenario: Login User
        # I start the args browser with args size
        # I visit "http://localhost:8100/#desktop-login"
        # I click the element with css selector "#login-button"
        
## No ID
        I fill in the input with selector "[ng-model='signupForm.email']" with "Jason@uguru.me"
        I fill in the input with selector "[ng-model='signupForm.password']" with "launchuguru123"
        # I press enter on "#password"
            And wait 2 seconds
## NO ID
        I click the element with css selector "[ng-click='loginUser()']"
        Wait 5 seconds
        I verify that the url contains "guru"

    Scenario: alumni dropdown
        ## Open Profile
        I click the element with css selector "#cta-box-profile"
            And Wait 2 seconds
        I click the element with css selector "[name='alumni-btn']"
        #I verify that the selector "[name='alumn-dropdown'] li" contains 1 element
        I click the element with css selector "[name='alumn-dropdown'] li"
        I verify that the element with css selector ".loading-container" has a class "active"
        I click the element with css selector "[name='alumni-btn']"


    Scenario: year dropdown
        I click the element with css selector "[name='year-btn']"
        #I verify that the selector "[name='alumn-dropdown'] li" contains 6 element
        I click the element with css selector "[name='alumn-dropdown'] li"
        I verify that the element with css selector ".loading-container" has a class "active"
        I click the element with css selector "[name='year-btn']"

    Scenario: major dropdown
        I clear text in element with css selector "[name='userMajor-input']"
        I fill in the input with selector "[name='userMajor-input']" with "uguru"

    Scenario: Check is dropdown hidden
        I check "[name='alumn-dropdown']" is "invisible" now
        I check "[name='year-dropbodwn']" is "invisible" now
        I click the element with css selector "#guru-profile-cta-close"
        I refresh browser
            And Wait 2 seconds
        ## Open Profile
        I click the element with css selector "#cta-box-profile"
            And Wait 2 seconds
        I click the element with css selector "[name='about-btn']"
        I check input "[name='userMajor-input']" contain text "uguru"
        I click the element with css selector "#guru-profile-cta-close"




