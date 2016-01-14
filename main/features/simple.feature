Feature: Simple try
	Scenario: Init websie
		I start the args browser with args size
		# I visit "localhost:8100/#/university/2307"
		I visit "https://uguru.me"
	Scenario Outline: Scroll button [0-4]
	    # I check element "<scrollTo>" contain text "<result>"
	    I click the element with css selector "<scrollTo>"
	        And wait 1 seconds
	    I check element "<checkmarks>" position is at 0,0
	       Examples:
	         | scrollTo 										  | checkmarks         | result      |
	         | [ng-click='scrollToSection("#how-it-works")']      | #how-it-works      | How It Works|
	         | [ng-click='scrollToSection("#live-map")']    	  | #live-map    	   | Live 		 |
	         | [ng-click='scrollToSection("#browse-categories")'] | #splash-browse     | Browse 	 |
	         | [ng-click='scrollToSection("#become-guru")']       | #become-guru       | Apply Guru  |	
 