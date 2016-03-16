$(function() {
	$("#form").validate({
		rules : {
			name : {
				required : true,
				minlength : 4,
				maxlength : 20,
				customvalidation : true
			},
			age	:{
				required:true,
				minlength: 1,
				maxlength: 3,
				customvalidation2:true
			},
			addr:{
				required:true,

			},
			email: {
				required:true,
				email:true
			},
			tpNo:{
				required:true,
				minlength:10,
				maxlength:10,
				customvalidation2:true
			},
			NIC:{
				required:true,
				minlength:10,
				maxlength:10,
				customvalidation3:true

			}

		},
		messages : {
			name : {
				required : "Please enter a name",
				minlength : $.format("Minimum {0} characters required!"),
				maxlength : $.format("Maximum {0} characters allowed!")

			},
			age:{
				required: "Please enter the age",
				minlength : $.format("Age required!"),
				maxlength : $.format("You wont survive that long!")
			},
			addr :{
				required:"Enter a valid Address"
			},
			email:{
				required:"enter an email address",
				email:"Enter a valid email"
			},
			tpNo:{
				required:"Enter an tp no",
				minlength:"",
				maxlength:"Enter a valid Tp number"


			},
			NIC:{
				required:"Enter a NIC",
				minlength:"",
				maxlength:"Enter a valid NIC including last letter"
			}
		}
	});
	$.validator.addMethod("customvalidation", function(value, element) {
	return /^[A-Za-z\_ -]+$/.test(value);
}, "Alpha Characters Only.");
	$.validator.addMethod("customvalidation2", function(value, element) {
		return /^[0-9\_ -]+$/.test(value);
	}, "Numbers Only.");
	$.validator.addMethod("customvalidation3", function(value, element) {
		return /^[0-9+]{9}[Vv]+$/.test(value);
	}, "Enter valid NIC.");
});
