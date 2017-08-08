package com.webtrucking.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.webtrucking.entity.StatisticTrucking;

public interface StatisticTruckingDAO extends CrudRepository<StatisticTrucking, Integer>{

//	@Modifying
//	@Query(value = "delete from statistic_trucking where object_type = ?1 ", nativeQuery = true)
//	void deleteByType(Integer type);
	@Transactional
    @Modifying(clearAutomatically = true)
	void deleteByObjectType(int type);
}
