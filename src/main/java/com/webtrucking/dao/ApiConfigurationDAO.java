package com.webtrucking.dao;

import com.webtrucking.entity.ApiConfiguration;
import org.springframework.data.repository.CrudRepository;

public interface ApiConfigurationDAO extends CrudRepository<ApiConfiguration, Integer> {
}
