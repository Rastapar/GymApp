import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


const Color colorBack = Colors.black;
const Color colorWidget = Colors.orange;
const Color colorText = Colors.white;

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});


  @override
  Widget build(BuildContext context) {
    Color colorBack = Colors.black;
    Color colorWidget = Colors.deepOrange;
    Color colorText = Colors.white;



    return Scaffold(
      backgroundColor: colorBack,
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: colorBack,
        foregroundColor: colorText,
      ),
      body: ListView(
        children: [
          const Text("data"),
          const Text("data2"),
        ],
      ),
    );
  }
}