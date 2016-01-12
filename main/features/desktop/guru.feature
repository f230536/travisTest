Feature: Guru edits their profile for the first time
   Scenario: access code page
        I start the args browser with args size
        I visit "http://localhost:8100/#/university"
        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
        	And wait 2 seconds
   Scenario: Login User
       I fill in the input with selector "[ng-model='signupForm.email']" with "Jason@uguru.me"
       I fill in the input with selector "[ng-model='signupForm.password']" with "launchuguru123"
           And wait 2 seconds
       I click the element with css selector "[ng-click='loginUser()']"
       	   And wait 5 seconds
       I verify that the url contains "guru"
   
	Scenario: Billing
	    #open billing
	    I click the element with css selector "#cta-box-billing"
	        And wait 2 seconds
	    #Check Billing page is show
	    I verify that the element with css selector "#cta-modal-billing" has a class " show"
	    #close billing
	    I click the element with css selector "#desktop-billing a:nth-child(2)"
	    I verify that the element with css selector "#cta-modal-billing" should not " show"


### Guru service
	Scenario: Public profile link : empty, exist, change back original
	    I refresh browser
           And Wait 3 seconds
	    I click the element with css selector "#cta-box-profile"
	    I click the element with css selector "[name='services-btn']"

	#empty public link
	    I clear text in element with css selector "[name='profile_code']"
	    I fill in the input with selector "[name='profile_code']" with ""
	    I click the element with css selector "[name='services-btn']"
	        And wait 1 seconds
	    I verify that the element with css selector ".loading-container" has a class "active"
	    ## I verify that the element with css selector "[name='code_checkmark']" has a class "checkmark-add-active"
	    I verify that the element with css selector "[name='code_checkmark']" should not "checkmark-add-active"

	#exist public link : jason
	    I clear text in element with css selector "[name='profile_code']"
	    I fill in the input with selector "[name='profile_code']" with "jason"
	    I click the element with css selector "[name='services-btn']"
	        And wait 1 seconds
	    I verify that the element with css selector ".loading-container" has a class "active"
	    ## I verify that the element with css selector "[name='code_checkmark']" has a class "checkmark-add-active"
	    I verify that the element with css selector "[name='code_checkmark']" should not "checkmark-add-active"

	#changeback original public link : jason1
	    I clear text in element with css selector "[name='profile_code']"
	    I fill in the input with selector "[name='profile_code']" with "jason1"
	    I click the element with css selector "[name='services-btn']"
	        And wait 1 seconds
	    I verify that the element with css selector ".loading-container" should not "active"
	    I verify that the element with css selector "[name='code_checkmark']" has a class "checkmark-add-active"
   

   Scenario: Add a portfolio item
   	   I refresh browser
           And Wait 3 seconds
       I click the element with css selector "#cta-box-profile"
           And Wait 2 seconds
       I click the element with css selector "[name='services-btn']"
       I click the element with css selector "#cta-box-profile-pi-item"
           And Wait 2 seconds
       I fill in the input with selector "[name='new-portfolio'] #course-input-1" with "cs 1"
           And Wait 2 seconds
       I verify that more than 4 elements exist with the selector "[name='course-list'] li a"
       I select the first element with css selector "[name='course-list'] li a"
       I click the element with css selector "[name='new-portfolio'] #save-portfolio-item-button"
           And Wait 1 seconds
       I verify that the element with css selector ".loading-container" has a class "active"

       ########
       #  Instructions
       ########
       # - Follow the spec below for the remainder of the scenario
       # - Understand the mentality I am thinking & why I am doing it this way (you should eventually be able to create same spec yourself)
       # - Think about all the steps you are going to use as you read them

       ########
       #  01. # Test Description
       ########
       # A. Enter a description in the field
       I fill in the input with selector "[name='new-portfolio'] textarea" with "HELLO TESTER"
       # B. Cancel the course by pressing the X button
       I click the element with css selector "[name='course-clear']"
       # C. Verify that the input is empty
       I check input "#course-input-1" contain text ""
       # D. Click submit
       I click the element with css selector "[name='new-portfolio'] #save-portfolio-item-button"
           And Wait 1 seconds
       # E. Test that error msg still shows
       I verify that the element with css selector ".loading-container" has a class "active"

       ########
       #  02. # Test Portfolio Item Creation
       ########
       # A. Re-enter a new biology course by typing "Bio1"
       I fill in the input with selector "#course-input-1" with "general biology lecture"
       # B. Select Bio1A
       I select the first element with css selector "[name='course-list'] li a"
       # C. Confirm that it has been selected
       # I check "[name='select-course'] h2" is "visible"

       # D. Save portfolio item & wait 5 seconds
       I click the element with css selector "[name='new-portfolio'] #save-portfolio-item-button"
           And Wait 5 seconds
       # E. Confirm that the edit course container has disappeared
       # I check ".pf-checklist-add #cta-modal-profile-pi-item" is invisible now
       I verify that the element with css selector "[name='add-course-container']" has a class " hide"
       # F. Confirm that the text "Biology 1A" has been added
       I check list "[name='portfolio-item-course-short_name']" contain text "Biology 1A"
       I click the element with css selector "#guru-profile-cta-close"

   #########
   Scenario: Enable, Deactivate ,and Remove Portfolio Item
	   I refresh browser
	       	And wait 3 seconds
       I click the element with css selector "#cta-box-profile"
    	    And Wait 2 seconds
       I click the element with css selector "[ng-click='activeTabIndex = 0']"
       save current length of list "[ng-repeat='portfolio_item in user.academic_shop.portfolio_items']  a:nth-of-type(2)"

       ##Cancel
       I click the element with css selector "[ng-repeat='portfolio_item in user.academic_shop.portfolio_items']  a:nth-of-type(2)"
       I click the element with css selector "[ng-click='portfolio_item.showRemovePopup = null;']"
           And Wait 3 seconds
       I check "[ng-click='portfolio_item.showRemovePopup = null;']" is "invisible" now

       ##Deactivate
       I click the element with css selector "[ng-repeat='portfolio_item in user.academic_shop.portfolio_items']  a:nth-of-type(2)"
       I click the element with css selector ".button-group-deactivate"
       I verify that the element with css selector ".loading-container" has a class "active"
           And Wait 3 seconds
       I check ".button-group-deactivate" is "invisible" now
       I check "[ng-click='reactivatePortfolioItem(portfolio_item)']" is "visible" now
       ##Enable
       I click the element with css selector "[ng-click='reactivatePortfolioItem(portfolio_item)']"
       I verify that the element with css selector ".loading-container" has a class "active"
           And Wait 3 seconds
       I check "[ng-click='reactivatePortfolioItem(portfolio_item)']" is "visible" now

       #Remove
       I click the element with css selector "[ng-repeat='portfolio_item in user.academic_shop.portfolio_items']  a:nth-of-type(2)"
       I click the element with css selector "[ng-click='removePortfolioItem(portfolio_item)']"
       I verify that the element with css selector ".loading-container" has a class "active"
           And Wait 3 seconds
       check length of list "[ng-repeat='portfolio_item in user.academic_shop.portfolio_items']" is "decreased"

       #close
       I click the element with css selector "#guru-profile-cta-close"
 Scenario: bio description
	   I refresh browser
           And Wait 3 seconds
		 ## Open Profile
		 I click the element with css selector "#cta-box-profile"
		     And Wait 2 seconds
		 I click the element with css selector "[ng-click='activeTabIndex = 0']"

		 ### profile code
		 ## swap to edit profile code 
		 I click the element with css selector "[ng-click='profile.edit_mode = true;']"

		 ## Clear Input of profile code
		 I clear text in element with css selector "[ng-model='user.profile_code']"
		 ## Save the work
		 I click the element with css selector "[ng-click='saveGuruProfile()']"
		 ## wait message
		 ##I verify that the element with css selector ".loading-container" has a class "active"
		 ## Save failed, code empty
		 I check "[ng-click='saveGuruProfile()']" is "visible" now


		 ## Enter the input : samir
		 I fill in the input with selector "[ng-model='user.profile_code']" with "samir"
		 ## Save the work
		 I click the element with css selector "[ng-click='saveGuruProfile()']"
		 ## wait message
		 ##I verify that the element with css selector ".loading-container" has a class "active"
		 ## Save failed, code empty
		 I check "[ng-click='saveGuruProfile()']" is "visible" now

		 ## Clear Input of profile code
		 I clear text in element with css selector "[ng-model='user.profile_code']"
		 ## Enter the input : jason1
		 I fill in the input with selector "[ng-model='user.profile_code']" with "jason1"
		 ## Save the work
		 I click the element with css selector "[ng-click='saveGuruProfile()']"
		 ## wait message
		 ##I verify that the element with css selector ".loading-container" has a class "active"
		 ## Save success
		 I check "[ng-click='saveGuruProfile()']" is "invisible" now

         ###Descriton
         # swap to edit profile code 
         I click the element with css selector "[ng-click='profile.edit_mode = true;']"
         # Clear description 
         I clear text in element with css selector "[ng-model='user.guru_introduction']"

         # Enter Uguru test
         I fill in the input with selector "[ng-model='user.guru_introduction']" with "Uguru test"
         # Save the work 
         I click the element with css selector "[ng-click='saveGuruProfile()']"
         # wait message
         # I verify that the element with css selector ".loading-container" has a class "active"
         ## Save success
         I check "[ng-click='saveGuruProfile()']" is "invisible" now
         # Check description contain "Uguru test"
         I check element "[ng-model='user.guru_introduction']" contain text "Uguru test"

         ##Refresh page and see
         ## Refresh browser
         I refresh browser
         ## Open Profile
         I click the element with css selector "#cta-box-profile"
             And Wait 2 seconds
         I click the element with css selector "[ng-click='activeTabIndex = 0']"
         ## Check description contain "Uguru test"
         I check element "[ng-model='user.guru_introduction']" contain text "Uguru test"
         ## Check code contain "jason1"
         # I check element "[ng-model='user.profile_code']" contain text "jason1"
         # #close
         I click the element with css selector "#guru-profile-cta-close"

  #    Scenario: Edit about tab > updated profile URLS
		# I visit "http://localhost:8100/#/essay-student-home-desktop"
  #         And Wait 3 seconds
  #        ## Open Profile
  #        I click the element with css selector "#cta-box-profile"
  #            And Wait 2 seconds
  #        I click the element with css selector "[name='about-btn']"

	 Scenario Outline: profile social link [0-4]
   	   I refresh browser
		     And Wait 2 seconds
       I click the element with css selector "#cta-box-profile"
	   I click the element with css selector "[name='about-btn']"
       I click the element with css selector "[ng-click='showPagePopup("<socialName>")']"
       I clear text in element with css selector "[ng-model='user.external_profiles_dict.<socialName>']" 
       I fill in the input with selector "[ng-model='user.external_profiles_dict.<socialName>']" with "<value>"
       I click the element with css selector "[ng-click='updateExternalResource("<socialName>", user.external_profiles_dict.<socialName>)']"
             And Wait 1 seconds
       I verify that the element with css selector ".loading-container" has a class "active"
             And Wait 5 seconds
       I check "[ng-click='updateExternalResource("<socialName>", user.external_profiles_dict.<socialName>)']" is "invisible" now
       I click the element with css selector "[ng-click='showPagePopup("<socialName>")']"
       I check element "[ng-model='user.external_profiles_dict.<socialName>']" contain text "<value>"
       I click the element with css selector "[ng-click='updateExternalResource("<socialName>", user.external_profiles_dict.<socialName>)']"
             And Wait 5 seconds
       I click the element with css selector "#guru-profile-cta-close"
   
         Examples:
           | socialName    | value |
           | linkedin      | uguru |
           | facebook      | uguru |
           | twitter       | uguru |
           | instagram     | uguru | 


##Guru about profile :
  Scenario: Guru profile dropdown for alumni, year, and major
	   I refresh browser
	     And Wait 2 seconds
      ## Open Profile
      I click the element with css selector "#cta-box-profile"
          And Wait 2 seconds
      I click the element with css selector "[name='about-btn']"

      ## alumni
      I click the element with css selector "[name='alumni-btn']"
          And Wait 1 seconds
      # I verify that the selector "[name='alumn-dropdown'] li" contains 1 element
      I click the element with css selector "[name='alumni-dropdown'] li"
      I verify that the element with css selector ".loading-container" has a class "active"
      I click the element with css selector "[name='alumni-btn']"
      # year
      I click the element with css selector "[name='year-btn']"
          And Wait 1 seconds
      #I verify that the selector "[name='alumn-dropdown'] li" contains 6 element
      I click the element with css selector "[name='year-dropdown'] li"
      I verify that the element with css selector ".loading-container" has a class "active"
      I click the element with css selector "[name='year-btn']"
      # major
      I clear text in element with css selector "[name='userMajor-input']"
      I fill in the input with selector "[name='userMajor-input']" with "uguru"
      I verify that the element with css selector "[name='alumni-dropdown']" should not " active"
      I verify that the element with css selector "[name='year-dropdown']" should not " active"
        And Wait 2 seconds
      I click the element with css selector "#guru-profile-cta-close"

      I refresh browser
          And Wait 2 seconds
      ## Open Profile
      I click the element with css selector "#cta-box-profile"
          And Wait 2 seconds
      I click the element with css selector "[name='about-btn']"
      I check input "[name='userMajor-input']" contain text "uguru"
      I click the element with css selector "#guru-profile-cta-close"

  Scenario Outline: communication && currency test [0-1]
  	   I refresh browser
  	     And Wait 2 seconds  
  	   I click the element with css selector "#cta-box-profile"
  	       And Wait 2 seconds
  	   I click the element with css selector "[name='about-btn']"

       I loop and click on list element by css selector "<checkboxType> input" by <count> time
       I refresh browser
           And Wait 2 seconds
       I click the element with css selector "#cta-box-profile"
           And Wait 2 seconds
       I click the element with css selector "[name='about-btn']"
       I check the input "<checkboxType> input" which has checkmark is equal <count>
       I loop and click on list element by css selector "<checkboxType> input" by <count> time

         Examples:
           | checkboxType                | count |
           | [name='communication-check']| 3     |
           | [name='currency-check']     | 5     |

  Scenario: Experience: add,edit,remove ,and edge test
  	  I refresh browser
  	    And Wait 2 seconds  
      ## Open Profile
      save current length of list "[name='exp-list'] li"
      I click the element with css selector "#cta-box-profile"
          And Wait 2 seconds
      I click the element with css selector "[name='about-btn']"
      I click the element with css selector "[name='exp-add-btn']"
          And Wait 1 seconds

      I fill in the input with selector "[name='exp-title']" with "Uguru"
      I selet range of the selector "[name='exp-year']" by 5

      I fill in the input with selector "[name='exp-descp']" with "Uguru Tester"
      I click the element with css selector "[name='save-btn']"
      I verify that the element with css selector ".loading-container" has a class "active"
          And Wait 2 seconds
      check length of list "[name='exp-list'] li" is "increased"

  	# edit experience
      I click the element with css selector "[name='exp-list'] li"
      I clear text in element with css selector "[name='exp-title']"
      I fill in the input with selector "[name='exp-title']" with "Uguru Edit"
     
      I clear text in element with css selector "[name='exp-descp']"
      I fill in the input with selector "[name='exp-descp']" with "Uguru edit Tester"
      I click the element with css selector "[name='update-btn']"
      I verify that the element with css selector ".loading-container" has a class "active"

  	# remove experience
      save current length of list "[name='exp-list'] li"
      I click the element with css selector "[name='remove-btn']"
      I verify that the element with css selector ".loading-container" has a class "active"
          And Wait 1 seconds
      check length of list "[name='exp-list'] li" is "decreased"

  	# Edge test
      I click the element with css selector "[name='exp-list'] li"
      I click the element with css selector "[name='exp-close-btn']"
      I click the element with css selector "[name='exp-add-btn']"
      I check element "[name='exp-close-btn']" contain text "add an experience"
      I check input "[name='exp-title']" contain text ""
      I check input "[name='exp-descp']" contain text ""
    
    # Refresh browser and see list is updated
      I refresh browser
          And Wait 2 seconds
      ## Open Profile
      I click the element with css selector "#cta-box-profile"
          And Wait 2 seconds
      I click the element with css selector "[name='about-btn']"
      check length of list "[name='exp-list'] li" is "decreased"

      I click the element with css selector "#guru-profile-cta-close"

  Scenario: Language : add, search, remove, and check updated
		I refresh browser
		  And Wait 2 seconds  
		I click the element with css selector "#cta-box-profile"
	  	I click the element with css selector "[name='lang-add-btn']"
	  	save current length of list "[name='lang-usr-list'] li a"
	      I verify that more than 4 elements exist with the selector "[name='lang-list'] li a"
	  	I click the element with css selector "[name='lang-list'] li a"
	  	I verify that the element with css selector ".loading-container" has a class "active"
	  	    And Wait 2 seconds
	  	check length of list "[name='lang-usr-list'] li" is "increased"

	#Search language : English
	  	save current length of list "[name='lang-usr-list'] li a"
	  	I fill in the input with selector "[name='lang-input']" with "English"
			I verify that the selector "[name='lang-list'] li a" contains 1 element
	  	I click the element with css selector "[name='lang-list'] li a"
	  	I check input "[name='lang-input']" contain text ""
	  	I verify that the element with css selector ".loading-container" has a class "active"
	  	    And Wait 2 seconds
	  	check length of list "[name='lang-usr-list'] li" is "increased"

    #Remove language
	    save current length of list "[name='lang-usr-list'] li a"
	  	I click the element with css selector "[name='lang-usr-list'] li a"
	  	I verify that the element with css selector ".loading-container" has a class "active"
	  	    And Wait 2 seconds
	    check length of list "[name='lang-usr-list'] li" is "decreased"

  # refresh browser and see data is updated
	    I refresh browser
	        And Wait 2 seconds
	    I click the element with css selector "#cta-box-profile"
	        And Wait 2 seconds
	    I click the element with css selector "[name='about-btn']"
	    I click the element with css selector "[name='lang-add-btn']"
	    I verify that the selector "[name='lang-usr-list'] li a" contains 1 element
	    I click the element with css selector "[name='lang-usr-list'] li a"

	    I click the element with css selector "#guru-profile-cta-close"



  Scenario: Settings
  	  I refresh browser
  	    And Wait 2 seconds  
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
      I verify that the url contains "guru"


 
# Credibility
   Scenario: Credibility
   		I visit "http://localhost:8100/#/guru"
		 # Scenario: Transcript test
		 #     I click the element with css selector "#cta-box-credibility"
		 #     I click the element with css selector "[name='active-credit']"
		 #         And wait 1 seconds
		 #     Implenent a file attachment to "#file-input-guru-add-transcript" 
		 #         And wait 5 seconds
		 #     I verify that the element with css selector ".loading-container" has a class "active"
		 #     I check element "#credit-progress .ng-binding" contain text "2/5"
		 #     I click the element with css selector "#desktop-credibility header .cta-modal-close"
		 #     I check element "#credit-progress .ng-binding" contain text "40%"


		# Scenario: Facebook test- login a facebook account
		#      I click the element with css selector "#cta-box-credibility"
		#      I click the element with css selector "[ng-click="connectWithFacebook()"]"
		#      S-TODO : I login my Facebook account
		#      S-TODO : I look at "#credit-progress .ng-binding" has text "equal" : "2/5" 
		#      I click the element with css selector "#desktop-credibility header .cta-modal-close"
		#      S-TODO : I look at "#cta-box-credibility .credibility-percent" has text "equal" : "40%" 
		#      J-TODO : combine above 2 to : close credibility and see percent is "40%"
   # Phone test - add a phone number
	   I refresh browser
   	     And Wait 2 seconds  
       I click the element with css selector "#cta-box-credibility"
           And wait 1 seconds
       I click the element with css selector "[name='active-phone']"
           And wait 2 seconds
       I clear text in element with css selector "#phone-number-input"
       I fill in the input with selector "#phone-number-input" with "4085945188"
       I click the element with css selector "#send-confirm-code"
       I verify that the element with css selector ".loading-container" has a class "active"
           And Wait 2 seconds
       I check element "#credit-progress .ng-binding" contain text "2/5"
           And Wait 5 seconds
       I click the element with css selector "[name='credibility-close']"
       I check element "#credit-progress .ng-binding" contain text "40%"
           And wait 1 seconds

   # Email test - add an Email address
       I click the element with css selector "#cta-box-credibility"
           And wait 1 seconds
       I click the element with css selector "[name='active-email']"
           And wait 2 seconds
       I clear text in element with css selector "#user-confirm-email-input"
       I fill in the input with selector "#user-confirm-email-input" with "jasontest@uguru.me"
       I click the element with css selector "#confirm-email-save-popup-linkx"
       I verify that the element with css selector ".loading-container" has a class "active"
           And Wait 2 seconds
       I check element "#credit-progress .ng-binding" contain text "2/5"
           And Wait 5 seconds
       I click the element with css selector "[name='credibility-close']"
       I check element "#credit-progress .ng-binding" contain text "40%"
           And wait 1 seconds

   # experience test - add Open Exp and edit it and then close it
       I click the element with css selector "#cta-box-credibility"
       I click the element with css selector "[name='active-exp']"
       I click the element with css selector ".modal-backdrop.active [name='exp-close-btn']"
       I click the element with css selector "[name='active-exp']"
            And wait 1 seconds

       I fill in the input with selector "[name='exp-title']" with "Uguru"
       I selet range of the selector "[name='exp-year']" by 5
       I fill in the input with selector "[name='exp-descp']" with "Uguru Tester"
       I click the element with css selector "[name='save-btn']"
       I verify that the element with css selector ".loading-container" has a class "active"
           And Wait 2 seconds
       I check element "#credit-progress .ng-binding" contain text "3/5"
       I click the element with css selector "[name='credibility-close']"
       I check element "#credit-progress .ng-binding" contain text "40%"

#Card 
  Scenario Outline: Add card [0-4]
      #refresh
      I refresh browser
          And wait 5 seconds
      #open
      I click the element with css selector "#cta-box-balance"
          And wait 3 seconds
      #add new card
      I click the element with css selector "#cta-box-payments"
          And wait 3 seconds
      #add card number
      I clear text in element with css selector "#card-number"
      I fill in the input with selector "#card-number" with "<cardNum>"
      #add expire date
      I clear text in element with css selector "#exp-date"
      I fill in the input with selector "#exp-date" with "09/2016"
      #submit 
      I click the element with css selector "[name='save_card-btn']"
      #wait
          And wait 3 seconds
      #result number
      I verify that the selector "[name='cards'] li" contains <result> element
      I verify that the element with css selector "#cta-modal-payments" should not " show"

      Examples:
        | cardNum          | result |
        | 4242424242424242 | 0      |
        | 4012888888881881 | 0      |
        | 4000056655665556 | 1      |
        | 5200828282828210 | 2      |

  Scenario: Default card
      #Open last card
      I click the element with css selector ".balance-cards li:nth-child(2)"
      #Select Default
      I click the element with css selector "name='default_card-btn']"
      #wait
          And wait 3 seconds
      #Check the last has Default    
      I check element ".balance-cards li:nth-child(2) strong" contain text "DEFAULT"

  Scenario Outline: Remove all the card [0-1]
      #refresh
      I refresh browser
        And wait 5 seconds
      #open
      I click the element with css selector "#cta-box-balance"
        And wait 3 seconds
      #select exist card
      I click the element with css selector ".balance-cards li:nth-child(1)"
      #select removed
      I click the element with css selector "[name='remove_card-btn']"
      #wait
          And wait 2 seconds
      #result number
      I verify that the selector "[name='cards'] li" contains <result> element
      I verify that the element with css selector "#cta-modal-payments" should not " show"

      Examples:
      |result |
      |1      |
      |0      |

  Scenario: Logoff
      I click the element with css selector "#top-settings"
      I click the element with css selector "[name='logout']"

