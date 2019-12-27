import 'package:bachat/widgets/debited_tab.dart';
import 'package:bachat/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bachat/widgets/add_item_bottom_sheet.dart';
const kBlueTextStyle = TextStyle(color: Color(0xFF05445E), fontSize: 20.0);

class BachatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFFD4F1F4),
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("BACHAT"),
          backgroundColor: Color(0xFF017AAD),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "DEBITED",
              ),
              Tab(
                text: "CREDITED",
              )
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            DebitedTab(),
            DebitedTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (_) => Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: AddItemBottomSheet(),
                )
                );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
