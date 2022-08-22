import 'package:flutter/material.dart';

import '../home/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutri App',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
          primarySwatch: Colors.deepPurple,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.purple,
          ),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.deepPurple)))))),
      home: const MyHomePage(title: 'Nutri App'),
    );
  }
}
