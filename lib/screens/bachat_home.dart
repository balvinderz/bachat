import 'package:flutter/material.dart';

class BachatHome extends StatefulWidget {
  @override
  _BachatHomeState createState() => _BachatHomeState();
}

class _BachatHomeState extends State<BachatHome>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {

    super.initState();
    _tabController=new TabController(vsync:this,initialIndex:1,length:2);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Bachat',
      theme: new ThemeData(
        primaryColor: new Color(0xff3c84a7),
        accentColor: new Color(0xff25D366),
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("BACHAT"),
          elevation:0.7,
          bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(
                text: "Debited",
              ),
              new Tab(
                text: "Credited",
              ),
            ],
          ),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                trailing: new Icon(Icons.cancel),
                onTap:() => Navigator.of(context).pop(),
              ),
              new ListTile(
                title: new Text("Homepage"),
                trailing: new Icon(Icons.home),
                onTap:()=>Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context)=>new BachatHome())),
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
        ),
        body: new Container(
          color: Colors.lightBlue[50],
        ),
      ),
    );
  }
}