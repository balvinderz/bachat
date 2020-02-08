import 'package:bachat/models/bachat_client.dart';
import 'package:bachat/themes/colors.dart';
import 'package:flutter/material.dart';

import 'item_row.dart';

class SummaryCard extends StatelessWidget {
  final String type;
  final List<Item> items;

  const SummaryCard({Key key, this.type, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xFF54646A)),
          color: kBlackColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'CabinCondensed',
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xFFC4C4C4),
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: Divider(
              height: 4,
              color: Colors.white,
              thickness: 1,
            ),
          ),
          SizedBox(
            height: 5,
          ),
         ...generateItemRow(),
          SizedBox(height: 2),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: SizedBox(
                width: 80,
                child: Divider(
                  thickness: 1,
                  height: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Text(
                "${getTotal()}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "CabinCondensed"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> generateItemRow() {
    //return [Container()];
    print(items[0].cost);
    return items.map((item) => ItemRow(
      itemName: item.itemName,
      cost: int.parse(item.cost),
    )).toList();
  }
  int getTotal(){
    var sum=0;
   for(int i=0;i<items.length;i++)
     sum+=int.parse(items[i].cost);
   return sum;
  }
}
