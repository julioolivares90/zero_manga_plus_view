import 'package:flutter/material.dart';
import '../../data/datastore/model/mangas_populares.dart';
import '../../data/datastore/util/Util.dart';
Widget listManga(List<Mangas> mangas){

  return ListView.builder(
    itemCount: mangas.length,itemBuilder: (context,index){
    final mangasPopularesItem = mangas[index];
    return Card(
        color: Colors.grey.shade900,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 300.0,
                width: 400,
                child: Image.network(getUrlFromImage(mangasPopularesItem.mangaImagen!),width: 400, height: 300,),
              ),
              ListTile(title: Text(mangasPopularesItem.title??"",style: const TextStyle(color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.normal,),),),

            ],
          ),
        )
    );
  },);
}