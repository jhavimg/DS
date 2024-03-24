from selenium import webdriver

from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

import time

from Scraper import ScrapeStrategy

class SeleniumStrategy(ScrapeStrategy):
    def scrape(self, url):
        options = Options()
        options.headless = True
        driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

        try:
            #Abrimos la página web
            driver.get("https://finance.yahoo.com/quote/TSLA")

            WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.CSS_SELECTOR, ".btn.secondary.accept-all"))).click()
            time.sleep(1)

            # Encontrar los elementos requeridos utilizando Selenium
            wait = WebDriverWait(driver, 10)  # Espera hasta 10 segundos

            open_price = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@data-test="OPEN-value"]'))).text
            prev_close = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@data-test="PREV_CLOSE-value"]'))).text
            volume = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@data-test="TD_VOLUME-value"]'))).text
            market_cap = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@data-test="MARKET_CAP-value"]'))).text
            
            # Devolver los datos scrapeados como un diccionario
            data = {
                'Precio cierre previo': prev_close,
                'Precio de apertura': open_price,
                'Volumen': volume,
                'Capitalizacion de mercado': market_cap
            }

            return data
        finally:
            #Cerramos el driver
            driver.quit() 

