import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zero_manga_plus_view/data/datastore/model/response.dart';
import 'package:zero_manga_plus_view/presentation/widgets/gridMangas.dart';

import '../../data/datastore/util/Util.dart';
import '../providers/providers.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final response = ref.watch(mangasProvider);
  return Scaffold(
    backgroundColor: Colors.grey.shade900,
    appBar: AppBar(title: const Text('Home'),backgroundColor: Colors.grey.shade900,),
    body: Center(child:
      response.when( data: (response) =>  GridMangas(response!.mangasPopulares!),
          error: (_,stack) =>  Text('No se pudo mostrar informacion$stack'), loading: ()=> const CircularProgressIndicator()),),
  );
  }
  

  
}