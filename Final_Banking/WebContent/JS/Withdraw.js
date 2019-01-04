$(document)
			.ready(
					function() {
						$('#AccountOperations')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												amount : {
													message : '',
													validators : {
														notEmpty : {
															message : 'This field is required and cannot be empty'
														},
														stringLength : {
															min : 3,
															max : 4,
															message : 'Withdraw amount must be between Rs. 100 and Rs.9999'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'Withdraw amount can only consist of numbers'
														}
													}
												},
												accID : {
												message : 'accID is not valid',
												validators : {
													notEmpty : {
														message : 'accID is required and cannot be empty'
													},
													stringLength : {
														min : 9,
														max : 9,
														message : 'Enter 9 digit accID'
													},
													regexp : {
														regexp : /^[0-9]+$/,
														message : 'accID can  consist only of  numbers '
													}
												}
											
										
												}
											}
										}
										);
					});