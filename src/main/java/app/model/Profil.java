

package app.model;

import java.sql.Timestamp;


public class Profil {
    private int id;
    private int userId;
    private String statut;
    private String typeVehicule;
    private int nbPassagersMax;
    private Timestamp createdAt;

    public Profil(int id, int userId, String statut, String typeVehicule, int nbPassagersMax, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.statut = statut;
        this.typeVehicule = typeVehicule;
        this.nbPassagersMax = nbPassagersMax;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public String getTypeVehicule() {
        return typeVehicule;
    }

    public void setTypeVehicule(String typeVehicule) {
        this.typeVehicule = typeVehicule;
    }

    public int getNbPassagersMax() {
        return nbPassagersMax;
    }

    public void setNbPassagersMax(int nbPassagersMax) {
        this.nbPassagersMax = nbPassagersMax;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
