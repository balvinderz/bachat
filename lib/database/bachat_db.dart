import 'dart:io';

import 'package:bachat/models/bachat_client.dart';
import 'package:bachat/models/bachat_client.dart';
import 'package:bachat/models/bachat_client.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class BachatDBProvider {
  BachatDBProvider._();

  static final BachatDBProvider db = BachatDBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory applicationDoucmentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(applicationDoucmentsDirectory.path, "bachat_db.db");
    return await openDatabase(path, version: 3,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE item(id INTEGER PRIMARY KEY AUTOINCREMENT,item_name TEXT,type TEXT,cost TEXT,category TEXT,date TEXT)");
          await db.execute("CREATE TABLE mydate(dayy TEXT PRIMARY KEY)");
        });
  }
  Future<List<String>> getDates() async{
    final db = await database;
    var res = await db.rawQuery("select * from mydate");
  //  print("mai chala");
    print(res);
    List<String> dates = res.map((d)=>d['dayy'].toString()).toList();
//    print("dates are ${dates.length}");
    return dates;
  }
  Future<List<Item>> getItems(String date) async
  {
    final db = await database;
   // await getDates();
    var res = await db.rawQuery("select * from item where date= '$date'");

    List<Item> items = new List();
    //print("meri length hai ${res.length}");
    for (int i = 0; i < res.length; i++) {
   //   print("mai chal rha hu ");
      print(res[i]['item_name']);
      //var currentRes = res[i];
      items.add(Item(id: res[i]['id'],
          itemName: res[i]['item_name'],
          type: res[i]['type'],
          cost: res[i]['cost'],
          date: res[i]['date']));
    }

    //items.add(Item(id: 1,itemName: "samosa",type: "Debited",cost: "50",date: "27 December 2019"));
    return items;
   // print(int.parse(res[0]['cost'].toString()));
   // List<Item>items =res.isNotEmpty ? res.toList().map((c) => Item.fromMap(c)) : null;
   // String query ="insert into item(item_name,type,cost,category,date) values('${item.itemName}','${item.type}',${item.cost},'${item.category}','${item.date}')";
   // print(query);
    //print(item.itemName);
   // print("call hua ye ");

    //print(items.length);
    //return items;

  }

 insertItem(Item item) async
  {
    print("call hua ye");
    final db = await  database;
    print("isse pehle");
    String query ="insert into item(item_name,type,cost,category,date) values('${item.itemName}','${item.type}',${item.cost},'${item.category}','${item.date}')";
    print(query);
    var res = await db.rawQuery("insert into item(item_name,type,cost,category,date) values('${item.itemName}','${item.type}','${item.cost}','${item.category}','${item.date}')");
    print("idhar aaya");
    try {
      await db.rawQuery("insert into mydate values('${item.date}')");
    }catch(e)
    {
      print(e.toString());
    }
    return res;
  }

}