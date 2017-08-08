var InitiateSimpleDataTable = function() {
    return {
        init: function() {
            //Datatable Initiating
            var oTable = $('#simpledatatable').dataTable({
                "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
                "iDisplayLength": 5,
                "oTableTools": {
                    "aButtons": [
                        "copy", "csv", "xls", "pdf", "print"
                    ],
                    "sSwfPath": "assets/swf/copy_csv_xls_pdf.swf"
                },
                "language": {
                    "search": "",
                    "sLengthMenu": "_MENU_",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                },
                "aoColumns": [
                    {
                        "bSortable": false,
                        "width": '45px'
                    },
                    null,
                    { "bSortable": false },
                    null,
                    { "bSortable": false }
                ],
                
                "aaSorting": []
            });

            //Check All Functionality
            $('#simpledatatable thead th input[type=checkbox]').change(function() {
                var set = $("#simpledatatable tbody tr input[type=checkbox]");
                var checked = $(this).is(":checked");
                $(set).each(function() {
                    if (checked) {
                        $(this).prop("checked", true);
                        $(this).parents('tr').addClass("active");
                    } else {
                        $(this).prop("checked", false);
                        $(this).parents('tr').removeClass("active");
                    }
                });

            });
            $('#simpledatatable tbody tr input[type=checkbox]').change(function() {
                $(this).parents('tr').toggleClass("active");
            });

        }

    };

}();
var InitiateEditableDataTable = function() {
    return {
        init: function() {
            //Datatable Initiating
            var oTable = $('#editabledatatable').dataTable({
                "aLengthMenu": [
                    [5, 15, 20, 100, -1],
                    [5, 15, 20, 100, "All"]
                ],
                "iDisplayLength": 5,
                "sPaginationType": "bootstrap",
                "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
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
                    "sSwfPath": "assets/swf/copy_csv_xls_pdf.swf"
                },
                "language": {
                    "search": "",
                    "sLengthMenu": "_MENU_",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                },
                "aoColumns": [
                    null,
                    null,
                    null,
                    null,
                    { "bSortable": false }
                ]
            });

            var isEditing = null;

            //Add New Row
            $('#editabledatatable_new').click(function(e) {
                e.preventDefault();
                var aiNew = oTable.fnAddData([
                    '', '', '', '',
                    '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-edit"></i> Save</a> <a href="#" class="btn btn-warning btn-xs cancel" data-mode="new"><i class="fa fa-times"></i> Cancel</a>'
                ]);
                var nRow = oTable.fnGetNodes(aiNew[0]);
                editAddedRow(oTable, nRow);
                isEditing = nRow;
            });

            //Delete an Existing Row
            $('#editabledatatable').on("click", 'a.delete', function(e) {
                e.preventDefault();

                if (confirm("Are You Sure To Delete This Row?") == false) {
                    return;
                }

                var nRow = $(this).parents('tr')[0];
                oTable.fnDeleteRow(nRow);
                alert("Row Has Been Deleted!");
            });

            //Cancel Editing or Adding a Row
            $('#editabledatatable').on("click", 'a.cancel', function(e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                    isEditing = null;
                } else {
                    restoreRow(oTable, isEditing);
                    isEditing = null;
                }
            });

            //Edit A Row
            $('#editabledatatable').on("click", 'a.edit', function(e) {
                e.preventDefault();

                var nRow = $(this).parents('tr')[0];

                if (isEditing !== null && isEditing != nRow) {
                    restoreRow(oTable, isEditing);
                    editRow(oTable, nRow);
                    isEditing = nRow;
                } else {
                    editRow(oTable, nRow);
                    isEditing = nRow;
                }
            });

            //Save an Editing Row
            $('#editabledatatable').on("click", 'a.save', function(e) {
                e.preventDefault();
                if (this.innerHTML.indexOf("Save") >= 0) {
                    saveRow(oTable, isEditing);
                    isEditing = null;
                    //Some Code to Highlight Updated Row
                }
            });


            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();
            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
                jqTds[4].innerHTML = '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-save"></i> Save</a> <a href="#" class="btn btn-warning btn-xs cancel"><i class="fa fa-times"></i> Cancel</a>';
            }

            function editAddedRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
                jqTds[4].innerHTML = aData[4];
            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate('<a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a> <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>', nRow, 4, false);
                oTable.fnDraw();
            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate('<a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a> <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>', nRow, 4, false);
                oTable.fnDraw();
            }
        }

    };
}();
var InitiateExpandableDataTable = function() {
    return {
        init: function() {
            /* Formatting function for row details */
            function fnFormatDetails(oTable, nTr) {
                var aData = oTable.fnGetData(nTr);
                var sOut = '<table>';
                sOut += '<tr><td rowspan="12" style="padding:0 10px 0 0;"><img src="assets/img/avatars/' + aData[6] + '"/></td><td><b>Danh sách phụ kiện :</b></td></tr>';
                sOut += '<tr colspan="2">';
				sOut +=	'<td>';			
				sOut += 	'<table class="table table-bordered table-striped table-condensed flip-content detail-device">';				
				sOut += '<thead class="flip-content bordered-palegreen">';
				sOut += '<tr> ';
				sOut += '<th class="detail-device">Code</th>';
				sOut += '<th class="detail-device">Article</th>';
				sOut += '<th class="detail-device">Node</th>';
				sOut += '<th class="detail-device">Quantity</th>';
				sOut += '<th class="detail-device">Giá order (€)</th>';
				sOut += '<th class="detail-device">Giá về Việt Nam (VNĐ)</th>';
				sOut += '<th class="detail-device">Tổng giá vốn thành phần</th>';
				sOut += '</tr></thead>';
				
                sOut += 		'</body>';
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background">4932748</td>';
				sOut += 				'<td class="detail-device white-background">GVMC.400-2.D7,5</td>';
				sOut += 				'<td class="detail-device white-background">FFH 400 - 600</td>';
				sOut += 				'<td class="detail-device white-background">0</td>';
				sOut += 				'<td class="detail-device white-background">2.08</td>';
				sOut += 				'<td class="detail-device white-background">78,150.00</td>';
				sOut += 				'<td class="detail-device white-background">-</td>';
				sOut += '			</tr>';
				
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background">4932749</td>';
				sOut += 				'<td class="detail-device white-background">GVMC.600-2.D7,5</td>';
				sOut += 				'<td class="detail-device white-background">FFH 601 - 800</td>';
				sOut += 				'<td class="detail-device white-background">0</td>';
				sOut += 				'<td class="detail-device white-background">2.35</td>';
				sOut += 				'<td class="detail-device white-background">88,125.00</td>';
				sOut += 				'<td class="detail-device white-background">-</td>';
				sOut += '			</tr>';	
				
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background">4932750</td>';
				sOut += 				'<td class="detail-device white-background">GVMC.800-2.D7,5</td>';
				sOut += 				'<td class="detail-device white-background">FFH 801 - 1000</td>';
				sOut += 				'<td class="detail-device white-background">0</td>';
				sOut += 				'<td class="detail-device white-background">2.73</td>';
				sOut += 				'<td class="detail-device white-background">102,375.00</td>';
				sOut += 				'<td class="detail-device white-background">-</td>';				
				sOut += '			</tr>';	
				
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background">4932751</td>';
				sOut += 				'<td class="detail-device white-background">GVMC.1000-2.D7,5</td>';
				sOut += 				'<td class="detail-device white-background">FFH 1001 - 1200</td>';
				sOut += 				'<td class="detail-device white-background">0</td>';
				sOut += 				'<td class="detail-device white-background">3.08</td>';
				sOut += 				'<td class="detail-device white-background">115,500.00</td>';
				sOut += 				'<td class="detail-device white-background">-</td>';
				sOut += '			</tr>';		
				
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background">4932753</td>';
				sOut += 				'<td class="detail-device white-background">GVMC.1400-2.D7,5</td>';
				sOut += 				'<td class="detail-device white-background">FFH 1401 - 1600</td>';
				sOut += 				'<td class="detail-device white-background">2</td>';
				sOut += 				'<td class="detail-device white-background">4.67</td>';
				sOut += 				'<td class="detail-device white-background">175,125.00</td>';
				sOut += 				'<td class="detail-device white-background">350,250.00</td>';
				sOut += '			</tr>';	

				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background">4932755</td>';
				sOut += 				'<td class="detail-device white-background">GVMC.1800-2.D7,5</td>';
				sOut += 				'<td class="detail-device white-background">FFH 1801 - 2000</td>';
				sOut += 				'<td class="detail-device white-background">0</td>';
				sOut += 				'<td class="detail-device white-background">-</td>';
				sOut += 				'<td class="detail-device white-background">-</td>';
				sOut += 				'<td class="detail-device white-background">-</td>';
				sOut += '			</tr>';
				
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background">&nbsp</td>';
				sOut += 				'<td class="detail-device white-background">&nbsp</td>';
				sOut += 				'<td class="detail-device white-background">&nbsp</td>';
				sOut += 				'<td class="detail-device white-background">&nbsp</td>';
				sOut += 				'<td class="detail-device white-background">&nbsp</td>';
				sOut += 				'<td class="detail-device white-background">&nbsp</td>';
				sOut += 				'<td class="detail-device white-background">&nbsp</td>';
				sOut += '			</tr>';
				
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background">4933190</td>';
				sOut += 				'<td class="detail-device white-background">SBS.K.S.U</td>';
				sOut += 				'<td class="detail-device white-background">Số vấu phụ thuộc số Cam </td>';
				sOut += 				'<td class="detail-device white-background">6</td>';
				sOut += 				'<td class="detail-device white-background">0.58</td>';
				sOut += 				'<td class="detail-device white-background">21,750.00</td>';
				sOut += 				'<td class="detail-device white-background">130,500.00</td>';
				sOut += '			</tr>';
				
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background"></td>';
				sOut += 				'<td class="detail-device white-background">Con lăn đơn</td>';
				sOut += 				'<td class="detail-device white-background">Phụ thuộc trọng lượng cửa </td>';
				sOut += 				'<td class="detail-device white-background">4</td>';
				sOut += 				'<td class="detail-device white-background">2.00</td>';
				sOut += 				'<td class="detail-device white-background">75,000.00</td>';
				sOut += 				'<td class="detail-device white-background">300,000.00</td>';
				sOut += '			</tr>';
				
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background"></td>';
				sOut += 				'<td class="detail-device white-background">Tay nắm</td>';
				sOut += 				'<td class="detail-device white-background">Phụ thuộc khách hàng </td>';
				sOut += 				'<td class="detail-device white-background">2</td>';
				sOut += 				'<td class="detail-device white-background"></td>';
				sOut += 				'<td class="detail-device white-background">-</td>';
				sOut += 				'<td class="detail-device white-background">-</td>';
				sOut += '			</tr>';
				
				sOut += 			'<tr class="detail-device">';								
				sOut += 				'<td class="detail-device white-background">4936343</td>';
				sOut += 				'<td class="detail-device white-background">GP.K.S.25.WS</td>';
				sOut += 				'<td class="detail-device white-background">Chống sập </td>';
				sOut += 				'<td class="detail-device white-background">0</td>';
				sOut += 				'<td class="detail-device white-background">4.12</td>';
				sOut += 				'<td class="detail-device white-background">154,500.00</td>';
				sOut += 				'<td class="detail-device white-background">-</td>';
				sOut += '			</tr>';
				
                sOut += 		'</tbody>';
                sOut += 	'</table>';
				sOut +=	'</td>';
				sOut += '</tr>';
                
				sOut += '</table>';
                return sOut;
            }

            /*
             * Insert a 'details' column to the table
             */
            var nCloneTh = document.createElement('th');
            var nCloneTd = document.createElement('td');
            nCloneTd.innerHTML = '<i class="fa fa-plus-square-o row-details"></i>';

            $('#expandabledatatable thead tr').each(function() {
                this.insertBefore(nCloneTh, this.childNodes[0]);
            });

            $('#expandabledatatable tbody tr').each(function() {
                this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
            });

            /*
             * Initialize DataTables, with no sorting on the 'details' column
             */
            var oTable = $('#expandabledatatable').dataTable({
                "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
                "aoColumnDefs": [
                    { "bSortable": false, "aTargets": [0] },
                    { "bVisible": false, "aTargets": [6] }
                ],
                "aaSorting": [[1, 'asc']],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"]
                ],
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
                    "sSwfPath": "assets/swf/copy_csv_xls_pdf.swf"
                },
                "language": {
                    "search": "",
                    "sLengthMenu": "_MENU_",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                }
            });


            $('#expandabledatatable').on('click', ' tbody td .row-details', function() {
                var nTr = $(this).parents('tr')[0];
                if (oTable.fnIsOpen(nTr)) {
                    /* This row is already open - close it */
                    $(this).addClass("fa-plus-square-o").removeClass("fa-minus-square-o");
                    oTable.fnClose(nTr);
                } else {
                    /* Open this row */
                    $(this).addClass("fa-minus-square-o").removeClass("fa-plus-square-o");;
                    oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
                }
            });

            $('#expandabledatatable_column_toggler input[type="checkbox"]').change(function() {
                var iCol = parseInt($(this).attr("data-column"));
                var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
                oTable.fnSetColumnVis(iCol, (bVis ? false : true));
            });

            $('body').on('click', '.dropdown-menu.hold-on-click', function(e) {
                e.stopPropagation();
            });
        }
    };
}();
var InitiateSearchableDataTable = function() {
	
    return {
        init: function() {
            var oTable = $('#searchable').dataTable({
                "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
                "aaSorting": [[1, 'asc']],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"]
                ],
                "iDisplayLength": 10,
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
                    "sSwfPath": "assets/swf/copy_csv_xls_pdf.swf"
                },
                "language": {
                    "search": "",
                    "sLengthMenu": "_MENU_",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                }
            });

            $("tfoot input").keyup(function() {
                /* Filter on the column (the index) of this element */
                oTable.fnFilter(this.value, $("tfoot input").index(this));
            });

        }
    };
}();

var InitiateExpandableDataTable2 = function() {
    return {
        init: function() {
            /* Formatting function for row details */
            function fnFormatDetails(oTable, nTr) {
                var aData = oTable.fnGetData(nTr);
                var sOut = '<table>';
                sOut += '<tr><td rowspan="12" style="padding:0 10px 0 0;"><img src="assets/img/avatars/' + aData[6] + '"/></td><td><b>Danh sách phụ kiện :</b></td></tr>';
                sOut += '<tr colspan="2">';
				sOut +=	'<td>';			
				sOut += 	'<table class="table table-bordered table-striped table-condensed flip-content detail-device">';				
				sOut += '<thead class="flip-content bordered-palegreen">';
				sOut += '<tr> ';
				sOut += '<th class="detail-device">Code</th>';
				sOut += '<th class="detail-device">Article</th>';
				sOut += '<th class="detail-device">Node</th>';
				sOut += '<th class="detail-device">Quantity</th>';
				sOut += '<th class="detail-device">Giá order (€)</th>';
				sOut += '<th class="detail-device">Giá về Việt Nam (VNĐ)</th>';
				sOut += '<th class="detail-device">Tổng giá vốn thành phần</th>';
				sOut += '</tr></thead>';
				
                sOut += 		'</body>';
                
                var phukiens = $.ajax({
                    type: 'GET',
                    url: "http://localhost:8080/rest/getDanhSachPhuKien",
                    dataType: "json",
                    async: false,
                    success: function(data){
                    	phukiens= data;
                    }
                }).responseText;
                phukiens= JSON.parse(phukiens);
                for(var i = 0; i< phukiens.length; i++){
                	var phukien= phukiens[i];
                	sOut += 			'<tr class="detail-device">';
                	sOut += 			'<td class="detail-device white-background">'+phukien.codePhuKien+'</td>'
                	sOut += 			'<td class="detail-device white-background">'+phukien.tenPhuKien+'</td>'
                	sOut += 			'<td class="detail-device white-background">'+phukien.mieuTa+'</td>'
                	sOut += 			'<td class="detail-device white-background">0</td>'
                	sOut += 			'<td class="detail-device white-background">'+phukien.giaOrder+'</td>'
                	sOut += 			'<td class="detail-device white-background">'+phukien.giaVeVietNam+'</td>'
                	sOut += 			'<td class="detail-device white-background">'+phukien.giaOrder+'</td>'
                	sOut += '			</tr>';
                }
                sOut += 		'</tbody>';
                sOut += 	'</table>';
				sOut +=	'</td>';
				sOut += '</tr>';
                
				sOut += '</table>';
                return sOut;
            }
            /*
             * Insert a 'details' column to the table
             */
            var nCloneTh = document.createElement('th');
            var nCloneTd = document.createElement('td');
            nCloneTd.innerHTML = '<i class="fa fa-plus-square-o row-details"></i>';

            $('#expandabledatatable thead tr').each(function() {
                this.insertBefore(nCloneTh, this.childNodes[0]);
            });

            $('#expandabledatatable tbody tr').each(function() {
                this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
            });

            /*
             * Initialize DataTables, with no sorting on the 'details' column
             */
            var oTable = $('#expandabledatatable').dataTable({
                "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
                "columns": [
                    { "bSortable": false, "aTargets": [0] },
                    { "bVisible": false, "aTargets": [6] },
                    { "data": "idCua"},
                    { "data": "tenCua"},
                    { "data": "heProfile"},
                    { "data": "loaiCua"},
                    { "data": "soCanh"},
                    { "data": "heCua"},
                    { "data": "heSoAnToan"},
                    { "data": "heMo"}
                ],
                "ajax": {
                    "url": "http://localhost:8080/rest/getDanhSachCua",
                    "type": "GET"
                },
                "aaSorting": [[1, 'asc']],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"]
                ],
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
                    "sSwfPath": "assets/swf/copy_csv_xls_pdf.swf"
                },
                "language": {
                    "search": "",
                    "sLengthMenu": "_MENU_",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                }
            });


            $('#expandabledatatable').on('click', ' tbody td .row-details', function() {
                var nTr = $(this).parents('tr')[0];
                if (oTable.fnIsOpen(nTr)) {
                    /* This row is already open - close it */
                    $(this).addClass("fa-plus-square-o").removeClass("fa-minus-square-o");
                    oTable.fnClose(nTr);
                } else {
                    /* Open this row */
                    $(this).addClass("fa-minus-square-o").removeClass("fa-plus-square-o");;
                    oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
                }
            });

            $('#expandabledatatable_column_toggler input[type="checkbox"]').change(function() {
                var iCol = parseInt($(this).attr("data-column"));
                var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
                oTable.fnSetColumnVis(iCol, (bVis ? false : true));
            });

            $('body').on('click', '.dropdown-menu.hold-on-click', function(e) {
                e.stopPropagation();
            });
        }
    };
}();
