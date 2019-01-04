$(document)
			.ready(
					function() {
						$('#UpdateCustomer')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												cust_id : {
													message : 'The ID is not valid',
													validators : {
														notEmpty : {
															message : 'This field is required and cannot be empty'
														},
														stringLength : {
															min : 9,
															max : 9,
															message : 'The Customer ID must be 9 characters long'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'The Customer ID can only consist of numbers'
														}
													}
												},
												
											}
										}
									);
				});
												
										