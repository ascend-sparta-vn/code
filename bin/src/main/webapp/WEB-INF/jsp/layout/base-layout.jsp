<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
    <title>Admin Site</title>

    <meta name="description" content="data tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="/resources/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/resources/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css">

    <!--Beyond styles-->
    <link id="beyond-link" href="/resources/css/beyond.min.css" rel="stylesheet" />
    <link href="/resources/css/demo.min.css" rel="stylesheet" />
    <link href="/resources/css/typicons.min.css" rel="stylesheet" />
    <link href="/resources/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

    <!--Page Related styles-->
    <link href="/resources/css/dataTables.bootstrap.css" rel="stylesheet" />
	
	
	
	<link href="/resources/css/custom.css" rel="stylesheet" type="text/css" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="/resources/js/skins.min.js"></script>
    <!--Basic Scripts-->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="/resources/js/beyond.min.js"></script>

    <!--Page Related Scripts-->
    <script src="/resources/js/datatable/jquery.dataTables.min.js"></script>
    <script src="/resources/js/datatable/ZeroClipboard.js"></script>
    <script src="/resources/js/datatable/dataTables.tableTools.min.js"></script>
    <script src="/resources/js/datatable/dataTables.bootstrap.min.js"></script>
    <!-- <script src="/resources/js/datatable/datatables-init.js"></script> -->
	<script src="/resources/js/bootstrap-multiselect.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/Constants.js"></script>
</head>
<body>
	<!-- Loading Container -->
    <div class="loading-container">
        <div class="loader"></div>
    </div>
    <!--  /Loading Container -->
    
	<tiles:insertAttribute name="header" />
	
	<!-- Main Container -->
    <div class="main-container container-fluid">
    	<!-- Page Container -->
        <div class="page-container">
        	<tiles:insertAttribute name="menu" />
        	<!-- Page Content -->
            <div class="page-content">
				<tiles:insertAttribute name="body" />
            </div>
        </div>
    </div>
	
	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>
	
</body>



</html>

