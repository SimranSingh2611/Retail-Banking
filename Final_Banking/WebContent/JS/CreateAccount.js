
$(document)
			.ready(
					function() {
						$('#createAccount')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												customerId : {
													message : 'The Customer ID is not valid',
													validators : {
														notEmpty : {
															message : 'The Customer ID is required and cannot be empty'
														},
														stringLength : {
															min : 9,
															max : 9,
															message : 'Enter 9 digit Customer ID'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'The Customer ID can  consist only of  numbers '
														}
													}
												},
												depositAmount : {
													message : 'The Deposit Amount is not valid',
													validators : {
														notEmpty : {
															message : 'The Deposit Amount is required and cannot be empty'
														},
														stringLength : {
															min : 3,
															max : 10,
															message : 'Minimum amount to be deposited is Rs. 100'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'The Deposit Amount can  consist only of  numbers'
														}
													}
												},
											}
										});
					});