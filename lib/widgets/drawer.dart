import 'package:bachat/screens/bachat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const whiteTextStyle = TextStyle(
    color: Colors.white
    );

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        color: Color(0xFF017AAD),
        child: new Column(
          children: <Widget>[
            new ListTile(
              trailing: new Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: new Text("Homepage", style: whiteTextStyle,),
              leading: new Icon(Icons.home, color: Colors.white),
              onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => BachatPage())),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: new Text("Categories", style: whiteTextStyle,),
              leading: new Icon(Icons.category, color: Colors.white),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: new Text("Cards", style: whiteTextStyle,),
              leading: new Icon(Icons.credit_card, color: Colors.white),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: new Text("Calender", style: whiteTextStyle,),
              leading: new Icon(Icons.calendar_today, color: Colors.white),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: new Text("-", style: whiteTextStyle,),
              leading: new Icon(Icons.home, color: Colors.white),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.settings,color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
