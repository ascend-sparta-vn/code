package com.webtrucking.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.webtrucking.entity.Cua;
import com.webtrucking.entity.PhuKien;


@Transactional
public interface PhuKienDAO extends CrudRepository<PhuKien, Long>{
	
	@Query(value ="SELECT DISTINCT a.* "
			+ "FROM tbo_phu_kien a "
			+ "INNER JOIN tbo_thanh_phan_phu_kien b "
			+ "ON a.id_phu_kien = b.phu_kien "
			+ "WHERE b.cua = :idCua "
			+ "AND a.category = :category ", nativeQuery = true)
	public List<PhuKien> findThietBiByCategory(@Param("category") String category, @Param("idCua") int idCua);
	
	@Query( "select o from PhuKien o where category in :cateList" )
	public List<PhuKien> getThietBiByCategories(@Param("cateList") List<String> cateList);
	
	@Query(value ="SELECT DISTINCT a.* "
				+ "FROM tbo_phu_kien a "
				+ "INNER JOIN tbo_thanh_phan_phu_kien b "
				+ "ON a.id_phu_kien = b.phu_kien "
				+ "WHERE b.cua = :idCua "
				+ "AND a.category = :category "
				+ "AND (a.kich_thuoc_toi_thieu <= :chieuDai or :chieuDai = 0) "
				+ "AND (a.kich_thuoc_toi_Da >= :chieuDai or :chieuDai = 0 )", nativeQuery = true)
	public List<PhuKien> searchPhuKienByChieuDai(@Param("idCua") int idCua, @Param("chieuDai") int chieuDai, @Param("category") String category);
	
	@Query(value ="SELECT DISTINCT a.* "
			+ "FROM tbo_phu_kien a "
			+ "INNER JOIN tbo_thanh_phan_phu_kien b "
			+ "ON a.id_phu_kien = b.phu_kien "
			+ "WHERE b.cua = :idCua "
			+ "AND a.category = :category "
			+ "AND (a.kich_thuoc_toi_thieu <= :chieuRong or :chieuRong = 0) "
			+ "AND (a.kich_thuoc_toi_Da >= :chieuRong or :chieuRong = 0 )", nativeQuery = true)
	public List<PhuKien> searchPhuKienByChieuRong(@Param("idCua") int idCua, @Param("chieuRong") int chieuRong, @Param("category") String category);
	
	@Query(value="SELECT DISTINCT a.* "
			+ "FROM tbo_phu_kien a INNER JOIN tbo_thanh_phan_phu_kien b "
			+ "ON a.id_phu_kien = b.phu_kien WHERE b.cua = :idCua", nativeQuery = true)
	public List<PhuKien> getAllPhuKienByIdCua(@Param("idCua") int idCua);
	
	@Modifying
	@Query(value =	"DELETE a FROM tbo_phu_kien a INNER JOIN tbo_thanh_phan_phu_kien b " 
				  + "ON a.id_phu_kien = b.phu_kien "
				  + "WHERE b.cua = :idCua", nativeQuery = true)
	public void deletePhuKienByIdCua(@Param("idCua") long idCua);
}
