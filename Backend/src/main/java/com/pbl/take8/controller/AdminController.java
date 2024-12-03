package com.pbl.take8.controller;

import com.pbl.take8.model.Admin;
import com.pbl.take8.model.Customer;
import com.pbl.take8.service.AdminService;
import com.pbl.take8.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Controller
@CrossOrigin("*")
@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService service;


        @GetMapping("/all")
        public List<Admin> getAllAdmin()
        {
            return service.getAllAdmin();
        }

        @GetMapping("/login/{name}")
        public Admin getAdminByName(@PathVariable String name)
        {
            return service.getAdminByName(name);
        }
        @PostMapping("/signup")
        public void updateAdminbyId(@RequestBody Admin admin)
        {
             service.updateAdminById(admin);
        }



}
