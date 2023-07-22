import requests
import selectorlib
import sqlite3
import time
import datetime
import smtplib, ssl

URL = "https://www.jdsports.co.uk/product/black-nike-max-95-ultra/19576123/"
HEADERS = {"User-Agent":'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 '
                        '(KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'}

connection = sqlite3.connect("data.db")
current_datetime = datetime.datetime.now()
timestamp = current_datetime.strftime("%Y-%m-%d %H:%M:%S")


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
    cursor.execute("INSERT INTO products VALUES(?,?,?)", item)
    connection.commit()


def send_email(message):
    host = "smtp.gmail.com"
    port = 465

    username = "james.barker132@gmail.com"
    password = "zzvjdmwywnuzfyyi"

    receiver = "james.barker132@gmail.com"
    context = ssl.create_default_context()

    with smtplib.SMTP_SSL(host, port, context=context) as server:
        server.login(username, password)
        server.sendmail(username, receiver, message)
    print("Email was sent!")


if __name__ == "__main__":
    while True:
        scraped = scrape(URL)
        extracted = extract(scraped)
        item = extracted.split("£")
        item.append(timestamp)
        stored = store(item)
        if item[1] < "176.00":
            send_email("Price has dropped!")
            print(item)
            time.sleep(5)
        else:
            print("No Change")
            time.sleep(5)
