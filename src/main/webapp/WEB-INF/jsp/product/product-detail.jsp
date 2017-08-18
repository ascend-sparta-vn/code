<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="breadcrumbs">
   <div class="container">
      <h1 class="pull-left">Product Detail</h1>
      <ul class="pull-right breadcrumb">
         <li><a href="/"><spring:message code="homepage"/></a></li>
         <li class="active"><a href="/shipment/list">Products List</a></li>
         <li class="active"><a href="#">Product Detail</a></li>
      </ul>
   </div>
</div>
<br/>

<%--Shop Product--%>
<div class="shop-product">
   <!-- Breadcrumbs v5 -->
   <div class="container">
      <ul class="breadcrumb-v5">
         <li><a href="index.html"><i class="fa fa-home"></i></a></li>
         <li><a href="#">Products List</a></li>
         <li class="active">Product Detail</li>
      </ul>
   </div>
   <!-- End Breadcrumbs v5 -->

   <div class="container">
      <div class="row">
         <div class="col-md-6 md-margin-bottom-50">
            <div class="ms-showcase2-template">
               <!-- Master Slider -->
               <div class="master-slider ms-skin-default" id="masterslider">
                  <div class="ms-slide">
                     <img class="ms-brd" src=${product.imgUrl} alt="lorem ipsum dolor sit">
                  </div>
                  <div class="ms-slide">
                     <img src="http://rausachdanghit.vn/wp-content/uploads/2017/05/IMG_5685-1024x683.jpg">

                  </div>
                  <div class="ms-slide">
                     <img src="http://www.vusta.vn/uploads/news/2015_03/td31.jpg" alt="lorem ipsum dolor sit">
                  </div>
               </div>
               <!-- End Master Slider -->
            </div>
         </div>

         <div class="col-md-6">
            <div class="shop-product-heading ">
               <h2>${product.name}</h2>
               <ul class="list-inline shop-product-social">
                  <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                  <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                  <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                  <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
               </ul>
            </div><!--/end shop product social-->

            <ul class="list-inline product-ratings margin-bottom-30">
               <li><i class="rating-selected fa fa-star"></i></li>
               <li><i class="rating-selected fa fa-star"></i></li>
               <li><i class="rating-selected fa fa-star"></i></li>
               <li><i class="rating fa fa-star"></i></li>
               <li><i class="rating fa fa-star"></i></li>
               <li class="product-review-list">
                  <span>(1) <a href="#">Review</a> | <a href="#"> Add Review</a></span>
               </li>
            </ul><!--/end shop product ratings-->

            <p>${product.description}</p><br>

            <ul class="list-inline shop-product-prices margin-bottom-30">
               <li class="shop-red">$${product.price}/kg</li>
            </ul><!--/end shop product prices-->

                <div class="row margin-bottom-40">
            <div class="col-md-4">
               <h3 class="shop-product-title">Quantity Left</h3>
               <input type='text' class="quantity-field" value= "${product.amount}" id="amount"/>
            </div>
            <!--/end product Quantity Left-->

                <div class="col-md-8">
            <h3 class="shop-product-title">Quantity</h3>
            <div style="display:inline">
               <form name="f1" class="product-quantity sm-margin-bottom-20">
                  <button type='button' class="quantity-button" name='subtract' onclick='subtractQty();' value='-'>-</button>
                  <input type='text' class="quantity-field" name='qty' value="1" id='qty'/>
                  <button type='button' class="quantity-button" name='add' onclick='javascript: document.getElementById("qty").value++;' value='+'>+</button>
               </form>
               <button type="button" onclick="addToCart(${product.id})" class="btn-u btn-u-sea-shop btn-u-lg">Add to Cart</button>
            </div><!--/end product quantity-->
            </div>
                </div>

            <ul class="list-inline add-to-wishlist add-to-wishlist-brd">
               <li class="wishlist-in">
                  <i class="fa fa-heart"></i>
                  <a href="#">Add to Wishlist</a>
               </li>
               <li class="compare-in">
                  <i class="fa fa-exchange"></i>
                  <a href="#">Add to Compare</a>
               </li>
            </ul>
            <p class="wishlist-category"><strong>Categories:</strong> <a href="#">Vegetable,</a> <a href="#">Happy Farm</a></p>
         </div>
      </div><!--/end row-->
   </div>
</div>
<!--=== End Shop Product ===-->

<%--Description item--%>

<div class="content-md container">
   <!--=== Product Service ===-->
   <div class="tab-v6">
      <ul class="nav nav-tabs" role="tablist">
         <li class="active"><a href="#description" role="tab" data-toggle="tab">Description</a></li>
         <li><a href="#reviews" role="tab" data-toggle="tab">Reviews (1)</a></li>
      </ul>

      <div class="tab-content">
         <!-- Description -->
         <div class="tab-pane fade in active" id="description">
            <div class="row">
               <div class="col-md-7">
                  <p class="margin-bottom-40"><strong>About provider: </strong> This is the best farm in Ha Noi that provides organic vegetable for about 10000 house hold in the city. They can produce 1 ton of organic vegetable per day. <a href="#">Visit farm</a></p><br>
                  <h3 class="heading-md">Product Information</h3>
                  <p><strong>About the product:</strong> Banana is a very good food for health.</p>
                  <p><strong>Planting Date:</strong> 8 August 2017</p>
                  <p><strong>Haversting Date:</strong> 15 August 2017</p>
                  <p><strong>Expriation Date:</strong> 22 August 2017</p>
                  <p><strong>Properties of banana from Happy farm:</strong></p>
                  <div class="row">
                     <div class="col-sm-6">
                        <ul class="list-unstyled specifies-list">
                           <li><i class="fa fa-caret-right"></i>Water: <span>74.2 gr</span></li>
                           <li><i class="fa fa-caret-right"></i>Energy: <span>92 kcal</span> Knitted</li>
                           <li><i class="fa fa-caret-right"></i>Fat: <span>0.48 gr</span></li>
                           <li><i class="fa fa-caret-right"></i>Protein: <span>1.03 gr</span></li>
                           <li><i class="fa fa-caret-right"></i>Carbonhydrates Type: <span>23.43 gr</span></li>
                           <li><i class="fa fa-caret-right"></i>Fiber: <span>2.4 gr</span></li>
                           <li><i class="fa fa-caret-right"></i>Potassium: <span>396 mg</span></li>
                           <li><i class="fa fa-caret-right"></i>Phosphorus: <span>20 mg</span></li>
                           <li><i class="fa fa-caret-right"></i>Iron: <span>0.31 mg</span></li>
                           <li><i class="fa fa-caret-right"></i>Sodium: <span>1 mg</span></li>
                        </ul>
                     </div>
                     <div class="col-sm-6">
                        <ul class="list-unstyled specifies-list">
                           <li><i class="fa fa-caret-right"></i>Magnesium: <span>29 mg</span></li>
                           <li><i class="fa fa-caret-right"></i>Calcium: <span>6 mg</span></li>
                           <li><i class="fa fa-caret-right"></i>Zinc: <span>0.16 mg</span></li>
                           <li><i class="fa fa-caret-right"></i>Selenium: <span>1.1 mg </span></li>
                           <li><i class="fa fa-caret-right"></i>Vitamin C: <span>9.1 mg</span></li>
                           <li><i class="fa fa-caret-right"></i>Vitamin A: <span>81 lU</span></li>
                           <li><i class="fa fa-caret-right"></i>Vitamin B1 (Thiamin): <span>0.045 mg</span></li>
                           <li><i class="fa fa-caret-right"></i>Vitamin B2 (Riboflamin): <span>0.1 mg </span></li>
                           <li><i class="fa fa-caret-right"></i>Vitamin E: <span>0.27 mg</span></li>
                           <li><i class="fa fa-caret-right"></i>Niacin: <span>0.54 mg</span></li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="col-md-5">
                  <div class="responsive-video">
                     <iframe src="https://www.youtube.com/embed/prfEeJEamco" frameborder="0" width='500px' height='300px' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
                  </div>
               </div>
            </div>
         </div>
         <!-- End Description -->

         <!-- Reviews -->
         <div class="tab-pane fade" id="reviews">
            <div class="product-comment margin-bottom-40">
               <div class="product-comment-in">
                  <img class="product-comment-img rounded-x" src="http://agraria.pe/uploads/images/2016/08/Bananas-Ecuador.jpg" width="20px" height="15px" alt="">
                  <div class="product-comment-dtl">
                     <h4>Mickel <small>22 days ago</small></h4>
                     <p>I like this shop because of the fresh vegetable. i also like this website cause i can order the organic food very easily.</p>
                     <ul class="list-inline product-ratings">
                        <li class="reply"><a href="#">Reply</a></li>
                        <li class="pull-right">
                           <ul class="list-inline">
                              <li><i class="rating-selected fa fa-star"></i></li>
                              <li><i class="rating-selected fa fa-star"></i></li>
                              <li><i class="rating-selected fa fa-star"></i></li>
                              <li><i class="rating fa fa-star"></i></li>
                              <li><i class="rating fa fa-star"></i></li>
                           </ul>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
            <h3 class="heading-md margin-bottom-30">Add a review</h3>
            <form action="assets/php/demo-contacts-process.php" method="post" id="sky-form3" class="sky-form sky-changes-4">
               <fieldset>
                  <div class="margin-bottom-30">
                     <label class="label-v2">Name</label>
                     <label class="input">
                        <input type="text" name="name" id="name" size="50">
                     </label>
                  </div>

                  <div class="margin-bottom-30">
                     <label class="label-v2">Email</label>
                     <label class="input">
                        <input type="email" name="email" id="email" size="50">
                     </label>
                  </div>

                  <div class="margin-bottom-30">
                     <label class="label-v2">Review</label>
                     <label class="textarea">
                        <textarea rows="7" name="message" id="message" size="50"></textarea>
                     </label>
                  </div>
               </fieldset>

               <footer class="review-submit">
                  <label class="label-v2">Review</label>
                  <div class="stars-ratings">
                     <input type="radio" name="stars-rating" id="stars-rating-5">
                     <label for="stars-rating-5"><i class="fa fa-star"></i></label>
                     <input type="radio" name="stars-rating" id="stars-rating-4">
                     <label for="stars-rating-4"><i class="fa fa-star"></i></label>
                     <input type="radio" name="stars-rating" id="stars-rating-3">
                     <label for="stars-rating-3"><i class="fa fa-star"></i></label>
                     <input type="radio" name="stars-rating" id="stars-rating-2">
                     <label for="stars-rating-2"><i class="fa fa-star"></i></label>
                     <input type="radio" name="stars-rating" id="stars-rating-1">
                     <label for="stars-rating-1"><i class="fa fa-star"></i></label>
                  </div>
                  <button type="button" class="btn-u btn-u-sea-shop btn-u-sm pull-right">Submit</button>
               </footer>
            </form>
         </div>
         <!-- End Reviews -->
      </div>
   </div>
</div>

<%--Description item--%>

<%--Related Product--%>

<div class="container">
   <div class="heading heading-v1 margin-bottom-20">
      <h2>Product you may like</h2>
   </div>

   <div class="illustration-v2 margin-bottom-60">
      <div class="customNavigation margin-bottom-25">
         <a class="owl-btn prev rounded-x"><i class="fa fa-angle-left"></i></a>
         <a class="owl-btn next rounded-x"><i class="fa fa-angle-right"></i></a>
      </div>

      <ul class="list-inline owl-slider-v4">
         <li class="item">
            <a href="#"><img class="img-responsive" src="http://imavex.vo.llnwd.net/o18/clients/urbanfarm/images/Fruit/Seascape-Strawberry-Plants.jpg" alt="" width="200px" heigth="150px"></a>
            <div class="product-description-v2">
               <div class="margin-bottom-5">
                  <h4 class="title-price text-center"><a href="#">Organic Strawberry - from Happy farm</a></h4>
                  <span class="title-price">$10.00/kg</span>
               </div>
               <ul class="list-inline product-ratings">
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating fa fa-star"></i></li>
                  <li><i class="rating fa fa-star"></i></li>
               </ul>
            </div>
         </li>
         <li class="item">
            <a href="#"><img class="img-responsive" src="http://pull01.thefruitcompany.netdna-cdn.com/media/catalog/product/cache/1/image/800x/9df78eab33525d08d6e5fb8d27136e95/o/r/organic-cherries_4.jpg" alt="" width="200px" heigth="150px"></a>
            <div class="product-description-v2">
               <div class="margin-bottom-5">
                  <h4 class="title-price"><a href="#">Cherry - from Happy Farm</a></h4>
                  <span class="title-price">$15.00/kg</span>
               </div>
               <ul class="list-inline product-ratings">
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating fa fa-star"></i></li>
                  <li><i class="rating fa fa-star"></i></li>
               </ul>
            </div>
         </li>
         <li class="item">
            <a href="#"><img class="img-responsive" src="http://foodservice.treetop.com/Assets/Images/Products/Juice/bg/bg-apples-04.jpg" alt="" width="200px" heigth="150px"></a>
            <div class="product-description-v2">
               <div class="margin-bottom-5">
                  <h4 class="title-price"><a href="#">Apple - from Happy Farm</a></h4>
                  <span class="title-price">$7.00/kg</span>
               </div>
               <ul class="list-inline product-ratings">
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating fa fa-star"></i></li>
                  <li><i class="rating fa fa-star"></i></li>
               </ul>
            </div>
         </li>
         <li class="item">
            <a href="#"><img class="img-responsive" src="http://media.bizwebmedia.net/sites/123330/data/Upload/2016/5/untitled_1(13).jpg" alt="" width="200px" heigth="150px"></a>
            <div class="product-description-v2">
               <div class="margin-bottom-5">
                  <h4 class="title-price"><a href="#">Water melon - from Monday </a></h4>
                  <span class="title-price">$1.50/kg</span>
               </div>
               <ul class="list-inline product-ratings">
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating-selected fa fa-star"></i></li>
                  <li><i class="rating fa fa-star"></i></li>
                  <li><i class="rating fa fa-star"></i></li>
               </ul>
            </div>
         </li>
      </ul>
   </div>
</div>

<%--Related Product--%>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY&callback=initialize"></script>
<script src="/resources/js/product/ProductDetail.js"></script>
<script src="/resources/js/plugins/utils/slider/master-slider-showcase2.js"></script>
<script src="/resources/js/plugins/utils/slider/style-switcher.js"></script>
<script src="/resources/js/plugins/utils/slider/owl-carousel.js"></script>
<script>
    var manager = new ProductDetail();
    $(document).ready(function(){
        getResource(function(){
            manager.init();
        });
        // init slider lib
        OwlCarousel.initOwlCarousel();
        StyleSwitcher.initStyleSwitcher();
        MasterSliderShowcase2.initMasterSliderShowcase2();
    });

    function addToCart(productId){
        var quantity = document.getElementById('qty').value;
        manager.addToCart(productId, quantity);
    }

   function subtractQty() {
      if(document.getElementById('qty').value !== '0') {
         document.getElementById('qty').value = document.getElementById('qty').value - 1;
         //document.getElementById('amount').value = parseInt(document.getElementById('amount').value) + 1;
      }

   }
</script>
