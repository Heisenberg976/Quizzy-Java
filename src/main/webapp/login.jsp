<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<div class="container">
    <div class="row">
        <div class="offset-md-4 col-md-4">
            <div class="card" style="margin-top:50%">
                <div class="card-body">
                    <h3 class="card-title">Sign in</h3>
                    <form action="/login" method='post'>
                        <label> Email</label>
                        <input type="text" class="form-control" name="email">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password">
                        <a href="register.jsp">Create new account</a>
                        <br> <br>
                        <%
                            String s = (String) request.getAttribute("error");
                            if(s != null)
                        %>
                        <p style="color:red"><%=s%></p>
                        <input type="submit" name="submit" value="Sign in" class="btn btn-primary">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</html>