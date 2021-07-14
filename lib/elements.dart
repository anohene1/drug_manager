import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';



Widget NavList({String text, Icon icon, Color color}){
  return Container(
    height: 50,
    color: color,
    child: Row(
      children: [
        SizedBox(width: 40,),
        icon,
        SizedBox(width: 20,),
        Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),)
      ],
    ),
  );
}

Widget FormItem({String title, TextEditingController controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'gilroy'),),
      SizedBox(height: 5,),
      Container(
        height: 58,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 2, left: 10),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: primary)
              )
          ),
        ),
      )
    ],
  );
}

Widget Items({String sl, String name, String quantity, String unitPrice, String price}){
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    margin: EdgeInsets.only(top: 20),
    height: 30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          child: Text(sl, style: TextStyle(color: Colors.grey),),
        ),
        Container(
          width: 160,
          child: Text(name, style: TextStyle(fontFamily: 'gil'),),
        ),
        Container(
          width: 90,
          child: Text(quantity, style: TextStyle(color: Colors.grey),),
        ),
        Container(
          width: 90,
          child: Text(unitPrice, style: TextStyle(color: Colors.grey),),
        ),
        Container(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: TextStyle(color: Colors.grey),),
              Icon(CupertinoIcons.clear, color: Colors.grey,)
            ],
          ),
        )
      ],
    ),
  );
}