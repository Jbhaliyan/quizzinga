import 'package:flutter/material.dart';
import 'package:quizzinga/Screens/questionScreen.dart';
import 'Screens/authentication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(250, 53, 58, 95),
        // ignore: deprecated_member_use
        accentColor: const Color.fromARGB(255, 158, 186, 243),
      ),
      home: Authentication(),
      routes: {
        Authentication.routeName: (context) => Authentication(),
        Questions.routeName: (context) => Questions()
      },
    );
  }
}
