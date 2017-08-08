package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.webtrucking.entity.Truck;

public interface TruckDAO extends CrudRepository<Truck, Integer> {
	
	@Query(value="SELECT * FROM truck WHERE plate_number = :plateNumber", nativeQuery=true)
	List<Truck> getListTruckByPlateNumber(@Param("plateNumber") String plateNumber);
	
	@Query(value="SELECT * FROM truck WHERE owner_truck_id = :ownerTruckId", nativeQuery=true)
	List<Truck> getListTruckByOwner(@Param("ownerTruckId") Integer id);
	
	@Query(value="SHOW TABLE STATUS WHERE `Name` = 'truck'", nativeQuery=true)
	List<Object[]> getNextAutoIncreamentTrucking();
}
