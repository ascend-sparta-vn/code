function ProductManager() {

}
//init
ProductManager.prototype.init = function(){
    var self = this;

    $("li .active").removeClass("active");
    $("#menu3").addClass("active");


}

ProductManager.prototype.addToCart = function (productId){

    var url = "/product/cart/add/" + productId + '/1';
    $.ajax({
        type : "GET",
        url : url,
        success : function(response) {
            console.log('success');
            if(response == 1)
                showMessage('add product to successfull', "success");
            else
                showMessage('add product to failed', "error");
        },
        error : function(e) {
            console.log("ERROR addToCart: ", e);
            showMessage('Contact to admin to resolve this problem', "error");
        },
        done : function(e) {
            console.log("DONE");
        }
    });
}
