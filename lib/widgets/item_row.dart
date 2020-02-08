import 'package:flutter/material.dart';

import 'grey_square.dart';
class ItemRow extends StatelessWidget
{
  final itemName,cost;

  const ItemRow({Key key, this.itemName, this.cost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return                   Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(width: 30,),
        GreySquare(size: 15,),
        SizedBox(width: 5,),
        Text(itemName,style: TextStyle(
            fontFamily: 'CabinCondensed',
            color: Colors.white,
            fontSize: 20
        ),
        //overflow: TextOverflow.ellipsis,

        ),
        Expanded(

          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right :50.0),
              child: Text("$cost",style: TextStyle(
                fontFamily: 'CabinCondensed',
                fontSize: 20,
                color: Colors.white,
              ),
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        )
      ],
    );

  }
}