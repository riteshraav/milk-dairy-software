package com.pbl.take8.repository;

import com.pbl.take8.model.MilkCollection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface MilkCollectionRepo extends JpaRepository<MilkCollection, Integer> {

    @Query("SELECT mc.quantityLiters,mc.total_value from MilkCollection mc where mc.customer.c_id = :c_id and mc.animal = :animal")
    List<double[]> findTotalValueByCustomerAndAnimal(@Param("c_id")int c_id,@Param("animal")String animal);
}
