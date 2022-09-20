
var asyncstate = true;

XMLHttpRequest.prototype.original_open = XMLHttpRequest.prototype.open;

XMLHttpRequest.prototype.open = function (method, url, async, user, password) {

    async = asyncstate;

    var eventArgs = Array.prototype.slice.call(arguments);

    return this.original_open.apply(this, eventArgs);

}
////////////////////////////////////////////////////////////////////////////////////////////////

var last;
function getlast(str) {
    PageMethods.lastnum(str,success);
    function success(result) {
        last= result;
    }


}

function plus(clicked_id) {
    asyncstate = false;
    getlast(clicked_id);
    var x = 'ContentPlaceHolder1_DataList1_lbl_amount_' + last;
    var lbl_amount = document.getElementById(x);
    ///
    var y = 'ContentPlaceHolder1_DataList2_amountLabel_' + last;
    var maxamount = document.getElementById(y);
    if (parseInt(maxamount.innerText) > parseInt(lbl_amount.innerText)) {
        lbl_amount.innerText = (parseInt(lbl_amount.innerText) + 1).toString();
    } else alert('You Have Reached The Max Amount!')
    asyncstate = true;

}

function minus(clicked_id) {
    getlast(clicked_id);
    var x = 'ContentPlaceHolder1_DataList1_lbl_amount_' + last;
    var lbl_amount = document.getElementById(x);

    if (parseInt(lbl_amount.innerText) > 1) {
        lbl_amount.innerText = (parseInt(lbl_amount.innerText) - 1).toString();
    }
}

function addtocart(clicked_id) {
    asyncstate = false;
    var y = 'ContentPlaceHolder1_DataList2_amountLabel_' + last;
    var maxamount = document.getElementById(y);

    getlast(clicked_id);
    var x = 'ContentPlaceHolder1_DataList1_lbl_amount_' + last;
    var lbl_amount = document.getElementById(x);

    var y = 'ContentPlaceHolder1_DataList2_codeLabel_' + last;
    var code = document.getElementById(y);
    if (maxamount.innerText != "0")
        PageMethods.addtocart(parseInt(lbl_amount.innerText), code.innerText);
    else alert("This Product Is Sold Out Of Stock !");
    asyncstate = true;
}


//////////////////////////////////////CART/////////////////////////////
function RemoveItem(clicked_id) {
    asyncstate = false;
    getlast(clicked_id);
    var y = 'ContentPlaceHolder1_DataList1_pNumLabel_' + last;
    var code = document.getElementById(y);
    PageMethods.Remove(code.innerText);
    location.reload();
    asyncstate = true;
}

function plus1(clicked_id) {
    asyncstate = false;
    getlast(clicked_id);
    var x = 'ContentPlaceHolder1_DataList1_QuantityLabel_' + last;
    var lbl_amount = document.getElementById(x);
    ///
    var y = 'ContentPlaceHolder1_DataList2_amountLabel_' + last;
    var maxamount = document.getElementById(y);

    var code = 'ContentPlaceHolder1_DataList1_pNumLabel_' + last;
    var codelbl = document.getElementById(code);

    var ttlprice = 'ContentPlaceHolder1_DataList1_totalpriceLabel_' + last;
    var ttlpricelbl = document.getElementById(ttlprice);

    var price = 'ContentPlaceHolder1_DataList1_pPriceLabel_' + last;
    var pricelbl = document.getElementById(price);

    if (parseInt(maxamount.innerText) > parseInt(lbl_amount.innerText)) {
        lbl_amount.innerText = (parseInt(lbl_amount.innerText) + 1).toString();
        ttlpricelbl.innerText = (parseInt(pricelbl.innerText) * parseInt(lbl_amount.innerText)).toString();
        PageMethods.change(lbl_amount.innerText, codelbl.innerText);
    } else alert('You Have Reached The Max Amount!')
    asyncstate = true;

}

function minus1(clicked_id) {
    asyncstate = false;
    getlast(clicked_id);
    var x = 'ContentPlaceHolder1_DataList1_QuantityLabel_' + last;
    var lbl_amount = document.getElementById(x);

    var code = 'ContentPlaceHolder1_DataList1_pNumLabel_' + last;
    var codelbl = document.getElementById(code);

    var ttlprice = 'ContentPlaceHolder1_DataList1_totalpriceLabel_' + last;
    var ttlpricelbl = document.getElementById(ttlprice);

    var price = 'ContentPlaceHolder1_DataList1_pPriceLabel_' + last;
    var pricelbl = document.getElementById(price);

    if (parseInt(lbl_amount.innerText) > 1) {
        lbl_amount.innerText = (parseInt(lbl_amount.innerText) - 1).toString();
        ttlpricelbl.innerText = (parseInt(pricelbl.innerText) * parseInt(lbl_amount.innerText)).toString();
        PageMethods.change(lbl_amount.innerText, codelbl.innerText);
    }
    asyncstate = true;
}