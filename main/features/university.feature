Feature: university home page
	Scenario: Init websie
		I start the args browser with args size

	Scenario Outline: this will test 10 university page with different browser size [0-31]
		# test university : "<university_name>"

		# I visit "http://localhost:5000"
		I visit "http://localhost:8100/#/university/<ID>"
		I set browser window to "desktop-m" and refresh the browser
			And wait 5 seconds
		# I fill in the input with selector "#search-bar" with "<university_name>"
		# I click the element with css selector ".tt-dropdown-menu div"
		# 	And wait 2 seconds
	 #    I check element "#live-map h1" contain text "<result>"
	    # I check element "#live-map h1" contain text "university.short_name"

		# Verify Menu
		I click the element with css selector "[name = 'sidebar']"
		I check element "[name = 'sidebar']" contain text "Menu"
		I verify element "#cta-modal-sidebar" exist
			And wait 1 seconds
		I click the element with css selector "#cta-modal-sidebar .cta-modal-close"
		I verify element "#cta-modal-sidebar" does not exist
		#mobile-s
		I set browser window to "mobile-s" and refresh the browser
		I check element "[name = 'sidebar']" contain text "Menu"
		# Verify Menu
		I click the element with css selector "[name = 'sidebar']"
		I verify element "#cta-modal-sidebar" exist
			And wait 1 seconds
		I click the element with css selector "#cta-modal-sidebar .cta-modal-close"
		I verify element "#cta-modal-sidebar" does not exist

		#mobile-m
		I set browser window to "mobile-m" and refresh the browser
		I check element "[name = 'sidebar']" contain text "Menu"
		# Verify Menu
		I click the element with css selector "[name = 'sidebar']"
		I verify element "#cta-modal-sidebar" exist
			And wait 1 seconds
		I click the element with css selector "#cta-modal-sidebar .cta-modal-close"
		I verify element "#cta-modal-sidebar" does not exist

		#mobile-lg
		I set browser window to "mobile-lg" and refresh the browser
		I check element "[name = 'sidebar']" contain text "Menu"
		# Verify Menu
		I click the element with css selector "[name = 'sidebar']"
		I verify element "#cta-modal-sidebar" exist
			And wait 1 seconds
		I click the element with css selector "#cta-modal-sidebar .cta-modal-close"
		I verify element "#cta-modal-sidebar" does not exist

		#mobile-xl
		I set browser window to "mobile-xl" and refresh the browser
		I check element "[name = 'sidebar']" contain text "Menu"
		# Verify Menu
		I click the element with css selector "[name = 'sidebar']"
		I verify element "#cta-modal-sidebar" exist
			And wait 1 seconds
		I click the element with css selector "#cta-modal-sidebar .cta-modal-close"
		I verify element "#cta-modal-sidebar" does not exist

		#desktop-s
		I set browser window to "desktop-s" and refresh the browser
		I check element "[name = 'sidebar']" contain text "Menu"
		# Verify Menu
		I click the element with css selector "[name = 'sidebar']"
		I verify element "#cta-modal-sidebar" exist
			And wait 1 seconds
		I click the element with css selector "#cta-modal-sidebar .cta-modal-close"
		I verify element "#cta-modal-sidebar" does not exist

		#desktop-m
		I set browser window to "desktop-m" and refresh the browser
		I check element "[name = 'sidebar']" contain text "Menu"
		# Verify Menu
		I click the element with css selector "[name = 'sidebar']"
		I verify element "#cta-modal-sidebar" exist
			And wait 1 seconds
		I click the element with css selector "#cta-modal-sidebar .cta-modal-close"
		I verify element "#cta-modal-sidebar" does not exist



    # Examples:
    # 	| university_name | result 		| 
    # 	| berkeley  	  | Berkeley 	|
    # 	| stanford  	  | Stanford 	|
    # 	| santa clara 	  | SCU			|
    # 	| florida		  | UF			|
    # 	| davis			  | Davis		|	 
    # 	| bard			  | Bard		|	  
    # 	| mit			  | Mit			|
    # 	| yale            | Yale     	|
    # 	| columbia		  | Columbia	|
    # 	| tufts			  | Tufts		|

    Examples:
	| ID  | 
	| 249 |
	| 2502|
	| 463 |
	| 175 |
	| 138 |
	| 2264|
	| 2186|
	| 2575|
	| 2757|
	| 191 |
	| 1334|
	| 1442|
	| 411 |
	| 999 |
	| 702 | 
	| 187 |
	| 2550|
	| 1800|
	| 1276|
	| 1194|
	| 2542|
	| 2554|
	| 1870|
	| 358 |
	| 640 |
	| 188 |
	| 1718|
	| 2365| 
	| 638 |
	| 2005|
    | 141 |
    | 1745|