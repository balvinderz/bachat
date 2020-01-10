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
  TextEditingController itemNameController, costController, dateController;
  DateTime _date = DateTime.now();
  String getFormattedDate(){
    return "${_date.day} ${getMonth(_date.month)} ${_date.year}";

  }
  @override
  void initState() {
    itemNameController = TextEditingController();
    costController = TextEditingController();
    dateController = TextEditingController();
  }

  String getMonth(int dateMonth) {
    var month;
    switch (dateMonth) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }
    return month;
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: _date);
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;

        //print(_date.toIso8601String());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    dateController.text = getFormattedDate();

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
              readOnly: true,
              textAlign: TextAlign.center,

              controller: dateController,
              decoration: InputDecoration(hintText: "date"),
              onTap: () async {
                print("soja");
                await selectDate(context);
              }),
          TextField(
            controller: costController,
            keyboardType: TextInputType.datetime,
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
                child: Center(child: Text(value)),
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
                child: Center(child: Text(value)),
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
                if(itemName=="")
                  return ;
                String cost = costController.text;
                if(cost =="")
                  return ;
                print(itemName);
                print(cost);
                print("adding item");
                Item item = Item(
                    itemName: itemName,
                    cost: cost,
                    type: typeDropDownValue,
                    category: dropDownValue,
                    date: getFormattedDate());
                var res = await BachatDBProvider.db.insertItem(item);
                print(res);
                Navigator.pop(context);
              },
              child: Text(
                "Add Item",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
