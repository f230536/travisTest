Feature: Student home page is testing all the button is working
   Scenario: access code page
        I start the args browser with args size
        # I visit "http://localhost:8100/#/university"
        I visit "https://uguru.me/static/remote/index.html?version=1.081235#/university"

        I click the element with css selector "[ng-click="goToLoginFromAccess()"]"
          And wait 1 seconds

    Scenario: Login User
        I fill in the input with selector "[ng-model='signupForm.email']" with "Jason@uguru.me"
        I fill in the input with selector "[ng-model='signupForm.password']" with "launchuguru123"
        I click the element with css selector "[ng-click='loginUser()']"
            And wait 2 seconds
        I verify that the url contains "guru"
        I click the element with css selector "#top-settings"
        I click the element with css selector "[name='student-btn']"
            And wait 2 seconds
        I verify that the url contains "student-home"

    Scenario Outline: Billing, Support, Request, Add Course CTA check exist [0-4]
        I click the element with css selector "<cta_btn>"
            And wait 1 seconds
        I verify that the element with css selector "<cta_modal>" has a class " show"
        I click the element with css selector "<cta_modal> <close_btn>"
            And wait 1 seconds
        I verify that the element with css selector "<cta_modal>" should not " show"

         Examples:
         | cta_btn                  | cta_modal                 | close_btn                                                 |
         | #cta-box-billing         | #cta-modal-billing        | a:nth-child(2)                                            |
         | #cta-box-content         | #cta-modal-content        | .cta-modal-close.close-button.desktop-header-next         |   
         | #cta-box-student-request | #cta-modal-student-request| .cta-modal-close.desktop-header-next.desktop-header-close |
         | #cta-box-student-courses | #cta-modal-student-courses| .cta-modal-close.desktop-header-next.desktop-header-close |  
         | #cta-box-referrals       | #desktop-referrals        | .cta-modal-close.close-button.desktop-header-next         |

    Scenario Outline: Term FAQ Modal [0-2]
        I click the element with css selector "#top-settings"
        I click the element with css selector "[name='<modal_btn>']"
            And wait 1 seconds
        I click the element with css selector ".modal-backdrop.active a"
            And wait 1 seconds
        I verify element ".modal-backdrop.active" does not exist

         Examples:
         | modal_btn | 
         | privacy   | 
         | faq       |
    
    Scenario: Account setting view 
        I click the element with css selector "#top-settings"
        I click the element with css selector "[name='setting']"
        I click the element with css selector "[name='save-setting']"
        I check "[name='edit-name']" is invisible now

    Scenario: Account setting view 
        I click the element with css selector "#top-settings"
        I click the element with css selector "[name='setting']"
        I click the element with css selector "[name='goBackHome']"
        I verify that the url contains "student-home"

