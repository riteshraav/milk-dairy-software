package com.pbl.take8.controller;

import com.pbl.take8.model.Customer;
import com.pbl.take8.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@CrossOrigin(origins = "*")

@RestController()
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    CustomerService customerService;
    @GetMapping("/{c_id}")
    public Customer getCustomerById(@PathVariable int c_id)
    {
        return customerService.getCustomerById(c_id);
    }
    @PostMapping("/add")
    public void registerCustomer(@RequestBody Customer customer) {
        customerService.registerCustomer(customer);
    }
    @GetMapping("/all")
    public List<Customer> getAllCustomer()
    {
    return customerService.getAllCustomer();
    }

}
