<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Admin</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <div class="login-image">
                <img src="pngimg.com - batman_PNG87.png" alt="Workout Image">
            </div>
            <div class="login-form">
                <h1>WELCOME ADMIN!</h1>
                <p>Log in to your account for more access.</p>
                <form action="LoginServlet" method="post">
                    <div class="input-group">
                        <input type="text" id="username" name="eName" placeholder="Username" required>
                    </div>
                    <div class="input-group">
                        <input type="password" id="password" name="pWord" placeholder="Password" required>
                    </div>
                    <button type="submit">LOGIN</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
