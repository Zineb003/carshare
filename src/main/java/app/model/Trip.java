package app.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.sql.Time;
import java.sql.Timestamp;

public class Trip {
    private int id;
    private int driverId;
    private String startTown;
    private String endTown;
    private String startAddress;
    private String endAddress;
    private LocalDateTime startDate;
    private Time startHour;
    private int nbPlaces;
    private BigDecimal price;
    private Time estimatedTime;
    private String description;
    private String vehicule;
    private String status;
    private Timestamp createdAt;

    public Trip() {}

    public Trip(int id, int driverId, String startTown, String endTown,
                String startAddress, String endAddress, LocalDateTime startDate, Time startHour,
                int nbPlaces, BigDecimal price, Time estimatedTime,
                String description, String vehicule, String status, Timestamp createdAt) {
        this.id = id;
        this.driverId = driverId;
        this.startTown = startTown;
        this.endTown = endTown;
        this.startAddress = startAddress;
        this.endAddress = endAddress;
        this.startDate = startDate;
        this.startHour = startHour;
        this.nbPlaces = nbPlaces;
        this.price = price;
        this.estimatedTime = estimatedTime;
        this.description = description;
        this.vehicule = vehicule;
        this.status = status;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
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

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public Time getStartHour() {
        return startHour;
    }

    public void setStartHour(Time startHour) {
        this.startHour = startHour;
    }

    public int getNbPlaces() {
        return nbPlaces;
    }

    public void setNbPlaces(int nbPlaces) {
        this.nbPlaces = nbPlaces;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Time getEstimatedTime() {
        return estimatedTime;
    }

    public void setEstimatedTime(Time estimatedTime) {
        this.estimatedTime = estimatedTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVehicule() {
        return vehicule;
    }

    public void setVehicule(String vehicule) {
        this.vehicule = vehicule;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}