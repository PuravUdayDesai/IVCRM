import 'package:flutter/material.dart';

class MultiChips extends StatefulWidget{
	final List<String> options;
	String preSelected;
	Function(List<String>) onSelectionChanged;
	final String type;

	MultiChips(this.options,this.type,{this.preSelected,this.onSelectionChanged});

	@override
	_MultiChipsState createState() => _MultiChipsState();
}

List<String> statusSelected = [];
List<String> prioritySelected = [];
List<String> enquiryTypeSelected = [];
List<String> productSelected = [];
 class _MultiChipsState extends State<MultiChips>{


 	@override
 	void initState(){
     super.initState();
 		if(widget.preSelected != null){
			prioritySelected.contains(widget.preSelected) ? null : prioritySelected.add(widget.preSelected) ;
		}
		//print('here tmp = $tmp');
 	}

	List<Widget> buildChoiceList(){

		List<String> tmp = [];

		switch(widget.type){
			case 'status' : tmp = statusSelected;break;
			case 'priority' : tmp = prioritySelected;break;
			case 'enquiryType' : tmp = enquiryTypeSelected;break;
			case 'product' : tmp = productSelected;break;
		}
		List<Widget> choices = [];

		for(int i=0;i<widget.options.length;i++){
			choices.add(
				Container(
					padding : const EdgeInsets.all(2.0),
					child : ChoiceChip(
						label : Text(widget.options[i]),
						selected : tmp.contains(widget.options[i]),
						onSelected : (s){
							setState((){
								// switch(widget.type){
								// 	case 'status': tmp.contains(widget.options[i]) ? tmp.remove(widget.options[i]) : tmp.add(widget.options[i]);
								// 	break;

								// }
								tmp.contains(widget.options[i]) ? tmp.remove(widget.options[i]) : tmp.add(widget.options[i]);

								widget.onSelectionChanged(tmp);
								// switch(widget.type){
								// 	case 'status' : print(statusSelected);break;
								// 	case 'priority' : print(prioritySelected);break;
								// 	case 'enquiryType' : print(enquiryTypeSelected);break;
								// 	case 'product' : print(productSelected);break;
								// }
							});
							
						}
					),
				)
			);
		}
		return choices;
	}



	@override
	Widget build(BuildContext context){
		return Wrap(
			children : buildChoiceList(),
		);
	}
}
