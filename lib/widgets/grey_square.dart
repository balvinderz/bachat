import 'package:flutter/material.dart';

class GreySquare extends StatelessWidget
{
  GreySquare({this.size});
  int size;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: size!=null? size.toDouble(): 25.0,
      width: size!=null ? size.toDouble() : 25.0,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(3.0),

      color: Colors.grey.shade400,
    );
  }
}
