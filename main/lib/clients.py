from selenium import webdriver
from selenium.webdriver.chrome.options import Options

ALL_WINDOW_SIZES = {
    'mobile-s': { 'width': 320, 'height': 480 },
    'mobile-m': { 'width': 320, 'height': 568 },
    'mobile-lg': { 'width': 375, 'height': 667 },
    'mobile-xl': { 'width': 414, 'height': 736},
    'desktop-s': { 'width': 1024, 'height': 768},
    'desktop-m': {'width': 1366, 'height':768},
    'desktop-lg': {'width': 1920, 'height':1080}
}

def initiateChromeWithSize(width, height, pixelRatio=2.0):
    mobile_emulation = {
    "deviceMetrics": { "width": width, "height": height, "pixelRatio": pixelRatio },
    "userAgent": "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19" }
    chrome_options = Options()
    chrome_options.add_experimental_option("mobileEmulation", mobile_emulation)
    return webdriver.Chrome(chrome_options=chrome_options)

def getWidthHeightFromCMDArgs(cmd_arg):
    return ALL_WINDOW_SIZES[cmd_arg]['width'], ALL_WINDOW_SIZES[cmd_arg]['height']
