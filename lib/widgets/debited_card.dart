
import 'package:bachat/models/bachat_client.dart';
import 'package:bachat/models/cost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'grey_square.dart';
class DebitedCard extends StatelessWidget{
final String date;
final List<Item> items;
static const  kBlueTextStyle = TextStyle(color: Color(0xFF05445E), fontSize: 20.0);

DebitedCard({this.date, this.items});

@override
Widget build(BuildContext context) {
  int totalcost = 0;
  for (Item item in items) totalcost += int.parse(item.cost);
  // TODO: implement build
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
                  date ?? "soja",
                  style: kBlueTextStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (_, index) => Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GreySquare(),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    items[index].itemName,
                    style: kBlueTextStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 6.0, right: 30.0, bottom: 6.0, left: 12.0),
                    child: Text(
                      items[index].cost.toString(),
                      style: kBlueTextStyle,
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
              style: kBlueTextStyle,
              textAlign: TextAlign.end,
            ),
          ),
        )
      ],
    ),
  );
}
}
