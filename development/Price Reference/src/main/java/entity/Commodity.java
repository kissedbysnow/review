package entity;

import java.sql.Date;

public class Commodity {
    //商品信息
    private int id;
    private String classify;
    private String brand;
    private String version;
    private String description;
    private Float lowestPrice;
    private Float price;
    private Float discountPrice;
    private Float deduction;
    private Float actualPayment;
    private Date updatedDate;
    private Date purchasingDate;

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

    public Float getLowestPrice() {
        return lowestPrice;
    }

    public void setLowestPrice(Float lowestPrice) {
        this.lowestPrice = lowestPrice;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(Float discountPrice) {
        this.discountPrice = discountPrice;
    }

    public Float getDeduction() {
        return deduction;
    }

    public void setDeduction(Float deduction) {
        this.deduction = deduction;
    }

    public Float getActualPayment() {
        return actualPayment;
    }

    public void setActualPayment(Float actualPayment) {
        this.actualPayment = actualPayment;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Date getPurchasingDate() {
        return purchasingDate;
    }

    public void setPurchasingDate(Date purchasingDate) {
        this.purchasingDate = purchasingDate;
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "id=" + id +
                ", classify='" + classify + '\'' +
                ", brand='" + brand + '\'' +
                ", version='" + version + '\'' +
                ", description='" + description + '\'' +
                ", lowestPrice=" + lowestPrice +
                ", price=" + price +
                ", discountPrice=" + discountPrice +
                ", deduction=" + deduction +
                ", actualPayment=" + actualPayment +
                ", updatedDate=" + updatedDate +
                ", purchasingDate=" + purchasingDate +
                '}';
    }
}
