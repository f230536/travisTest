Feature: university home page - university Specific test : Berkeley
	Scenario: Init websie
		I start the args browser with args size
		# I visit "localhost:8100/#/university/2307"
		I visit "https://uguru.me/static/remote/index.html?version=1.081235#/university/2307"
	Scenario Outline: Scroll button [0-4]
	    I check element "<scrollTo>" contain text "<result>"
	    I click the element with css selector "<scrollTo>"
	        And wait 1 seconds
	    I check element "<checkmarks>" position is at 0,0
	       Examples:
	         | scrollTo 				 | checkmarks         | result      |
	         | [name= 'how-scroll']      | #how-it-works      | How It Works|
	         | [name= 'splash-scroll']   | #live-map    	  | Live 		|
	         | [name= 'live-scroll']     | #splash-browse     | Browse 	    |
	         | [name= 'become-scroll']   | #become-guru       | Apply Guru  |	
