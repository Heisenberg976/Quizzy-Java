<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body style="background-color:white">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="#" style="margin-left: 50px">Quizzy</a>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><span class="sr-only">Home</span></a>
            </li>
            <li class="nav-item">

                <a class="nav-link" href="categories.jsp"><span class="sr-only">Categories</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/logout">Log Out</a>
            </li>


            <li class="nav-item">
                <a class="nav-link" href="admin/create-category.jsp">Admin</a>
            </li>


        </ul>

    </div>
</nav>

<div class="jumbotron" style="margin-left:50px ; margin-top:20px">
    <h1 class="display-4">Hello, User</h1>
    <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to
        featured content or information.</p>
    <hr class="my-4">
    <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
    <a class="btn btn-primary btn-lg" href="categories.jsp" role="button">Go to Categories</a>
</div>
</body>
</html>