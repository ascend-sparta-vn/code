package com.webtrucking.dao;

import com.webtrucking.entity.PaymentHistory;
import com.webtrucking.entity.Wallet;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WalletDAO extends CrudRepository<Wallet, Integer>{

	List<Wallet> findByUserId(Integer userId);

	List<Wallet> findByMobileNumber(String mobileNumber);
}
