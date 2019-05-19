package esgi.java.advanced.ui.desktop.app.model;

public class Admin {


    private String email;
    private String passeword;


    public Admin(String email, String passeword) {
        this.email = email;
        this.passeword = passeword;

    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasseword() {
        return passeword;
    }

    public void setPasseword(String passeword) {
        this.passeword = passeword;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "email='" + email + '\'' +
                ", passeword='" + passeword + '\'' +
                '}';
    }


}
