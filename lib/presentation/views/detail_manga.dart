import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zero_manga_plus_view/presentation/providers/providers.dart';
import 'package:zero_manga_plus_view/presentation/views/visor_manga.dart';

class DetailManga extends ConsumerWidget {
  DetailManga? detailManga;
  final String mangaUrl;
  DetailManga({super.key, required this.mangaUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailManga = ref.watch(mangaDetailProvider(mangaUrl));
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: detailManga.when(
            data: (detailResponse) => Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Image.network(
                              detailResponse.data!.imageUrl!.trim(),
                              width: 150,
                              height: 300,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 0, left: 10, bottom: 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    detailResponse.data!.title!
                                            .replaceAll("\n", "")
                                            .trim() ??
                                        "",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    detailResponse.data!.description!,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                     Flexible(child:  Container(
                       margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                       child: SizedBox(
                         width: 400,
                         height: 100,
                         child: GridView.builder(
                           padding: const EdgeInsets.all(0),
                           scrollDirection: Axis.vertical,
                           gridDelegate:
                           const SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 3, childAspectRatio: 3.0),
                           itemCount: detailResponse.data!.generos!.length,
                           itemBuilder: (context, index) {
                             return Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 clipBehavior: Clip.antiAlias,
                                 width: 20,
                                 height: 20,
                                 decoration: BoxDecoration(
                                     color: Colors.deepPurple.shade800,
                                     borderRadius: BorderRadius.circular(10),
                                     boxShadow: [
                                       BoxShadow(
                                           color: Colors.black.withOpacity(1),
                                           blurRadius: 5,
                                           offset: const Offset(0, 3))
                                     ]),
                                 child: Container(
                                   alignment: Alignment.center,
                                   padding: const EdgeInsets.all(0),
                                   child: Text(
                                     detailResponse.data!.generos![index],
                                     style: const TextStyle(
                                         color: Colors.white,
                                         overflow: TextOverflow.ellipsis,
                                         fontSize: 12,
                                         fontStyle: FontStyle.normal),
                                   ),
                                 ),
                               ),
                             );
                           },
                         ),
                       ),
                     ),),
                      Flexible(
                        child: Container(
                            padding: const EdgeInsets.all(0),
                            width: 100,
                            height: 20,
                            margin: const EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 0),
                            alignment: Alignment.topCenter,
                            color: Colors.deepPurple,
                            child: const Text(
                              'Capitulos',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          width: 400,
                          height: 300,
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async{
                                    await Navigator.push(context,
                                        MaterialPageRoute(builder: (BuildContext context)=> VisorManga(urlCapitulo: detailResponse.data!.capitulos![index].urlLeer!)
                                    ));
                                  },
                                  child: ListTile(
                                    title: Text(
                                      detailResponse.data!.capitulos![index].name!,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                              itemCount: detailResponse.data!.capitulos!.length,

                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
            error: (_, __) => const Text('No se pudo mostrar informacion'),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
