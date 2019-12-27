import 'package:bachat/screens/bachat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Drawer(
      child: new ListView(
        children: <Widget>[
          new ListTile(
            trailing: new Icon(Icons.cancel),
            onTap:() => Navigator.of(context).pop(),
          ),
          new ListTile(
            title: new Text("Homepage"),
            trailing: new Icon(Icons.home),
            onTap:()=>Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context)=> BachatPage())),
          ),
          new ListTile(
            title: new Text("Categories"),
            trailing: new Icon(Icons.category),
          ),
          new ListTile(
            title: new Text("Cards"),
            trailing: new Icon(Icons.credit_card),
          ),
          new ListTile(
            title: new Text("Calender"),
            trailing: new Icon(Icons.calendar_today),
          )
        ],
      ),
    );
  }
}
