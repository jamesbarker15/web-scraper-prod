import requests
import selectorlib

URL = "https://www.jdsports.co.uk/product/black-nike-max-95-ultra/19576123/"
HEADERS = {"User-Agent":'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 '
                        '(KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'}


def scrape(url):
    response = requests.get(url, headers=HEADERS)
    source = response.text
    return source


def extract(source):
    extractor = selectorlib.Extractor.from_yaml_file("extract.yaml")
    value = extractor.extract(source)["shoes"]
    return value


if __name__ == "__main__":
    scraped = scrape(URL)
    extracted = extract(scraped)
    print(extracted)

