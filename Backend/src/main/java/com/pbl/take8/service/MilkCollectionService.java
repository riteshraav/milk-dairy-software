package com.pbl.take8.service;

import com.pbl.take8.model.Customer;
import com.pbl.take8.model.MilkCollection;
import com.pbl.take8.repository.MilkCollectionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MilkCollectionService {
    @Autowired
    MilkCollectionRepo milkCollectionRepo;
    public void saveInfo(MilkCollection milkCollection) {
        MilkCollection milkCollection1 = new MilkCollection();
        milkCollection1.setShift(milkCollection.getShift());
        milkCollection1.setAdmin(milkCollection.getAdmin());
        milkCollection1.setCustomer(milkCollection.getCustomer());
        milkCollection1.setAnimal(milkCollection.getAnimal());
        milkCollection1.setQuantityLiters(milkCollection.getQuantityLiters());
        milkCollection1.setTotal_value(milkCollection.getTotal_value());
        milkCollection1.setFat(milkCollection.getFat());
        milkCollectionRepo.save(milkCollection1);
    }

    public List<MilkCollection> getAllCollection() {
        return milkCollectionRepo.findAll();

    }

    public List<double[]> getReportWithCustomerAndAnimal(int c_id,String animal) {
        return milkCollectionRepo.findTotalValueByCustomerAndAnimal(c_id, animal);
    }
}
