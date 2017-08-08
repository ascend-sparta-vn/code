function DeviceManager() {
	
}

//init
DeviceManager.prototype.init = function(){
	var self = this;
	self.initDataTable();
	self.initButtonClick();
	self.initSelectAction();
}

/**
 * @Todo: init table here
 */
DeviceManager.prototype.initDataTable = function(){
	var self = this;
	var table = $("#mau-cua-cuon-table").dataTable();
	table.fnDestroy();
	var url = "/rest/getDanhSachCua";
	var t = $('#mau-cua-cuon-table').DataTable({
         "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
         "columns": [
			 {
			    "className":      'details-control',
			    "orderable":      false,
			    "data":           null,
			    "defaultContent": ''
			    	
			 },
             /*{ "data": "codeCua"},*/
			 { "data": "kyHieu"},
			 { "data": "anhDaiDien"},
             { "data": "heProfile"},
             { "data": "cuaTruotQuay"},
             { "data": "loaiCua"},
             { "data": "soCanh"},
             { "data": "heMo"},
             { "data": "loaiBanLe"},
             { "data": "heSoAnToan"}
         ],
         "ajax": {
             "url": url,
             "type": "GET",
             "dataSrc": ""            	 
         },
         "aaSorting": [[1, 'asc']],
         "aLengthMenu": [
                         [5, 15, 20, -1],
                         [5, 15, 20, "All"]
                     ],
         "language" : {
				"paginate" : {
					"previous" : JQUERY_DATA_TABLE.LANGUAGE.PREVIOUS_PAGE,
					"next" : JQUERY_DATA_TABLE.LANGUAGE.NEXT_PAGE,
					
				},
				"sZeroRecords": JQUERY_DATA_TABLE.LANGUAGE.SZERORECORDS,
				"sInfoFiltered": "",
				"processing":     JQUERY_DATA_TABLE.LANGUAGE.PROCESSING,
				"search": "",
				"sLengthMenu": "_MENU_",
				"info": JQUERY_DATA_TABLE.LANGUAGE.INFO,
				"infoEmpty":JQUERY_DATA_TABLE.LANGUAGE.INFOEMPTY
			},
         "iDisplayLength": 5,
         "oTableTools": {
             "aButtons": [
                 "copy",
                 "print",
                 {
                     "sExtends": "collection",
                     "sButtonText": "Save <i class=\"fa fa-angle-down\"></i>",
                     "aButtons": ["csv", "xls", "pdf"]
                 }
             ],
             "sSwfPath": "resources/css/swf/copy_csv_xls_pdf.swf"
         },
     });
	
	// Add event listener for opening and closing details
    $('#mau-cua-cuon-table tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = t.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( self.formatExpandData(row.data()) ).show();
            tr.addClass('shown');
        }
    } );
	
}


/**
 * @Todo: init button here
 */
DeviceManager.prototype.initButtonClick = function() {
	var self = this;
	
}

/**
 * @Todo: init select box here
 */
DeviceManager.prototype.initSelectAction = function() {
	var self = this;
}

DeviceManager.prototype.formatExpandData = function(data) {	
	var dataString = '<table><tbody><tr><td rowspan="12" style="padding:0 10px 0 0;"><img src="resources/img/avatars/Picture1.png"></td><td><b>Danh sách phụ kiện :</b></td></tr><tr colspan="2"><td><table class="table table-bordered table-striped table-condensed flip-content detail-device"><thead class="flip-content bordered-palegreen"><tr> <th class="detail-device">Code</th><th class="detail-device">Article</th><th class="detail-device">Node</th><th class="detail-device">Quantity</th><th class="detail-device">Giá order (€)</th><th class="detail-device">Giá về Việt Nam (VNĐ)</th><th class="detail-device">Tổng giá vốn thành phần</th></tr></thead><tbody><tr class="detail-device"><td class="detail-device white-background">4932748</td><td class="detail-device white-background">GVMC.400-2.D7,5</td><td class="detail-device white-background">FFH 400 - 600</td><td class="detail-device white-background">0</td><td class="detail-device white-background">2.08</td><td class="detail-device white-background">78,150.00</td><td class="detail-device white-background">-</td>			</tr><tr class="detail-device"><td class="detail-device white-background">4932749</td><td class="detail-device white-background">GVMC.600-2.D7,5</td><td class="detail-device white-background">FFH 601 - 800</td><td class="detail-device white-background">0</td><td class="detail-device white-background">2.35</td><td class="detail-device white-background">88,125.00</td><td class="detail-device white-background">-</td>			</tr><tr class="detail-device"><td class="detail-device white-background">4932750</td><td class="detail-device white-background">GVMC.800-2.D7,5</td><td class="detail-device white-background">FFH 801 - 1000</td><td class="detail-device white-background">0</td><td class="detail-device white-background">2.73</td><td class="detail-device white-background">102,375.00</td><td class="detail-device white-background">-</td>			</tr><tr class="detail-device"><td class="detail-device white-background">4932751</td><td class="detail-device white-background">GVMC.1000-2.D7,5</td><td class="detail-device white-background">FFH 1001 - 1200</td><td class="detail-device white-background">0</td><td class="detail-device white-background">3.08</td><td class="detail-device white-background">115,500.00</td><td class="detail-device white-background">-</td>			</tr><tr class="detail-device"><td class="detail-device white-background">4932753</td><td class="detail-device white-background">GVMC.1400-2.D7,5</td><td class="detail-device white-background">FFH 1401 - 1600</td><td class="detail-device white-background">2</td><td class="detail-device white-background">4.67</td><td class="detail-device white-background">175,125.00</td><td class="detail-device white-background">350,250.00</td>			</tr><tr class="detail-device"><td class="detail-device white-background">4932755</td><td class="detail-device white-background">GVMC.1800-2.D7,5</td><td class="detail-device white-background">FFH 1801 - 2000</td><td class="detail-device white-background">0</td><td class="detail-device white-background">-</td><td class="detail-device white-background">-</td><td class="detail-device white-background">-</td>			</tr><tr class="detail-device"><td class="detail-device white-background">&nbsp;</td><td class="detail-device white-background">&nbsp;</td><td class="detail-device white-background">&nbsp;</td><td class="detail-device white-background">&nbsp;</td><td class="detail-device white-background">&nbsp;</td><td class="detail-device white-background">&nbsp;</td><td class="detail-device white-background">&nbsp;</td>			</tr><tr class="detail-device"><td class="detail-device white-background">4933190</td><td class="detail-device white-background">SBS.K.S.U</td><td class="detail-device white-background">Số vấu phụ thuộc số Cam </td><td class="detail-device white-background">6</td><td class="detail-device white-background">0.58</td><td class="detail-device white-background">21,750.00</td><td class="detail-device white-background">130,500.00</td>			</tr><tr class="detail-device"><td class="detail-device white-background"></td><td class="detail-device white-background">Con lăn đơn</td><td class="detail-device white-background">Phụ thuộc trọng lượng cửa </td><td class="detail-device white-background">4</td><td class="detail-device white-background">2.00</td><td class="detail-device white-background">75,000.00</td><td class="detail-device white-background">300,000.00</td>			</tr><tr class="detail-device"><td class="detail-device white-background"></td><td class="detail-device white-background">Tay nắm</td><td class="detail-device white-background">Phụ thuộc khách hàng </td><td class="detail-device white-background">2</td><td class="detail-device white-background"></td><td class="detail-device white-background">-</td><td class="detail-device white-background">-</td>			</tr><tr class="detail-device"><td class="detail-device white-background">4936343</td><td class="detail-device white-background">GP.K.S.25.WS</td><td class="detail-device white-background">Chống sập </td><td class="detail-device white-background">0</td><td class="detail-device white-background">4.12</td><td class="detail-device white-background">154,500.00</td><td class="detail-device white-background">-</td>			</tr></tbody></table></td></tr></tbody></table>';
	return dataString;
}











