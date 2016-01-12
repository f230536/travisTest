Feature: become Guru
    Scenario: Go to essay-home and wait 5 to see the become guru button is shown
        I start the args browser with args size
        I visit "http://localhost:8100/#/essay-home"
            And wait 5 seconds
        I verify that the element with css selector "#become-guru-essay-header" has a class " show"
        I click the element with css selector "#become-guru-essay-header a"
            And wait 1 seconds
   Scenario: Search university
        I fill in the input with selector "#university-input" with "stanford"
        I verify that the selector "#school-list li a" contains 1 element
        I click the element with css selector "[name='reset-input']"
        I check input "#university-input" contain text ""
        I verify that more than 4 elements exist with the selector "#school-list li a"
   Scenario: re-select university
        I check input "#university-input" contain text ""
        I click the element with css selector "#become-guru-essay-header a"

