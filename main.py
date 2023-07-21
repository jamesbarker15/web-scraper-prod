import requests
import selectorlib
import sqlite3

URL = "https://www.jdsports.co.uk/product/black-nike-max-95-ultra/19576123/"
HEADERS = {"User-Agent":'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 '
                        '(KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'}

connection = sqlite3.connect("data.db")


def scrape(url):
    response = requests.get(url, headers=HEADERS)
    source = response.text
    return source


def extract(source):
    extractor = selectorlib.Extractor.from_yaml_file("extract.yaml")
    value = extractor.extract(source)["shoes"]
    return value


def store(price):
    cursor = connection.cursor()
    cursor.execute("INSERT INTO products VALUES(?,?)", item)
    connection.commit()


if __name__ == "__main__":
    scraped = scrape(URL)
    extracted = extract(scraped)
    item = extracted.split("£")
    stored = store(item)
    print(item)
