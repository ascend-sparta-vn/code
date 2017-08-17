package com.webtrucking.dao;

import com.webtrucking.entity.Order;
import com.webtrucking.entity.OrdersShipment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersDAO extends CrudRepository<Order, Integer>{

	List<Order> findByUserIdOrderByCreatedTimestamp(Integer userId);
	List<Order> findAllByOrderByCreatedTimestamp();
	List<Order> findAll();

}
