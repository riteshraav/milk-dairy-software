package com.pbl.take8.service;

import com.pbl.take8.model.Admin;
import com.pbl.take8.model.Customer;
import com.pbl.take8.repository.AdminRepo;
import com.pbl.take8.repository.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CustomerService {
    @Autowired
    AdminRepo adminRepo;
    @Autowired
    CustomerRepo  customerRepo;

    public Customer getCustomerById(int cId) {
        return customerRepo.findById(cId).orElse(new Customer());
    }

    public void registerCustomer(Customer customer) {
        customerRepo.save(customer);

    }

    public List<Customer> getAllCustomer() {
        return customerRepo.findAll();
    }
}
