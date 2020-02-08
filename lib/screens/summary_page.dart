import 'package:bachat/models/bachat_client.dart';
import 'package:bachat/themes/colors.dart';
import 'package:bachat/widgets/grey_square.dart';
import 'package:bachat/widgets/item_row.dart';
import 'package:bachat/widgets/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Item> items = List();
    items.add(Item(
      id: 1,
      itemName: "Milk",
      cost: "50",
      type: "Credited"
    ));
    items.add(Item(
        id: 2,
        itemName: "Bread",
        cost: "100",
        type: "Debiited"
    ));
    // TODO: implement build
    return Scaffold(
      //    backgroundColor: Color(0xFF203B46),
      appBar: AppBar(
        elevation: 0,
        //   backgroundColor: Color(0xFF203B46),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          "Bachat".toUpperCase(),
          style: GoogleFonts.atomicAge(fontSize: 30),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: kBlackColor,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("19th Dec,'19",
                      style: TextStyle(
                          fontFamily: 'CabinCondensed',
                          color: Color(0xFFC4C4C4),
                          fontSize: 14)),
                  Text(
                    "20th Dec,'19",
                    style: TextStyle(
                        fontFamily: 'CabinCondensed',
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Text("21th Dec,'19",
                      style: TextStyle(
                          fontFamily: 'CabinCondensed',
                          color: Color(0xFFC4C4C4),
                          fontSize: 14)),
                ],
              ),
            ),
            SummaryCard(
              type: "Debited",
              items : items
            ),
            SizedBox(
              height: 2,
            ),
            SummaryCard(
              type: "Credited",
                items : items

            ),
            Padding(
              padding: const EdgeInsets.only(top :12.0,left: 30,right: 12),
              child: Row(
                children: <Widget>[
                  Text("Total",
                      style: TextStyle(
                          fontFamily: 'CabinCondensed',
                          color: Colors.white,
                          fontSize: 20)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right :50.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child:  Text("+4995",
                            style: GoogleFonts.openSans(
                                //fontFamily: 'CabinCondensed',
                                color: Colors.white,
                                fontSize: 25)),
                      ),
                    ),
                  ),

                ],

              ),

            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.white,
                thickness: 1,
                height: 0
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "All rights reserved CINC © 2019",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 14
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
