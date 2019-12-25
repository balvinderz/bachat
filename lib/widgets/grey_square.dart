import 'package:flutter/material.dart';

class GreySquare extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: 25,
      width: 25,
      margin: EdgeInsets.all(12.0),
      color: Colors.grey.shade400,
    );
  }
}
