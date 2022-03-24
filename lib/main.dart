import 'package:dinamik_not_ortalamasi/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';

import 'constants/app_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dinamik ortalama hesapla",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OrtalamaHesaplaApp(),
    );
  }
}
