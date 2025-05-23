
package app.model;

import java.sql.Timestamp;
import java.math.BigDecimal;


public class Trajet {
    private int id;
    private int profilId;
    private String startTown;
    private String endTown;
    private String startAddress;
    private String endAddress;
    private Timestamp startDate;
    private BigDecimal price;
    private String description;
    private Timestamp createdAt;

    public Trajet() {
    // constructeur vide requis pour pouvoir instancier l'objet sans arguments
    }

    public Trajet(int id, int profilId, String startTown, String endTown, String startAddress, String endAddress,
                  Timestamp startDate, BigDecimal price, String description, Timestamp createdAt) {
        this.id = id;
        this.profilId = profilId;
        this.startTown = startTown;
        this.endTown = endTown;
        this.startAddress = startAddress;
        this.endAddress = endAddress;
        this.startDate = startDate;
        this.price = price;
        this.description = description;
        this.createdAt = createdAt;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProfilId() {
        return profilId;
    }

    public void setProfilId(int profilId) {
        this.profilId = profilId;
    }

    public String getStartTown() {
        return startTown;
    }

    public void setStartTown(String startTown) {
        this.startTown = startTown;
    }

    public String getEndTown() {
        return endTown;
    }

    public void setEndTown(String endTown) {
        this.endTown = endTown;
    }

    public String getStartAddress() {
        return startAddress;
    }

    public void setStartAddress(String startAddress) {
        this.startAddress = startAddress;
    }

    public String getEndAddress() {
        return endAddress;
    }

    public void setEndAddress(String endAddress) {
        this.endAddress = endAddress;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
