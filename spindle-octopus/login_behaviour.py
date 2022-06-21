import sys
import shutil
import os
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

from seleniumwire import webdriver as wd
wd_driver = wd.Chrome()

def login():
    wd_driver.get("https://secure.spindlelive.com")
    wd_driver.get("https://secure.spindlelive.com/#/Login")
    wd_driver.find_element_by_id("username").send_keys('peter@laundrytechsolutions.com')
    wd_driver.find_element_by_id("password").send_keys('IREMSXIRB')
    wd_driver.find_element_by_xpath("//button[@type='submit']").click()
    WebDriverWait(wd_driver, 10).until(EC.presence_of_element_located((By.ID, "corp-dlm-portlet")))
    wd_driver.get("https://secure.spindlelive.com/#/Eqm/Facility/41100")
#then
    d = os.getcwd()
    print(d)
    path = os.path.join(d, "lock")
    print(path)
    bearer = os.path.join(d, "bearer.txt")
    for request in wd_driver.requests:
         try:
             token = request.headers['Authorization']
             if len(token) > 200:
                 f = open(bearer, "w")
                 f.write(request.headers['Authorization'])
                 f.close()
                 print(request.headers['Authorization'])
         except:
             print("err")
    try:
        with open(path, "w+") as f:
            f.write("")
            f.close()
    except OSError as e:
        print("Error: %s : %s" % (path, e.strerror))
    time.sleep(2)
    try:
        time.sleep(2)
        os.remove(path)
        print("removing ", path)
    except OSError as e:
        print("Error: %s : %s" % (path, e.strerror))
    wd_driver.quit()
