import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zero_manga_plus_view/data/datastore/model/capitulos.dart';
import 'package:zero_manga_plus_view/data/datastore/remote/SendCapituloData.dart';
import 'package:zero_manga_plus_view/presentation/providers/providers.dart';
import 'package:zero_manga_plus_view/presentation/widgets/visor.dart';

import '../../data/datastore/model/response_capitulos.dart';
import '../../data/datastore/remote/ApiService.dart';
import '../../data/datastore/repository/api_service.dart';

class VisorManga extends StatefulWidget {

  final String urlCapitulo;

  final String urlRefer;

  VisorManga({super.key, required this.urlCapitulo, required this.urlRefer});
  /*
  @override
  Widget build(BuildContext context, WidgetRef ref) {
      // "ref" can be used in all life-cycles of a StatefulWidget.
    final sendCapitulosData =
    SendCapituloData(urlRefer: urlRefer, urlCapitulo: urlCapitulo);
    final AsyncValue<ResponseCapitulos> capitulosProvider =
    ref.watch(capitulosMangaProvider(sendCapitulosData));

  }
   */
  @override
  State<StatefulWidget> createState() => VisorMangaState(urlCapitulo: urlCapitulo,urlRefer: urlRefer);
}

class VisorMangaState extends State<VisorManga> {
  final String urlCapitulo;

  final String urlRefer;
  late Future<ResponseCapitulos> responseCapitulos;

  final ApiService apiService = ApiServiceImplementation();
  VisorMangaState({required this.urlRefer,required this.urlCapitulo});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    responseCapitulos = apiService.GetCapitulos(urlRefer, urlCapitulo);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: FutureBuilder<ResponseCapitulos>(
          future: responseCapitulos,
          builder: (context,snapshot) {
            if(snapshot.hasData){
              return Center(
                child: SizedBox(
                  width: double.infinity, //ocupa todo el ancho posible
                  height: double.infinity, //ocupa todo el alto posible
                  child: PageView.builder(
                    pageSnapping: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Visor(imageUrl: snapshot.data!.data![index],urlRefer: urlCapitulo,);
                    },
                  ),
                ),
              );
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          } ,
        ) ,
    );
  }
}


