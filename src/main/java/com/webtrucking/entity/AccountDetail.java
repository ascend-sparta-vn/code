package com.webtrucking.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "account_detail")
public class AccountDetail {

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(name = "email", nullable = false, length = 255)
	private String email;
	
	@Column(name = "gender", nullable = false, length = 255)
	private String gender;
	
	@Column(name = "last_name", nullable = false, length = 255)
	private String lastName;
	
	@Column(name = "first_name", nullable = false, length = 255)
	private String firstName;
	
	@Column(name = "phone_number", nullable = false, length = 255)
	private String phoneNumber;
	
	@Column(name = "address", nullable = false, length = 255)
	private String address;
	
	@Column(name = "province_id", nullable = false, length = 255)
	private String provinceId;
	
	@Column(name = "company_name", nullable = false, length = 255)
	private String companyName;
	
	@Column(name = "company_address", nullable = false, length = 255)
	private String companyAdress;
	
	@Column(name = "company_start_year", nullable = false, length = 10)
	private Integer companyStartYear;
	
	@Column(name = "company_employee_total", nullable = false, length = 10)
	private Integer companyEmployeeTotal;
	
	@Column(name = "company_iso", nullable = false, length = 255)
	private String companyIso;
	
	@Column(name = "company_role", nullable = false, length = 255)
	private String companyRole;
	
	@Column(name = "company_director_name", nullable = false, length = 255)
	private String companyDirectorName;
	
	@Column(name = "company_tax_code", nullable = false, length = 255)
	private String companyTaxCode;
	
	@Column(name = "company_phone_number", nullable = false, length = 255)
	private String companyPhoneNumber;
	
	@Column(name = "company_bussiness_license", nullable = false, length = 255)
	private String companyBussinessLicense;
	
	@Column(name = "account_bank_name", nullable = false, length = 255)
	private String accountBankName;
	
	@Column(name = "account_bank_number", nullable = false, length = 255)
	private String accountBankNumber;
	
	@Column(name = "bank_name", nullable = false, length = 255)
	private String bankName;
	
	@Column(name = "created_date", nullable = false)
	private Date createdDate;
	
	@Column(name = "goods_trading", nullable = false, length = 255)
	private String goodsTrading;
	
	@Column(name = "transport_requirement_monthly", nullable = false, length = 255)
	private String transportRequirementMonthly;
	
	@Column(name = "competence_intro", nullable = false, length = 500)
	private String competenceIntro;
	
	@Column(name = "company_fax", nullable = false, length = 500)
	private String companyFax;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyAdress() {
		return companyAdress;
	}
	public void setCompanyAdress(String companyAdress) {
		this.companyAdress = companyAdress;
	}
	public Integer getCompanyStartYear() {
		return companyStartYear;
	}
	public void setCompanyStartYear(Integer companyStartYear) {
		this.companyStartYear = companyStartYear;
	}
	public Integer getCompanyEmployeeTotal() {
		return companyEmployeeTotal;
	}
	public void setCompanyEmployeeTotal(Integer companyEmployeeTotal) {
		this.companyEmployeeTotal = companyEmployeeTotal;
	}
	public String getCompanyIso() {
		return companyIso;
	}
	public void setCompanyIso(String companyIso) {
		this.companyIso = companyIso;
	}
	public String getCompanyRole() {
		return companyRole;
	}
	public void setCompanyRole(String companyRole) {
		this.companyRole = companyRole;
	}
	public String getCompanyDirectorName() {
		return companyDirectorName;
	}
	public void setCompanyDirectorName(String companyDirectorName) {
		this.companyDirectorName = companyDirectorName;
	}
	public String getCompanyTaxCode() {
		return companyTaxCode;
	}
	public void setCompanyTaxCode(String companyTaxCode) {
		this.companyTaxCode = companyTaxCode;
	}
	public String getCompanyPhoneNumber() {
		return companyPhoneNumber;
	}
	public void setCompanyPhoneNumber(String companyPhoneNumber) {
		this.companyPhoneNumber = companyPhoneNumber;
	}
	public String getCompanyBussinessLicense() {
		return companyBussinessLicense;
	}
	public void setCompanyBussinessLicense(String companyBussinessLicense) {
		this.companyBussinessLicense = companyBussinessLicense;
	}
	public String getAccountBankName() {
		return accountBankName;
	}
	public void setAccountBankName(String accountBankName) {
		this.accountBankName = accountBankName;
	}
	public String getAccountBankNumber() {
		return accountBankNumber;
	}
	public void setAccountBankNumber(String accountBankNumber) {
		this.accountBankNumber = accountBankNumber;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getGoodsTrading() {
		return goodsTrading;
	}
	public void setGoodsTrading(String goodsTrading) {
		this.goodsTrading = goodsTrading;
	}
	public String getTransportRequirementMonthly() {
		return transportRequirementMonthly;
	}
	public void setTransportRequirementMonthly(
			String transportRequirementMonthly) {
		this.transportRequirementMonthly = transportRequirementMonthly;
	}
	public String getCompetenceIntro() {
		return competenceIntro;
	}
	public void setCompetenceIntro(String competenceIntro) {
		this.competenceIntro = competenceIntro;
	}
	public String getCompanyFax() {
		return companyFax;
	}
	public void setCompanyFax(String companyFax) {
		this.companyFax = companyFax;
	}

}