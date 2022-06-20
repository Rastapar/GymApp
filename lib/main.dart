import 'package:app2_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:app2_flutter/defaultPage.dart';
import 'package:app2_flutter/tutorial_1_Layout.dart';
import 'package:app2_flutter/mythologym/home.dart';
import 'package:app2_flutter/mythologym/login.dart';
import 'package:app2_flutter/mythologym/sign_up.dart';
import 'package:app2_flutter/mythologym/menu.dart';


void main() {
  runApp(const MyApp());
}

Color colorBack = Colors.black;
Color colorWidget = Colors.deepOrange;
Color colorText = Colors.white;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nombre App Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Titulo de App'),
      initialRoute: '/',
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
        '/home': (context) => const HomePage(),
        '/sign_up': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/menu': (context) => const MenuPage(),
      },
    );
  }
}

