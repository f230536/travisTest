from lettuce import before, after, world, step
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from lettuce_webdriver.util import *
from lib.clients import initiateChromeWithSize, getWidthHeightFromCMDArgs
from nose.tools import assert_equals
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import WebDriverException
import os, sys, time
from selenium.common.exceptions import TimeoutException

#jason's work
@step('test university : "(.*?)"')
def checkPosition(step,text):
    window_args = ['mobile-s', 'mobile-m', 'mobile-lg', 'mobile-xl', 'desktop-s', 'desktop-m', 'desktop-lg']
    for size in window_args:
        step.given('I visit "http://localhost:5000"')
        step.given('I set browser window to "desktop-m" and refresh the browser')
        step.given('And wait 5 seconds')
        step.given('I fill in the input with selector "#search-bar" with "'+text+'"')
        step.given('I click the element with css selector ".tt-dropdown-menu div"')
        step.given('And wait 3 seconds')
        step.given('I check element "#live-map h1" contain text "<university_name>"')
        # I check element "#live-map h1" contain text "university.short_name"
        #Verify Menu
        step.given('I click the element with css selector "[ng-click="page.sidebar.show = !page.sidebar.show;"]"')
        step.given('I verify element"#cta-modal-sidebar" is exist')
        step.given('I click the element with css selector "#cta-modal-sidebar .cta-modal-close"')
        step.given('I verify element"#cta-modal-sidebar" does not exist')

        

@step('I set browser window to "(.*?)" and refresh the browser')
def checkPosition(step,size):
    width, height = getWidthHeightFromCMDArgs(size)
    # print "Creating %s browser with %s width, %s height" % (size, width, height)
    world.browser.set_window_size(int(width), int(height))
    step.given('I refresh browser')
    step.given('And wait 1 seconds')


@step('I verify element "(.*?)" exist')
def verifyElement(step,selector):
    sectionElement = world.browser.find_element_by_css_selector(selector)

@step('I verify element "(.*?)" does not exist')
def verifyElement(step,selector):
    try :
        sectionElement = world.browser.find_element_by_css_selector(selector)
        assert True == False , "Element should not exist"
    except :
        pass

@step('I check element "(.*?)" position is at 0,0')
def checkPosition(step,selector):
    sectionElement = world.browser.find_element_by_css_selector(selector)
    assert sectionElement.location['y'] == 0 , 'Incorrect element(%s) location %s' %(selector, sectionElement.location)
    assert sectionElement.location['x'] == 0 , 'Incorrect element(%s) location %s' %(selector, sectionElement.location)
@step('Implenent a file attachment to "(.*?)"')
def ImplenentValue(step,selector):
    inputElement = world.browser.find_element_by_css_selector(selector)
    inputElement.send_keys("/splash.png")

@step('I should see an alert dialog, and I confirm it')
def acceptAlert(step):
    try:
        WebDriverWait(world.browser, 3).until(EC.alert_is_present(),
                                       'Timed out waiting for PA creation ' +
                                       'confirmation popup to appear.')

        alert = world.browser.switch_to_alert()
        alert.accept()
    except TimeoutException:
        assert "No alert is shown"

@step('I refresh browser')
def refresh(step):
    world.browser.refresh()
@step('I clear text in element with css selector "(.*?)"')
def clearInput(step,selector):
    inputElement = world.browser.find_element_by_css_selector(selector)
    i = len(inputElement.get_attribute('value'))
    while i != 0:
        inputElement.send_keys(Keys.BACK_SPACE)
        i -= 1

@step('I loop and click on list element by css selector "(.*?)" by (\d+) time')
def loopCheckbox(step,selector,specRange):
    listItems = world.browser.find_elements_by_css_selector(selector)
    for i in range(int(specRange)):
      listItems[i].click()
      
@step('I check the input "(.*?)" which has checkmark is equal (\d+)')
def loopCheckbox(step,selector,specRange):
    listItems = world.browser.find_elements_by_css_selector(selector)
    specRange = int(specRange)
    count = 0
    for item in listItems:
        if item.is_selected():
            count += 1
    assert count == specRange, "The inputs (%s) should have %d checks(s) : %d is not eqult %d" %(selector,specRange,count,specRange)

@step('I verify that the selector "(.*?)" contains (\d+) element')
def verifyLenGroup(step,selector,count):
    listItems = world.browser.find_elements_by_css_selector(selector)
    assert len(listItems) == int(count), "The list of element (%s) should have %d element(s) in it, only %d element(s) is in the list" %(selector,int(count),len(listItems))

@step('I selet range of the selector "(.*?)" by (\d+)')
def seletInputRange(step,selector,specRange):
    element = world.browser.find_element_by_css_selector(selector)
    for i in range(int(specRange)):
      element.send_keys(Keys.RIGHT)

@step('save current length of list "(.*?)"')
def saveTempValue(step,selector):
    listItems = world.browser.find_elements_by_css_selector(selector)
    world.browser.before = len(listItems)

@step('check length of list "(.*?)" is "(.*?)"')
def compareValue(step,selector,command):
    listItems =  world.browser.find_elements_by_css_selector(selector)
    if command == 'increased' :
        assert  world.browser.before  < len(listItems), "List is not increased"
    elif command == 'decreased' :
        assert world.browser.before  > len(listItems), "List is not decreased"
    else :
        assert True == False, "Incorrect command (increase or decrease) : %s" % (command)

@step('I wait elements "(.*?)" is not active')
def waitElementGone(step,selector):
    element = WebDriverWait(world.browser, 10).until(
        EC.staleness_of((By.CSS_SELECTOR, selector))
    )
@step('I check input "(.*?)" contain text "(.*?)"')
def findInputElementContainText(step,selector,text):
    inputElement = world.browser.find_element_by_css_selector(selector)
    inputText = inputElement.get_attribute('value')
    if text == "":
        assert  inputText == text ,  "Input (%s) with text ( %s ) is not empty" % (selector,inputText)
    else :
        assert  inputText == text ,  "Input (%s) with text ( %s ) does not contain text ( %s )" % (selector,inputText,text)

@step('I check element "(.*?)" contain text "(.*?)"')
@step('I check list "(.*?)" contain text "(.*?)"')
def findElementContainText(step,selector,text):
    listItems = world.browser.find_elements_by_css_selector(selector)
    # print listItems[0].text

    assert any(text in item.text for item in listItems),"No element(s) %s contain text : %s" % (selector,text)

    # isFind = False
    # for item in listItems:
    #     if item.text == text:
    #         isFind = True
    # assert isFind == False ,  "No element in the list contain text : %s" % (selector,text)
        # assert listItems[0].text == text, "Text of element %s does not contain text : %s" % (selector.text,text)
@step('I check "(.*?)" is "(.*?)"')
def checkStatus(step,selector,visible):
    # element = world.browser.find_element_by_css_selector(selector)
    if visible ==  "invisible" :
        EC.invisibility_of_element_located((By.CSS_SELECTOR,selector))
    elif visible ==  "visible" :
        EC.visibility_of_element_located((By.CSS_SELECTOR,selector))
    else :
        assert True == False, "Incorrect command (invisible or visible) : %s" % visible

@step('Verify that the input "(.*?)" is "(.*?)"')
@step('Verify that the input "(.*?)" is empty')
def verify(step,selector,value):
    element = world.browser.find_element_by_css_selector(selector)
    if value == None :
        assert element.text == ""
    else :
        assert element.text == value

@step('I verify that more than (\d+) elements exist with the selector "(.*?)"')
def setup(step,numEle,selector):
    count = int(numEle)
    itemList = world.browser.find_elements_by_css_selector(selector)
    assert (len(itemList) > count), "%d is not larger than %d for elements : %s" % (len(itemList),count,selector)

@step('I select the first element with css selector "(.*?)"')
def setup(step,selector):
    step.given('I click the element with css selector "'+selector+'"')

@step('I verify that the element with css selector "(.*?)" should not "(.*?)"')
def setup(step,selector,keyValue):
    element = world.browser.find_element_by_css_selector(selector);
    className = element.get_attribute('class')
    assert className.find(keyValue) == -1, "Element( %s ) %d is still %s" % (className,className.find(keyValue),keyValue)

@step('I verify that the element with css selector "(.*?)" has a class "(.*?)"')
def setup(step,selector,keyValue):
    element = world.browser.find_element_by_css_selector(selector);
    className = element.get_attribute('class')
    assert className.find(keyValue) > -1, "Element( %s ) does not contain %s" % (selector,keyValue)



@step('I login as a berkeley guru, within top 100 gurus')
def setup(step):
    from lib.utils import getLoginAutoLoginUrl
    guruList = getLoginAutoLoginUrl()
    # for guruurl in guruList:
    #     step.given('I visit "'+guruurl+'"')

    # clickElementOnceClickable(selector)
@step('I verify that the url contains "(.*?)"')
def setup(step,url):
    assert world.browser.current_url.find(url) > -1, "Current_url ( %s )does not contains %s" % (world.browser.current_url , url)


#End jason's work
@step('I login with my admin account')
def setup(step):
   step.given('I click the element with css selector "[ng-click="goToLoginFromAccess()"]"')
   step.given('I fill in the input with selector "[ng-model="signupForm.email"]" with "jason@uguru.me"')
   step.given('I fill in the input with selector "[ng-model="signupForm.password"]" with "launchuguru123"')
   step.given('I click the element with css selector "[ng-click="loginUser()"]"')

@step('I visit "(.*?)" with size (\d+)x(\d+) args browser')
def setup(step,url, width, height):
    step.given('Start the args browser with size '+width+' by '+height+'')
    step.given('I visit "'+url+'"')



@step('Start the args browser with args size')
# for reference for future decimals (\d+) by (\d+)
def fireBrowserWithSize(step):
    width, height = getWidthHeightFromCMDArgs(world.window_params)
    if world.cli_params and world.cli_params == "chrome":
        print "Creating %s browser with %s width, %s height" % (world.cli_params, width, height)
        # world.browser = initiateChromeWithSize(int(width), int(height))
        # world.browser.set_window_size(int(width), int(height))
        world.browser = webdriver.Chrome()
    elif world.cli_params and world.cli_params == "firefox":
        world.browser = webdriver.Firefox()
    elif world.cli_params and world.cli_params == "phantom":
        world.browser = webdriver.PhantomJS()
        time.sleep(5)
    else :
        # world.browser = webdriver.Safari('../standalone.jar')
        from pprint import pprint
        # pprint(world.browser.options.__dict__)
        from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
        safari_capabilities = DesiredCapabilities.SAFARI
        # safari_capabilities['loggingPrefs'] = {'browser': 'OFF', 'server': 'OFF', 'driver': "OFF"}
        # FOR MORE DETAILS VISIT https://code.google.com/p/selenium/wiki/DesiredCapabilities
        # Available values for most loggers are "OFF", "SEVERE", "WARNING", "INFO", "CONFIG", "FINE", "FINER", "FINEST", "ALL".
        # This produces a JSON object looking something like: {"loggingPrefs": {"driver": "INFO", "server": "OFF", "browser": "FINE"}}.
        world.browser = webdriver.Remote(
           command_executor='http://127.0.0.1:4444/wd/hub',
           desired_capabilities=safari_capabilities)

    world.browser.set_window_size(int(width), int(height))
    # world.browser.save_screenshot('screen.png')
## URLS
@step(r'I set the window size to (\d+) by (\d+)?$')
def visitURL(step, width, height):
    world.browser.set_window_size(int(height), int(width))
    # world.browser.get("localhost:8100/#/university")

@step(r'admin login "(.*?)"')
def adminlogin(step,usrID):
    step.given('I fill in the input with name "#login-email" with "jason@uguru.me"')
    step.given('I fill in the input with name "#login-password" with "jason-uguru-2"')
    step.given('I click the element with css selector "#sign-in-button"')
    step.given('I visit "https://uguru.me/admin/users/5919/"')
    step.given('I click the element with css selector "[href="/admin/users/'+usrID+'/login"]"')
    time.sleep(8)


# @step(r'INCOMPLETE: "(.*)"')
# def missingFeature(step, incomplete_feature):
#     assert_equals(True, False)
#     # with AssertContextManager(step):
#     #     assert_equals(False, True)
#     #     raise AssertionError()

@step(r'Fill in input "(.*?)" with "(.*?)",and enter')
def fillAndEnter(step, name, text_to_input):
    step.given('I fill in the input with name "'+name+'" with "'+text_to_input+'"')
    step.given('press enter on "'+name+'"')


@step(r'Fill in input "(.*?)" with "(.*?)",and click Redeem btn')
def fillAndEnter(step, name, text_to_input):
    step.given('I fill in the input with name "'+name+'" with "'+text_to_input+'"')
    step.given('I click the element with css selector "#redeem-button"')


@step(r'I fill in the input with selector "(.*?)" with "(.*?)"')
def findElementByName(step, selector, text_to_input):
    # from lib.utils import waitUntilSelectorExists
    # waitUntilSelectorExists(selector)
    if text_to_input == 'random':
        import string
        import random
        text_to_input = ''.join(random.sample(string.letters*5,5))
        text_to_input = text_to_input+'@jason-test.edu'
    # time.sleep(2)
    # countElement =len(world.browser.find_elements_by_css_selector(selector))
    # assert countElement == 1, "DUDE !!! FOUND %d ELEMENTS WITH CSS_SELECTOR %s , WHICH ONE I SHOULD SEND THE KEYS TO?????"%(countElement,selector)
    username = world.browser.find_element_by_css_selector(selector)
    username.send_keys(text_to_input)
    from time import sleep



@step(r'press enter on "(.*?)"')
def pressEnterOnSelector(step,selector_name):
    username = world.browser.find_element_by_css_selector(selector_name)
    username.send_keys(Keys.RETURN)
    time.sleep(5)


@step(r'search and select university : "(.*?)"')
def findUniversity(step,name):
    step.given('a list of "#school-list li" are shown')
    step.given('I fill in the input with name "#university-input" with "'+name+'"')
    step.given('I click the element with css selector "#school-list li a"')


@step(r'I add course "(.*?)"')
def findCourse(step,name):
    step.given('a list of "[ng-click="addSelectedGuruCourse(course)"]" are shown')
    step.given('I fill in the input with name "[ng-model="search_text.course"]" with "'+name+'"')
    step.given('I click the element with css selector "[ng-click="addSelectedGuruCourse(course)"]"')

# @step(r'I select "(.*?)" in "(.*?)" section')
# def findSkill(step,skill,section):
#     # assert_equals(True, False)
#     step.given('a list of "#skills-list li a" are shown')
#     step.given('I click the element with css selector "[ng-click="launchCategoryModal(category)"]"')
#     step.given('I click the element with css selector "[ng-model="subcategory.active"]"')

@step(r'sign up a new account')
def Signup(step):
    step.given('I click the element with css selector "[ng-click="signupModal.show()"]"')
    step.given('I click the element with css selector "[ng-click="switchSignupMode()"]"')
    step.given('I fill in the input with name "signup-name" with "Jason Huang"')
    step.given('I fill in the input with name "email-input" with "jason@uguru.me"')
    step.given('I fill in the input with name "password" with "test123"')
    step.given('I click the element with css selector "#account [ng-click="completeSignup()"]"')







## --> document.getElementById
@step(r'I click the element with id "(.*?)"$')
def findElementByID(step, elem_id):
    element = world.browser.find_element_by_id(elem_id)
    element.click()

## --> document.querySelector || document.querySelectorAll()[0]
@step(r'I click the element with css selector "(.*?)"$')
def clickElementBySelector(step, selector):
    from lib.utils import clickElementOnceClickable
    clickElementOnceClickable(selector)


    # element = world.browser.find_element_by_css_selector(selector)
    # element.click()


@step(r'Wait (\d+) second')
@step(r'Wait (\d+) seconds')
def waitXseconds(step, seconds):
    from time import sleep
    sleep(int(seconds))

@step(r'Access page')
def goToAccessPage(step, selector):
    step.given('I go to the home page')
    step.given('I click the login button')

# @step(r'I click "(.*?)" button')
# def i_click_redeem(step, namebtn):
#     world.browser.implicitly_wait(5) # seconds
#     btn = world.browser.find_element_by_css_selector("#"+namebtn+"-button")
#     btn.click();

@step(r'"(.*?)" are shown$')
def isSelectorElementShown(step, selector):
    time.sleep(3) #
    EC.visibility_of_element_located((By.CSS_SELECTOR,selector))

@step(r'(.*?)" are not shown$')
def isSelectorElementNotShown(step, selector):
    time.sleep(3) #
    EC.staleness_of((By.CSS_SELECTOR,selector))


@step(r'I wait (\d+) sec')
def waitCertainSeconds(step, time):
    time.sleep(5) #


@step(r'Verify that the URL is "(.*?)"')
@step(r'Does url change to "(.*?)"')
def verifyURLIsCorrect(step,url):
    assert_equals(world.browser.current_url,url)


@step('quit')
def quitWebDriver(step):
    try:
    	world.browser.quit()
    except:
    	print "shit went wrong"