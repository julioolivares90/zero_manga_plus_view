import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisorManga extends ConsumerWidget {

  final String urlCapitulo;

   VisorManga({super.key, required this.urlCapitulo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return  Scaffold(
       backgroundColor: Colors.grey.shade900,
       body: const Center(child: Text('Visor Manga',style: TextStyle(color: Colors.white),),),
     );
  }

}