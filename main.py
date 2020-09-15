import requests
import xml.etree.ElementTree as ET

url = "http://www.cbr.ru/scripts/XML_daily.asp"

data = requests.get(url).content
root = ET.fromstring(data)

for numcode in root.findall('Valute'):
    if numcode.find('NumCode').text == '344':
        name = numcode.find('Name').text
        nominal = int(numcode.find('Nominal').text)
        value = numcode.find('Value').text
    else:
        continue
    value = float(value.replace(',', '.'))
    print(nominal, name, 'равно', value , 'рубль')