$(document)
		.ready(
				function() {
					$('#AccountDetails')
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
												message : 'The SSN ID is not valid',
												validators : {

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
											customerid : {
												message : 'The CustomerID is not valid',
												validators : {

													stringLength : {
														min : 9,
														max : 9,
														message : 'The CustomerID must be only 9 characters long'
													},
													regexp : {
														regexp : /^[0-9]+$/,
														message : 'The CustomerID can only consist of alphabets'
													}
												}
											},
											a_id : {
												message : 'The AccountID is not valid',
												validators : {

													stringLength : {
														min : 9,
														max : 9,
														message : 'The AccountID must be 9 characters long'
													},
													regexp : {
														regexp : /^[0-9]+$/,
														message : 'The AccountID can only consist of numbers'
													}
												}
											},

										}
									}

							);
				});