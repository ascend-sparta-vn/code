package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.webtrucking.entity.ThanhPhanPhuKien;

@Transactional
public interface ThanhPhanDAO extends CrudRepository<ThanhPhanPhuKien, Long> {

	public ThanhPhanPhuKien findThanhPhanByCuaAndPhuKien(@Param("idCua") long idCua, @Param("idPhuKien") long idPhuKien);
	public List<ThanhPhanPhuKien> findThanhPhanByCua(@Param("idCua") long idCua);
	
	@Modifying
	@Query(value="DELETE FROM tbo_thanh_phan_phu_kien WHERE cua = :idCua", nativeQuery = true)
	public void deleteThanhPhanPhuKienByIdCua(@Param("idCua") long idCua);
	
}
