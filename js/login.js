var asyncstate = true;

XMLHttpRequest.prototype.original_open = XMLHttpRequest.prototype.open;

XMLHttpRequest.prototype.open = function (method, url, async, user, password) {

    async = asyncstate;

    var eventArgs = Array.prototype.slice.call(arguments);

    return this.original_open.apply(this, eventArgs);

}
////////////////////////////////////////////////////////////////////////////////////////////////
const signup = document.getElementById('signUp');
const signIn = document.getElementById('signIn');
const container = document.getElementById('container');
const validator = document.getElementById('# <%= cstm_valid_usr.ClientID %>');
const minus = document.getElementById('ContentPlaceHolder1_DataList1_lbl_minus_1');

signup.addEventListener('click', () =>
    container.classList.add('right-panel-active'));

signIn.addEventListener('click', () =>
    container.classList.remove('right-panel-active'));





function validateLength(oSrc, args) {
    args.IsValid = (args.Value.length >= 6);
   
}
//Validate Length

function validate_exist(oSrc, args) {
    if (args.Value.length >= 6) {
        asyncstate = false;
        let x = false;
        PageMethods.Exist(args.Value, success);
        function success(result) {
            if (result == false) x = true;
        }
        args.IsValid = x;
    }
        asyncstate = true;
}
//Validate Exist

                 


