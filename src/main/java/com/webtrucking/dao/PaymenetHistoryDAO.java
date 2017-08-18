package com.webtrucking.dao;

import com.webtrucking.entity.Order;
import com.webtrucking.entity.PaymentHistory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymenetHistoryDAO extends CrudRepository<PaymentHistory, Integer>{

	List<PaymentHistory> findByOrderId(Integer id);
}
