import codecs
import re
import json

with codecs.open('intenções_ingressos_cinema.json', 'r', encoding='utf8') as json_data:
    intents = json.load(json_data)

dictionary = {'a': ['à', 'á', 'â', 'ã', 'ä', 'å'],
              'c': ['ç'],
              'e': ['è', 'é', 'ê', 'ë', '&'],
              'i': ['ì', 'í', 'î', 'ï'],
              'o': ['ò', 'ó', 'ô', 'õ', 'ö'],
              'u': ['ù', 'ú', 'û', 'ü'],
              'n': ['ñ'],
              'y': ['ý', 'ÿ']}
word_set = {}


def clear_word(word_to_clear):
    for char, old_chars in dictionary.items():
        for old_char in old_chars:
            word_to_clear = word_to_clear.replace(old_char, char)
        word_to_clear = re.sub(r'[^\w]', '', word_to_clear)
    return word_to_clear.lower()


for intent in intents['intents']:
    intent['tag'] = clear_word(intent['tag'])
    word_set[intent['tag']] = {}
    for pattern in intent['patterns']:
        for word in pattern.split(' '):
            word = clear_word(word)
            if word not in word_set[intent['tag']]:
                word_set[intent['tag']].update({word: 1})
            else:
                word_set[intent['tag']][word] += 1

for words, value in word_set.items():
    print(words, value)
