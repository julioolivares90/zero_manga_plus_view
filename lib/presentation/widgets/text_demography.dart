import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textDemography({demography}){

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Container(
          alignment: Alignment.center,
          color: getColor(demography) ,
          child: Text(demography,style: const TextStyle(color: Colors.white),),
        ),
      ),
    ],
  );
}

MaterialColor getColor(String demography){
  if(demography == "Shounen") {
    return Colors.amber;
  }
  if(demography == "Seinen"){
    return Colors.red;
  }
  if(demography == "Shoujo"){
    return Colors.pink;
  }
  if(demography == "Josei"){
    return Colors.deepPurple;
  }
  return  Colors.amber;
}