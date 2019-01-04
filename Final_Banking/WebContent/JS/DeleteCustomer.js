$(document)
			.ready(
					function() {
						$('#DeleteCustomer')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												ssnid : {
													message : 'The SSN Id is not valid',
													validators : {
														notEmpty : {
															message : 'SSN Id should not be empty'
														},
														stringLength : {
															min : 9,
															max : 9,
															message : 'SSN ID must be only 9 characters long'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'SSN ID can only consist of numbers'
														}
													}
												},
												customerid : {
													message : 'The customerID is not valid',
													validators : {
														notEmpty : {
															message : 'customerID should not be empty'
														},
														stringLength : {
															min : 9,
															max : 9,
															message : 'The customerID must be only 9 characters long'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'The CustomerID can only consist of numbers'
														}
													}
												}
												}
											}
										);
					});