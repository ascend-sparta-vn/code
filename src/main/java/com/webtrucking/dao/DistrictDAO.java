package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.webtrucking.entity.District;

public interface DistrictDAO extends CrudRepository<District, String>{
	
	@Query(value="SELECT * FROM district WHERE province_id= :provinceId", nativeQuery=true)
	List<District> getListDistrictByProvinceId(@Param("provinceId") Integer provinceId);
	
}
