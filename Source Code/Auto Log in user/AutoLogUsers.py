from selenium import webdriver
from selenium.webdriver.common.keys import Keys
#from pyvirtualdisplay import Display
from selenium.webdriver.support.ui import WebDriverWait
import sys

def startSessions(Anum):
    count = int(Anum)
    #display = Display(visible=0, size=(800, 600))
    #display.start()
    browser = webdriver.Chrome('/Users/sumitdeshmukh/Downloads/chromedriver')
    url = 'http://northeasternbanking.us-west-2.elasticbeanstalk.com'
    browser.get(url)
    assert 'Home' in browser.title 
    user_list = ['ryan_29', 'noah_3', 'fritz_21', 'zeph_19', 'camilla_5', 'chase_14', 'noel_14', 'guy_10', 'igor_22', 'emi_1']
    i = 0
    while(count > 0):
        button = browser.find_element_by_class_name('btn-primary')  # Find the search box
        button.click()

        browser.implicitly_wait(1) # seconds
        username_box = browser.find_element_by_name('userName')
        username_box.send_keys(user_list[i])
        i = i + 1

        password_box = browser.find_element_by_name('password')
        password_box.send_keys('Saurabh@31')

        signin_btn = browser.find_element_by_name('signin')
        signin_btn.click()

        statement_toggle = browser.find_element_by_xpath('/html/body/div/div[2]/div[2]/div/div/div[1]/h4/a')
        statement_toggle.click()

        browser.implicitly_wait(1) # seconds

        submit_btn = browser.find_element_by_class_name('btn-warning')
        submit_btn.submit()

        #logout_btn = browser.find_element_by_class_name('btn-success')
        #logout_btn.submit()
        browser.execute_script("window.open('http://northeasternbanking.us-west-2.elasticbeanstalk.com','_blank');")
        browser.close()
        browser.switch_to.window(browser.window_handles[-1])
        count = count - 1

    browser.quit()
    #display.stop()

def main():
    # print command line arguments
    if len(sys.argv) != 2:
        print("Pass a number as argument to keep those many sessions alive")
    else:
        startSessions(sys.argv[1])

if __name__ == "__main__":
    main()