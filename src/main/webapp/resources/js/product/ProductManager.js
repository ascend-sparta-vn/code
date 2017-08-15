function ProductManager() {

}
//init
ProductManager.prototype.init = function(){
    var self = this;

    $("li .active").removeClass("active");
    $("#menu3").addClass("active");

    self.initButtonClick();


}
