
function checkCreateCustomer(tagName){
	alert("ds");
	var customerSSNId=document.getElementById("customerSSNId").value;
	var customerName=document.getElementById("customerName").value;
	var age=document.getElementById("age").value;
	var address1=document.getElementById("address1").value;
	var address2=document.getElementById("address2").value;
	var state=document.getElementById("state").value;
	var city=document.getElementById("city").value;
	
	var alphaNumeric = /^[0-9a-zA-Z]+$/;  
	

	function isAlphaNumeric(input){
		if(input.match(alphaNumeric)){
			return true;
		}
	}
	
	
	if(tagName==="customerSSNId"){
		return customerSSNId_validation(customerSSNId,9);
	}
	
	if(tagName=="customerName"){
		return customerName_validation(customerName,2,20);
	}
	
	if(tagName=="age"){
		return age_validation(age,3);
	}
	
	if(tagName=="address"){
		return address_validation(address1,address2,5,50);
	}

	if(tagName=="state"){
		return state_validation(state);
	}
	
	if(tagName=="city"){
		return city_validation(city);
	}

	
	function customerSSNId_validation(customerSSNId,length){
		
		if(isNaN(customerSSNId)==false){
			if(customerSSNId.length!=length){
				alert("SSD ID should be of 9 digits");
				return false;
			}
			
		}
		
		else{
			alert("SSN ID can be only numbers");
			return false;
		}
		
	}
	
	function customerName_validation(customerName,min,max){
		
		if(isNaN(customerName)==true){
			if(customerName.length<=min || customerName.length<=max){
				alert("Customer name should be between 2 and 20 letters.");
				return false;
			}
			
		}
		
		else{
			alert("Please enter a valid Name");
			return false;
		}
		
	}
	
	function age_validation(age,max){
		
		if(isNaN(age)==false || isAlphaNumeric(age)==false){
			if(age.length==0 || age.length>max || age>100 ){
				alert("Please enter a valid age");
				return false;
			}
			
		}
		
	}	
	
	function address_validation(address1,address2,min,max){
		
		if(isAlphaNumeric(address1)==true){
			if(address1.length==0 || address1.length>max || address1.length<min){
				alert("Please enter a valid address");
				return false;
			}
			
		}
		
	}	
	
	function state_validation(state){	
	
			if(state==''){
				alert("Please enter a valid state");
				return false;
			}
		
	}	
	
	function city_validation(city){
		
			if(city==''){
				alert("Please enter a valid state");
				return false;
			}
	
		
	}
	

		
			
	
		
		
	  
}



