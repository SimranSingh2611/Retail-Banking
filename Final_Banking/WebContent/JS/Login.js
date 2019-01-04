$(document)
			.ready(
					function() {
						$('#login')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												userId : {
													message : 'The username is not valid',
													validators : {
														notEmpty : {
															message : 'The username is required and cannot be empty'
														},
														stringLength : {
															min : 8,
															max : 30,
															message : 'The userid must be more than 8 and less than 30 characters long'
														},
														regexp : {
															regexp : /^[a-zA-Z0-9]+$/,
															message : 'The username can only consist of alphabets and numbers'
														}
													}
												},
												password : {
													validators : {
														notEmpty : {
															message : 'The password is required and cannot be empty'
														},
														stringLength : {
															min : 10,
															max : 30,
															message : 'The password must be of 10 or more characters'
														},
														regexp : {
															regexp : /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/,
															message : 'The password should consist of atleast 1 uppercase, 1 lowercase, 1 digit and 1 special character'
														}
														}
													}
												}
											}
										);
					});