package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.webtrucking.entity.Shipment;

public interface ShipmentDAO extends CrudRepository<Shipment, Integer>{
	
	@Query(value="SELECT a.* FROM shipment a"
			+ " WHERE (a.from_district IN (SELECT b.id FROM district b WHERE b.province_id = :provinceFrom) OR (:provinceFrom = -1))"
			+ " AND (a.to_district IN (SELECT b.id FROM district b WHERE b.province_id = :provinceTo) OR (:provinceTo = -1))"
			+ " AND (a.from_district = :districtFrom OR :districtFrom = -1)"
			+ " AND (a.to_district = :districtTo OR :districtTo = -1) "
			+ " AND (a.goods_type_id = :goodsType OR :goodsType = -1)"
			+ " AND (DATE_FORMAT(a.start_date , '%d/%m/%Y') >= :fromDate OR :fromDate='')"
			+ " AND (DATE_FORMAT(a.expired_date , '%d/%m/%Y') >= :toDate OR :toDate='')"
			+ " AND a.status = 1"
			+ " ORDER BY a.id DESC"
			+ " LIMIT :start, :end"
			, nativeQuery=true)
	List<Shipment> searchShipment(
			@Param("provinceTo") Integer provinceTo,
			@Param("provinceFrom") Integer provinceFrom,
			@Param("districtTo") Integer districtTo,
			@Param("districtFrom") Integer districtFrom,
			@Param("goodsType") Integer goodsType,
			@Param("fromDate") String fromDate,
			@Param("toDate") String toDate, 
			@Param("start") Integer start, 
			@Param("end") Integer end);
	
	@Query(value="SELECT count(*) FROM shipment a"
			+ " WHERE (a.from_district IN (SELECT b.id FROM district b WHERE b.province_id = :provinceFrom) OR (:provinceFrom = -1))"
			+ " AND (a.to_district IN (SELECT b.id FROM district b WHERE b.province_id = :provinceTo) OR (:provinceTo = -1))"
			+ " AND (a.from_district = :districtFrom OR :districtFrom = -1)"
			+ " AND (a.to_district = :districtTo OR :districtTo = -1) "
			+ " AND (a.goods_type_id = :goodsType OR :goodsType = -1)"
			+ " AND (DATE_FORMAT(a.start_date , '%d/%m/%Y') >= :fromDate OR :fromDate='')"
			+ " AND (DATE_FORMAT(a.expired_date , '%d/%m/%Y') >= :toDate OR :toDate='')"
			+ " AND a.status = 1"
			, nativeQuery=true)
	Integer countResult(
			@Param("provinceTo") Integer provinceTo,
			@Param("provinceFrom") Integer provinceFrom,
			@Param("districtTo") Integer districtTo,
			@Param("districtFrom") Integer districtFrom,
			@Param("goodsType") Integer goodsType,
			@Param("fromDate") String fromDate,
			@Param("toDate") String toDate);
	
	
	@Query(value="SELECT a.* FROM shipment a"
			+ " WHERE a.owner_id = :ownerId"
			, nativeQuery=true)
	List<Shipment> getGoodsByOwner(
			@Param("ownerId") Integer ownerId);
	
	@Query(value="SELECT (SELECT id FROM shipment WHERE id < :shipmentId and status =1 ORDER BY id DESC LIMIT 1) prevId, "
			+ "(SELECT id FROM shipment WHERE id > :shipmentId and status =1 ORDER BY id ASC LIMIT 1) nextId FROM shipment"
			, nativeQuery=true)
	List<Object[]> getPrevNextShipmentId(
			@Param("shipmentId") Integer shipmentId);
	
	@Query(value="SHOW TABLE STATUS WHERE `Name` = 'shipment'", nativeQuery=true)
	List<Object[]> getNextAutoIncreamentShipment();
	
}
