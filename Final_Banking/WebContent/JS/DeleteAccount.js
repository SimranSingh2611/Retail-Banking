$(document)
			.ready(
					function() {
						$('#DeleteAccount')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												account_id : {
													message : '',
													validators : {
														notEmpty : {
															message : 'This field must be filled out'
														},
														stringLength : {
															min : 9,
															max : 9,
															message : 'Account ID must be of 9 characters long'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'Account ID can only consist of numbers'
														}
													}
												},
										
												}
											}
										);
					});