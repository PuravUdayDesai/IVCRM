import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget{
	final List<String> options;
	Function(String,bool) onSelectionChanged;
	final String type;
	final String page;

	CustomChip(this.options,this.type,this.page,{this.onSelectionChanged});

	@override
	_CustomChipState createState () => _CustomChipState();
}

int countryValue = -1;
int stateValue = -1;
int cityValue = -1;
int areaValue = -1;
int clientValue = -1;
int enquiryTypeValue = -1;
int productValue = -1;

String lastPage ='';
class _CustomChipState extends State<CustomChip>{

	int tmpValue = 0;
	buildChoiceList() {

		if(widget.page != lastPage){
			int countryValue = -1;
			int stateValue = -1;
			int cityValue = -1;
			int areaValue = -1;
			int clientValue = -1;
			int enquiryTypeValue = -1;
			int productValue = -1;
			lastPage = widget.page;
		}

		switch(widget.type){
			case 'country' : tmpValue = countryValue;break;
			case 'state' : tmpValue = stateValue;break;
			case 'city' : tmpValue = cityValue;break;
			case 'area' : tmpValue = areaValue;break;
			case 'client' : tmpValue = clientValue;break;
			case 'enquiryType' : tmpValue = enquiryTypeValue;break;
			case 'product' : tmpValue = productValue;break;
		}

		print('temp value = '+tmpValue.toString());
		List<Widget> choices = List();

		for(int i = 0;i<widget.options.length;i++){
		choices.add(Container(
		padding: const EdgeInsets.all(2.0),
		child: ChoiceChip(
			label: Text(widget.options[i]),
		//selected: selectedChoices.contains(item),
			//selected : _value==i,
			selected : tmpValue==i,
			onSelected: (selected) {
			setState(() {

				switch(widget.type){
					case 'country' : countryValue = selected ? i : -1;break;
					case 'state' : stateValue = selected ? i : -1;break;
					case 'city' : cityValue = selected ? i : -1;break;
					case 'area' : areaValue = selected ? i : -1;break;
					case 'client' : clientValue = selected ? i : -1;break;
					case 'enquiryType' : enquiryTypeValue = selected ? i : -1;break;
					case 'product' : productValue = selected ? i : -1;break;
				}
				//_value = selected ? i : -1;
				widget.onSelectionChanged(widget.options[i],selected);
			});
			},
		),
		));
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
