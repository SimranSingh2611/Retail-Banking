$(document)
			.ready(
					function() {
						$('#GetStatement')
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
													message : 'The Account ID is not valid',
													validators : {
														notEmpty : {
															message : 'The Account ID is required and cannot be empty'
														},
														stringLength : {
															min : 9,
															max : 9,
															message : 'Enter 9 digit Account ID'
														},
														regexp : {
															regexp : /^[0-9]+$/,
															message : 'The Account ID can  consist only of  numbers '
														},
													}
												}
											
											}
										});
					});