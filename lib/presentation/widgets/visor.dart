import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
class Visor extends ConsumerWidget {

  final String imageUrl;
  final String urlRefer;
  Visor({super.key, required this.imageUrl,required this.urlRefer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var headers = <String,String>{};
    headers["Referer"] = urlRefer;

    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: PhotoView(
          imageProvider: NetworkImage(imageUrl,headers: headers,scale: 1),
    )
      ),
    );
  }
  
}