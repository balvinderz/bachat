import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:bachat/database/bachat_db.dart';
Item bachatItemFromJson(String str)
{
  final jsonData = jsonDecode(str);
  return Item.fromMap(jsonData);
}

String bachatItemToJson(Item data)
{
  final dyn = data.toMap();
  return json.encode(dyn);
}
class Item
{
  int id;
  String itemName;
  String type;
  String cost;
  String category;
  String date;

  Item({this.id, this.itemName, this.type, this.cost,
      this.category,this.date});
  factory Item.fromMap(Map<String, dynamic> json) {
    print(json['type']);
    print(json['category']);
    print(json['id']);
    print(json['item_name']);
    print(json['date']);
    print(int.parse(json['cost']).toString());
    return Item(
        id: json["id"],
        itemName: json["item_name"],
        type: json["type"],
        cost: json['cost'],
        category: json['category'],
        date: json['date']
    );
  }
    Map<String, dynamic> toMap() => {
      "id": id,
      "item_name": itemName,
      "type": type,
      "cost": cost,
      "category" : category,
      "date": date
    };

}