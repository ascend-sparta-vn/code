package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.webtrucking.entity.OwnerTruck;

public interface OwnerTruckDAO extends CrudRepository<OwnerTruck, Integer>{
	
	@Query(value="SELECT * FROM owner_truck a WHERE a.owner_type = 1"
			+ " and (a.owner_name LIKE CONCAT('%',:name,'%'))"
			+ " and (a.owner_status = :status OR 1 = 1)"
			+ " and (a.owner_phone_number LIKE CONCAT('%',:phone,'%'))" , nativeQuery=true)
	List<OwnerTruck> searchListCommodity(@Param("name") String name, @Param("status") String status, @Param("phone") String phone);

}
