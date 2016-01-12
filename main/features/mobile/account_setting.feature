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
    		I click the element with css selector "[name='active-side']"

   Scenario: upload profile picture check there is missing link
	    # S-TODO : check there is a missing link from console.error (maybe check every step or every Scenario)
	    # ##( Failed to load resource: the https://uguru.me/static/img/avatar.svg)	
   		# I click the element with css selector "[ng-click="showStudentEditActionSheet($event)"]"
   		# S-TODO : I click index : '0' in '[ng-repeat="b in buttons"]'
     #    S-TODO : Implenent a file attachment to "#file-input-web-sidebar" 
  
   Scenario Outline: name update and see the update has been applied at sdiemenu [0-1]
      I click the element with css selector "[name='setting']"
      I click the element with css selector "[ng-repeat='b in buttons']:nth-child(4)"
          And wait 3 seconds
      I click the element with css selector "[ng-repeat='b in buttons']:nth-child(2)"
          And wait 3 seconds
      I clear text in element with css selector "#user-edit-name-input"
      I fill in the input with selector "#user-edit-name-input" with "<usrName>"
      I click the element with css selector "#edit-name-save-popup-link"
          And wait 3 seconds
      I click the element with css selector "[name='setting']"
      I click the element with css selector "[ng-repeat='b in buttons']:nth-child(4)"
          And wait 3 seconds
      I click the element with css selector "[ng-repeat='b in buttons']:nth-child(2)"
          And wait 3 seconds
      I click the element with css selector "#edit-name-save-popup-link"
      I check input "#user-edit-name-input" contain text "<result>"

      Examples:
        | usrName      | result     |
        | tony huang   | Tony Huang |
        | Jason Huang  | Jason Huang|

    Scenario Outline: email update and see the update has been applied in setting page [0-1]
        I click the element with css selector "[name='setting']"
        I click the element with css selector "[ng-repeat='b in buttons']:nth-child(4)"
            And wait 3 seconds
        I click the element with css selector "[ng-repeat='b in buttons']:nth-child(3)"
            And wait 3 seconds
        I clear text in element with css selector "#user-edit-email-input"
        I fill in the input with selector "#user-edit-email-input" with "<usrEmail>"
        I click the element with css selector "#edit-email-save-popup-link"
            And wait 3 seconds
        I click the element with css selector "[name='setting']"
        I click the element with css selector "[ng-repeat='b in buttons']:nth-child(4)"
            And wait 3 seconds
        I click the element with css selector "[ng-repeat='b in buttons']:nth-child(3)"
            And wait 3 seconds
        I click the element with css selector "#edit-email-save-popup-link"
        I check input "#user-edit-email-input" contain text "<result>"

       Examples:
         | usrEmail        | result         |
         | Test@uguru.me   | test@uguru.me  |
         | jason@uguru.me  | jason@uguru.me |

    Scenario: password update
      I click the element with css selector "[name='setting']"
      I click the element with css selector "[ng-repeat='b in buttons']:nth-child(4)"
          And wait 3 seconds
      I click the element with css selector "[ng-repeat='b in buttons']:nth-child(4)"
          And wait 3 seconds
      I click the element with css selector "[name='pwd_popup-close']"
	
   Scenario Outline: text && email notification toggle [0-1]
        I click the element with css selector "[name='notifi-modal']"
      I click the element with css selector "#experience-modal ion-item:nth-child(<index>)"
            And wait 1 seconds
      I verify that the element with css selector "#experience-modal ion-item:nth-child(<index>) circle" has a class " active"
      I click the element with css selector "#experience-modal ion-item:nth-child(<index>)"
            And wait 1 seconds
      I verify that the element with css selector "#experience-modal ion-item:nth-child(<index>) circle" should not " active"
      I click the element with css selector "[name='save_notifi-btn']"
            And wait 1 seconds

          Examples:
            | index|
            | 1    | 
            | 2    |

    Scenario Outline: Update University [0-1]
      I click the element with css selector "[name='setting']"
      I click the element with css selector "[ng-repeat='b in buttons']:nth-child(3)"
          And wait 3 seconds
      I fill in the input with selector "#university-input" with "<schoolName>"
      I click the element with css selector "#school-list li a"
      I should see an alert dialog, and I confirm it
      I check element "#student-sidebar-profile span:nth-child(2)" contain text "<result>"
          And wait 3 seconds
      Examples:
        | schoolName| result                               |
        | stanford  | Stanford University                  |
        | berkeley  | University of California at Berkeley |





