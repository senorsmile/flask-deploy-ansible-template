from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return 'Flask is running!'

@app.route('/api')
def names():
    data = {"foo": ["bar", "bob", "bab", "bib"]}
    return jsonify(data)


if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        port=5000,
    )
