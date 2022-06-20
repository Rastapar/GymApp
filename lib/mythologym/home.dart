import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:country_list_pick/country_list_pick.dart';

const Color colorBack = Colors.black;
const Color colorWidget = Colors.orange;
const Color colorText = Colors.white;

// This is the type used by the popup menu below.
enum Menu { English, Spanish, Icelandic }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _selectedMenu = 'Select Language';

  @override
  Widget build(BuildContext context) {
    const TextStyle txStyle = TextStyle(fontSize: 25, color: colorText,);
    final ButtonStyle btStyle = ElevatedButton.styleFrom(
      primary: colorWidget,
      textStyle: txStyle,
      maximumSize: Size(500, 100),
      minimumSize: Size(250, 50),
    );

    return Scaffold(
      backgroundColor: colorBack,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: colorWidget,
          ),
        ),
        backgroundColor: colorBack,
        foregroundColor: colorText,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Language List
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(width: 2, color: colorWidget),
                ),
              ),
              // Maybe a DropDownButton is better
              child: PopupMenuButton<Menu>(
                  color: colorWidget,
                  child: Text(
                    _selectedMenu,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: colorWidget,
                    ),
                  ),
                  // Callback that sets the selected popup menu item.
                  onSelected: (Menu item) {
                    setState(() {
                      _selectedMenu = item.name;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    const PopupMenuItem<Menu>(
                      value: Menu.English,
                      child: Text(
                        'English',
                        style: txStyle
                      ),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.Spanish,
                      child: Text('Spanish', style: txStyle,),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.Icelandic,
                      child: Text('Icelandic', style: txStyle,),
                    ),
                  ]),
            ),
            const SizedBox(height: 200), // empty hole
            // Sign up button
            Container(
              margin: const EdgeInsets.all(10),
              width: 250,
              height: 50,
              child: ElevatedButton(
                  style: btStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_up');
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
            ),
            // Login
            Container(
              margin: const EdgeInsets.all(10),
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: btStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Google button
            Container(
                margin: const EdgeInsets.all(10),
                width: 250,
                height: 50,
                child: SignInButton(
                  Buttons.Google,
                  mini: false,
                  onPressed: () {},
                ),
            ),
            // Facebook button
            Container(
              margin: const EdgeInsets.all(10),
              width: 250,
              height: 50,
              child: SignInButton(
                Buttons.Facebook,
                mini: false,
                onPressed: () {},
              ),
            ),

          ],
        ),
      ),
    );
  }
}