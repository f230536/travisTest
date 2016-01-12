Feature: Guru add their language
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

    Scenario: Add language
	    I click the element with css selector "#cta-box-profile"
    	I click the element with css selector "[name='lang-add-btn']"
    	save current length of list "[name='lang-usr-list'] li a"
        I verify that more than 4 elements exist with the selector "[name='lang-list'] li a"
    	I click the element with css selector "[name='lang-list'] li a"
    	I verify that the element with css selector ".loading-container" has a class "active"
    	    And Wait 2 seconds
    	check length of list "[name='lang-usr-list'] li" is "increased"

    Scenario: Search language : English
    	save current length of list "[name='lang-usr-list'] li a"
    	I fill in the input with selector "[name='lang-input']" with "English"
		I verify that the selector "[name='lang-list'] li a" contains 1 element
    	I click the element with css selector "[name='lang-list'] li a"
    	I check input "[name='lang-input']" contain text ""
    	I verify that the element with css selector ".loading-container" has a class "active"
    	    And Wait 2 seconds
    	check length of list "[name='lang-usr-list'] li" is "increased"

    Scenario: Remove language
	    save current length of list "[name='lang-usr-list'] li a"
    	I click the element with css selector "[name='lang-usr-list'] li a"
    	I verify that the element with css selector ".loading-container" has a class "active"
    	    And Wait 2 seconds
	    check length of list "[name='lang-usr-list'] li" is "decreased"

    Scenario: refresh browser and see data is updated
	    I refresh browser
	        And Wait 2 seconds
	    I click the element with css selector "#cta-box-profile"
	        And Wait 2 seconds
	    I click the element with css selector "[name='about-btn']"
	    I click the element with css selector "[name='lang-add-btn']"
	    I verify that the selector "[name='lang-usr-list'] li a" contains 1 element
	    I click the element with css selector "[name='lang-usr-list'] li a"