Feature: Guru edits their profile for the first time
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



    Scenario: Add a portfolio item
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

    #########
    Scenario: bio description
    #     ## Open Profile
    #     I click the element with css selector "#cta-box-profile"
    #         And Wait 2 seconds
    #     I click the element with css selector "[ng-click='activeTabIndex = 0']"

    #     ### profile code
    #     ## swap to edit profile code 
    #     I click the element with css selector "[ng-click='profile.edit_mode = true;']"

    #     ## Clear Input of profile code
    #     I clear text in element with css selector "[ng-model='user.profile_code']"
    #     ## Save the work
    #     I click the element with css selector "[ng-click='saveGuruProfile()']"
    #     ## wait message
    #     ##I verify that the element with css selector ".loading-container" has a class "active"
    #     ## Save failed, code empty
    #     I check "[ng-click='saveGuruProfile()']" is "visible" now


    #     ## Enter the input : samir
    #     I fill in the input with selector "[ng-model='user.profile_code']" with "samir"
    #     ## Save the work
    #     I click the element with css selector "[ng-click='saveGuruProfile()']"
    #     ## wait message
    #     ##I verify that the element with css selector ".loading-container" has a class "active"
    #     ## Save failed, code empty
    #     I check "[ng-click='saveGuruProfile()']" is "visible" now

    #     ## Clear Input of profile code
    #     I clear text in element with css selector "[ng-model='user.profile_code']"
    #     ## Enter the input : jason1
    #     I fill in the input with selector "[ng-model='user.profile_code']" with "jason1"
    #     ## Save the work
    #     I click the element with css selector "[ng-click='saveGuruProfile()']"
    #     ## wait message
    #     ##I verify that the element with css selector ".loading-container" has a class "active"
    #     ## Save success
    #     I check "[ng-click='saveGuruProfile()']" is "invisible" now

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

#########
    #New Scenario: Edit Portfolio Item
        ########
        #  03. # Set the price
        ########
        # --- play with the localhost:8100 && try to create steps yourself (USING COMMENTS)
        # ---- CHECKIN && Show me your
        # -------- 1. New steps that need to be implemented to create this (i.e. for example, "dragging the slider")
        # -------- 2. Prove to me that your spec tests it 100% -- the goal is I should not be able to suggest anymore steps that you have missed

        # try submitting
    #########
    ## New Scenario: Add, remove, edit tags
        ########

    #########
    ## New Scenario: Add resources
        ########
       

    #########
    ## New Scenario: Edit about tab > updated profile URLS
        ########
        ## Repeat for linkedin, instagram, twitter
        ## A. Open linkedin Popup
        ## B. Enter
        
    Scenario: Edit about tab > updated profile URLS

        ## Open Profile
        I click the element with css selector "#cta-box-profile"
            And Wait 2 seconds
        I click the element with css selector "[name='about-btn']"

    Scenario Outline: Factorials [0-4]

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

        Examples:
          | socialName    | value |
          | linkedin      | uguru |
          | facebook      | uguru |
          | twitter       | uguru |
          | instagram     | uguru | 

        # #close
    Scenario:  close profile
        I click the element with css selector "#guru-profile-cta-close"

    Scenario: Edit a portfolio item > tags
        # 1 click the input course
        # I added multiple tags
        # click save
        # refresh
        # edit the same course
        # make sure those tags still exist

    Scenario: Edit a portfolio item > remove tags
        # 1 click the input course
        # I remove multiple tags by clicking
        # click save
        # refresh
        # edit the same course
        # make sure those tags still exist

    Scenario: Edit price > refresh
        # 1 click the input course
        # I remove multiple tags by clicking
        # click save
        # refresh
        # edit the same course
        # make sure those tags still exist




    # 78
    # Scenario: Update external URLs

    #     I click the element with css selector "#linkedin-icon"
    #     I wait 1 second
    #     I verify the element with css selector "#linkedin-tooltip" is visible
    #     Jason - turn this into a scenario outline (http://lettuce.it/tutorial/scenario-outlines.html)

    #     I click the element with css selector "#fbprofile-icon"
    #     I wait 1 second
    #     I verify the element with css selector "#fbprofile-tooltip" is visible


    #     I click the element with css selector "#twitter-tooltip"
    #     I wait 1 second
    #     I verify the element with css selector "#twitter-tooltip" is visible


    #     I click the element with css selector "#custom-icon"
    #     I wait 1 second
    #     I click the element with css selector "#custom-tooltip"

        ## edit mode vs profile mode
        ## On way home (Jason, Jeselle)
            # _


        # 2. Initial user account model + update actual Gurus
            #  academic shop conversion
            #  guru courses --> portoflio items
            #  portfolio specific

        # 6. Messaging
        # 7. Scrape all courses

        # Jason (exact chores)

        ## Jeselle
        # - Gabrielle + Samir discuss / simplify current homepage
        # - High School Essay Spec
        # - Apply Page
        # - Virality loop

        ## Samir todo
        # - calendar
            # - calendar grid
            # - calendar.js
                # - add event
                # - scroll to time directive
                # - update event
                # - remove event
                # - getNextWeek()
        # - school email confirmed
