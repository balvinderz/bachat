import 'package:bachat/database/bachat_db.dart';
import 'package:bachat/models/bachat_client.dart';
import 'package:flutter/material.dart';

class AddItemBottomSheet extends StatefulWidget {
  @override
  _AddItemBottomSheetState createState() => _AddItemBottomSheetState();
}

class _AddItemBottomSheetState extends State<AddItemBottomSheet> {
  String dropDownValue = "soja";
  String typeDropDownValue = "Debited";
  TextEditingController itemNameController,costController;

  @override
  void initState() {
      itemNameController = TextEditingController();
      costController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add Item",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          TextField(
            controller: itemNameController,
            textAlign: TextAlign.center,
            autofocus: false,
            decoration: InputDecoration(hintText: "Item Name"),
          ),
          TextField(
            controller: costController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            autofocus: false,
            decoration: InputDecoration(hintText: "Cost"),
          ),
          DropdownButton<String>(
            hint: Text("Category"),
            isExpanded: true,
            value: dropDownValue,
            items: <String>['soja', 'B', 'C', 'D'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child:  Center(child: Text(value)),
              );
            }).toList(),

            onChanged: (newValue) {
              setState(() {
                dropDownValue = newValue;
              });
            },
          ),
          DropdownButton<String>(
            //hint: Text("Type"),
            isExpanded: true,
            value: typeDropDownValue,
            items: <String>['Debited', 'Credited'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child:  Center(child: Text(value)),
              );
            }).toList(),

            onChanged: (newValue) {
              setState(() {
                typeDropDownValue = newValue;
              });
            },
          ),
          Center(
            child: MaterialButton(
              color: Colors.blue,
              splashColor: Colors.blue,
              onPressed: () async {
                String itemName = itemNameController.text;
                String cost = costController.text;
                print(itemName);
                print(cost);
                print("adding item");
                Item item = Item(itemName: itemName,cost: cost,type: typeDropDownValue,category: dropDownValue,date: "28 December 2019");
               var res =  await BachatDBProvider.db.insertItem(item);
               print(res) ;
               Navigator.pop(context);
              },
              child: Text("Add Item",style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
