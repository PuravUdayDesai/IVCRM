import 'dart:core';

class CompanyUtil{
	int id;
	String name;


	CompanyUtil(
		this.id,
		this.name
	);

	static Uri convertToUri(String uri){
		return Uri.parse(uri);
	}
}