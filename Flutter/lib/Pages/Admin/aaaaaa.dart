validator : (v){
																			try{
																				double a= double.parse(v.toString());
																				return null;
																			}
																			catch(e){
																				return 'Please enter numeric value';
																			}



	keyboardType: TextInputType.phone,
	inputFormatters: [
		LengthLimitingTextInputFormatter(6),
		WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
	],
	validator : (v) => v.isEmpty ? 'Please enter pincode.' : null,


	keyboardType: TextInputType.emailAddress,
												          validator: (value) => isValidEmail(value)
												              ? (isEmailContains(value)
												                  ? null
												                  : 'Email must contain @ and .')
												              : 'Please enter a valid email address',
												        ),


bool isEmailContains(String input) {
		return input.contains("@") && input.contains(".");
	}

	bool isValidEmail(String input) {
		final RegExp regex = new RegExp(
		r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
		return regex.hasMatch(input);
	}