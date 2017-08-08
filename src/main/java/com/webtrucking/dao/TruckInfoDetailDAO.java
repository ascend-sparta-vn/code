package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.webtrucking.entity.TruckInfoDetail;

public interface TruckInfoDetailDAO extends CrudRepository<TruckInfoDetail, Integer>{
	
	
	@Query(value="SELECT a.* FROM truck_info_detail a"
			+ " WHERE (a.from_district IN (SELECT b.id FROM district b WHERE b.province_id = :provinceFrom) OR (:provinceFrom = -1))"
			+ " AND (a.to_district IN (SELECT b.id FROM district b WHERE b.province_id = :provinceTo) OR (:provinceTo = -1))"
			+ " AND (a.from_district = :districtFrom OR :districtFrom = -1)"
			+ " AND (a.to_district = :districtTo OR :districtTo = -1) "
			+ " AND (a.goods_type_id = :goodsType OR :goodsType = -1)"
			+ " AND (:truckType in (SELECT c.truck_type_id FROM truck c where a.truck_id = c.id) OR :truckType = -1)"
			+ " AND (DATE_FORMAT(a.start_date , '%d/%m/%Y') >= :fromDate OR :fromDate='')"
			+ " AND (DATE_FORMAT(a.expired_date , '%d/%m/%Y') >= :toDate OR :toDate='')"
			+ " AND a.status = 1"
			+ " ORDER BY a.id DESC"
			+ " LIMIT :start, :end"
			, nativeQuery=true)
	List<TruckInfoDetail> searchTruckInfoDetail(
			@Param("provinceTo") Integer provinceTo,
			@Param("provinceFrom") Integer provinceFrom,
			@Param("districtTo") Integer districtTo,
			@Param("districtFrom") Integer districtFrom,
			@Param("truckType") Integer truckType,
			@Param("goodsType") Integer goodsType,
			@Param("fromDate") String fromDate,
			@Param("toDate") String toDate,
			@Param("start") Integer start,
			@Param("end") Integer end);
	
	@Query(value="SELECT count(*) FROM truck_info_detail a"
			+ " WHERE (a.from_district IN (SELECT b.id FROM district b WHERE b.province_id = :provinceFrom) OR (:provinceFrom = -1))"
			+ " AND (a.to_district IN (SELECT b.id FROM district b WHERE b.province_id = :provinceTo) OR (:provinceTo = -1))"
			+ " AND (a.from_district = :districtFrom OR :districtFrom = -1)"
			+ " AND (a.to_district = :districtTo OR :districtTo = -1) "
			+ " AND (a.goods_type_id = :goodsType OR :goodsType = -1)"
			+ " AND (:truckType in (SELECT c.truck_type_id FROM truck c where a.truck_id = c.id) OR :truckType = -1)"
			+ " AND (DATE_FORMAT(a.start_date , '%d/%m/%Y') >= :fromDate OR :fromDate='')"
			+ " AND (DATE_FORMAT(a.expired_date , '%d/%m/%Y') >= :toDate OR :toDate='')"
			+ " AND a.status = 1"
			, nativeQuery=true)
	Integer countResult(
			@Param("provinceTo") Integer provinceTo,
			@Param("provinceFrom") Integer provinceFrom,
			@Param("districtTo") Integer districtTo,
			@Param("districtFrom") Integer districtFrom,
			@Param("truckType") Integer truckType,
			@Param("goodsType") Integer goodsType,
			@Param("fromDate") String fromDate,
			@Param("toDate") String toDate);
	
	
	/**
	 * get detail trucking info by truckId
	 * @param truckingId
	 * @return
	 */
	@Query(value="SELECT a.*, c.owner_name, b.truck_code, d.name  "
			+ "FROM truck_info_detail a "
			+ "INNER JOIN truck b ON a.truck_id = b.id "
			+ "INNER JOIN owner_truck c ON b.owner_truck_id = c.id "
			+ "LEFT JOIN truck_type d ON b.truck_type_id = d.id "
			+ "WHERE a.id = :truckId", nativeQuery=true)
	TruckInfoDetail getTruckInfoById(@Param("truckId") Integer truckId);
	
	@Query(value="SELECT (SELECT id FROM truck_info_detail WHERE id < :truckId and status = 1 ORDER BY id DESC LIMIT 1) prevId, "
			+ "(SELECT id FROM truck_info_detail WHERE id > :truckId and status = 1 ORDER BY id ASC LIMIT 1) nextId "
			+ "FROM truck_info_detail "
			, nativeQuery=true)
	List<Object[]> getPrevNextTruckingId(
			@Param("truckId") Integer truckId);
	
	/**
	 * @author ThanhNV
	 * @param ownerId
	 * @return
	 */
	@Query(value="SELECT a.* FROM truck_info_detail a"
			+ " INNER JOIN truck b ON a.truck_id = b.id"
			+ " WHERE b.owner_truck_id = :ownerId"
			, nativeQuery=true)
	List<TruckInfoDetail> getTruckingDetailsByOwner(
			@Param("ownerId") Integer ownerId);
	
	//Integer countByGoodsTypeId(Integer goodsTypeId);
	
	@Query(value="SELECT count(*) FROM truck_info_detail a"
			+ " INNER JOIN truck b ON a.truck_id = b.id"
			+ " WHERE b.truck_type_id = :truckTypeId"
			, nativeQuery=true)
	Integer countByTruckTypeId(@Param("truckTypeId") Integer truckTypeId);
}
