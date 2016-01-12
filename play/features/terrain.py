from lettuce import before, after, world
from selenium import webdriver
import lettuce_webdriver.webdriver

@before.all
def setup_browser():
    world.browser = webdriver.Chrome()


@after.all
def say_goodbye(total):
    print "Congratulations, %d of %d scenarios passed!" % (
        total.scenarios_ran,
        total.scenarios_passed
    )
    world.browser.quit()
    print "Goodbye!"