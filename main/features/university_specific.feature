Feature: university home page - university Specific test : Berkeley
	Scenario: Init websie
		I start the args browser with args size
		# I visit "localhost:8100/#/university/2307"
		#I visit "http://localhost:5000/static/remote/index.html#/university/2307"
		I visit "https://uguru.me/static/remote/index.html#/university/2307"

	Scenario Outline: Scroll button [0-4]
	    I check element "<scrollTo>" contain text "<result>"
	    I click the element with css selector "<scrollTo>"
	        And wait 1 seconds
	    I check element "<checkmarks>" position is at 0,0
	    I verify element "<checkmarks> header h1" exist

	       Examples:
	       | scrollTo 										    | checkmarks         | result      |
	       | [ng-click='scrollToSection("#how-it-works")']      | #how-it-works      | How It Works|
	      # | [ng-click='scrollToSection("#live-map")']    	    | #live-map    	     | Live 	   |
	       | [ng-click='scrollToSection("#browse-categories")'] | #splash-browse     | Browse 	   |
	       | [ng-click='scrollToSection("#become-guru")']       | #become-guru       | Apply Guru  |	


	       # | scrollTo 				 | checkmarks         | result      |
	       # | [name= 'how-scroll']      | #how-it-works      | How It Works|
	       # | [name= 'splash-scroll']   | #live-map    	  | Live 		|
	       # | [name= 'live-scroll']     | #splash-browse     | Browse 	    |
	       # | [name= 'become-scroll']   | #become-guru       | Apply Guru  |	
    # Scenario: make sure all link sidebar work
    	




	Scenario: element in how it work 
	    I click the element with css selector "[ng-click='scrollToSection("#how-it-works")']"
	        And wait 1 seconds
	    I check element "#how-it-works" position is at 0,0
	    I verify that the selector "#how-it-works li" contains 6 element

    Scenario: element in go to become-guru
	    I click the element with css selector "[ng-click='scrollToSection("#how-it-works")']"
        I click the element with css selector "[ng-click='goToUniversity()']  "
            And wait 1 seconds
        I verify that the selector "[name='university-list']" contains 8 element
		I visit "localhost:8100/#/university/2307"
		I refresh browser

	Scenario: check support cta
		I click the element with css selector "#splash-footer-support"
		I verify that the element with css selector "#cta-modal-content" has a class " show"
		I click the element with css selector "#desktop-general header .cta-modal-close"
		I verify that the element with css selector "#cta-modal-content" should not " show"

	Scenario: Test Back To Top Button is working
		I click the element with css selector "[ng-click='scrollToSection("#become-guru")'] "
		I check element "#become-guru" position is at 0,0
		I click the element with css selector "#splash-footer-top" 
		I check element "#essay-home" position is at 0,0

	Scenario Outline: categories view test [0-8]
		I check element "[ng-click='scrollToSection("#browse-categories")']" contain text "Browse"
		I click the element with css selector "[ng-click='scrollToSection("#browse-categories")']"
		    And wait 1 seconds
		I check element "#splash-browse" position is at 0,0
		I click the element with css selector "[.tab-bar.bg-university li:nth-of-type(1) a"
		I click the element with css selector ".category-card-list li:nth-of-type(<index>) a"
	    I verify that more than 4 elements exist with the selector ".selected li"
	    I click the element with css selector ".selected button"
	   	I verify element ".selected" does not exist

		Examples:
		|index|
		|  1  |
		|  2  |
		|  3  |
		|  4  |
		|  5  |
		|  6  |
		|  7  |
		|  8  |

	Scenario Outline: Gurus view test [0-8]
		I check element "[ng-click='scrollToSection("#browse-categories")']" contain text "Browse"
		I click the element with css selector "[ng-click='scrollToSection("#browse-categories")']"
		    And wait 1 seconds
		I check element "#splash-browse" position is at 0,0
		I click the element with css selector "[.tab-bar.bg-university li:nth-of-type(2) a"
	    I verify that more than 4 elements exist with the selector "#splash-gurus li a"
	    I click the element with css selector "#splash-gurus li:nth-of-type(<index>) a"
	    I verify that the element with css selector "#cta-modal-profile" has a class " show"
	    I click the element with css selector "#cta-modal-profile close"

		Examples:
		|index|
		|  1  |
		|  2  |
		|  3  |
		|  4  |
		|  5  |
		|  6  |
		|  7  |
		|  8  |

	Scenario: Course view Test
		I check element "[ng-click='scrollToSection("#browse-categories")']" contain text "Browse"
		I click the element with css selector "[ng-click='scrollToSection("#browse-categories")']"
		    And wait 1 seconds
		I check element "#splash-browse" position is at 0,0
		I click the element with css selector "[.tab-bar.bg-university li:nth-of-type(3) a"
		I verify that more than 4 elements exist with the selector ".course-name"
		I fill in the input with selector "[name='request-search-input']" with "math"
		I verify that more than 1 elements exist with the selector ".course-name"


