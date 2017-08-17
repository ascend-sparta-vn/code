package com.webtrucking.dao;

import com.webtrucking.entity.DeliveryOrder;
import com.webtrucking.entity.Order;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface DeliveryDAO extends CrudRepository<DeliveryOrder, Integer>{

    /*@Transactional
    @Query(value="delete from DeliveryOrder c where c.orderId = ?1")
    void deleteByOrder(Integer orderId);
    */
    @Transactional
    Integer deleteByOrderId(Integer orderId);
}
