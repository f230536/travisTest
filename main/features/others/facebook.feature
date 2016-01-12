Feature: Facebook home login
    Scenario: put correct access code and enter 
	    Start the args browser with size 1600 by 1050
        I visit "https://www.facebook.com/"
        I fill in the input with name "#email" with "myth.twfob@gmail.com"
	    I fill in the input with name "#pass" with "f9026972"
	    I click the element with css selector "#loginbutton"
		I wait 5 sec