from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    # Retrieve environment variables
    env_var1 = os.getenv('ENV_VAR1')
    env_var2 = os.getenv('ENV_VAR2')
    return f"Hello, World! ENV_VAR1: {env_var1}, ENV_VAR2: {env_var2}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)