package dat.backend.model.entities;

import java.util.Objects;

public class Admin {
    private String username;
    private String password;


    public Admin (String username, String password){
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof Admin)) return false;
        Admin admin = (Admin) o;
        return getUsername().equals(admin.getUsername()) && getPassword().equals(admin.getPassword());
    }

    @Override
    public int hashCode()
    {
        return Objects.hash(getUsername(), getPassword());
    }

    @Override
    public String toString()
    {
        return "User: " +
                "Brugernavn='" + username + '\'' +
                ", Kodeord='" + password + '\'' +
                ' ';
    }
}
