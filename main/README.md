### Run the tests
1. [for clicks] I click the element with css selector "#cta-box-profile-pi-item"
    And Wait 2 seconds
2. [For inputs] I fill in the input with selector "#password" with "launchuguru123"

Restructure the files in this format

##### Feature
- No more than 5 scenarios
- No more than 5 words for title

##### Scenario
- Should not have more than 10 steps. Otherwies it should be two scenarios
- Should follow "for-loop" pattern, which is called scenario outline

##### Structure
- Feature: Credibility
    Scenario: Test phone number
    Scenario: Upload transcript
    Scenario: ... etc


1.
- Feature: Edit Profile Item
    Scenario: Add a portfolio item
    Scenario: Edit a portfolio item

2.
- Feature: Settings
    [ ] Scenario: "Edit your email"
    [ ] Scenario: "Change your password"
    [ ] Scenario: "Change your university"
    [ ] Scenario: "Change your name"

3.
- Feature: Edit Profile Item
    Scenario: Add a portfolio item
    Scenario: Edit a portfolio item