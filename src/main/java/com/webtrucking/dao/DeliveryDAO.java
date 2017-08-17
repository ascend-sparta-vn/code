package com.webtrucking.dao;

import com.webtrucking.entity.DeliveryOrder;
import com.webtrucking.entity.Order;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeliveryDAO extends CrudRepository<DeliveryOrder, Integer>{


}
