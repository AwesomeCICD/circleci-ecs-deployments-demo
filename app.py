from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    # Retrieve environment variables
    env_var1 = os.getenv('ENV_VAR1')
    env_var2 = os.getenv('ENV_VAR2')
    # Start of HTML content
    html_start = """
    <!doctype html>
    <html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <!-- Tailwind CSS via CDN -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        
        <title>ECS Flask Container</title>
    </head>
    <body class="bg-blue-900 text-white h-screen flex items-center justify-center">
        <div class="max-w-md w-full bg-blue-800 p-8 rounded-lg shadow-lg">
            <h1 class="text-2xl font-bold text-center mb-4">ECS Flask Container</h1>
    """
    
    # Middle of HTML content with dynamic values
    html_middle = f"""
            <p class="text-lg mb-2"><strong>CIRCLE_BUILD_NUM:</strong> {env_var1}</p>
            <p class="text-lg"><strong>CIRCLE_SHA:</strong> {env_var2}</p>
    """
    
    # End of HTML content
    html_end = """
        </div>
    </body>
    </html>
    """
    
    # Combine all parts and return
    return html_start + html_middle + html_end

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
