package com.pbl.take8.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "customer")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int c_id;
    @JsonProperty("name")
    private String name;
    @JsonProperty("phone_num")
    private String phone_num;

    @JsonProperty("animal")
    private String animal;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    @JoinColumn(name = "admin_name", referencedColumnName = "name", nullable = false)
    private Admin admin;

    @OneToMany//(mappedBy = "customer",cascade = CascadeType.ALL,orphanRemoval = true)
    private List<MilkCollection> milkCollections;


    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public String getAnimal() {
        return animal;
    }

    public void setAnimal(String animal) {
        this.animal = animal;
    }


    public String getAdmin() {
        return admin.getName();
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
}
