from lettuce import before, world
from selenium import webdriver
from lettuce import *
@step('quit')
def quitWebDriver(step):
    try:
    	world.browser.quit()
    except:
    	print "shit went wrong"