$(document)
			.ready(
					function() {
						$('#CreateCustomer')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												customerSSNId : {
													message : 'The SSN ID is not valid',
													validators : {
														notEmpty : {
															message : 'This field is required and cannot be empty'
														},
														stringLength : {
															min : 9,
															max : 9,
															message : 'The SSN ID must be only 9 characters long'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'The SSN ID can only consist of numbers'
														}
													}
												},
												customerName : {
													message : 'The Name is not valid',
													validators : {
														notEmpty : {
															message : 'This field is required and cannot be empty'
														},
														stringLength : {
															min : 5,
															max : 30,
															message : 'The name must be atleast 5 characters long'
														},
														regexp : {
															regexp : /^[A-Za-z]+$/,
															message : 'The name can only consist of alphabets'
														}
													}
												},
												age : {
													message : 'The age is not valid',
													validators : {
														notEmpty : {
															message : 'This field is required and cannot be empty'
														},
														stringLength : {
															min : 2,
															max : 2,
															message : 'The age must be 2 characters long'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'The age can only consist of numbers'
														}
													}
												},
												address1 : {
													message : 'The Address Line 1 is not valid',
													validators : {
														notEmpty : {
															message : 'This field is required and cannot be empty'
														},
														stringLength : {
															min : 5,
															max : 30,
															message : 'The address must be atleast 5 characters long'
														},
														regexp : {
															regexp : /^[A-Za-z0-9{6,20}]+$/,
															message : 'The address can only consist of alphabets and digits'
														}
													}
												},
										
												}
											}
										);
					});