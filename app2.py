<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <title>ECS Flask Container</title>

    <style>
        html, body {{
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #001f3f; /* Navy Blue Background */
            color: #ffffff; /* White Text */
            font-family: Arial, sans-serif;
        }}
        .container {{
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }}
        .card {{
            background-color: #004080; /* Slightly Lighter Navy */
            border: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            color: #ffffff; /* Ensure white text inside card */
        }}
        .card-title {{
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }}
        .card-text {{
            font-size: 1.2rem;
        }}
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card text-center">
                    <div class="card-body">
                        <h1 class="card-title">ECS Flask Container</h1>
                        <p class="card-text">
                            <strong>This container was built on CIRCLE_BUILD_NUM:</strong> {env_var1}
                        </p>
                        <p class="card-text">
                            <strong>The CIRCLE_SHA that generated the container:</strong> {env_var2}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
