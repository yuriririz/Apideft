import 'dart:io';

import 'package:app_deaf/routers.dart';
import 'package:app_deaf/pages/menu/navbar.dart';
import 'package:app_deaf/utils/App_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final navigatorState = GlobalKey<NavigatorState>();

void main() {
  HttpOverrides.global = MyHttpOverride();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute.all,
      home: NavbarPage(),
      navigatorKey: navigatorState,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          appBarTheme: AppBarTheme(backgroundColor: AppConstant.bgColor)),
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // TODO: implement createHttpClient
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
