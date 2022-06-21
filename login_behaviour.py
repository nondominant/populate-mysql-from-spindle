import sys
from selenium.webdriver.support.ui import Select
from datetime import date
import csv
from selenium import webdriver
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.ui import Select
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.action_chains import ActionChains
from seleniumwire import webdriver


chrome_options = Options()
#chrome_options.add_argument("--headless")
s = Service('/home/sandworm/Workspace/work/spindle/spindle-octopus/chromedriver')
s.start()
driver = webdriver.Remote(s.service_url, options=chrome_options)
driver.implicitly_wait(10)


def login():
    driver.get("https://secure.spindlelive.com")
    driver.get("https://secure.spindlelive.com/#/Login")
    driver.find_element_by_id("username").send_keys('peter@laundrytechsolutions.com')
    driver.find_element_by_id("password").send_keys('IREMSXIRB')
    driver.find_element_by_xpath("//button[@type='submit']").click()
    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "corp-dlm-portlet")))


