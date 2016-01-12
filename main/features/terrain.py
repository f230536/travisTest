from lettuce import before, after, world
import selenium
from selenium import webdriver
import lettuce_webdriver.webdriver
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait as WAIT
class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

@before.all
def setup_browser():
    import sys, os
    browser_name = sys.argv[-2]
    window_size = sys.argv[-1]
    browser_args = ['chrome', 'firefox','safari']
    window_args = ['all','mobile-s', 'mobile-m', 'mobile-lg', 'mobile-xl', 'desktop-s', 'desktop-m', 'desktop-lg']
    if browser_name.lower() not in browser_args or window_size.lower() not in window_args or len(sys.argv) < 4:
        print "\n\n INVALID ARGS \n\n PLZ READ DOCS ASAP\n\n"
        print "GENERAL FORMAT:"
        print "==============="
        print "lettuce features/FEATURE_FILE_NAME.feature BROWSER_NAME BROWSER_SIZE\n\n\n"

        print "SUPPORTED BROWSER ARGS:"
        print "========================"
        print "chrome, firefox\n\n\n"

        print "SUPPORTED BROWSER SIZE:"
        print "======================="
        print "mobile-s, mobile-m, mobile-lg, mobile-xl, desktop-s, desktop-m, desktop-lg\n\n\n"
        sys.exit()

    world.window_params = window_size
    if browser_name.lower() == 'chrome':
        world.cli_params = 'chrome'
    elif browser_name.lower() == 'firefox':
        world.cli_params = 'firefox'
    else:
        world.cli_params = 'safari'





@after.all
def say_goodbye(total):
    # print "Congratulations, %d of %d scenarios passed!" % (

    failed_steps = []
    not_implemented = []
    print "FAILED STEPS"
    for scenario_result in total.scenario_results:
        for step in scenario_result.scenario.steps:
            if step.failed:
                print bcolors.FAIL +"FAILED:"+bcolors.ENDC, step.sentence
    print
    print



    json_todo = []
    samir_todo = []
    for step in total.proposed_definitions:
        if 'J-TODO' in step.sentence:
            json_todo.append(step)
        else:
            samir_todo.append(step)


    print
    print "SAMIR'S TODOS"
    for todo in samir_todo:
        print todo.sentence

    print
    print
    print "JSON'S TODOS: %s things" % len(json_todo)
    for todo in json_todo:
        print todo.sentence

    # if len(failed_steps):
    #     print "You have failed life %s times" % len(failed_steps)

    #     print "\n\nHere's "

    # )
    world.browser.quit()



@before.each_feature
def setup_some_feature(feature):
    pass
    print "Running the feature %r, at file %s" % (
        feature.name,
        feature.described_at.file
    )


# ## scenario specific
# @before.each_scenario
# def setup_some_scenario(scenario):
#     pass

# ## scenario specific
# @after.each_scenario
# def teardown_some_scenario(scenario):
#     pass

# ## step specific
# @before.each_step
# def setup_some_step(step):
#     pass

# @after.each_step
# def teardown_some_step(step):
#     pass