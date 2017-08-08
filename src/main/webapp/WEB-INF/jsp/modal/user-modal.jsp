<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="myModal" style="display:none;">
        <div class="row">
            <div class="col-md-12">
            	<input type="hidden" id="userIdModal"/>
                <div class="form-group col-md-6">
                	<label><spring:message code="manageUser.modalEmail"/></label>
                    <input type="text" id="usernameModal" name="username" class="form-control" value="" placeholder="Nhập email" required="">
                </div>
                <div class="form-group col-md-6">
                	<label id="passwordLabel"><spring:message code="manageUser.modalPassword"/></label>
                    <input type="password" id="passwordModal" class="form-control" placeholder="Để trống nếu không muốn thay đổi" required="">
                </div>
                
                <div class="form-group col-md-6">
                	<label><spring:message code="manageUser.modalRole"/></label>
                	<select id="roleModal" class="form-control">
                		<option value="ROLE_ADMIN">Admin</option>
                		<option value="ROLE_CLIENT">Customer</option>
                	</select>
                </div>
                <div class="form-group col-md-6">
                	<label><spring:message code="manageUser.modalStatus"/></label>
                    <select id="enabledModal" class="form-control">
                		<option value="true"><spring:message code="manageUser.modalStatus.active"/></option>
                		<option value="false"><spring:message code="manageUser.modalStatus.inactive"/></option>
                	</select>
                </div>
                
            </div>
        </div>
</div>