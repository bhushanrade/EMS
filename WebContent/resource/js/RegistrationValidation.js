
function formValidation()  
{  
var ufname = document.registration.fname;
var ulname=document.registration.lname;
var ucontact=document.registration.contact;
var uaddress = document.registration.address;
var ucity = document.registration.city;
var udistrict = document.registration.district;
var ustate=document.registration.state;
var userid = document.registration.userid;
var uemail = document.registration.uemail;
var password = document.registration.password;
var password1 = document.registration.password1;
var uquestion=document.registration.ques;
var uanswer=document.registration.ans;
if(fname_validation(ufname))  
    { 
    if(lname_validation(ulname))
	{
        if(allnumeric(ucontact))  
            {  
            if(Address_alphanumeric(uaddress)) 
                {
                if(City_character(ucity))
                    {
                    if(District_character(udistrict))
                        {
                         if( countryselect(ustate))
                            {
                            if(alphanumeric(userid))
                                {
                                if(ValidateEmail(uemail))  
                                    { 
                                    if(password_validation(password,7,12))  
                                        {
                                        if(password_validation1(password1,7,12))  
                                            {
                                            if(question_validation(uquestion))
                                                {
                                                if(answer_validation(uanswer))
                                                    {
                                                        return true;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }	
                            }			
                        }		
                    }		
                }
            }
        }
    }
return false;
}
function fname_validation(ufname)  
{  
    var letters = /^[A-Za-z]+$/;  
    if(!ufname.value.match(letters))  
	{  
	// Focus goes to next field i.e. Last Name.  
	//document.registration.lname.focus();
            alert('First Name Must be Alphabetic Character Only, No Special Character');  
            ufname.focus(); 
            return false;  
	}  
	else  
	{  
	 
	return true;  
	} 
}
function lname_validation(ulname)  
{  
    var letters = /^[A-Za-z]+$/;  
	if(!ulname.value.match(letters))  
	{  
	// Focus goes to next field i.e. Last Name.  
	//document.registration.lname.focus();
		alert('Last Name Must be Alphabetic Character Only, No Special Character');  
		ulname.focus(); 
	return false;  
	}  
	else  
	{  
	 
	return true;  
	} 
}
function allnumeric(ucontact)  
{   
    var ucontact_len = ucontact.value.length;  
	if (ucontact_len==10)  
	{  
            return true;
	}
        else
        {
            alert("Contact length must be 10 digit");  
            ucontact.focus();  
            return false;  
	}  
	//return true;  
    var numbers = /^[0-9]+$/;
	if(ucontact.value.match(numbers))  
        {  
            return true;  
        }  
        else  
        {  
            alert('Contact  must have numeric characters only');  
            ucontact.focus();  
            return false;  
        }  
}

function Address_alphanumeric(uaddress)  
{   
    var letters = /^[0-9a-zA-Z]+$/;  
    if(uaddress.value.match(letters))  
        {  
            return true;  
        }  
        else  
        {  
            alert('User address must have alphanumeric characters only');  
            uaddress.focus();  
            return false;  
        }  
}

function City_character(ucity)  
{   
    var letters = /^[a-zA-Z]+$/;  
    if(ucity.value.match(letters))  
    {  
        return true;  
    }  
    else  
    {  
        alert('city must have characters only');  
        ucity.focus();  
        return false;  
    }  
}

function District_character (udistrict)  
{   
    var letters = /^[a-zA-Z]+$/;  
    if(udistrict.value.match(letters))  
    {  
        return true;  
    }  
    else  
    {  
        alert('District must have characters only');  
        udistrict.focus();  
        return false;  
    }  
}

function countryselect(ustate)  
{  
  
    if(ustate.value == "Default")  
    {  
        alert('Select your country from the list');  
        ustate.focus();  
        return false;  
    }  
    else  
    {  
    // Focus goes to next field i.e. emalid.  
      return true;  
    }  
}
function alphanumeric(userid)  
{   
    var letters = /^[0-9a-zA-Z]+$/;  
    if(userid.value.match(letters))  
    {  
    return true;  
    }  
    else  
    {  
    alert('User id must have alphanumeric characters only');  
    userid.focus();  
    return false;  
    }  
}

function ValidateEmail(uemail)  
{  
    var mailformat = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;  
    if(uemail.value.match(mailformat))  
    {

    return true;  
    }  
    else  
    {  
    alert("You have entered an invalid email address!");  
    uemail.focus();  
    return false;  
    }  
} 

function password_validation(password,mx,my)  
{  
    var password_len = password.value.length;  
    if (password_len == 0 ||password_len >= my || password_len < mx)  
    {  
    alert("Password should not be empty / length be between "+mx+" to "+my);  
    password.focus();  
    return false;  
    }
    else
            {
    return true;  
    }  
}
function password_validation1(password1,mx,my)  
{  
    var password_len = password1.value.length;  
    if (password_len == 0 ||password_len >= my || password_len < mx)  
    {  
    alert(" New Password should not be empty / length be between "+mx+" to "+my);  
    password1.focus();  
    return false;  
    }
    else
            {
    return true;  
    }  
}
function question_validation(uquestion)
{
    if(uquestion.value == "Default")  
    {  
	alert('Select the question from the list');  
	uquestion.focus();  
	return false;  
    }  
    else  
    {  
	// Focus goes to next field i.e. emalid.  
	  return true;  
    }  
	
}

  function answer_validation(uanswer)
  {
      var letters = /^[0-9a-zA-Z]+$/;  
      if(uanswer.value.match(letters))  
        {  
	  return true;  
        }  
	else  
	{  
	  alert('Answer must have alphanumeric characters only');  
	  uanswer.focus();  
	  return false;  
	}    
  }
    