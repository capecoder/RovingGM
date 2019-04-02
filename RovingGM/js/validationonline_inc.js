
var charexp = /./
var letterexp = /[a-z]/i
var numberexp = /[0-9]/i
var phonexp = /^\d{10}$/
var zipexp = /^\d{5}$|^\d{5}[\-\s]?\d{4}$/
var emailexp = /^[a-z][a-z_0-9\.]+@[a-z_0-9\.]+\.[a-z]{3}$/i

function isValid(pattern, str) {
    return pattern.test(str)
}
function hasLetter(str) {
    return letterexp.test(str)
}
function hasNumber(str) {
    return numberexp.test(str)
}
function hasChar(str) {
    return charexp.test(str)
}
function stripChars(pattern, str) {
    return str.replace(pattern, '')
}
function stripNonDigits(str) {
    return str.replace(/[^0-9]/g, '')
}
function Input_Validator(theForm) {
    var valid = true;
    if (theForm.Accept.checked == false) {
        alert("Please indicate your acceptance of the course requirements.")
        theForm.Accept.focus()
        valid = false;
    }

    //Ensure that if a credit card has been provided, AuthorizeCharge has been checked.
    if (hasChar(theForm.CCNumber.value) && theForm.AuthorizeCharge.checked == false) {
        alert("Please indicate your authorization of credit card charge.")
        theForm.AuthorizeCharge.focus()
        valid = false;
    }

    if (!hasChar(theForm.FIRSTNAME.value)) {
        alert("Please enter a value for the \"First Name\" field.")
        theForm.FIRSTNAME.focus()
        valid = false;
    }

    if (!hasChar(theForm.LASTNAME.value)) {
        alert("Please enter a value for the \"Last Name\" field.")
        theForm.LASTNAME.focus()
        valid = false;
    }

    if (!isValid(emailexp, theForm.EMAIL.value)) {
        alert("Invalid E-mail value")
        theForm.EMAIL.focus()
        valid = false;
    }

    if (!hasChar(theForm.EMAIL.value)) {
        alert("Please enter a value for the \"Email\" field.")
        theForm.EMAIL.focus()
        valid = false;
    }

    if (!hasChar(theForm.ADDRESSTOSHIP.value)) {
        alert("Please enter a value for the \"Address(first line)\" field.")
        theForm.ADDRESSTOSHIP.focus()
        valid = false;
    }

    if (hasNumber(theForm.CITYTOSHIP.value)) {
        alert("Please enter letters only in the \"City\" field.")
        theForm.CITYTOSHIP.focus();
        valid = false;
    }

    if (!hasChar(theForm.CITYTOSHIP.value)) {
        alert("Please enter a value for the \"City\" field.")
        theForm.CITYTOSHIP.focus();
        valid = false;
    }

    if (!hasChar(theForm.STATETOSHIP.value)) {
        alert("Please enter a value for the \"State\" field.")
        theForm.STATETOSHIP.focus();
        valid = false;
    }

    if (theForm.STATETOSHIP.value.length != 2) {
        alert("Please enter a two letter abbreviation in the \"State\" field.")
        theForm.STATETOSHIP.focus();
        valid = false;
    }

    if (hasNumber(theForm.STATETOSHIP.value)) {
        alert("Please enter letters only in the \"State\" field.")
        theForm.STATETOSHIP.focus();
        valid = false;
    }

    if (!hasChar(theForm.ZIPTOSHIP.value)) {
        alert("Please enter a value for the \"Zip\" field.")
        theForm.ZIPTOSHIP.focus();
        valid = false;
    }

    if (hasLetter(theForm.ZIPTOSHIP.value)) {
        alert("Please enter numbers in the \"Zip\" field.")
        theForm.ZIPTOSHIP.focus()
        valid = false;
    }

    if (!hasChar(theForm.DAYPHONE.value)) {
        alert("Please enter a value for the \"Phone(day)\" field.")
        theForm.DAYPHONE.focus()
        valid = false;
    }

    if (hasLetter(theForm.EVEPHONE.value)) {
        alert("Please enter numbers in the \"Phone(day)\" field.")
        theForm.EVEPHONE.focus()
        valid = false;
    }


    if (!hasChar(theForm.DOB.value)) {
        alert("Please enter your date of birth.")
        theForm.DOB.focus()
        valid = false;
    }

    //Ensure that either gift certificate or credit card fields have been completed
    if (!hasChar(theForm.GiftCertificate.value) && !hasChar(theForm.CCNumber.value)) {
        alert("Please enter either a gift certificate number or credit card information.")
        valid = false;
    }
    else {
        if (hasChar(theForm.CCNumber.value)) {
            if (!hasChar(theForm.NAME.value)) {
                alert("Please enter a value for the \"Name\" field.")
                theForm.NAME.focus()
                valid = false;
            }
            if (!hasChar(theForm.ADDRESS.value)) {
                alert("Please enter a value for the \"Street address\" field.")
                theForm.ADDRESS.focus()
                valid = false;
            }
            if (!hasChar(theForm.CITY.value)) {
                alert("Please enter a value for the \"City\" field.")
                theForm.CITY.focus()
                valid = false;
            }
            if (!hasChar(theForm.ZIP.value)) {
                alert("Please enter a value for the \"Zip...\" field.")
                theForm.ZIP.focus();
                valid = false;
            }

            if (theForm.EXPIRATIONMONTH.selectedIndex == 0) {
                alert("Please enter a value for \"Expiration Date (Month)\".");
                theForm.EXPIRATIONMONTH.focus();
                valid = false;
            }

            if (theForm.EXPIRATIONYEAR.selectedIndex == 0) {
                alert("Please enter a value for \"Expiration Date (Year)\".");
                theForm.EXPIRATIONYEAR.focus();
                valid = false;
            }

            if (theForm.CARDTYPE.selectedIndex == 0) {
                alert("Please select credit card type.")
                theForm.CARDTYPE.focus()
                valid = false;
            }

            if (!hasChar(theForm.CIDNumber.value)) {
                alert("Please enter a value for the \"Security code\" field.")
                theForm.CIDNumber.focus();
                valid = false;
            }


        }
    }
    return valid;
}

//-->
