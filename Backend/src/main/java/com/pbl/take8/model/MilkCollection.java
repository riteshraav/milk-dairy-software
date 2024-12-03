package com.pbl.take8.model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name = "MILKCOLLECTION")
public class MilkCollection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @ManyToOne//(cascade = {CascadeType.ALL})
    @JoinColumn(name = "c_id",referencedColumnName = "c_id",nullable = false)
     private Customer customer;

    @ManyToOne//(cascade = {CascadeType.ALL})
    @JoinColumn(name = "admin_name",referencedColumnName = "name",nullable = false)
    private Admin admin;

    @Column(name = "animal", nullable = false)
    private String animal;

    @Column( name = "created_at",updatable = false)
    @CreationTimestamp
    private LocalDateTime createdAt;

    @Enumerated(EnumType.STRING)
    @Column(name = "shift", nullable = false)
    private Shift shift;

    @Column(name = "quantity_liters", nullable = false)
    private double quantityLiters;

    @Column(name = "fat", nullable = false)
    private double fat;

    @Column(name = "total_value", nullable = false)
    private double total_value;

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public String getAnimal() {
        return animal;
    }

    public void setAnimal(String animal) {
        this.animal = animal;
    }







    public Shift getShift() {
        return shift;
    }

    public void setShift(Shift shift) {
        this.shift = shift;
    }

    public double getQuantityLiters() {
        return quantityLiters;
    }

    public void setQuantityLiters(double quantityLiters) {
        this.quantityLiters = quantityLiters;
    }

    public double getTotal_value() {
        return total_value;
    }

    public void setTotal_value(double total_value) {
        this.total_value = total_value;
    }

    public double getFat() {
        return fat;
    }

    public void setFat(double fat) {
        this.fat = fat;
    }
}
