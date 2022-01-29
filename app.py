from flask import Flask, render_template, redirect, url_for, request


app = Flask(__name__)

words = ["Pura", "Na", "Krovu", "Ikce", "Pikce"]

@app.route('/')
def home():
    message = 'iso medo u ducan'
    return render_template('index.html', message=message, words=words)


@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] != 'admin' or request.form['password'] != 'admin':
            error = 'Invalid Credentials. Please try again.'
        else:
            return redirect(url_for('home'))

    return render_template('login.html', error=error)


if __name__ == '__main__':
    app.run(debug=True)
