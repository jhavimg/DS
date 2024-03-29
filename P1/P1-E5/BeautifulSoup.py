from bs4 import BeautifulSoup
import requests
from Scraper import ScrapeStrategy

class BeautifulSoupStrategy(ScrapeStrategy):
    def scrape(self, url):
        response = requests.get(url)

        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')

            # Encontrar los elementos requeridos utilizando BeeautifulSoup
            open_price = soup.find('td', {'data-test': 'OPEN-value'}).text
            prev_close = soup.find('td', {'data-test': 'PREV_CLOSE-value'}).text
            volume = soup.find('td', {'data-test': 'TD_VOLUME-value'}).text
            market_cap = soup.find('td', {'data-test': 'MARKET_CAP-value'}).text
            
            # Devolver los datos scrapeados como un diccionario
            data = {
                'Precio cierre previo': prev_close,
                'Precio de apertura': open_price,
                'Volumen': volume,
                'Capitalizacion de mercado': market_cap
            }

            return data
        else:
            return f'Failed to retrieve the webpage, status code: {response.status_code}'