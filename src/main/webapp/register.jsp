<html>

<head>
    <title>Register</title>
</head>

<body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<div class="row">
    <div class="offset-md-4 col-md-3" style="margin-top:10%">
        <div class="card">
            <div class="card-body">
                <h4>Sign in</h4>
                <form action="/register" method="post">
                    <label>Name</label>
                    <input type="text" name="name" class="form-control">
                    <label>Email</label>
                    <input type="text" name="email" class="form-control">

                    <label>Password</label>
                    <input type="password" name="password" class="form-control">

                    <label>Repeat Password</label>
                    <input type="password" name="Rpassword" class="form-control">
                    <a href="login.jsp">Already Have An Account?</a>
                    <br><br>
                    <input type="submit" name="submit" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>