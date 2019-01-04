$(document)
			.ready(
					function() {
						$('#Deposit')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
											
												depositamount : {
													message : 'The Deposit Amount is not valid',
													validators : {
														notEmpty : {
															message : 'The Deposit Amount is required and cannot be empty'
														},
														stringLength : {
															min : 2,
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