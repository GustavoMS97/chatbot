from flask import Flask, render_template, request, json
from src.Response import response, define_curso

app = Flask(__name__)


@app.route("/")
def main():
    return render_template('index.html')


@app.route('/curso', methods=['POST'])
def curso():
    curso = request.form['curso']
    define_curso(curso)
    return json.dumps({'html': '<h1>Pey pey</h1>'})

@app.route('/pergunta', methods=['POST'])
def pergunta():
    pergunta = request.form['pergunta']
    print(pergunta)
    resposta = response(pergunta)
    print(resposta)
    if resposta is None:
        resposta = "Não sei o que te responder."
    return json.dumps({'text': resposta})


if __name__ == "__main__":
    app.run()
