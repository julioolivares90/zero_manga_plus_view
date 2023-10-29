import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bookType(String bookType){

  return Container(
    color: getColorBookType(bookType),
    child: Text(
      bookType,
      style: const TextStyle(color: Colors.white),
    ),
  );
}


MaterialColor getColorBookType(String bookType){

  if(bookType == "MANGA"){
    return Colors.blue;
  }
  if(bookType == "MANHWA"){
    return Colors.green;
  }
  if(bookType == "ONE SHOT"){
   return Colors.pink;
  }
  if(bookType == "MANHUA"){
    return Colors.brown;
  }
  return Colors.deepOrange;
}