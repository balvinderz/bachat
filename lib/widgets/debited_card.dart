
import 'package:bachat/database/bachat_db.dart';
import 'package:bachat/models/bachat_client.dart';
import 'package:bachat/models/cost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'grey_square.dart';
class BachatCard extends StatefulWidget{
final String date;
final List<Item> items;
static const  kBlueTextStyle = TextStyle(color: Color(0xFF05445E), fontSize: 20.0);

BachatCard({this.date, this.items});

  @override
  _TabCardState createState() => _TabCardState();
}

class _TabCardState extends State<BachatCard> {
  int state = 0 ;


@override
Widget build(BuildContext context) {
  int totalcost = 0;
  for (Item item in widget.items) totalcost += int.parse(item.cost);
  if(widget.items.length ==0)
    return Container();

  return Container(
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.date,
                  style: BachatCard.kBlueTextStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: state == 0 ? IconButton(
                  icon : Icon(Icons.edit),
                  color: Colors.grey,
                  onPressed: (){
                    setState(() {
                      state = 1;
                    });
                  },

                ) : IconButton(
                  icon: Icon(Icons.check),
                  onPressed: (){
                    setState(() {
                      state = 0;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.items.length,
            itemBuilder: (_, index) => Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if(state == 1)
                buildCrossWidget(index)
                else
                GreySquare(),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    widget.items[index].itemName,
                    style: BachatCard.kBlueTextStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, right: 30.0, bottom: 12.0, left: 12.0),
                    child: Text(
                      widget.items[index].cost.toString(),
                      style: BachatCard.kBlueTextStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 2.0,
              width: 100.0,
              color: Colors.grey.shade400,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 6.0, right: 30.0, bottom: 6.0, left: 12.0),
            child: Text(
              "$totalcost",
              style: BachatCard.kBlueTextStyle,
              textAlign: TextAlign.end,
            ),
          ),
        )
      ],
    ),
  );
}
Widget buildCrossWidget(int index){
  return  IconButton(
    icon: Icon(Icons.close),
    onPressed: () async {
      var db = BachatDBProvider.db;
     await  db.deleteItem(widget.items[index]);
     widget.items.removeAt(index);
     setState(() {

     });
    },
  ) ;
}
}
