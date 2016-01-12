from lettuce import before, after, world, step
## this will be local so we dont fuck with their data
def generateAdminAutoLoginUrl(user_id):
    return "http://localhost:5000/static/remote/index.html?admin_token=fe78e1c1cddfe4b132c7963136243aa51ac5609fb17839bf65a446d6&user_id=%s" %s

# returns URL to later visit
def getLoginAutoLoginUrl():
    from random import randint
    import requests , arr
    berkeleyUserIds = [3122,2177,5395,195,2954,5413,3622,5375,5373,4647,4952,4658,4655,5300,5438,4949,5323,5371,5346,3361,5362,5382,5311,3065,5463,5460,2941,4903,5353,4519,3284,5334,2533,3106,5363,5111,5012,5370,4227,5097,2585,128,1683,4687,908,1310,1557,2181,2576, 3022]
    randomUserId = berkeleyUserIds[randint(0, len(berkeleyUserIds) - 1 )]
    user_dict = json.loads(requests.get('http://localhost:5000/api/v1/user/%s' % randomUserId))
    return generateAdminAutoLoginUrl(randomUserId)

def camelCaseArg(arg):
    split_args = arg.split('-')
    return split_args[0].lower() + "".join([_arg.title() for _arg in split_args[1:]])


def clickElementOnceClickable(selector, max_iter=3):
    import time
    from selenium.webdriver.common.by import By
    from selenium.webdriver.support.ui import WebDriverWait
    from selenium.webdriver.support import expected_conditions as EC
    from selenium.common.exceptions import WebDriverException
    MAX_LIMIT = max_iter
    index = 0
    element = None
    while True:
        if index >= MAX_LIMIT:
            raise
        index += 1
        try:
            time.sleep(1)
            # print "iteration #%s -- checking to see if %s exists " % (index, selector)
            element = WebDriverWait(world.browser, 10).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, selector))
            )
            element.click()
        except WebDriverException:
            continue
        break

def waitUntilSelectorExists(selector, max_iter=20):
    import time
    from selenium.webdriver.common.by import By
    from selenium.webdriver.support.ui import WebDriverWait
    from selenium.webdriver.support import expected_conditions as EC
    from selenium.common.exceptions import WebDriverException
    MAX_LIMIT = max_iter
    index = 0
    element = None
    while True:
        if index >= MAX_LIMIT:
            raise
        index += 1
        try:
            time.sleep(1)
            print "iteration #%s -- checking to see if %s exists " % (index, selector)
            element = WebDriverWait(world.browser, 10).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, selector))
            )
            element.focus()
        except WebDriverException:
            continue
        break