import 'package:flutter/material.dart';
import 'package:mobx_dart/components/home/view/home_screen.dart';
import 'package:mobx_dart/components/locator.dart';
import 'package:mobx_dart/mobx_home/pages/create_page.dart';
import 'package:mobx_dart/mobx_home/pages/home_page.dart';


void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomeScreen(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        CreatePage.id: (context) => const CreatePage(),
      },
    );
  }
}


