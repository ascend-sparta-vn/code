package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.webtrucking.entity.OrdersShipment;
import com.webtrucking.entity.OrdersTrucking;
import com.webtrucking.entity.TruckInfoDetail;

public interface OrdersDAO extends CrudRepository<OrdersTrucking, Integer>{
	
	/**
	 * transaction_type=1 ==> shipment transaction
	 * transaction_type=2 ==> trucking transaction
	 * order_type = 1 ==> sending
	 * order_type = 2 ==> receiving
	 * @param provinceTo
	 * @param provinceFrom
	 * @param goodsType
	 * @param fromDate
	 * @param toDate
	 * @param orderType
	 * @return
	 */
	@Query(value="SELECT a.* FROM orders_shipment a WHERE (a.`event_id` IN(SELECT b.`id` FROM shipment b WHERE b.`from_district` "
			+ "IN (SELECT c.id FROM district c WHERE c.`province_id` = :provinceTo OR :provinceTo = -1))) "
			+ "AND (a.`event_id` IN(SELECT d.`id` FROM shipment d WHERE d.`to_district` "
			+ "IN (SELECT e.id FROM district e WHERE e.`province_id` = :provinceFrom OR :provinceFrom = -1))) "
			+ "AND (a.`event_id` IN (SELECT h.`id` FROM shipment h WHERE h.`goods_type_id` = :goodsType OR :goodsType = -1)) "
			+ "AND (a.`event_id` IN(SELECT f.`id` FROM shipment f WHERE (STR_TO_DATE(:fromDate , '%d/%m/%Y') >= f.start_date OR :fromDate=''))) "
			+ "AND (a.`event_id` IN(SELECT g.`id` FROM shipment g WHERE (STR_TO_DATE(:toDate , '%d/%m/%Y') <= g.finish_date OR :toDate =''))) "
			+ "AND (a.`transaction_type` = 2) "
			+ "AND (IF(:orderType = -1,:orderType = -1,IF(:orderType = 1, a.owner_id= :ownerId, a.partner_id= :ownerId)))"
			, nativeQuery=true)
	List<OrdersShipment> searchShipmentOrders(
			@Param("provinceTo") Integer provinceTo,
			@Param("provinceFrom") Integer provinceFrom,
			@Param("goodsType") Integer goodsType,
			@Param("fromDate") String fromDate,
			@Param("toDate") String toDate,
			@Param("orderType") Integer orderType,
			@Param("ownerId") Integer ownerId);
	
	/**
	 * transaction_type=1 ==> shipment transaction
	 * transaction_type=2 ==> trucking transaction
	 * order_type = 1 ==> sending
	 * order_type = 2 ==> receiving
	 * @param provinceTo
	 * @param provinceFrom
	 * @param goodsType
	 * @param fromDate
	 * @param toDate
	 * @param orderType
	 * @return
	 */
	@Query(value="SELECT a.* FROM orders_trucking a WHERE (a.`event_id` IN(SELECT b.`id` FROM truck_info_detail b WHERE b.`from_district` "
			+ "IN (SELECT c.id FROM district c WHERE c.`province_id` = :provinceTo OR :provinceTo = -1))) "
			+ "AND (a.`event_id` IN(SELECT d.`id` FROM truck_info_detail d WHERE d.`to_district` "
			+ "IN (SELECT e.id FROM district e WHERE e.`province_id` = :provinceFrom OR :provinceFrom = -1))) "
			+ "AND (a.`event_id` IN (SELECT h.`id` FROM truck_info_detail h WHERE h.`truck_id` in (select id from truck where truck_type_id = :truckType or :truckType = -1)))  "
			+ "AND (a.`event_id` IN(SELECT f.`id` FROM truck_info_detail f WHERE (STR_TO_DATE(:fromDate , '%d/%m/%Y') >= f.start_date OR :fromDate=''))) "
			+ "AND (a.`event_id` IN(SELECT g.`id` FROM truck_info_detail g WHERE (STR_TO_DATE(:toDate , '%d/%m/%Y') <= g.expired_date OR :toDate =''))) "
			+ "AND (a.`transaction_type` = 1) "
			+ "AND (IF(:orderType = -1,:orderType = -1,IF(:orderType = 1, a.owner_id= :ownerId, a.partner_id= :ownerId)))"
			, nativeQuery=true)
	List<OrdersTrucking> searchTruckingOrders(
			@Param("provinceTo") Integer provinceTo,
			@Param("provinceFrom") Integer provinceFrom,
			@Param("truckType") Integer truckType,
			@Param("fromDate") String fromDate,
			@Param("toDate") String toDate,
			@Param("orderType") Integer orderType,
			@Param("ownerId") Integer ownerId);
	
	
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
	
}
