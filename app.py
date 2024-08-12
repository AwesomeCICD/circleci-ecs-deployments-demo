from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    # Retrieve environment variables
    env_var1 = os.getenv('ENV_VAR1')
    env_var2 = os.getenv('ENV_VAR2')
    return (
        f"Hello, World! "
        f"The CIRCLE_BUILD_NUM used for building this container was: {env_var1}, "
        f"The CIRCLE_SHA that generated this container was : {env_var2}"
    )

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)