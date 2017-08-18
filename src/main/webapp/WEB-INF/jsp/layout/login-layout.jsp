
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.springframework.context.ApplicationContext,org.springframework.web.servlet.support.RequestContextUtils"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <title>Onmart.vn - Online Organic Food Deliver</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/img/logoOnmart.jpg">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/shop.style.css">
    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="/resources/css/headers/header-default.css">
    <link rel="stylesheet" href="/resources/css/footers/footer-default.css">
    <!-- 	<link rel="stylesheet" href="/resources/css/footers/footer-v2.css"> -->
    <!-- 	<link rel="stylesheet" href="/resources/css/footers/footer-v8.css"> -->

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/resources/plugins/animate.css">
    <link rel="stylesheet" href="/resources/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/plugins/parallax-slider/css/parallax-slider.css">
    <link rel="stylesheet" href="/resources/plugins/owl-carousel/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="/resources/js/plugins/masterslider/style/masterslider.css">
    <link rel='stylesheet' href="/resources/js/plugins/masterslider/skins/default/style.css">


    <link rel="stylesheet" href="/resources/plugins/datatable/new/dataTables.bootstrap.css">
    <!-- 	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"> -->




    <link rel="stylesheet" href="/resources/plugins/datepicker/datepicker.css">
    <link rel="stylesheet" href="/resources/plugins/toastr/toastr.min.css">
    <link rel="stylesheet" href="/resources/css/beyond.min.css">

    <!-- CSS Theme -->
    <!-- 	<link rel="stylesheet" href="/resources/css/theme-colors/default.css" id="style_color"> -->
    <link rel="stylesheet" href="/resources/css/theme-colors/blue.css" id="style_color">
    <link rel="stylesheet" href="/resources/css/theme-skins/dark.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/resources/css/pages/page_log_reg_v1.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/resources/css/custom.css">

    <link href="/resources/css/jquery.realperson.css" rel="stylesheet" />

    <!-- JS Global Compulsory -->
    <script type="text/javascript" src="/resources/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/plugins/jquery/jquery-migrate.min.js"></script>
    <script type="text/javascript" src="/resources/plugins/bootstrap/js/bootstrap.min.js"></script>

    <!-- JS Implementing Plugins -->
    <script type="text/javascript" src="/resources/plugins/back-to-top.js"></script>
    <script type="text/javascript" src="/resources/plugins/smoothScroll.js"></script>
    <script type="text/javascript" src="/resources/plugins/parallax-slider/js/modernizr.js"></script>
    <script type="text/javascript" src="/resources/plugins/parallax-slider/js/jquery.cslider.js"></script>
    <script type="text/javascript" src="/resources/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
    <!-- JS Customization -->
    <script type="text/javascript" src="/resources/js/custom.js"></script>
    <!-- JS Page Level -->
    <script type="text/javascript" src="/resources/js/app.js"></script>
    <script type="text/javascript" src="/resources/js/plugins/owl-carousel.js"></script>
    <script type="text/javascript" src="/resources/js/plugins/style-switcher.js"></script>
    <script type="text/javascript" src="/resources/js/plugins/parallax-slider.js"></script>
    <!-- JS Global Compulsory -->
    <script type="text/javascript" src="/resources/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/plugins/jquery/jquery-migrate.min.js"></script>
    <script type="text/javascript" src="/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- JS Implementing Plugins -->
    <script type="text/javascript" src="/resources/plugins/back-to-top.js"></script>
    <script type="text/javascript" src="/resources/plugins/smoothScroll.js"></script>
    <script type="text/javascript" src="/resources/plugins/parallax-slider/js/modernizr.js"></script>
    <script type="text/javascript" src="/resources/plugins/parallax-slider/js/jquery.cslider.js"></script>
    <script type="text/javascript" src="/resources/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
    <script type="text/javascript" src="/resources/js/plugins/bootbox.min.js"></script>
    <!-- JS Customization -->
    <script type="text/javascript" src="/resources/js/custom.js"></script>
    <script type="text/javascript" src="/resources/js/Constants.js"></script>
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <!-- JS Page Level -->
    <script type="text/javascript" src="/resources/js/app.js"></script>
    <script type="text/javascript" src="/resources/js/plugins/owl-carousel.js"></script>
    <script type="text/javascript" src="/resources/js/plugins/style-switcher.js"></script>
    <script type="text/javascript" src="/resources/js/plugins/parallax-slider.js"></script>
    <!-- Master Slider -->
    <script type="text/javascript" src="/resources/js/plugins/masterslider/masterslider.js"></script>
    <script type="text/javascript" src="/resources/js/plugins/masterslider/jquery.easing.min.js"></script>

    <script type="text/javascript" src="/resources/plugins/datatable/new/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/resources/plugins/datatable/new/dataTables.bootstrap.min.js"></script>
    <!-- 	<script type="text/javascript" src="/resources/plugins/datatable/new/dataTables.responsive.min.js"></script> -->
    <!-- 	<script type="text/javascript" src="/resources/plugins/datatable/new/responsive.bootstrap.min.js"></script> -->


    <script type="text/javascript" src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="/resources/plugins/toastr/toastr.js"></script>
    <script type="text/javascript" src="/resources/plugins/beyond/beyond.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.i18n.properties.min.js"></script>
    <script src="/resources/js/jquery.plugin.js"></script>
    <script src="/resources/js/jquery.realperson.js"></script>

</head>
<body class="header-fixed header-fixed-space-default">
<div class="wrapper">

    <tiles:insertAttribute name="body" />

</div>

<%--show loading --%>
<div id="loading-div-background">
    <div id="loading-div" class="ui-corner-all">
        <img style="height:32px;width:32px;margin:30px;" src="/resources/img/Alternative.gif"" alt="Loading.."/><br>Đang xử lý...
    </div>
</div>
<%--end show loading --%>

<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        OwlCarousel.initOwlCarousel();
        StyleSwitcher.initStyleSwitcher();
        ParallaxSlider.initParallaxSlider();

    });

    function getSystemLocale() {
        var systemLocale ='<%=RequestContextUtils.getLocale(request)%>';
        return systemLocale;
    }

    function getResource(callbackFunction){
        jQuery.i18n.properties({
            name:'JS_Messages',
            path: '/resources/language/',
            mode:'both',
            language:getSystemLocale(),
            callback: function() {
                loadConstantLanguage();
                callbackFunction();
            }
        });
    }

</script>
<!-- reCAPTCHA with Vietnamese language -->
<!-- 	<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script> -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>

</body>
</html>

