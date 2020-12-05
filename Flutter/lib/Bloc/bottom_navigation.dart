import 'package:flutter/material.dart';

class BottomNavigationNotifier extends ChangeNotifier{
	int index;
	String name;

	BottomNavigationNotifier(this.index);


	getData(){
		var map = Map<String,dynamic>();
		map['index'] = this.index;
		map['name'] = this.name;
		return map;
	}

	setData(index,{name}){
		this.index = index;
		this.name = name;
		notifyListeners();
	}

}
