package esgi.java.advanced.ui.desktop.app.model;

public class Employee {



    private String nom;
    private String prenom;
    private String email;
    private String passeord;
    private String phone;
    private int  salaire;


    public Employee(String nom, String prenom, String phone , String passeord, String email, int  salaire ) {
        this.nom = nom;
        this.prenom = prenom;
        this.phone = phone;
        this.passeord = passeord;
        this.email = email;
        this.salaire = salaire;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasseord() {
        return passeord;
    }

    public void setPasseord(String passeord) {
        this.passeord = passeord;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int  getSalaire() {
        return salaire;
    }

    public void setSalaire(int  salaire) {
        this.salaire = salaire;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", email='" + email + '\'' +
                ", passeord='" + passeord + '\'' +
                ", phone='" + phone + '\'' +
                ", salaire='" + salaire + '\'' +
                '}';
    }
}
