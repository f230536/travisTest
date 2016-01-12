Feature: Credibility testing
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

    Scenario Outline: Add card [0-4]
        #refresh
        I refresh browser
            And wait 5 seconds
        #open
        I click the element with css selector "[name='active-side']"
        I click the element with css selector "[name='payment-model']"
            And wait 3 seconds
        #add new card
        I click the element with css selector "[name='add_card_modal-btn']"
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
        I verify that the selector ".modal-backdrop.active" contains 1 element
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
        I click the element with css selector "[name='default_card-btn']"
        #wait
            And wait 3 seconds
        #Check the last has Default    
        I check element ".balance-cards li:nth-child(2) strong" contain text "DEFAULT"

    Scenario Outline: Remove all the card [0-1]
        #refresh
        I refresh browser
            And wait 5 seconds
        #open
        I click the element with css selector "[name='active-side']"
        I click the element with css selector "[name='payment-model']"
            And wait 3 seconds
        #select exist card
        I click the element with css selector ".balance-cards li:nth-child(1)"
        #select removed
        I click the element with css selector "[name='remove_card-btn']"
        #wait
            And wait 2 seconds
        #result number
        I verify that the selector "[name='cards'] li" contains <result> element
        I verify that the selector ".modal-backdrop.active" contains 1 element

        Examples:
        |result |
        |1      |
        |0      |


