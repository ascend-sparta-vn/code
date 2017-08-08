package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.webtrucking.entity.OrdersShipment;

public interface OrdersShipmentDAO extends CrudRepository<OrdersShipment, Integer>{
	
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
			+ "IN (SELECT c.id FROM district c WHERE c.`province_id` = :provinceFrom OR :provinceFrom = -1))) "
			+ "AND (a.`event_id` IN(SELECT d.`id` FROM shipment d WHERE d.`to_district` "
			+ "IN (SELECT e.id FROM district e WHERE e.`province_id` = :provinceTo OR :provinceTo = -1))) "
			+ "AND (a.`event_id` IN (SELECT h.`id` FROM shipment h WHERE h.`goods_type_id` = :goodsType OR :goodsType = -1)) "
			+ "AND (a.`event_id` IN(SELECT f.`id` FROM shipment f WHERE (STR_TO_DATE(:fromDate , '%d/%m/%Y') >= f.start_date OR :fromDate=''))) "
			+ "AND (a.`event_id` IN(SELECT g.`id` FROM shipment g WHERE (STR_TO_DATE(:toDate , '%d/%m/%Y') <= g.finish_date OR :toDate =''))) "
			+ "AND (IF(:orderType = -1,(a.owner_id = :ownerId OR a.partner_id = :ownerId),IF(:orderType = 2, a.owner_id= :ownerId, a.partner_id= :ownerId)))"
			, nativeQuery=true)
	List<OrdersShipment> searchShipmentOrders(
			@Param("provinceTo") Integer provinceTo,
			@Param("provinceFrom") Integer provinceFrom,
			@Param("goodsType") Integer goodsType,
			@Param("fromDate") String fromDate,
			@Param("toDate") String toDate,
			@Param("orderType") Integer orderType,
			@Param("ownerId") Integer ownerId);
	
}
