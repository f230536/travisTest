Feature: account_setting testing
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

   Scenario: upload profile picture check there is missing link
  		J-TODO : check there is a missing link from console.error
  		##( Failed to load resource: the https://uguru.me/static/img/avatar.svg)
      J-TODO : Implenent a file attachment to "#file-input-web-sidebar" 

   Scenario Outline: name update and see the update has been applied in setting page [0-1]
   		I click the element with css selector "[name='edit-name']"
   		# I click the element with css selector "[name='name-clear']"
          And wait 3 seconds
      I clear text in element with css selector "#user-edit-name-input"
   		I fill in the input with selector "#user-edit-name-input" with "<usrName>"
   		I click the element with css selector "#edit-name-save-popup-link"
      I check input "[name='usr-name']" contain text "<result>"
      Examples:
        | usrName      | result     |
        | tony huang   | Tony Huang |
        | jason huang  | Jason Huang|

   Scenario Outline: email update and see the update has been applied in setting page [0-1]
   		I click the element with css selector "[name='edit-email']"
        And wait 3 seconds
      # I click the element with css selector "[name='email-clear']"
      I clear text in element with css selector "#user-edit-email-input"

   		I fill in the input with selector "#user-edit-email-input" with "<usrEmail>"
   		I click the element with css selector "#edit-email-save-popup-link"
      I check input "[name='email']" contain text "<result>"

      Examples:
        | usrEmail        | result         |
        | Test@uguru.me   | test@uguru.me  |
        | jason@uguru.me  | jason@uguru.me |
   Scenario: password update
  		I click the element with css selector "[name='edit-pwd']"
         And wait 3 seconds
  		I click the element with css selector "[name='pwd_popup-close']"
	
   Scenario: text notification toggle && able to update with different number 
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

   Scenario: email notification update
       I click the element with css selector "[name='email-toogle']"
       I verify that the element with css selector "[name='email-toogle'] circle" has a class " active"
       I click the element with css selector "[name='email-toogle']"
       I verify that the element with css selector "[name='email-toogle']" should not " active"
  		# S-TODO : check class of "[ng-click="toggleEmailNotifications()"]" is active
   
   Scenario Outline: Update University [0-1]
  		I click the element with css selector "[name='edit-university']"
  		I fill in the input with selector "#university-input" with "<schoolName>"
  		I click the element with css selector "#school-list li a"
      I should see an alert dialog, and I confirm it
      I check input "[name='usr-university']" contain text "<result>"

      Examples:
        | schoolName| result                               |
        | stanford  | Stanford University                  |
        | berkeley  | University of California at Berkeley |

   Scenario: saveSettings
  		I click the element with css selector "[name='save-setting']"
  		I check "[name='edit-name']" is invisible now



