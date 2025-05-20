package app.model;

public class User {
    private int id;
    private String nom;
    private String email;
    private String motDePasse;
    private java.sql.Timestamp dateCreation;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMotDePasse() { return motDePasse; }
    public void setMotDePasse(String motDePasse) { this.motDePasse = motDePasse; }

    public java.sql.Timestamp getDateCreation() { return dateCreation; }
    public void setDateCreation(java.sql.Timestamp dateCreation) { this.dateCreation = dateCreation; }
}
