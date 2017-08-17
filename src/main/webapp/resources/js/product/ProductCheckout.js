/**
 * 
 */

const VND = '&#x20ab;';

function ProductList(){
    this.listProduct = [];
}

// function ProductList() {
//     this.listProduct = [
//         {
//             product_id: '1',
//             url: '/resources/img/thumb/thumb1.jpg',
//             product_name: 'Red hot chilli',
//             unit: 'gram',
//             product_provider: 'Tulu farm',
//             price: 30000,
//             quantity: 2
//         },
//         {
//             product_id: '2',
//             url: '/resources/img/thumb/thumb1.jpg',
//             product_name: 'Red hot chilli',
//             unit: 'kg',
//             product_provider: 'Tulu farm',
//             price: 40000,
//             quantity: 2
//         },
//         {
//             product_id: '3',
//             url: '/resources/img/thumb/thumb1.jpg',
//             product_name: 'Red hot chilli',
//             unit: 'kg',
//             product_provider: 'Tulu farm',
//             price: 50000,
//             quantity: 2
//         },
//         {
//             product_id: '4',
//             url: '/resources/img/thumb/thumb1.jpg',
//             product_name: 'Red hot chilli',
//             unit: 'kg',
//             product_provider: 'Tulu farm',
//             price: 25000,
//             quantity: 2
//         },
//         {
//             product_id: '5',
//             url: '/resources/img/thumb/thumb1.jpg',
//             product_name: 'Red hot chilli',
//             unit: 'kg',
//             product_provider: 'Tulu farm',
//             price: 25300,
//             quantity: 2
//         }
//     ];
//     this.subTotalAmount = 0;
//     this.shipmentFee = 0;
//     this.couponValue = 0;
//     this.totalAmount = 0;
// }

ProductList.prototype.init = function () {
    var self = this;

    // this.displayProducts();
}

ProductList.prototype.subtractQuantity = function (productId) {
    var sub_total_cost = $('.sub_total_cost');

    var product = _.find(this.listProduct, (item) => {
        return item.product_id == productId;
    });

    if (product) {
        var quantityInputBox = $(`.quantity-field.product_${product.product_id}`);
        var totalItemPrice = $(`.shop-red.total.product_${product.product_id}`);

        product.quantity--;

        quantityInputBox.attr('value', product.quantity);
        totalItemPrice.html(`${VND} ${product.quantity * product.price}`);

        this.subTotalAmount = this.calculateTotalAmount();
        this.displayTotalAmount();
    }
}

ProductList.prototype.addQuantity = function (productId) {
    var sub_total_cost = $('.sub_total_cost');

    var product = _.find(this.listProduct, (item) => {
        return item.product_id == productId;
    });

    if (product) {
        var quantityInputBox = $(`.quantity-field.product_${product.product_id}`);
        var totalItemPrice = $(`.shop-red.total.product_${product.product_id}`);

        product.quantity++;

        quantityInputBox.attr('value', product.quantity);
        totalItemPrice.html(`${VND} ${product.quantity * product.price}`);

        this.subTotalAmount = this.calculateTotalAmount();
        this.displayTotalAmount();
    }
}

ProductList.prototype.calculateTotalAmount = function () {
    var totalAmount = 0;
    for (index in this.listProduct) {
        var product = this.listProduct[index];
        totalAmount += product.price * product.quantity;
    }
    return totalAmount;
}

ProductList.prototype.displayTotalAmount = function () {
    this.totalAmount = this.subTotalAmount + this.shipmentFee - this.couponValue;

    $('.sub_total_cost').html(`${VND} ${this.subTotalAmount}`);
    $('.shipment_cost').html(`${VND} ${this.shipmentFee}`);
    $('.total_cost').html(`${VND} ${this.totalAmount}`);
}

ProductList.prototype.removeProduct = function(productId){
    _.remove(this.listProduct, (item) => {
        return item.product_id == productId
    });
    
    this.displayProducts();
}

ProductList.prototype.displayProducts = function () {
    var container = $('.product-list-table');
    container.empty();

    for (index in this.listProduct) {
        var product = this.listProduct[index];
        var productItem = `<tr>
								<td class="product-in-table">
									<img class="img-responsive" src=${product.url} alt="">
									<div class="product-it-in">
										<h3>${product.product_name}</h3>
										<span>${product.product_provider}</span>
									</div>
								</td>
                                <td>${product.unit}</td>
								<td>${VND} ${product.price}</td>
								<td>
									<button type='button' class="quantity-button" name='subtract' onclick='javascript: productList.subtractQuantity(${product.product_id});'>-</button>
									<input type='text' class="quantity-field product_${product.product_id}" name='qty1' value="${product.quantity}" id='qty1'/>
									<button type='button' class="quantity-button" name='add' onclick='javascript: productList.addQuantity(${product.product_id});'>+</button>
								</td>
								<td class="shop-red total product_${product.product_id}">
                                    ${VND} ${product.price * product.quantity}
                                </td>
								<td>
								    <button type="button" class="close" onclick='javascript: productList.removeProduct(${product.product_id});'>
                                        <span>&times;</span>
                                        <span class="sr-only">Close</span>
                                    </button>
								</td>
							</tr>`;
        container.append(productItem);
    }

    this.subTotalAmount = this.calculateTotalAmount();
    this.displayTotalAmount();
}
