Feature: highschool student search, remove, and add their university
    Scenario: Go to essay-home and wait 7 to see the become guru button is shown
        I start the args browser with args size
        I visit "http://localhost:8100/#/essay-home"
            And wait 7 seconds
        I verify that the element with css selector "#essay-home-banner" has a class " show"
        I click the element with css selector "[name='becomeguru-btn']"

            And wait 1 seconds
        I click the element with css selector "[name='goBackStudentEssay']"
        I click the element with css selector "[name='guru-essay-hdeader-close']"
        I click the element with css selector "[name='start-btn']"
        I verify that the selector "[name='university-list']" contains 8 element
    
    Scenario Outline: Search ,check reset input button , add university
        I fill in the input with selector "#university-input" with "<universityName>"
        I verify that the element with css selector "[for='university-input']" has a class " active"
        I check input "#university-input" contain text "<universityName>"
        I click the element with css selector "[name='university_input-reset']"
            And wait 1 seconds
        I check input "#university-input" contain text ""
        I fill in the input with selector "#university-input" with "<universityName>"
            And wait 1 seconds
        I verify that the selector "[name='university-list']" contains 1 element
        I click the element with css selector "[name='university-list'] input"
        I check input "#university-input" contain text ""
        Examples:
          | universityName        | 
          | berkeley              | 
          | stanford              | 

    Scenario: Remove all select university
        I verify that the element with css selector "[name='add_university_list-btn']" has a class " show"
        I click the element with css selector "[name='add_university_list-btn']"
        I verify that the element with css selector "[name='search-bar']" has a class " hide"
        I verify that the element with css selector "[name='add_university_list-btn']" should not " show"
        I verify that the element with css selector "[name='back_university_list-btn']" has a class " show"
        I verify that the selector "[name='university-list']" contains 2 element
        I click the element with css selector "[name='selected_university-list'] input"
        I click the element with css selector "[name='selected_university-list'] input"

    Scenario: Add University
        I clear text in element with css selector "#university-input"
        I verify that the selector "[name='university-list']" contains 8 element
        I click the element with css selector "[name='university-list'] input"
        I click the element with css selector "[name='university-list'] input"
        I verify that the selector "[name='university-list']" contains 8 element
        I verify that the element with css selector "[name='add_university_list-btn']" has a class " show"

