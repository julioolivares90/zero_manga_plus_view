import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zero_manga_plus_view/presentation/views/home_page.dart';

import 'DI.dart';
void main() {
  final di = Di();

  HttpOverrides.global =  MyHttpOverrides();
  di.regist();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:  ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HomePage(),

    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context)
  { return super.createHttpClient(context) ..badCertificateCallback = (X509Certificate cert, String host, int port) => true; }
}



