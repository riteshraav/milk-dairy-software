package com.pbl.take8.controller;

import com.pbl.take8.model.Customer;
import com.pbl.take8.model.MilkCollection;
import com.pbl.take8.service.MilkCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/collection")
@Controller
@CrossOrigin
public class MilkCollectionController {
    @Autowired
    MilkCollectionService milkCollectionService;
    @PostMapping("/save")
    public void saveInfo(@RequestBody MilkCollection milkCollection) {
        milkCollectionService.saveInfo(milkCollection);
    }
    @GetMapping("/all")
    public List<MilkCollection> getAllCollection()
    {
       return milkCollectionService.getAllCollection();
    }
    @GetMapping("/total_value")
    public List<double[]> getReportWithCustomerAndAnimal(@RequestParam int c_id,@RequestParam String animal )
    {
        return milkCollectionService.getReportWithCustomerAndAnimal(c_id,animal);
    }


}
