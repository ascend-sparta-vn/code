function ProductManager() {

}
//init
ProductManager.prototype.init = function(){
    var self = this;

    $("li .active").removeClass("active");
    $("#menu3").addClass("active");


}

ProductManager.prototype.addToCart = function (productId){

    var url = "/product/cart/add/" + productId;
    $.ajax({
        type : "GET",
        url : url,
        success : function(response) {
            console.log('success');
            showMessage('add product to successfull', "success");
        },
        error : function(e) {
            console.log("ERROR addToCart: ", e);
        },
        done : function(e) {
            console.log("DONE");
        }
    });
}
