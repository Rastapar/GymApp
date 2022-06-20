import 'package:flutter/material.dart';

const Color colorBack = Colors.black;
const Color colorWidget = Colors.orange;
const Color colorText = Colors.white;

Container _textInputContainer(String textLabel, [bool hiddenWord=false]){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    width: double.infinity,
    height: 60,
    child: TextFormField(
      cursorColor: colorWidget,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: colorText, width: 1)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: colorText, width: 3)),
        labelText: textLabel,
        labelStyle: const TextStyle(fontSize: 18, color: colorText),
        filled: true,
        fillColor: colorWidget,
      ),
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.bottom,
      style: const TextStyle(color: colorBack, fontSize: 22),
      showCursor: false,
      obscureText: hiddenWord,
    ),
  );
}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    const TextStyle txStyle = TextStyle(fontSize: 25, color: colorText,);
    final ButtonStyle btStyle = ElevatedButton.styleFrom(
      primary: colorWidget,
      textStyle: txStyle,
      maximumSize: const Size(500, 100),
      minimumSize: const Size(250, 50),
    );

    // Date Variables
    TextEditingController dateInput = TextEditingController();
    //text editing controller for text field
    @override
    void initState() {
      dateInput.text = ""; //set the initial value of text field
      super.initState();
    }

    return Scaffold(
      backgroundColor: colorBack,
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: colorWidget,
          ),
        ),
        backgroundColor: colorBack,
        foregroundColor: colorText,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            // Email
            _textInputContainer("Email"),
            // Password
            _textInputContainer("Password", true),
            // Accept button
            Container(
              margin: const EdgeInsets.all(10),
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: btStyle,
                onPressed: () {},
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}