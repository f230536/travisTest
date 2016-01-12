Feature: I should see a link containing
    Scenario: Everything fires up

        Start the args browser with size 320 by 480
        # I fill in the input with name "access-code-bar" with "cool" and press enter

        # ## dont need this one anymore
        # I click "redeem" button

        # ### don't worry about university
        # I should see "Verfiy" message , and a list of "university" are shown


        # ## Use send keys and press enter
        # I fill in the input with name "university" with "berkeley"

        # After the "univerity" list is filter by the name, then I click "berkeley" in the list



        # The "univerity" list is filter by the name, then I click "berkeley" in the list

        # Then I saw the loading screen with message "Loading an awesome experience.."
        # I see a page ask me to "add coures", and a list of "course" are shown
        # I fill in the input with name "course" with "CS100"
        # After the "course" list is filter by the name, then I click "CS100" in the list

    ## Missing --> Loader page in between with
        I visit "localhost:8100/#/university"
        I set the window size to 800 by 400
        Fill in input "#access-code-bar" with "cool",and enter

        I search and select university : "Berkeley"

    Scenario: Become guru
        I add course "math1a"
        I add course "math1b"
        I add course "CS170"
        I click the element with css selector "[ng-click="nextSlide()"]"
        I select "cake" in "baking" section
        I click the element with css selector "#category-skills [ng-click="nextSlide()"]"
        # I upload a photo,
        # I should see "Awesome! You're all set." message
        I click the element with css selector "#photo [ng-click="goToGuruMode()"]"
    Scenario: Become guru
        I sign up a new account
