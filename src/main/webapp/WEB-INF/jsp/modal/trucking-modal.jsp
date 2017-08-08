<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="myModal" style="display: none">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group col-md-6">
                	<div class="form-group">
						<label class=""><spring:message code="trucking.type"/></label>
							<div class="input-group ">
							  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-truck"></i></span>
							  <select id="truckTypeModal" class="form-control">
							  		<option value="-1" selected="selected"><spring:message code="trucking.type.choose"/></option>
							  </select>
							</div>
					</div>
                </div>
                <div class="form-group col-md-6">
                	<label><spring:message code="manageUser.modalStatus"/></label>
                    <select id="statusModal" class="form-control">
                		<option value="1"><spring:message code="manageUser.modalStatus.active"/></option>
                		<option value="0"><spring:message code="manageUser.modalStatus.inactive"/></option>
                	</select>
                </div>
                <div class="form-group col-md-12">
                	<label><spring:message code="trucking.post.plateNumber"/></label>
                    <input type="text" id="plateNumberModal" name="username" class="form-control" placeholder="<spring:message code="trucking.post.plateNumber.placeholder"/>" required="">
                </div>
            </div>
        </div>
</div>