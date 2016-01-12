Feature: DesktopVersion
Scenario: Make sure all homepage functionality is working
	Given I go to "http://localhost:5000"
	And I click "STUDENTS"
    The browsers URL should contain "remote/index.html#/""
