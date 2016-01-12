Feature: Admin Login
    Scenario: Login through admin dashboard
        I visit "https://uguru.me/admin"
        I set the window size to 1600 by 1050
        admin login "5919"

    Scenario: Setting account info
    	I click the element with css selector "#top-settings"
		I click the element with css selector "[ng-click="goToDesktopSettings()"]"
	    