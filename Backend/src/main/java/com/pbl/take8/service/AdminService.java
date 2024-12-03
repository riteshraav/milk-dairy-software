package com.pbl.take8.service;

import com.pbl.take8.model.Admin;
import com.pbl.take8.model.Customer;
import com.pbl.take8.repository.AdminRepo;
import com.pbl.take8.repository.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {
    @Autowired
    AdminRepo adminRepo;

    public List<Admin> getAllAdmin()
    {
        return adminRepo.findAll();
    }

//    public Admin getAdminById(int aId) {
//        return adminRepo.findById(aId).orElse(new Admin());
//    }

    public void updateAdminById(Admin admin) {
        adminRepo.save(admin);
    }

    public Admin getAdminByName(String name) {
       return adminRepo.findById(name).orElse(new Admin());
    }


}
