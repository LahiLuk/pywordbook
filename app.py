from flask import Flask, render_template

app = Flask(__name__)

words = ["Pura", "Na", "Krovu", "Ikce", "Pikce"]

@app.route('/')
def main():
    message = 'iso medo u ducan'
    return render_template('index.html', message=message, words=words)


@app.route('/login')
def login():
    return ""
