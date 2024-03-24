import json
from BeautifulSoup import BeautifulSoupStrategy
from Selenium import SeleniumStrategy

class main:
    def __init__(self, strategy):
        self._strategy = strategy

    def scrape(self, url):
        return self._strategy.scrape(url)
    

url = 'https://finance.yahoo.com/quote/TSLA'
context = main(SeleniumStrategy())
data = context.scrape(url)

# Imprimir los datos scrapeados
if data:
    print('Datos scrapeados:')
    for key, value in data.items():
        print(f'{key}: {value}')

#Guardamos los datos en un json
with open ('data.json', 'w') as f:
    json.dump(data, f)

