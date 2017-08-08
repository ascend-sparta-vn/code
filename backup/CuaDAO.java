package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webtrucking.entity.Cua;

@Transactional
public interface CuaDAO extends CrudRepository<Cua, Long>{

	public List<Cua> findCuaByHeProfile(@Param("heProfile") String heProfile);
	public List<Cua> findCuaByHeMo(@Param("heMo") String heMo);
	public List<Cua> findCuaByHeSoAnToan(@Param("heSoAnToan") String heSoAnToan);
	public List<Cua> findCuaByLoaiBanLe(@Param("loaiBanLe") String loaiBanLe);
	public List<Cua> findCuaBySoCanh(@Param("soCanh") int soCanh);
	public List<Cua> findCuaByLoaiCua(@Param("loaiCua") String loaiCua);
	
	@Modifying
	@Query("from Cua where "
			+ "cua_truot_quay = ?1 "
			+ "and he_mo = ?2 "
			+ "and he_profile = ?3 "
			+ "and he_so_an_toan = ?4 "
			+ "and loai_ban_le = ?5 "
			+ "and loai_cua = ?6 "
			+ "and so_canh = ?7")
	public List<Cua> findAll(String cuaTruotQuay, String heMo, String heProfile, String heSoAnToan, String loaiBanLe, String loaiCua, Integer soCanh);
	
	@Modifying
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor={java.lang.Exception.class, java.lang.RuntimeException.class})
	@Query("delete from Cua where ky_hieu = ?1 "
			+ "and cua_truot_quay = ?2 "
			+ "and he_mo = ?3 "
			+ "and he_profile = ?4 "
			+ "and he_so_an_toan = ?5 "
			+ "and loai_ban_le = ?6 "
			+ "and loai_cua = ?7 "
			+ "and so_canh = ?8")
	void delete(String kyHieu, String cuaTruotQuay, String heMo, String heProfile, String heSoAnToan, String loaiBanLe, String loaiCua, Integer soCanh);
	
	@Query(value = "SELECT DISTINCT id_cua, ky_hieu, anh_dai_dien, cua_truot_quay, loai_cua, so_canh, loai_ban_le, he_so_an_toan, he_mo, he_profile "
			+ "FROM tbo_cua p LEFT JOIN tbo_thanh_phan_phu_kien tppk ON tppk.cua = p.id_cua"
			+" LEFT JOIN tbo_phu_kien pk ON tppk.phu_kien = pk.id_phu_kien "
			+ " WHERE (LOWER(p.he_profile) = LOWER(:heProfile) or :heProfile is null or :heProfile = '') "
			+ " AND (LOWER(p.he_so_an_toan) = LOWER(:heSoAnToan) or :heSoAnToan is null or :heSoAnToan = '' )"
			+ " AND (LOWER(p.loai_ban_le) = LOWER(:loaiBanLe) or :loaiBanLe is null or :loaiBanLe = ''  )"
			+ " AND (LOWER(p.he_mo) = LOWER(:heMo) or :heMo is null or :heMo = ''  )"
			+ " AND (LOWER(p.cua_truot_quay) = LOWER(:cuaTruotQuay) or :cuaTruotQuay is null or :cuaTruotQuay = ''  )"
			+ " AND (LOWER(p.loai_cua) = LOWER(:loaiCua) or :loaiCua is null or :loaiCua = ''  )"
			+ " AND ( p.so_canh = :soCanh or :soCanh = 0 )", nativeQuery = true)
			//+ " AND ( ( (pk.kich_thuoc_toi_thieu <= :chieuRong ) and (:chieuRong <= pk.kich_thuoc_toi_da) ) or :chieuRong = 0 and pk.category ='rong')"
			//+ " AND ( ( (pk.kich_thuoc_toi_thieu <= :chieuDai ) and (:chieuDai <= pk.kich_thuoc_toi_da) ) or :chieuDai = 0 and pk.category ='cao')" , nativeQuery = true)
	public List<Cua> searchCua(	@Param("heProfile") String heProfile,
								@Param("cuaTruotQuay") String cuaTruotQuay,
								@Param("loaiCua") String loaiCua, 
								@Param("soCanh") int soCanh,
								@Param("heMo") String heMo, 
								@Param("loaiBanLe") String loaiBanLe,
								@Param("heSoAnToan") String heSoAnToan);
								//@Param("chieuRong") int chieuRong,
								//@Param("chieuDai") int chieuDai);
	
}
