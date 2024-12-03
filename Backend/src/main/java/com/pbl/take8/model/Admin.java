package com.pbl.take8.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "admin")
@AllArgsConstructor
@NoArgsConstructor
public class Admin {

    private int a_id;
    @Id
    @JsonProperty("name")
    private String name;
    private String phone_num;

    private String password;

    @OneToMany(mappedBy = "admin", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Customer> customers;

    @OneToMany//(mappedBy = "admin",cascade = CascadeType.ALL, orphanRemoval = true)
    private List<MilkCollection> milkCollections;
    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
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



    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
