### Run tests
```
# General
==============================================================================
=====          PLEASE MERGE MY BRANCH (jason-dev) AT guru REPO.         ======
=====  OR THE TEST MIGHT ALL FAIL SINCE IT CAN'T FIND THE ELEMENT NAME  ======
==============================================================================

>> lettuce features/ANYFEATUREFILE.feature BROWSER_NAME[chrome, firefox, safari] BROWSER_SIZE[mobile-(s,m,lg,xl), desktop-(s,md,lg)]

```

### Setup test suite

1. Install Selenium  <br />
```>> sudo pip install -r requirements.txt```

2.[Option] Install phantom.js <br />
```>> npm install -g phantomjs```

3. Tests that it works <br />
```
>> cd play
>> lettuce

```

### Test you might want to run


# To run all the test on Guru page
lettuce -v 2 features/desktop/guru.feature chrome BROWSER-SIZE
# To run all the test for Essay page
lettuce -v 2 features/desktop/essay.feature chrome BROWSER-SIZE


### Option for running lettuce 


VERBOSITY LEVEL 
======================

-v 1 :  dots for each feature¶
-v 2 :  scenario names [most of time you using]
-v 3 :  full feature print, but colorless 
-v 4 :  full feature print, but colorful [If you want to see detail of the steps in the test]

SCENARIOS TO RUN
=======================
In case you just want to run specific Scenarios, however [1,2] scenario are the required.
User comma to separated the list  
EX:

Content of Scenario in feature

##guru.feature - Desktop

REQUIREMENT TO RUN ```-s 1,2 ,#SCENARIO YOU WANT TO RUN```
EX:
lettuce -v 4 -s 1,2,3,18 features/desktop/guru.feature firefox desktop-m
lettuce -v 2 features/desktop/guru.feature chrome desktop-lg
lettuce -v 4 -s 1,2,6,9,18 features/desktop/guru.feature safari desktop-s  

------------------------
1 : access code page

2 : Login User

3 : Billing

4 : Public profile link : empty, exist, change back original

5 : Add a portfolio item

6 : Enable, Deactivate ,and Remove Portfolio Item

7 : bio description

8 : profile social link [0-4]  

9 : Guru profile dropdown for alumni, year, and major

10: communication && currency test [0-1]

11: Experience: add,edit,remove ,and edge test

12: Language : add, search, remove, and check updated

13: Settings

14: Credibility

15: Add card [0-4]

16: Default card

17: Remove all the card [0-1]

18: Logoff

#essay.feature
REQUIREMENT TO RUN ```-s 1,2,4,#SCENARIO YOU WANT TO RUN```
EX:
lettuce -v 4 -s 1,2,4,8features/desktop/guru.feature safari desktop-m
lettuce -v 2 features/desktop/guru.feature chrome desktop-lg
lettuce -v 4 -s 1,2,4,7,8 features/desktop/guru.feature firefox desktop-s  

------------------------
1: Go to essay-home and wait 7 to see the become guru button is shown
     
2: Add University
    
3: login exist account
    
4: sign up with new account
    
5: Settings
    
6: Timeline
    
7: Add modify/university
    
8: Logoff
    
    
SUPPORTED BROWSER SIZE:
=======================
mobile-s, mobile-m, mobile-lg, mobile-xl, desktop-s, desktop-m, desktop-lg


### Run Safari webdriver
1. Download Safari webdriver  <br />
```http://selenium-release.storage.googleapis.com/2.48/SafariDriver.safariextz```

2. Open the file to install ,and open safari browser -> perference -> extensions -> make sure the 'Webdriver' is enable <br />


3. Open standalone at home folder (tests) at new tab termal
```java -jar standalone.jar```

4. Run the test <br />
```lettuce -v 1 xxxxxxxxxx.feature browserName desktop-m```







Common Failure You Might See
-----------------------------
1. FAILED: I verify that the element with css selector ".loading-container" has a class "active"
   - That mean there support to have a loading screen or message show up, but it doesn't
2. FAILED: I click the element with css selector "xxxxxxxxx"
   - That mean unable to find the element to click it


















### Table of Contents

* /main ## for main tests
* /play ## sandbox environment to screw around

### Helpful resources
1. [**Quora** Best higher level practice](https://www.quora.com/What-are-the-best-practices-for-maintaining-the-testing-framework-using-selenium-webdriver-using-Java)
2. [Understanding **Remote Driver** vs **WebDriver**] (http://www.guru99.com/introduction-webdriver-comparison-selenium-rc.html)
3. [**Understanding Lettuce**](https://testingbot.com/support/getting-started/lettuce.html)
4. [**Best tools for IOS UI Automation**] (https://github.com/alexmx/ios-ui-automation-overview)
5. [**Benchmarking Example**] (https://realpython.com/blog/python/headless-selenium-testing-with-python-and-phantomjs/)
6. Tutorials to get started
   * 1. Read the code inside these files
   ```
   play
      -- features
         -- zero.feature
         -- terrain.py
         -- steps.py
   ```  <br />
   * 2. Understand [how lettuce works] (http://lettuce.it/tutorial/simple.html#c-run-and-watch-it-fail) <br /> *(feel free to create your own folder within play to message around)*  <br />
   * 3. Do **chapter 2** of [selenium python webdriver] (http://selenium-python.readthedocs.org/getting-started.html) docs