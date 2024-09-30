import requests
from concurrent.futures import ThreadPoolExecutor
import time

# This was written via cGPT because I'm lazy and Python is not my main language


result = ""
def append_string_to_txt(filename, text):
    # Открываем файл в режиме добавления
    with open(filename, 'a', encoding='utf-8') as file:
        # Дописываем строку в конец файла
        file.write(text + '\n')  # Добавляем перевод строки после текста
    #print(f"Строка успешно добавлена в {filename}")
def get_random_wikipedia_pages(num_pages=10):
    # URL MediaWiki API для получения случайных страниц
    url = "https://en.wikipedia.org/w/api.php"

    # Параметры запроса
    params = {
        "action": "query",
        "format": "json",
        "list": "random",
        "rnlimit": num_pages,  # Количество случайных страниц
        "rnnamespace": 0  # Только главные пространства имен (обычные статьи)
    }

    # Отправка GET-запроса к API
    response = requests.get(url, params=params)

    # Проверка статуса ответа
    if response.status_code == 200:
        data = response.json()
        random_pages = data['query']['random']
        return random_pages
    else:
        return f"Ошибка при выполнении запроса: {response.status_code}"
def get_wikipedia_page_extract(page_title):
    # URL MediaWiki API для получения содержимого страницы
    url = "https://en.wikipedia.org/w/api.php"

    # Параметры запроса
    params = {
        "action": "query",
        "format": "json",
        "prop": "extracts",
        "exintro": True,  # Только введение
        "explaintext": True,  # Без HTML тегов
        "titles": page_title
    }

    # Отправка GET-запроса к API
    response = requests.get(url, params=params)

    # Проверка статуса ответа
    if response.status_code == 200:
        data = response.json()
        pages = data['query']['pages']
        # Получение текста страницы
        for page_id, page_data in pages.items():
            if 'extract' in page_data:
                return page_data['extract']
            else:
                return "Текст не найден"
    else:
        return f"Ошибка при выполнении запроса: {response.status_code}"
executor = ThreadPoolExecutor()
futures = []
def main(i):
    page_text = get_wikipedia_page_extract(i["title"])
    append_string_to_txt('texts.txt', page_text)
    print(i["title"] + "; words: " + str(len(page_text.split(" "))))

t = time.time() + 15 * 60
while t >= time.time():
    for i in get_random_wikipedia_pages(500):
        future = futures.append(executor.submit(main, i))
    for future in futures:
        future.result()
    time.sleep(1)
print("DONE")
