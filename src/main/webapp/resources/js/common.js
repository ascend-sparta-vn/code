function pad(number) {
    if (number < 10) {
        return '0' + number;
    }
    return number;
}


/** to decode to avoid xss*/
function decodeHtml(input) {
    if(input) {
        input = input.toString().replace(/</g, "&lt;").replace(/>/g, "&gt;");
    }
    return  input;
}


/**show waiting dialog */
function showProgressAnimation(){
    $("#loading-div-background").show();
}

function hideProgressAnimation() {
    $("#loading-div-background").hide();
}

/**function to upload file*/
function uploadFile(uploadObject) {
//	console.log(uploadObject);
    showProgressAnimation();
	/* Create a FormData instance */
    var formData = new FormData();
	/* Add the file */
    formData.append("file", uploadObject.file.files[0]);
    formData.append("fkId", uploadObject.fkId);
    formData.append("uploadType", uploadObject.type);
    formData.append("folderType", uploadObject.folderType);
    $.ajax({
        url: 'uploadFile', // point to server-side
        dataType: 'text',  // what to expect back from server, if anything
        cache: false,
        contentType: false,
        processData: false,
        data: formData,
        type: 'post',
        success: function(response){
            uploadObject.hideProgressAnimation();
            if(uploadObject.message && uploadObject.message != '') {
                showMessageContent('Success', uploadObject.message);
            }
            if(uploadObject.url && uploadObject.url != '') {
                window.location.href = uploadObject.url;
            }

        },
        error:function(){
            uploadObject.hideProgressAnimation();
            if(uploadObject.message && uploadObject.message != '') {
                showMessageContent('Success', uploadObject.message);
            }
        }
    });
}

/**upload object */
function Upload(file, fk, url, type, folderType, message) {
    this.file = file;
    this.fkId = fk;
    this.url = url;
    this.type = type;
    this.folderType = folderType;
    this.message = message;
    this.hideProgressAnimation = function () {
        $("#loading-div-background").hide();
    }
}

/**function to only enter number for text box*/
function onlyEnterNumberTextBox(id) {
    $("#" + id).keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) ||
            // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
}

/**get status for device*/
function generateEquipmentStatus(status) {
    if(status == 0) {
        return "M&#7899;i";
    } else if (status == 1) {
        return "&#272;ang s&#7917; d&#7909;ng";
    } else if (status == 2) {
        return "&#272;&#227; h&#7871;t b&#7843;o h&#224;nh";
    } else if (status == 3) {
        return "H&#7887;ng";
    }
    return "";
}

/**show message area*/
function showMessageArea(cssClass, content, time) {
    $("#messageContent").addClass(cssClass);
    $("#messageForward").show();
    $("#messageContent").html(content);
    setTimeout(function(){
        $("#messageContent").removeClass(cssClass);
        $("#messageForward").hide();
    }, time);
}

/**show message for all project.For example : add or delete or edit*/
function showMessageContent(type, content, time) {
    $("#SuccessMessageComponent").hide();
    $("#WarningMessageComponent").hide();
    $("#ErrorMessageComponent").hide();
    var message = '<i class="uiIcon' + type + '"></i> ' + content;
    var id = '#' + type + 'MessageComponent';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}
function _showMessageContent(type, content, time) {
    var message = '<i class="uiIcon' + type + '"></i> ' + content;
    var id = '#_' + type + 'MessageComponent';
    var timeDisplay = 300000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}

function showMessageAdd2(content, time, container, type) {
    var message = "";
    if(typeof type ==='undefined') {
        message = '<i class="uiIconWarning"></i> ' + content;
    } else {
        if(type=="Success") {
            $("#" + container).removeClass("alert-warning");
            $("#" + container).addClass("alert-success");
        }

        if(type=="Error") {
            $("#" + container).removeClass("alert-success");
            $("#" + container).addClass("alert-warning");
        }

        message = '<i></i> ' + content;
    }
    var id = '#' + container;
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}

function showMessageAdd(content, time, type) {
    var message = "";
    if(typeof type ==='undefined') {
        message = '<i class="uiIconWarning"></i> ' + content;
    } else {
        if(type=="success") {
            $("#WarningMessageAdd").removeClass("alert-warning");
            $("#WarningMessageAdd").addClass("alert-success");
        }

        if(type=="error") {
            $("#WarningMessageAdd").removeClass("alert-success");
            $("#WarningMessageAdd").addClass("alert-warning");
        }

        message = '<i></i> ' + content;
    }
    var id = '#WarningMessageAdd';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}

/*function showMessageAdd(content, time) {
 var message = '<i class="uiIconWarning"></i> ' + content;
 var id = '#WarningMessageAdd';
 var timeDisplay = 3000;
 $(id).html(message);
 $(id).show();
 window.scrollTo(0,0);
 if(time)
 timeDisplay = time;
 setTimeout(function(){
 $(id).hide();
 }, timeDisplay);
 }*/

function showMessageModalAdd(content, time, type) {
    var message = "";
    if(type="error") {
        message = '<i class="uiIconWarning"></i> ' + content;
    } else {
        message = '<i class="uiIconSuccess"></i> ' + content;
    }

    var id = '#WarningMessageModalAdd';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}

function showPrintMessage(content, time) {
    var message = '<i class="uiIconWarning"></i> ' + content;
    var id = '#PrintMessageAdd';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}

function showPrintMessageModal(content, time) {
    var message = '<i class="uiIconWarning"></i> ' + content;
    var id = '#PrintMessageModalAdd';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}


function showMessageEdit(content, time) {
    var message = '<i class="uiIconWarning"></i> ' + content;
    var id = '#WarningMessageEdit';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
    console.log("thanh dep trai");
}

/**generate attached file*/
function generateAttachFile(data) {
    var files = data.attachFiles;
    if(files) {
        var out = '<ul class="list-unstyled project-files">';
        for(var i = 0; i < files.length; i++) {
            var file = files[i];
            out += '<li id = "file_upload_'+ file.attachId  +'">';
            out += '<a href = "./download?fileId=' + file.attachId +'" >' + file.attachName + '</a>';
            out += '<button title = "X&#243;a t&#7879;p" onclick="deleteFileUpload(' + file.attachId + ')" type="button" class="delete-file">'
            out	+= '<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>'
            out	+= '</button>'
            out += '</li>';
        }
        out += '</ul>';
        $("#attachedFile").html(out);
    }
}

/**generate attached file to show image in a popup*/
function generateAttachImage(data, folderType, hideDeletion) {
    var files = data.attachFiles;
    if(files) {
        var gallery = '<div class="gallery clearfix" style = "display:none">';
        var out = '<div class="gallery clearfix" style = "padding-bottom: 5px;">';
        for(var i = 0; i < files.length; i++) {
            var file = files[i];
            var type = file.attachName.substring(file.attachName.lastIndexOf('.') + 1, file.attachName.length).toUpperCase();
            var tmp = '';
            if(folderType == FOLDER.TYPE.PLAN) {
                tmp = 'images/upload-plan/';
            } else if(folderType == FOLDER.TYPE.RESOURCE) {
                tmp = 'images/upload-resource/';
            } else if (folderType == FOLDER.TYPE.USER) {
                tmp = 'images/upload-user/';
            } else {
                tmp = 'images/upload/';
            }
            var style = 'padding-top: 5px';
            if(i == (files.length - 1))
                style = 'padding-top: 5px; padding-bottom: 5px';

            if(type == 'JPG' || type == 'PNG' || type == 'JPEG') {
                gallery += '<a href="../' + tmp + file.attachUrl +'" rel="prettyPhoto"></a>';
                out += '<div style = "' + style + '" id = "file_upload_' + file.attachId + '"><a href="../' +  tmp + file.attachUrl +'" rel="prettyPhoto"> <span class = "fa fa-file-image-o"></span>&nbsp;' + file.attachName + '</a>&nbsp;&nbsp;';
                if(!hideDeletion) {
                    out += '<a title = "X&#243;a &#7843;nh" style = "font-size: 14px; color: black" class = "fa fa-trash-o" onclick = "deleteFileUpload(' + file.attachId + ')"></a>';
                }
                out	+= '</div>';
            } else {
                out += '<div style = "' + style + '" id = "file_upload_'+ file.attachId  +'">';
                out += '<a href = "./download?fileId=' + file.attachId +'" ><span class = "fa fa-download"></span>&nbsp;' + file.attachName + '</a>&nbsp;&nbsp;';
                if(!hideDeletion) {
                    out += '<a title = "X&#243;a t&#7879;p" style = "font-size: 14px; color: black" class = "fa fa-trash-o" onclick = "deleteFileUpload(' + file.attachId + ')"></a>';
                }
                out += '</div>';
            }
        }

        gallery += '</div>';
        out += '</div>';
        $("#attachedFile").html(gallery + out);
        $(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'fast',slideshow:10000, hideflash: true});
    }
}

/**get status for device*/
function generateStaffGrade(grade) {

    return grade;
}

/*trungnq*/
function hideMessageContent(){
    $("#WarningMessageComponent").hide();
    $("#ErrorMessageComponent").hide();
    $("#SuccessMessageComponent").hide();
}

function resetInputValue(){
    $("input").val('');
    $('input:checkbox').removeAttr('checked');
    $("textarea").val('');
    $(".summernote").code("");
    $('select ').not('.input-sm').val("-1");
}

/**to check integer number*/
function checkIntegerNumber(val) {
    if (val && val == parseInt(val, 10))
        return true;
    else
        return false;
}

/***validate file upload*/
function validateImageUpload(id) {
    var filePath = $("#" + id).val();
    var fileName = filePath.substring(filePath.lastIndexOf('\\') +1, filePath.length);
    var type = fileName.substring(fileName.lastIndexOf('.') + 1, fileName.length);
    if(type == null || type != 'jpg' || type != 'jepg' || type != 'png')
        return false;

    return true;
}

/*using for link to other screen*/
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

/** to decode to avoid xss*/
function decodeHtml(input) {
    if(input) {
        input = input.toString().replace(/</g, "&lt;").replace(/>/g, "&gt;");
    }

    return  input;
}

/**object to create Base64*/
var Base64 = {
    _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

    encode: function(input) {
        var output = "";
        var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
        var i = 0;

        input = Base64._utf8_encode(input);

        while (i < input.length) {

            chr1 = input.charCodeAt(i++);
            chr2 = input.charCodeAt(i++);
            chr3 = input.charCodeAt(i++);

            enc1 = chr1 >> 2;
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
            enc4 = chr3 & 63;

            if (isNaN(chr2)) {
                enc3 = enc4 = 64;
            } else if (isNaN(chr3)) {
                enc4 = 64;
            }

            output = output + this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) + this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

        }

        return output;
    },


    decode: function(input) {
        var output = "";
        var chr1, chr2, chr3;
        var enc1, enc2, enc3, enc4;
        var i = 0;

        input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

        while (i < input.length) {

            enc1 = this._keyStr.indexOf(input.charAt(i++));
            enc2 = this._keyStr.indexOf(input.charAt(i++));
            enc3 = this._keyStr.indexOf(input.charAt(i++));
            enc4 = this._keyStr.indexOf(input.charAt(i++));

            chr1 = (enc1 << 2) | (enc2 >> 4);
            chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
            chr3 = ((enc3 & 3) << 6) | enc4;

            output = output + String.fromCharCode(chr1);

            if (enc3 != 64) {
                output = output + String.fromCharCode(chr2);
            }
            if (enc4 != 64) {
                output = output + String.fromCharCode(chr3);
            }

        }

        output = Base64._utf8_decode(output);

        return output;

    },

    _utf8_encode: function(string) {
        string = string.replace(/\r\n/g, "\n");
        var utftext = "";

        for (var n = 0; n < string.length; n++) {

            var c = string.charCodeAt(n);

            if (c < 128) {
                utftext += String.fromCharCode(c);
            }
            else if ((c > 127) && (c < 2048)) {
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            }
            else {
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }

        }

        return utftext;
    },

    _utf8_decode: function(utftext) {
        var string = "";
        var i = 0;
        var c = c1 = c2 = 0;

        while (i < utftext.length) {

            c = utftext.charCodeAt(i);

            if (c < 128) {
                string += String.fromCharCode(c);
                i++;
            }
            else if ((c > 191) && (c < 224)) {
                c2 = utftext.charCodeAt(i + 1);
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                i += 2;
            }
            else {
                c2 = utftext.charCodeAt(i + 1);
                c3 = utftext.charCodeAt(i + 2);
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                i += 3;
            }

        }

        return string;
    }

}

function generateDate(endTime) {
    var date = endTime;
    date = formatDate_ddHHmmss_FULL_SLASH(date);
    return date;
}

function generateDateStaff(data, type, val) {
    var date = val.staffLastModifiedDate;
    date = formatDate_yyyyMMddHHmmss_FULL_SLASH(date);
    return date;
}


/**validate ip address*/
function validateIpAddressFormat(str) {
    var pattern = /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/;
    return pattern.test(str);
}

/**validate account username*/
function validateUsername(str) {
    var pattern = /^[a-zA-Z0-9\_]+$/;
    return pattern.test(str);
}

/**validate ip address*/
function validateIpAddressRange(str) {

    var part = str.trim().split("/");
    if(part.length != 2)
        return false;
    var arrange = parseInt(part[1]);
    if((arrange < 1 || arrange > 255))
        return false;
    var ips = part[0];
    var ipPart = ips.split(".");
    if(ipPart.length == 3){
        var a = parseInt(ipPart[0]);
        var b = parseInt(ipPart[1]);
        var c = parseInt(ipPart[2]);
        if((a < 1 || a > 255) || (b < 0 || b > 255) || (c <0 || c > 255))
            return false;
        else
            return true;
    }else{
        return false;
    }

//	var pattern = /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/;
//	return pattern.test(str);

}

function convertUTCDateToLocalDate(date) {
    var newDate = new Date(date.getTime()+date.getTimezoneOffset()*60*1000);

    var offset = date.getTimezoneOffset() / 60;
    var hours = date.getUTCHours();

    newDate.setHours(hours - offset);

    return newDate;
}

function isValidAjaxCall(response){
    if(response == "403") return false
    else return true;
}

/**hide modal*/
function hideModal(id) {
    $("#" + id).modal("hide");
}

//ds format: dd/mm/yyyy HH24:MM:ss
// trungnq
// for forensic and event-searching screen
function dateSplit(ds){
    var first_part = ds.split(" ")[0];
    var second_part = ds.split(" ")[1];

    var part1 = first_part.split("/");
    var day = part1[0];
    var month = part1[1];
    var year = part1[2];

    var part2 = second_part.split(":");
    var hour = part2[0];
    var minute = part2[1];
    var second = part2[2];

    return new Date (year, month, day, hour, minute, second);
}

/**
 * to validate password
 */
function validatePassword(password){
    // validate aleast 1 uppercase
    // validate aleast 1 lowercase
    // validate aleast contains 1 number
    var errors = '';
    if (password.length < USER.VALIDATE.PW_MIN_LENGTH) {
        errors += "<br />Máº­t kháº©u cÃ³ Ã­t nháº¥t 8 kÃ½ tá»±.<br /> ";
    }
    if (password.search(/[a-z]/) < 0) {
        errors += "Máº­t kháº©u pháº£i bao gá»“m Ã­t nháº¥t 1 kÃ½ tá»± thÆ°á»�ng.<br /> ";
    }
    if (password.search(/[A-Z]/) < 0) {
        errors += "Máº­t kháº©u pháº£i bao gá»“m Ã­t nháº¥t 1 kÃ½ tá»± in hoa.<br /> ";
    }
    if (password.search(/[0-9]/) < 0) {
        errors += "Máº­t kháº©u pháº£i cÃ³ Ã­t nháº¥t 1 kÃ½ tá»± lÃ  sá»‘.<br /> ";
    }
    return errors;
}

/** convert date id to date **/
function convertDateIdToString(dateString) {
    if(dateString == null || dateString == '' ) return "";
    dateString = dateString.toString();
    var result = dateString.substr(6,2) + "-" + dateString.substr(4,2) + "-" + dateString.substr(0,4);
    return result;
}

function getToday(){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd='0'+dd;
    }

    if(mm<10) {
        mm='0'+mm;
    }

    today = dd+'-'+mm+'-'+yyyy;
    return today;
}

function getTomorrow(){
    var tomorrow = new Date(new Date().getTime() + 24 * 60 * 60 * 1000);
    var dd = tomorrow.getDate();
    var mm = tomorrow.getMonth()+1; //January is 0!
    var yyyy = tomorrow.getFullYear();

    if(dd<10) {
        dd='0'+dd;
    }

    if(mm<10) {
        mm='0'+mm;
    }

    tomorrow = dd+'-'+mm+'-'+yyyy;
    return tomorrow;
}

function focusError(id) {
    $("#" + id).addClass('has-error');
}

function removeFocus() {
    $(".has-error").removeClass('has-error');
}

function numberWithCommas(x) {
    if (x == 0) return x;
    if(x == null) return '';
    if(x == '') return '';
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}

function getPercentageNumber(number) {
    if(number == null) return "";
    var text = number.toString();
    if(text.length > 4) {
        if(number == null) return "";
        else {
            if(number == '') {
                return "";
            } else {
                return number.toFixed(3);
            }
        }
    } else {
        return text;
    }
}

//is double or float
function isNumeric(n) {
    n = n + " ";
    n = n.trim();
    return !isNaN(parseFloat(n)) && isFinite(n);
}

//is only integer
function isInt(value) {
    value = value + " ";
    value = value.trim();
    return !isNaN(value) && parseInt(Number(value)) == value && !isNaN(parseInt(value, 10));
}

function setEffect(id) {
//	$("#" + id).get(0).scrollIntoView();
    $("#" + id).addClass("has-error");
    setTimeout(function(){ $("#" + id).removeClass("has-error"); }, 3000);
}

//2016-04-12T09:40:08 - > 09:40:08
function formatCreateDate(input) {
    if((input == null) || input == '') return "";
    else {
        return input.substring(11,19);
    }

}

//2016-04-12T09:40:08 - > 09:40:08
function formatFullCreateDate(createDate) {
    if(createDate == null) return "";
    if(createDate == '') return;//2015-01-03T00:00:00
    else {
        var year = createDate.substring(0,4);
        var month = createDate.substring(5,7);
        var day = createDate.substring(8,10);
        var time = createDate.substring(11,19);
        return day + "/" + month + "/" + year + " " + time;
    }
}

function replaceFullCreateDate(createDate) {
    if(createDate == null) return "";
    if(createDate == '') return;//2015-01-03T00:00:00
    else {
        return createDate.replaceAll('/', '-');
    }
}


function setPrinterLocalStorage(printerId) {
    localStorage.setItem('printerId', printerId);
}

function getPrinterLocalStorage() {
    return localStorage.getItem('printerId');
}

function makeid()
{
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 5; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}

function isEmpty(val){
    if(val == null || val == ''){
        return true;
    }else
        return false;
}


function displayMenu(listPages) {
    if (listPages && listPages.length > 0){
        $.each(listPages, function (i, page) {
            var pageCode = page.pageCode;
            var rightCode = page.rightCode;
            if ((pageCode != null) && (rightCode != null)) {
                if (rightCode.indexOf("S") >= 0) {
                    $('li[pagecode="'+pageCode+'"]').show();
                }
            }
        });
    }
}


function cutString(input, lengthMax) {
    var returnString = input;
    if(input.length > lengthMax) {
        returnString = input.substring(0, lengthMax) + "...";
    }
    return returnString;
}

/*function validateEmail(email) 
 {
 var re = /\S+@\S+\.\S+/;
 return re.test(email);
 }*/

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

/**
 * @author ThanhNV
 */
function loadRoad(container, data, roadId){
    container && $(container).empty().append('<option  value="-1">--Chọn tuyến đường--</option>');
    for(var i = 0; i< data.length; i++) {
        var obj = data[i];
        if(obj.id == roadId )
            $(container).append("<option selected=" + "selected " + "value='" + obj.id +"'>" +decodeHtml(obj.name) +"</option>");
        else
            $(container).append("<option value='" + obj.id +"'>" + decodeHtml(obj.name) +"</option>");
    }

    $(container).trigger('change');
}

/**
 * @author ThanhNV
 * @param value
 * @param mode
 * @returns {String}
 */
function getFormTitle(mode, value) {
    if(mode == CRUD.MODE.ADD) {
        return LABEL.CRUD.ADD + " " + value;
    } else if(mode == CRUD.MODE.UPDATE) {
        return LABEL.CRUD.UPDATE + " " + value;
    } else if(mode == CRUD.MODE.VIEW) {
        return LABEL.CRUD.VIEW + " " + value;
    }
}


/**
 * @author Sonph
 * @param array
 * @param item
 *
 * @todo remove a item in array
 */
function removeItemFromArray(arr, item) {
    for(var i = arr.length; i--;) {
        if(arr[i] === item) {
            arr.splice(i, 1);
        }
    }
}


/**
 * @author ThanhNV
 * @param inputText
 * @returns {Boolean}
 */
function validateIPaddress(inputText) {
    var ipformat = /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
    if(inputText.match(ipformat)) {
        return true;
    } else{
        return false;
    }
}

function validatePort(port){
    if(port == null) return false;
    var portInt = parseInt(port, 10);
    if(portInt >= 1 && portInt <= 65000)
        return true;
    else
        return false;
}

function getCustomEuroDateValue(strDate) {
    if((strDate == '') || (strDate.trim() == '')) {
        return 0;
    }
    var frDatea = $.trim(strDate).split(' ');
    var frTimea = frDatea[1].split(':');
    var frDatea2 = frDatea[0].split('/');

    var x = (frDatea2[2] + frDatea2[1] + frDatea2[0] + frTimea[0] + frTimea[1] + frTimea[2]);
    x = x * 1;

    return x;
}

function getByteLength(str){
    var utf8Str = unescape(encodeURIComponent(str));
    var arr = [];
    for (var i = 0; i < utf8Str.length; i++) {
        arr.push(utf8Str.charCodeAt(i));
    }
    return arr.length;
}

//convert 3.75 -> Km3 + 750;
function getRelativeString(relativePosition) {
    var returnString = '';
    if(relativePosition != null) {
        var kmIndex = parseInt(relativePosition, 10);
        var mIndex = Math.round(relativePosition * 1000 - kmIndex * 1000);
        mIndex = parseInt(mIndex, 10);
        if(mIndex == 0) {
            returnString = "KM"+kmIndex;
        } else {
            returnString = "KM"+kmIndex + " + " + mIndex;
        }
        return returnString;
    } else {
        return 'N/A';
    }
}

function convert2Position(position){
    var arrPos = [];
    if(position == null || position == '')
        arrPos = ['0', '0'];
    var firstNum = (parseInt(position,10)) || 0;
    var secNum = (Math.round(parseFloat(position) * 1000) - firstNum * 1000) || 0;
    arrPos = [firstNum + '', secNum + ''];
    return arrPos;
}

// for longitude, latititude
function validateDecimal(input){
    var flag = true;
    if(input != null){
        var arr = input.split('.');
        if(arr.length > 1){
            var decimalChild = arr[1];
            if(decimalChild.length > 6)
                flag = false;
        }
    }

    return flag;
}

function checkRoleButton(buttonId, pageRight) {
    //$("#" + buttonId).hide();
    $("#" + buttonId).parent().closest('div').hide();

    var listRole = $("#listRole").val();
    if(listRole != '') {
        var roles = listRole.split(",");
        for (var i = 0 ; i < roles.length ; i ++) {
            if(roles[i] == pageRight) {
                //$("#" + buttonId).show();
                $("#" + buttonId).parent().closest('div').show();
            }
        }
    }
}


function checkRole() {
    //$("#btn-modal-add").hide();
    //$("#btn-modal-edit").hide();
    //$("#btn-modal-delete").hide();

    $("#btn-modal-add").parent().closest('div').hide();
    $("#btn-modal-edit").parent().closest('div').hide();
    $("#btn-modal-delete").parent().closest('div').hide();

    var listRole = $("#listRole").val();
    if(listRole != '') {
//		console.log(listRole);
        var roles = listRole.split(",");
        for (var i = 0 ; i < roles.length ; i ++) {
            if(roles[i] == PAGE.PAGE_RIGHT.INSERT) {
                //$("#btn-modal-add").show();
                $("#btn-modal-add").parent().closest('div').show();
            }

            if(roles[i] == PAGE.PAGE_RIGHT.UPDATE) {
                //$("#btn-modal-edit").show();
                $("#btn-modal-edit").parent().closest('div').show();
            }

            if(roles[i] == PAGE.PAGE_RIGHT.DELETE) {
                //$("#btn-modal-delete").show();
                $("#btn-modal-delete").parent().closest('div').show();
            }

        }
    }
}

/**
 * @author ThanhNV
 * @param port
 * @returns {Boolean}
 */
function validatePortNVS(port){
    if(port == null) return false;
    var portInt = parseInt(port);
    if(portInt >= 1 && portInt <= 65000)
        return true;
    else
        return false;
}

/**
 * @author SonPH
 * @param ipAddress
 * @returns {Boolean}
 */
function isIpAddress(s) {
    if (typeof s !== 'string') { return false; }
    // There must be 4 parts separated by dots.
    var parts = s.split('.');
    if (parts.length !== 4) { return false; }
    // Each of the four parts must be an integer in the range 0 to 255.
    for (var i = 0; i < 4; ++i) {
        var part = parts[i];
        // Each part must consist of 1 to 3 decimal digits.
        if (!/^\d{1,3}$/.test(part)) { return false; }
        var n = +part;
        if (0 > n || n > 0xff) { return false; }
    }
    return true;
}

/**
 * allow only input integer
 *
 * @author SonPH
 * @param evnt
 * @returns {Boolean}
 */
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

/**
 * allow only input float
 *
 * @author SonPH
 * @param evnt, this, numberOfCharAfterDot
 * @returns {Boolean}
 */
function isFloatKey(evt, element, numberOfCharAfterDot) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57) && !(charCode == 46 || charCode == 8))
        return false;
    else {
        var len = $(element).val().length;
        var index = $(element).val().indexOf('.');
        if (index > 0 && charCode == 46) {
            return false;
        }

        if (index > 0) {
            var CharAfterdot = len - index;
            if (CharAfterdot > numberOfCharAfterDot) {
                return false;
            }
        }

    }
    return true;
}

function getRelativeLocation(idKmInput, idMetInput) {
    var first = $("#"+idKmInput).val() || '0';
    var second = $("#"+idMetInput).val() || '0';
    return parseInt(first, 10) + parseInt(second, 10)/1000 + '';
}

function fillPosition(relativePosition, kmId, mId){
    var arrPos = convert2Position(relativePosition);
    $("#" + kmId).val(arrPos[0]);
    $("#" + mId).val(arrPos[1]);
};

function checkInteger(data) {
    var isnum = /^\d+$/.test(data);
    return isnum;
}

/*compare to time now*/
function compareDateObject(date1, date2){
    if(date1 == null) return false;
    if(date2 == null) return false;

    var date1Long = date1.getTime();
    var date2Long = date2.getTime();

    if(date1Long - date2Long > 0) return '>';
    if(date1Long - date2Long == 0) return '=';
    if(date1Long - date2Long < 0) return '<';
    else
        return '';
}

/*to convert date string to date in format dd/MM/yyyy hh:mm:ss*/
function convertString2DateInFormat_ddMMyyyyhhmm(dateString){
    if(dateString == null || dateString == '' ) return "";
    var dateReturn = null;

    var arr = dateString.split(" ");
    if(arr == null) return null;

    var arr_dd = arr[0].split("/");
    if(arr_dd == null || arr_dd.length != 3) return null;

    var arr_hh = arr[1].split(":");
    if(arr_hh == null || arr_hh.length != 3) return null;

    var day = arr_dd[0];
    var month = arr_dd[1];
    var year = arr_dd[2];

    var hour = arr_hh[0];
    var minute = arr_hh[1];
    var second = arr_hh[2];

    dateReturn = new Date(year, parseInt(month) -1, day, hour, minute, second, 0);
    return dateReturn;
}

function showMessageAddTemplate(content, time, type) {
    var message = "";
    if(typeof type ==='undefined') {
        message = '<i class="uiIconWarning"></i> ' + content;
    } else {
        if(type=="success") {
            $("#WarningMessageAddTemplate").removeClass("alert-warning");
            $("#WarningMessageAddTemplate").addClass("alert-success");
        }

        if(type=="error") {
            $("#WarningMessageAddTemplate").removeClass("alert-success");
            $("#WarningMessageAddTemplate").addClass("alert-warning");
        }

        message = '<i></i> ' + content;
    }
    var id = '#WarningMessageAddTemplate';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}


function showMessageAddVariable(content, time, type) {
    var message = "";
    if(typeof type ==='undefined') {
        message = '<i class="uiIconWarning"></i> ' + content;
    } else {
        if(type=="success") {
            $("#WarningMessageAddVariable").removeClass("alert-warning");
            $("#WarningMessageAddVariable").addClass("alert-success");
        }

        if(type=="error") {
            $("#WarningMessageAddVariable").removeClass("alert-success");
            $("#WarningMessageAddVariable").addClass("alert-warning");
        }

        message = '<i></i> ' + content;
    }
    var id = '#WarningMessageAddVariable';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}


function showMessageClone(content, time, type) {
    var message = "";
    if(typeof type ==='undefined') {
        message = '<i class="uiIconWarning"></i> ' + content;
    } else {
        if(type=="success") {
            $("#WarningMessageClone").removeClass("alert-warning");
            $("#WarningMessageClone").addClass("alert-success");
        }

        if(type=="error") {
            $("#WarningMessageClone").removeClass("alert-success");
            $("#WarningMessageClone").addClass("alert-warning");
        }

        message = '<i></i> ' + content;
    }
    var id = '#WarningMessageClone';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}

function showMessageChoose(content, time, type) {
    var message = "";
    if(typeof type ==='undefined') {
        message = '<i class="uiIconWarning"></i> ' + content;
    } else {
        if(type=="success") {
            $("#WarningMessageChoose").removeClass("alert-warning");
            $("#WarningMessageChoose").addClass("alert-success");
        }

        if(type=="error") {
            $("#WarningMessageChoose").removeClass("alert-success");
            $("#WarningMessageChoose").addClass("alert-warning");
        }

        message = '<i></i> ' + content;
    }
    var id = '#WarningMessageChoose';
    var timeDisplay = 3000;
    $(id).html(message);
    $(id).show();
    window.scrollTo(0,0);
    if(time)
        timeDisplay = time;
    setTimeout(function(){
        $(id).hide();
    }, timeDisplay);
}

/**
 *
 * @param value
 * @returns {Boolean} kiem tra co gia tri hay ko
 */
function hasValue(value) {
    return (value != null && value != "" && value != undefined);
}

/**
 * @Todo:
 */
function pushArray(originalArray, addedArray) {
    if (addedArray != null) {
        for (var i = 0 ; i < addedArray.length ; i ++) {
            originalArray.push(addedArray[i]);
        }
    }
    return originalArray;
}


/**
 *  check contain string
 */
function isContain(input, str) {
    if(typeof input == 'undefined') return false;

    if(input == null || input == '') {
        return false;
    }
    if (input.indexOf(str) != -1) {
        return true;
    } else {
        return false;
    }
}

function substringBeforeFirst(input, str) {
    if(input == null || input == '') {
        return null;
    }
    if (input.indexOf(str) == -1) {
        return null;
    } else {
        var index = input.indexOf(str);
        return input.substring(0, index);
    }
}

function substringAfterFirst(input, str) {
    if(input == null || input == '') {
        return null;
    }
    if (input.indexOf(str) == -1) {
        return null;
    } else {
        var index = input.indexOf(str);
        return input.substring(index + 1, input.lenght);
    }
}

File.prototype.convertToBase64 = function(callback){
    var reader = new FileReader();
    reader.onload = function(e) {
        callback(e.target.result)
    };
    reader.onerror = function(e) {
        callback(null);
    };
    reader.readAsDataURL(this);
};

function showMessage(message, type) {
    if(type.toLowerCase() == 'success') {
        Notify(message, 'top-right', '5000', 'info', 'fa-check', true);
    } else if (type.toLowerCase() == 'error') {
        Notify(message, 'top-right', '5000', 'warning', 'fa-warning', true);
    } else {
        console.log("invalid type");
    }

};

function getFullDateFromLongValue(time) {
    var a = new Date(time);
    return a.customFormat("#DD#/#MM#/#YYYY# #hh#:#mm#:#ss#");
}

function getDateFromLongValue(time) {
    if(time == null || time == '') return 'N/A';
    var a = new Date(time);
    return a.customFormat("#DD#/#MM#/#YYYY#");
}

Date.prototype.customFormat = function(formatString){
    var YYYY,YY,MMMM,MMM,MM,M,DDDD,DDD,DD,D,hhhh,hhh,hh,h,mm,m,ss,s,ampm,AMPM,dMod,th;
    YY = ((YYYY=this.getFullYear())+"").slice(-2);
    MM = (M=this.getMonth()+1)<10?('0'+M):M;
    MMM = (MMMM=["January","February","March","April","May","June","July","August","September","October","November","December"][M-1]).substring(0,3);
    DD = (D=this.getDate())<10?('0'+D):D;
    DDD = (DDDD=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][this.getDay()]).substring(0,3);
    th=(D>=10&&D<=20)?'th':((dMod=D%10)==1)?'st':(dMod==2)?'nd':(dMod==3)?'rd':'th';
    formatString = formatString.replace("#YYYY#",YYYY).replace("#YY#",YY).replace("#MMMM#",MMMM).replace("#MMM#",MMM).replace("#MM#",MM).replace("#M#",M).replace("#DDDD#",DDDD).replace("#DDD#",DDD).replace("#DD#",DD).replace("#D#",D).replace("#th#",th);
    h=(hhh=this.getHours());
    if (h==0) h=24;
    if (h>12) h-=12;
    hh = h<10?('0'+h):h;
    hhhh = hhh<10?('0'+hhh):hhh;
    AMPM=(ampm=hhh<12?'am':'pm').toUpperCase();
    mm=(m=this.getMinutes())<10?('0'+m):m;
    ss=(s=this.getSeconds())<10?('0'+s):s;
    return formatString.replace("#hhhh#",hhhh).replace("#hhh#",hhh).replace("#hh#",hh).replace("#h#",h).replace("#mm#",mm).replace("#m#",m).replace("#ss#",ss).replace("#s#",s).replace("#ampm#",ampm).replace("#AMPM#",AMPM);
};

function getSearchParameters() {
//	console.log('url=' + window.location.search);
    return window.location.search.substr(1) || '';
//	var prmstr = window.location.search.substr(1);
//	return prmstr != null && prmstr != "" ? transformToAssocArray(prmstr) : {};
}

function transformToAssocArray(prmstr) {
    var params = {};
    var prmarr = prmstr.split("&");
    for (var i = 0; i < prmarr.length; i++) {
        var tmparr = prmarr[i].split("=");
        params[tmparr[0]] = tmparr[1];
    }
    return params;
}

function convertOwnerStatus(status){
    if(status == null || status == '') return '<span class="label label-default">Unkown</span>';
    if(status == '1') return '<span class="label label-success">Hiệu lực</span>';
    else
        return '<span class="label label-danger">Không hiệu lực</span>';
}

function getListGoodsType(container, defaultId){
    $(container).empty();
    // get list goods_type
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : "/rest/getListGoodsType",
        dataType : 'json',
        success : function(response) {
            $(container).append('<option value="-1" selected="selected">' +$("#trucking_goods_type_choose").val()+ '</option>');
            for(var i = 0; i < response.length; i++) {
                var type = response[i];
                if(type != null) {
                    if(type.id == defaultId)
                        $(container).append("<option value='" + type.id +"' selected='selected'>" + decodeHtml(type.name) +"</option>");
                    else
                        $(container).append("<option value='" + type.id +"'>" + decodeHtml(type.name) +"</option>");
                }
            }
        },
        error : function(e) {
            showMessage('ERROR: /rest/getListGoodsType', 'error');
            console.log("ERROR: ", e);
        },
        done : function(e) {
            console.log("DONE");
        }
    });
}
function getListTruckingByOwnerId(container){
    $(container).empty();
    // getListTruckingByOwnerId
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : "/rest_trucking/getListTruckingByOwnerId/",
        dataType : 'json',
        success : function(response) {
            $(container).append('<option value="-1" selected="selected">' +$("#trucking_choose").val()+ '</option>');
            for(var i = 0; i < response.length; i++) {
                var type = response[i];
                if(type != null) {
                    $(container).append("<option value='" + type.id +"'>" + decodeHtml(type.plateNumber) +"</option>");
                }
            }
        },
        error : function(e) {
            showMessage('ERROR: /rest_trucking/getListTruckingByOwnerId/', 'error');
            console.log("ERROR: ", e);
        },
        done : function(e) {
            console.log("DONE");
        }
    });
}
function getListDealType(container, defaultId){
    $(container).empty();
    // get list goods_type
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : "/rest/getListDealType",
        dataType : 'json',
        success : function(response) {
            $(container).append('<option value="-1" selected="selected">' +$("#shipment_dealType_choose").val()+ '</option>');
            for(var i = 0; i < response.length; i++) {
                var type = response[i];
                if(type != null) {
                    if(type.id == defaultId) {
                        $(container).append("<option selected='selected' value='" + type.id +"'>" + decodeHtml(type.name) +"</option>");
                    } else {
                        $(container).append("<option value='" + type.id +"'>" + decodeHtml(type.name) +"</option>");
                    }

                }
            }
        },
        error : function(e) {
            showMessage('ERROR: /rest/getListGoodsType', 'error');
            console.log("ERROR: ", e);
        },
        done : function(e) {
            console.log("DONE");
        }
    });
}

function getListTruckType(container){
    // get list truck_type
    $(container).empty();
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : "/rest/getListTruckType",
        dataType : 'json',
        success : function(response) {
            $(container).append('<option value="-1" selected="selected">' +$("#trucking_type_choose").val()+ '</option>');
            for(var i = 0; i < response.length; i++) {
                var truckType = response[i];
                if(truckType != null) {
                    $(container).append("<option value='" + truckType.id +"'>" + decodeHtml(truckType.name) +"</option>");
                }
            }
        },
        error : function(e) {
            showMessage('ERROR: /rest/getListTruckType', 'error');
            console.log("ERROR: ", e);
        },
        done : function(e) {
            console.log("DONE");
        }
    });
}

function getListProvince(container, defaultId, defaultText){
    // init list provice and truck_type
    $(container).empty();
    var listProvince = null;
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : "/rest/getListProvince",
        dataType : 'json',
        success : function(response) {
            $(container).append('<option value="-1" selected="selected">' + defaultText + '</option>');
            for(var i = 0; i < response.length; i++) {
                var province = response[i];
                if(province != null) {
                    if(province.id == defaultId)
                        $(container).append("<option value='" + province.id +"' selected='selected'>" + decodeHtml(province.name) +"</option>");
                    else
                        $(container).append("<option value='" + province.id +"'>" + decodeHtml(province.name) +"</option>");
                }
            }

            $(container).trigger('change');
        },
        error : function(e) {
            showMessage('ERROR: /rest/getListProvince', 'error');
            console.log("ERROR: ", e);
        },
        done : function(e) {
            console.log("DONE");
        }
    });
}

function getListDistrictByProvinceId(provinceId, container, defaultId, defaultText){
    $(container).empty();
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : "/rest/getListDistrictByProvinceId?provinceId=" + provinceId,
        dataType : 'json',
        success : function(response) {
            $(container).append('<option value="-1" selected="selected">' +defaultText+ '</option>');
//			$(container).append("<option value='-1'>Quận/huyện</option>");
            for(var i = 0; i < response.length; i++) {
                var district = response[i];
                if(district != null) {
                    if(defaultId == district.id) {
                        $(container).append("<option selected='selected'  value='" + district.id +"'>" + decodeHtml(district.name) +"</option>");
                    } else {
                        $(container).append("<option value='" + district.id +"'>" + decodeHtml(district.name) +"</option>");
                    }

                }
            }
        },
        error : function(e) {
            console.log("ERROR: ", e);
        },
        done : function(e) {
            console.log("DONE");
        }
    });

}

function convertPrice(row){
    if(row == null || row =='') return '';
    var unit = '';
    if(row.priceUnit != null){
        if(row.priceUnit == 1) unit = 'Tấn';
        else if(row.priceUnit == 2) unit = 'Khối';
        else if(row.priceUnit == 3) unit = 'Kg'
        else unit= 'N/A'
    }
    return (row.price || 'N/A') + ' triệu/1 ' + unit;
}

function convertAgency(row){
    if(row == null || row =='') return '';
    var agency = '';
    if(row.agency != null && row.agency != ''){
        if(row.agency == 1) agency = 'Đại Lý 1';
        else if(row.agency == 2) agency = 'Đại lý 2';
        else if(row.agency == 3) agency = 'Đại lý 3'
    }
    return agency;
}

function convertWeight(row){
    if(row == null || row =='') return '';
    var unit = '';
    if(row.weightUnit != null){
        if(row.priceUnit == 1) unit = 'Tấn';
        else if(row.priceUnit == 2) unit = 'Khối';
        else if(row.priceUnit == 3) unit = 'Khối/Km';
        else if(row.priceUnit == 4) unit = 'Chuyến'
    }
    return row.weight + ' ' + unit;
}

function convertQuantity(row){
    if(row == null || row =='') return '';
    var unit = '';
    if(row.unit != null){
        if(row.unit == 1) unit = 'Tấn';
        else if(row.unit == 2) unit = 'Khối';
        else if(row.unit == 3) unit = 'Khối/Km';
        else if(row.unit == 4) unit = 'Chuyến'
    }
    return row.quantity + ' ' + unit;
}

function getTruckingProp(key){
    var prop = '';
    if(key == 'fromProvince')
        return 'fromProvince';
    return prop;
}

function convertShipmentLabel(code){
    return '<code>'+code || 'N/A'+' </code>';
}

function convertTruckingLabel(code){
    return '<code>'+code || 'N/A'+' </code>';
}

function convertOrderLabel(code){
    return '<code> ORD_'+code || 'N/A'+' </code>';
}

function convertOwnerLabel(code){
    return '<code> OWN_'+code || 'N/A'+' </code>';
}

function convertTruckLabel(code){
    return '<code> '+code || 'N/A'+' </code>';
}

function convertTransactionType(type){
    if(type == 1){
        return 'Giao dịch về xe';
    }else if(type == 2){
        return 'Giao dịch về hàng';
    }else
        return 'N/A';
}

function convertOrderType(row, accountId){
    if(row == null || accountId == null || accountId == '') return "N/A";
    if(row.ownerId == accountId){
        return 'Yêu cầu gửi';
    }else if(row.partnerId == accountId){
        return 'Yêu cầu nhận';
    }else
        return 'N/A';
}

function convertFeeType(type){
    if(type == 1){
        return 'Đã bao gồm';
    }else if(type == 2){
        return 'Chưa bao gồm';
    }else
        return 'N/A';
}

function showLoading(){
    bootbox.dialog({ message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> Loading...</div>' })
}

function hideLoading(){
    // do something in the background
    bootbox.hideAll();
}

function getContextPath() {
    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

function loadConstantLanguage() {
    JQUERY_DATA_TABLE={};
    JQUERY_DATA_TABLE.LANGUAGE = {
        PREVIOUS_PAGE : jQuery.i18n.prop('PREVIOUS_PAGE'),
        NEXT_PAGE : jQuery.i18n.prop('NEXT_PAGE'),
        SZERORECORDS : jQuery.i18n.prop('SZERORECORDS'),
        PROCESSING : jQuery.i18n.prop('PROCESSING'),
        SEARCH : jQuery.i18n.prop('SEARCH'),
        LENGTHMENU : jQuery.i18n.prop('LENGTHMENU'),
        INFO : jQuery.i18n.prop('INFO'),
        INFOEMPTY: ""
    };
}

function ParseDMS(input) {
    if(input == null || input == '') return;
    var latObj = input.split(",")[0].trim();
    var lngObj = input.split(",")[1].trim();
    var partLat = latObj.split(" ");
    var partLng = lngObj.split(" ");
    var lat = ConvertDMSToDD(partLat[0], partLat[1], partLat[2].substring(0, 2), partLat[2].substring(2, 3));
    var lng = ConvertDMSToDD(partLng[0], partLng[1], partLng[2].substring(0, 2), partLng[2].substring(2, 3));

    return {
        lat : lat,
        lng: lng,
        Position : lat + ',' + lng
    }
}


function ConvertDMSToDD(degrees, minutes, seconds, direction) {
    var dd = Number(degrees) + Number(minutes)/60 + Number(seconds)/(60*60);

    if (direction == "S" || direction == "W") {
        dd = dd * -1;
    } // Don't do anything for N or E
    return dd;
}

function getParametter(param, asArray) {
    return document.location.search.substring(1).split('&').reduce(function(p,c) {
        var parts = c.split('=', 2).map(function(param) { return decodeURIComponent(param); });
        if(parts.length == 0 || parts[0] != param) return (p instanceof Array) && !asArray ? null : p;
        return asArray ? p.concat(parts.concat(true)[1]) : parts.concat(true)[1];
    }, []);
}


//loc trong danh sach list shipment nhung ban ghi co thuoc list filter
function filterListShipment(listShipment, listFilter, type) {
    if(listFilter == null || typeof listFilter == 'undefined' || listFilter.length == 0) {
        return listShipment;
    }
    var result = [];
    if(type == 'goodsType') {
        for(var i = 0; i < listShipment.length; i++) {
            var shipment = listShipment[i];
            if(containInArray(listFilter, shipment.goodsTypeId)) {
                result.push(shipment);
            }
        }
    } else if (type == 'truckType') {
        for(var i = 0; i < listShipment.length; i++) {
            var shipment = listShipment[i];
            if(containInArray(listShipment, shipment.truck.truckTypeId)) {
                result.push(trucking);
            }
        }
    }
    return result;
}

//loc trong danh sach list trucking nhung ban ghi co thuoc list filter
function filterListTrucking(listTrucking, listFilter, type) {
    if(listFilter == null || typeof listFilter == 'undefined' || listFilter.length == 0) {
        return listTrucking;
    }
    var result = [];
    if(type == 'goodsType') {
        for(var i = 0; i < listTrucking.length; i++) {
            var trucking = listTrucking[i];
            if(containInArray(listFilter, trucking.goodsTypeId)) {
                result.push(trucking);
            }
        }
    } else if (type == 'truckType') {
        for(var i = 0; i < listTrucking.length; i++) {
            var trucking = listTrucking[i];
            if(containInArray(listFilter, trucking.truck.truckTypeId)) {
                result.push(trucking);
            }
        }
    }
    return result;
}

function containInArray(array, element) {
    var isContain = false;
    for(var i = 0; i < array.length; i++) {
        if(array[i] == element) {
            isContain = true;
        }
    }
    return isContain;
}

function convertLongDate(dateLong) {
    var date = new Date(dateLong);
    return ((date.getDate()) + '/' + (date.getMonth()+1)  + '/' +  date.getFullYear());
}


function waitingProcess() {
    $('body').addClass("loading");
}
function completeProcess() {
    $('body').removeClass("loading");
}
