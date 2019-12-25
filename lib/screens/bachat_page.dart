import 'package:bachat/widgets/grey_square.dart';
import 'package:flutter/material.dart';

const kBlueTextStyle = TextStyle(color: Color(0xFF05445E), fontSize: 20.0);

class BachatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xFFD4F1F4),
          appBar: AppBar(
            leading: Icon(Icons.menu),
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
        ),
      ),
    );
  }
}

class DebitedCard extends StatelessWidget {
  String date;
  List<Cost> costs;

  DebitedCard({this.date, this.costs});

  @override
  Widget build(BuildContext context) {
    int totalcost = 0;
    for (Cost cost in costs) totalcost += int.parse(cost.costOfItem);
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
              itemCount: costs.length,
              itemBuilder: (_, index) => Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GreySquare(),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          costs[index].name,
                          style: kBlueTextStyle,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, right: 30.0, bottom: 6.0, left: 12.0),
                          child: Text(
                            costs[index].costOfItem,
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

class DebitedTab extends StatefulWidget {
  @override
  _DebitedTabState createState() => _DebitedTabState();
}

class _DebitedTabState extends State<DebitedTab> {
  List<Cost> costs = new List();
  List<List<Cost>> listOfCosts = new List();
  String date;

  @override
  void initState() {
    costs.add(Cost(name: "Beer", costOfItem: "20000"));
    costs.add(Cost(name: "asd", costOfItem: "40000"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: <Widget>[
          DebitedCard(
            date: "2nd January 2019",
            costs: costs,
          ),
          DebitedCard(
            date: "3rd January 2019",
            costs: costs,
          ),
          DebitedCard(
            date: "4th Janurary 2019",
            costs: costs,
          ),
        ],
      ),
    );
  }
}

class Cost {
  String name;
  String costOfItem;

  Cost({this.name, this.costOfItem});
}
