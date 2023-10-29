import 'package:flutter/material.dart';
import 'package:zero_manga_plus_view/presentation/widgets/book_type.dart';
import 'package:zero_manga_plus_view/presentation/widgets/text_demography.dart';

import '../../data/datastore/model/mangas_populares.dart';
import '../../data/datastore/util/Util.dart';

Widget GridMangas(List<Mangas> mangas) {
  return GridView.builder(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      scrollDirection: Axis.horizontal,
      itemCount: mangas.length,
      itemBuilder: (context, index) {
        var manga = mangas[index];
        return Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(1),
                    blurRadius: 5,
                    offset: const Offset(0, 3))
              ],
              border: Border.all(
                // Color del borde
                width: 2.0, // Ancho del borde
              ),
            ),
            //elevation: 3,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(getUrlFromImage(manga.mangaImagen!)),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 0),
                    color: Colors.black.withOpacity(0.5),
                    height: 45,
                    child: ListTile(
                      title: Text(
                        manga.title ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                   Row(
                    children: [
                     bookType(manga.type!),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(left: 0,top: 0,right: 10,bottom: 0),
                        color: Colors.black.withOpacity(0.5),
                        child: Row(
                          children: [
                            Text(
                              manga.score!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Icon(
                              Icons.star, // El ícono que deseas agregar
                              color: Colors.yellow, // Color del ícono
                              size: 20.0, // Tamaño del ícono
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  textDemography(demography: manga.demography),
                ],
              ),
            ));
      });
}
