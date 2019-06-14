# restore all of our data structures
import pickle
import codecs
import re
# things we need for NLP
import nltk
from nltk.stem.lancaster import LancasterStemmer

stemmer = LancasterStemmer()
# things we need for Tensorflow
import numpy as np
import random
from src.Model import model
import pymysql
# import our chat-bot intents file
import json

with codecs.open('intents-cursos.json', 'r', encoding='utf8') as json_data:
    intents = json.load(json_data)

dictionary = {'a': ['à', 'á', 'â', 'ã', 'ä', 'å'],
              'c': ['ç'],
              'e': ['è', 'é', 'ê', 'ë', '&'],
              'i': ['ì', 'í', 'î', 'ï'],
              'o': ['ò', 'ó', 'ô', 'õ', 'ö'],
              'u': ['ù', 'ú', 'û', 'ü'],
              'n': ['ñ'],
              'y': ['ý', 'ÿ']}
# create a data structure to hold user context
context = {}
ERROR_THRESHOLD = 0.85
curso = None
database_values = []
selected_data = None

data = None
words = None
classes = None
train_x = None
train_y = None


def load_data():
    db = pymysql.connect(host="localhost", user="root", passwd="1502900", database="chat")
    cursor = db.cursor()
    cursor.execute("SELECT * FROM dados")
    global database_values
    database_values = cursor.fetchall()
    db.close()
    global data
    data = pickle.load(open("training_data", "rb"))
    global words
    words = data['words']
    global classes
    classes = data['classes']
    global train_x
    train_x = data['train_x']
    global train_y
    train_y = data['train_y']
    # load our saved model
    model.load('./model.tflearn')
    for intent in intents['intents']:
        for pattern in intent['patterns']:
            pattern = clear_word(pattern)


def define_curso(new_curso):
    global selected_data
    selected_data = database_values[int(new_curso)-1]


def clear_word(word_to_clear):
    for char, old_chars in dictionary.items():
        for old_char in old_chars:
            word_to_clear = word_to_clear.replace(old_char, char)
        word_to_clear = re.sub(r'[^\w\s?]', '', word_to_clear)
    return word_to_clear.lower()


def clean_up_sentence(sentence):
    # tokenize the pattern
    sentence_words = nltk.word_tokenize(sentence)
    # stem each word
    sentence_words = [stemmer.stem(word.lower()) for word in sentence_words]
    return sentence_words


# return bag of words array: 0 or 1 for each word in the bag that exists in the sentence
def bow(sentence, words, show_details=True):
    # tokenize the pattern
    sentence_words = clean_up_sentence(sentence)
    # bag of words
    bag = [0] * len(words)
    for s in sentence_words:
        for i, w in enumerate(words):
            if w == s:
                bag[i] = 1
                if show_details:
                    print("found in bag: %s" % w)

    return np.array(bag)


def classify(sentence):
    sentence = clear_word(sentence)
    # generate probabilities from the model
    results = model.predict([bow(sentence, words)])[0]
    # filter out predictions below a threshold
    results = [[i, r] for i, r in enumerate(results) if r > ERROR_THRESHOLD]
    # sort by strength of probability
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = []
    for r in results:
        return_list.append((classes[r[0]], r[1]))
    # return tuple of intent and probability
    return return_list


def exchangeValuesFromResponse(response):
    return response \
        .replace('@curso', selected_data[1]) \
        .replace('@atividades', selected_data[3]) \
        .replace('@onde_fica', selected_data[6]) \
        .replace('@duracao', selected_data[7]) \
        .replace('@turno', selected_data[8]) \
        .replace('@diferenca', selected_data[9]) \
        .replace('@trabalha_onde', selected_data[11]) \
        #.replace('@profissao', selected_data[2]) \
        #.replace('@trabalha_como', selected_data[10]) \
        # .replace('@carga_horaria', selected_data[4]) \
        # .replace('@estrutura', selected_data[5]) \
        #.replace('@horario_aula', selected_data[12]) \



def response(sentence, userID='123', show_details=True):
    results = classify(sentence)
    print(results)
    # if we have a classification then find the matching intent tag
    if results:
        # loop as long as there are matches to process
        while results:
            for i in intents['intents']:
                # find a tag matching the first result
                if i['tag'].lower() == results[0][0]:
                    # set context for this intent if necessary
                    if 'context_set' in i:
                        if show_details:
                            print('context:', i['context_set'])
                        context[userID] = i['context_set']

                    # check if this intent is contextual and applies to this user's conversation
                    if not 'context_filter' in i or \
                            (userID in context and 'context_filter' in i and i['context_filter'] == context[userID]):
                        if show_details:
                            print('tag:', i['tag'])
                        # a random response from the intent
                        return exchangeValuesFromResponse(random.choice(i['responses']))
            results.pop(0)


load_data()

# sentenceIn = ""
# cursoIn = input("Qual curso deseja se informar: ")
# while sentenceIn != "Obrigado":
#     sentenceIn = input("O que deseja saber sobre o curso? ")
#     if sentenceIn.lower() != "obrigado":
#         response(sentenceIn, cursoIn)
