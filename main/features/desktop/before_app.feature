Feature: Before app + signup/login
    Scenario: init the app
        I start the args browser with args size
        I visit "localhost:8100/#/university"

    Scenario Outline: check signup button disable [0-1]
        I visit "localhost:8100/#/university"
        I click the element with css selector "#access-footer"
            And wait 1 seconds
        I click the element with css selector "<btn>"
        I verify that the element with css selector ".loading-container" has a class "active"
            And wait 1 seconds
        I verify that the url contains "university"
        Examples:
        |       btn             |
        | [name='switchSignup'] |
        | [name='grantAccess']  |
    Scenario: check create Account disable
        I visit "localhost:8100/#/university"
        I verify element "[name='createAccount']" does not exist
    
    Scenario Outline: check signup button disable [0-4]
        I visit "localhost:8100/#/university"
        I fill in the input with selector "#desktop-access-code-bar" with "<input>"
        I verify that the element with css selector ".loading-container" has a class "active"
            And wait 1 seconds
        I verify that the url contains "university"

        Examples:
        | input |
        |       |
        | "Hi"  |
        | "cccc"|

    Scenario: access -> university page
        I fill in the input with selector "#desktop-access-code-bar" with "cool"
        I verify that more than 4 elements exist with the selectr "#school-list li"
        I fill in the input with selectr "#university-input" with "university of california at berkeley"
        I verify that the selector "#school-list li a" contains 1 element
        I click the element with css selector "[name='reset-input']"

