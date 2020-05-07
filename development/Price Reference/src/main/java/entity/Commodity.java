package entity;

import java.sql.Date;

public class Commodity {
    //商品信息
    private int id;
    private String classify;
    private String brand;
    private String version;
    private String description;
    private Integer weightCapacity;
    private Integer quantity;

    private Float price;
    private Float costPerformance1;
    private Float unitPrice1;

    private Float lowestPrice;
    private Float costPerformance2;
    private Float unitPrice2;

    private Float actualPayment;
    private Float costPerformance3;
    private Float unitPrice3;

    private Date date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getWeightCapacity() {
        return weightCapacity;
    }

    public void setWeightCapacity(Integer weightCapacity) {
        this.weightCapacity = weightCapacity;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getCostPerformance1() {
        return costPerformance1;
    }

    public void setCostPerformance1(Float costPerformance1) {
        this.costPerformance1 = costPerformance1;
    }

    public Float getUnitPrice1() {
        return unitPrice1;
    }

    public void setUnitPrice1(Float unitPrice1) {
        this.unitPrice1 = unitPrice1;
    }

    public Float getLowestPrice() {
        return lowestPrice;
    }

    public void setLowestPrice(Float lowestPrice) {
        this.lowestPrice = lowestPrice;
    }

    public Float getCostPerformance2() {
        return costPerformance2;
    }

    public void setCostPerformance2(Float costPerformance2) {
        this.costPerformance2 = costPerformance2;
    }

    public Float getUnitPrice2() {
        return unitPrice2;
    }

    public void setUnitPrice2(Float unitPrice2) {
        this.unitPrice2 = unitPrice2;
    }

    public Float getActualPayment() {
        return actualPayment;
    }

    public void setActualPayment(Float actualPayment) {
        this.actualPayment = actualPayment;
    }

    public Float getCostPerformance3() {
        return costPerformance3;
    }

    public void setCostPerformance3(Float costPerformance3) {
        this.costPerformance3 = costPerformance3;
    }

    public Float getUnitPrice3() {
        return unitPrice3;
    }

    public void setUnitPrice3(Float unitPrice3) {
        this.unitPrice3 = unitPrice3;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
