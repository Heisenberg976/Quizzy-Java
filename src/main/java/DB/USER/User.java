package DB.USER;

public class User {
    private String username;
    private String password;
    private String email;

    public User(String username,String email, String password) {
        this.username = username;
        this.password = password;
        this.email = email;


    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
