Feature: High school student go through become guru, sign up, login, setting,

    Scenario: Go to essay-home and wait 7 to see the become guru button is shown
        I start the args browser with args size
        I visit "http://localhost:8100/#/essay-home"
            And wait 7 seconds
        I verify that the element with css selector "#essay-home-banner" has a class " show"
        I click the element with css selector "[name='guru-essay-hdeader-close']"
        I click the element with css selector "[name='start-btn']"
            And wait 5 seconds
        I verify that the selector "[name='university-list']" contains 8 element
    
    Scenario: Add University
        I click the element with css selector "[name='university-list'] input"
        I click the element with css selector "[name='university-list'] input"
        I verify that the selector "[name='university-list']" contains 8 element
        I verify that the element with css selector "[name='add_university_list-btn']" has a class " show"
        I click the element with css selector "[name='goToEssaySignup']"
            And wait 1 seconds

    Scenario: login exist account
        I click the element with css selector "[name='account-btn']"
        I fill in the input with selector "[name='notecard-email']" with "jason@uguru.me"
        I fill in the input with selector "[name='notecard-password']" with "launchuguru123"
        I click the element with css selector "[name='loginUser']"
            And wait 1 seconds
        I verify that the element with css selector ".loading-container" has a class "active"
        I verify that the element with css selector "[name='create-text']" has a class " show"
            And wait 3 seconds
    Scenario: sign up with new account
        I click the element with css selector "[name='account-btn']"
        I clear text in element with css selector "[name='notecard-name']"
        I clear text in element with css selector "[name='notecard-email'"
        I clear text in element with css selector "[name='notecard-password']"
        I fill in the input with selector "[name='notecard-name']" with "jason huang"
        I fill in the input with selector "[name='notecard-email']" with "random"
        I fill in the input with selector "[name='notecard-password']" with "test123"
        I click the element with css selector "[name='completeSignup']"
            And wait 3 seconds
        I verify that the url contains "essay-student-home-desktop"

    Scenario: Settings
        I click the element with css selector "#top-settings"
        I click the element with css selector "[name='setting']"
        #Image
        #J-TODO : check there is a missing link from console.error
        # Implenent a file attachment to "#file-input-web-sidebar" 
        #     And wait 5 seconds
        #Name
        I click the element with css selector "[name='edit-name']"
            And wait 3 seconds
        # I click the element with css selector "[name='name-clear']"
        I clear text in element with css selector "#user-edit-name-input"
        I fill in the input with selector "#user-edit-name-input" with "tony huang"
        I click the element with css selector "#edit-name-save-popup-link"
        I check input "[name='usr-name']" contain text "Tony Huang"
        #Email
        I click the element with css selector "[name='edit-email']"
          And wait 3 seconds
        # I click the element with css selector "[name='email-clear']"
        I clear text in element with css selector "#user-edit-email-input"
        I fill in the input with selector "#user-edit-email-input" with "Test@uguru.me"
        I click the element with css selector "#edit-email-save-popup-link"
        I check input "[name='email']" contain text "test@uguru.me"
        #password
        I click the element with css selector "[name='edit-pwd']"
            And wait 3 seconds
        I click the element with css selector "[name='pwd_popup-close']"
    
        #text notification toggle && able to update with different number 
            #S-TODO : I click the element with css selector "[ng-click="launchEditPhonePopup($event)"]"
            #S-TODO : I click the element with css selector "#clear-phone"
            #S-TODO : I fill in the input with selector "#phone-number-input" with "4085945188"
            #S-TODO : I click the element with css selector "#edit-phone-save-popup-link"
            #S-TODO : I look at "[ng-model="user.phone_number"]" has text "contain" : "4085945188"
        I click the element with css selector "[name='text-toogle']"
              And wait 1 seconds
        I verify that the element with css selector "[name='text-toogle'] circle" has a class " active"
        I click the element with css selector "[name='text-toogle']"
              And wait 1 seconds
        I verify that the element with css selector "[name='text-toogle']" should not " active"
            #S-TODO : check class of "[ng-click="toggleTextNotifications()"]" is active

        I click the element with css selector "[name='email-toogle']"
        I verify that the element with css selector "[name='email-toogle'] circle" has a class " active"
        I click the element with css selector "[name='email-toogle']"
        I verify that the element with css selector "[name='email-toogle']" should not " active"
        # S-TODO : check class of "[ng-click="toggleEmailNotifications()"]" is active
    
        # University
        I click the element with css selector "[name='edit-university']"
        I fill in the input with selector "#university-input" with "stanford"
        I click the element with css selector "#school-list li a"
        I should see an alert dialog, and I confirm it
        I check input "[name='usr-university']" contain text "Stanford University"

        I click the element with css selector "[name='save-setting']"
        I verify that the url contains "essay-student-home-desktop"
    Scenario: Timeline
        #redirect to http://192.168.0.103:8100/#/essay-student-home-desktop
        I visit "http://localhost:8100/#/essay-student-home-desktop"
        #save # university
          And wait 1 seconds
        #opening timeline
        I click the element with css selector "#cta-box-essay-student-timeline"
        #I check deadline university is contain 2
        I verify that the selector "[name='university_timeline']" contains 2 element
        #close
        I click the element with css selector "[name='cta_close-btn']"

        I verify that the element with css selector "#cta-modal-essay-student-timeline" should not " show"

    Scenario: Add modify/university
        I visit "http://localhost:8100/#/essay-student-home-desktop"
          And wait 1 seconds
        I click the element with css selector "#cta-box-essay-student-universities"
        I verify that the selector "[name='selected_university-list']" contains 2 element
        I verify that the element with css selector "[name='add_university_list-btn']" should not " show"
        I verify that the element with css selector "[name='back_university_list-btn']" has a class " show"
        I click the element with css selector "[name='selected_university-list'] input"
            And wait 1 seconds
        I click the element with css selector "[name='selected_university-list'] input"
            And wait 1 seconds

        I verify that the element with css selector "[name='add_university_list-btn']" should not " show"
        I verify that the element with css selector "[name='back_university_list-btn']" should not " show"
        I fill in the input with selector "#university-input" with "berkeley"
        I clear text in element with css selector "#university-input"
        I verify that the selector "[name='university-list']" contains 1 element
        I click the element with css selector "[name='university-list'] input"
            And wait 1 seconds
        I click the element with css selector "[name='university-list'] input"
            And wait 1 seconds
        I click the element with css selector "[name='university-list'] input"
            And wait 1 seconds
        I click the element with css selector "[name='university-list'] input"
            And wait 1 seconds
        I click the element with css selector "[name='university-list'] input"
            And wait 1 seconds

        I verify that the element with css selector "[name='add_university_list-btn']" has a class " show"
        I click the element with css selector "[name='add_university_list-btn']"
        I verify that the selector "[name='selected_university-list']" contains 5 element
        I click the element with css selector "[name='cta_close-btn']"
        I check element "#cta-box-essay-student-universities h3.show" contain text "You've added 5 university"
        I refresh browser
        I check element "#cta-box-essay-student-universities h3.show" contain text "You've added 5 university"
    
    Scenario: Logoff
        I click the element with css selector "#top-settings"
        I click the element with css selector "[name='logout']"


