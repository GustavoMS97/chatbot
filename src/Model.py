# things we need for NLP
import nltk
from nltk.stem.lancaster import LancasterStemmer
import codecs
import numpy as np
import tflearn
import tensorflow as tf
import random
import re

stemmer = LancasterStemmer()

# things we need for Tensorflow

# import our chat-bot intents file
import json

with codecs.open('intents-cursos.json', 'r', encoding='utf8') as json_data:
    intents = json.load(json_data)

words = []
classes = []
documents = []
ignore_words = ['?']
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
        word_to_clear = re.sub(r'[^\w\s,]', '', word_to_clear)
    return word_to_clear.lower()


teste = []


# loop through each sentence in our intents patterns
for intent in intents['intents']:
    intent['tag'] = clear_word(intent['tag'])
    word_set[intent['tag']] = {}
    for pattern in intent['patterns']:
        pattern = clear_word(pattern)
        print(pattern)
        # tokenize each word in the sentence
        w = nltk.word_tokenize(pattern)
        # add to our words list
        words.extend(w)
        # add to documents in our corpus
        documents.append((w, intent['tag']))
        # add to our classes list
        if intent['tag'] not in classes:
            classes.append(intent['tag'])
        #Contador de palavras
        new_pattern = pattern
        for word in new_pattern.split(' '):
            word = clear_word(word)
            word = stemmer.stem(word)
            if word not in word_set[intent['tag']]:
                word_set[intent['tag']].update({word: 1})
                teste.append(word)
            else:
                word_set[intent['tag']][word] += 1


for words, value in word_set.items():
    print(words, value)

print(teste)
words = teste

print('palavras normais -> ', words)
# stem and lower each word and remove duplicates
words = [stemmer.stem(w.lower()) for w in words if w not in ignore_words]
words = sorted(list(set(words)))
print('palavras stemmizadas -> ', words)

# remove duplicates
classes = sorted(list(set(classes)))

print(len(documents), "documents")
print(len(classes), "classes", classes)
print(len(words), "unique stemmed words", words)

# create our training data
training = []
output = []
# create an empty array for our output
output_empty = [0] * len(classes)

# training set, bag of words for each sentence
for doc in documents:
    # initialize our bag of words
    bag = []
    # list of tokenized words for the pattern
    pattern_words = doc[0]
    # stem each word
    pattern_words = [stemmer.stem(word.lower()) for word in pattern_words]
    # create our bag of words array
    for w in words:
        bag.append(1) if w in pattern_words else bag.append(0)

    # output is a '0' for each tag and '1' for current tag
    output_row = list(output_empty)
    output_row[classes.index(doc[1])] = 1
    training.append([bag, output_row])

# shuffle our features and turn into np.array
random.shuffle(training)
training = np.array(training)

# create train and test lists
train_x = list(training[:, 0])
train_y = list(training[:, 1])

# reset underlying graph data
tf.reset_default_graph()
# Build neural network
net = tflearn.input_data(shape=[None, len(train_x[0])])
net = tflearn.fully_connected(net, 8)
net = tflearn.fully_connected(net, 8)
net = tflearn.fully_connected(net, len(train_y[0]), activation='softmax')
net = tflearn.regression(net)

# Define model and setup tensorboard
model = tflearn.DNN(net, tensorboard_dir='/tmp/tflearn_logs/', )
# Start training (apply gradient descent algorithm)
model.fit(train_x, train_y, n_epoch=1000, batch_size=8, show_metric=True)
model.save('model.tflearn')

# save all of our data structures
import pickle

pickle.dump({'words': words, 'classes': classes, 'train_x': train_x, 'train_y': train_y}, open("training_data", "wb"))
