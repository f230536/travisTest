Feature: Credibility testing
   Scenario: Admin login
        I visit "https://uguru.me/app" with size 400x700 args browser 
        I login with my admin account
        I click the element with css selector "#cta-box-credibility"
        S-TODO : I look at "#cta-box-credibility .credibility-percent" has text "equal" : "0%" 

   Scenario: Transcript test
       I click the element with css selector "#cta-box-credibility"
        I click the element with css selector "[ng-click="showActionSheetTranscriptPhoto()"]"
        S-TODO : Implenent a file attachment to "#file-input-web-sidebar" 
        S-TODO : [Bug] unable to cancel / upload photo  action sheet
        I click the element with css selector ".modal-backdrop.active .header-close"
        S-TODO : I look at "#cta-box-credibility .credibility-percent" has text "equal" : "20%" 
        J-TODO : combine above 2 to : close credibility and see percent is "20%"


   Scenario: Facebook test
        I click the element with css selector "#cta-box-credibility"
        I click the element with css selector "[ng-click="activeTabIndex = 1;"]"
        I click the element with css selector "[ng-click="connectWithFacebook()"]"
        S-TODO : I login my Facebook account
        I click the element with css selector ".modal-backdrop.active .header-close"
        S-TODO : I look at "#cta-box-credibility .credibility-percent" has text "equal" : "40%" 
        J-TODO : combine above 2 to : close credibility and see percent is "40%"

    Scenario: Phone test
        I click the element with css selector "#cta-box-credibility"
        I click the element with css selector "[ng-click="activeTabIndex = 2;"]"
        I click the element with css selector "[ng-click="confirmPhonePopup($event)"]"
        I fill in the input with selector "#phone-number-input" with "4085945188"
        I click the element with css selector "#send-confirm-code"
        S-TODO : I look at "#cta-box-credibility .credibility-percent" has text "equal" : "40%" 
        J-TODO : combine above 2 to : close credibility and see percent is "40%"

    Scenario: Email test
        I click the element with css selector "#cta-box-credibility"
        I click the element with css selector "[ng-click="activeTabIndex = 3;"]"
        I click the element with css selector "[ng-click="launchConfirmEmailPopup()"]"
        I fill in the input with selector "#user-confirm-email-input" with "jasontest@uguru.me
        I click the element with css selector "#send-confirm-code"
        I click the element with css selector ".modal-backdrop.active .header-close"
        S-TODO : I look at "#cta-box-credibility .credibility-percent" has text "equal" : "40%" 
        J-TODO : combine above 2 to : close credibility and see percent is "40%"

    Scenario: Transcript test
        I click the element with css selector "#cta-box-credibility"
        I click the element with css selector "[ng-click="activeTabIndex = 4;"]"
        I click the element with css selector "[ng-click="launchAddGuruExperienceModal()"]"
        I click the element with css selector "[ng-click="closeGuruExperience()"]"
        I click the element with css selector "[ng-click="launchAddGuruExperienceModal()"]"
        I fill in the input with selector "[ng-model="experience.name"]" with "SE"
        I fill in the input with selector "[ng-model="experience.description"]" with "EASY jooob"
        I click the element with css selector "[ng-click="saveGuruExperience()"]"
        S-TODO : text of save button CSS position is incorrect too close to the botton of button
        I click the element with css selector ".modal-backdrop.active .header-close"
        S-TODO : I look at "#cta-box-credibility .credibility-percent" has text "equal" : "60%" 