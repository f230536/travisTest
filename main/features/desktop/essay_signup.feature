Feature: High school student sign up their account
    Scenario: Go to essay-home and wait 7 to see the become guru button is shown
        I start the args browser with args size
        I visit "http://localhost:8100/#/essay-home"
            And wait 8 seconds
        I verify that the element with css selector "#essay-home-banner" has a class " show"
        I click the element with css selector "[name='guru-essay-hdeader-close']"
        I click the element with css selector "[name='start-btn']"
            And wait 1 seconds
        I verify that the selector "[name='university-list']" contains 8 element
    
    Scenario: Add University
        I clear text in element with css selector "#university-input"
        I verify that the selector "[name='university-list']" contains 8 element
        I click the element with css selector "[name='university-list'] input"
        I click the element with css selector "[name='university-list'] input"
        I verify that the selector "[name='university-list']" contains 8 element
        I verify that the element with css selector "[name='add_university_list-btn']" has a class " show"
      	I click the element with css selector "[name='goToEssaySignup']"
      		And wait 1 seconds
    Scenario: Check University btn and home btn is working
	    I click the element with css selector "[name='goBackUniversity-btn']"
            And wait 1 seconds
   		I verify that the element with css selector "[name='add_university_list-btn']" has a class " show"
   		I click the element with css selector "[name='goToEssaySignup']"
    		And wait 1 seconds
	    I click the element with css selector "[name='goBackEssayHome-btn']"
	    	And wait 1 seconds
    	I click the element with css selector "[name='start-btn']"
	        And wait 1 seconds
	    I verify that the selector "[name='university-list']" contains 8 element
	    I verify that the element with css selector "[name='add_university_list-btn']" has a class " show"
	    I click the element with css selector "[name='goToEssaySignup']"

	Scenario: Sign up with exist account
		I fill in the input with selector "[name='notecard-name']" with "jason huang"
		I fill in the input with selector "[name='notecard-email']" with "jason@uguru.me"
		I fill in the input with selector "[name='notecard-password']" with "test123"
		I click the element with css selector "[name='completeSignup']"
		I verify that the element with css selector ".loading-container" has a class "active"
		I verify that the element with css selector "[name='create-text']" has a class " show"
		I click the element with css selector "[name='account-btn']"

	Scenario Outline: Sign up with wrong infomation[0:4]
		I clear text in element with css selector "[name='notecard-name']"
		I clear text in element with css selector "[name='notecard-email'"
		I clear text in element with css selector "[name='notecard-password']"

		I fill in the input with selector "[name='notecard-name']" with "<name>"
		I fill in the input with selector "[name='notecard-email']" with "<email>"
		I fill in the input with selector "[name='notecard-password']" with "<password>"
		I click the element with css selector "[name='completeSignup']"
			And wait 1 seconds
		I check element ".loading-container .loading span" contain text "<result>"

		
		Examples:
		  | name        | email  		 | password | result
		  | jason	    | jason@test.me  | test123  | name
		  | jason huang | jasonu 		 | test123  | email
		  | jason huang | jason@test.me  | test     | password

	Scenario: Sign up with correct information
		I clear text in element with css selector "[name='notecard-name']"
		I clear text in element with css selector "[name='notecard-email'"
		I clear text in element with css selector "[name='notecard-password']"
		I fill in the input with selector "[name='notecard-name']" with "jason huang"
		I fill in the input with selector "[name='notecard-email']" with "random"
		I fill in the input with selector "[name='notecard-password']" with "test123"
		I click the element with css selector "[name='completeSignup']"
