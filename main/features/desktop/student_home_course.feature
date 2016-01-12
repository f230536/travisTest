Feature: account_setting testing
     Scenario: access code page
        I start the args browser with args size
        I visit "http://localhost:8100/#/university"
        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
          And wait 1 seconds
    Scenario: Login User
        I fill in the input with selector "[ng-model='signupForm.email']" with "Jason@uguru.me"
        I fill in the input with selector "[ng-model='signupForm.password']" with "launchuguru123"
            And wait 2 seconds
        I click the element with css selector "[ng-click='loginUser()']"
        Wait 5 seconds
        I verify that the url contains "guru"
        I click the element with css selector "#top-settings"
        I click the element with css selector "[name='student-btn']"
            And wait 2 seconds
        I verify that the url contains "student-home"

    Scenario: Course list updated
        I click the element with css selector "#cta-box-student-courses"
            And wait 1 seconds
        I fill in the input with selector "#course-input-1" with "math1a"
        I verify that more than 4 elements exist with the selectr "[name='guru-courses']"
        I click the element with css selector "[name='clear-course-input']"
        I check input "#course-input-1" contain text ""
        I verify that the selector "[name='guru-courses']" contains 1 element
        I click the element with css selector "#cta-modal-student-courses .cta-modal-close.desktop-header-next.desktop-header-close"
    
    Scenario: Add course list updated
        I click the element with css selector "#cta-box-student-courses"
            And wait 1 seconds
        I verify that more than 4 elements exist with the selectr "[name='guru-courses']"
        I click the element with css selector "[name='guru-courses']"
        I verify that more than 1 elements exist with the selectr "[name='usr-course']"
        I click the element with css selector "[name='usr-course']"
        I verify element "[name='guru-courses']" does not exist
