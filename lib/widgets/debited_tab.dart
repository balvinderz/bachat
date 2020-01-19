import 'package:bachat/database/bachat_db.dart';
import 'package:bachat/models/bachat_client.dart';
import 'package:bachat/models/cost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'debited_card.dart';

class BachatTab extends StatefulWidget {
  String type ;
  BachatTab({this.type});
  @override
  _DebitedTabState createState() => _DebitedTabState();
}

class _DebitedTabState extends State<BachatTab> {
  List<Cost> costs = new List();
  List<List<Cost>> listOfCosts = new List();
  String date;
  Database db;

  @override
  void initState() {
    super.initState();
    costs.add(Cost(name: "Beer", costOfItem: "20000"));
    costs.add(Cost(name: "asd", costOfItem: "40000"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: BachatDBProvider.db.getDates(),
        builder: (_, AsyncSnapshot<List<String>> snapshot) {
          if(!snapshot.hasData )
            return Center(child: CircularProgressIndicator());
          List<String> dates = snapshot.data;
          if(dates.length == 0)
            return Center(
              child: Text("Click the + icon to get started",style: TextStyle(
                fontSize: 30,
                color: Colors.black
              ),),
            );
          return
          Container(
            child: ListView.builder(
              itemCount: dates.length,
              itemBuilder: (_,index){
                return FutureBuilder(
                  future: BachatDBProvider.db.getItems(dates[index],widget.type),
                  builder: (_a,AsyncSnapshot<List<Item>> itemSnapshot){
                    if(itemSnapshot.hasData)
                      {
                        print(itemSnapshot.data.length);
                        return BachatCard(
                          date: dates[index],
                          items: itemSnapshot.data,
                        );
                      }
                    return Container();
                 //   return null;
                },
                );
              },
            ),
          );
        });
  }
}
