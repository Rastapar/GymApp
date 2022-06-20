import 'package:flutter/material.dart';
import 'package:app2_flutter/mythologym/countires.dart';
import 'package:intl/intl.dart';

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


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {

  String country = 'Iceland';
  String dateValue = "";

  @override
  Widget build(BuildContext context) {
    const TextStyle txStyle = TextStyle(fontSize: 25, color: colorText,);
    final ButtonStyle btStyle = ElevatedButton.styleFrom(
      primary: colorWidget,
      textStyle: txStyle,
      maximumSize: const Size(500, 100),
      minimumSize: const Size(250, 50),
    );
    final List<String> countriesList = countries; // set of countries sorted

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
            // Whole Name
            _textInputContainer("Name"),
            // Birth date
            Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: double.infinity,
            height: 60,
            child: TextFormField(
              cursorColor: colorWidget,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorText, width: 1)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorText, width: 3)),
                labelText: "Birth date",
                labelStyle: TextStyle(fontSize: 18, color: colorText),
                filled: true,
                fillColor: colorWidget,
              ),
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              style: const TextStyle(color: colorBack, fontSize: 22),
              showCursor: false,
              controller: TextEditingController(text: dateValue),

              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context, initialDate: DateTime.now(),
                    firstDate: DateTime(1920), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: colorWidget, // header background color
                            onPrimary: colorText, // header text color
                            onSurface: colorBack, // body text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              primary: colorBack, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                );

                if(pickedDate != null ){
                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                  dateValue = formattedDate;
                  //you can implement different kind of Date Format here according to your requirement
                  setState(() {
                    dateInput.text = formattedDate; //set output date to TextField value.
                  });
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You have not choose any date.'),
                    ),
                  );
                }
              },
            ),
          ),
            // Country
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(
                color: colorWidget,
              ),
              child: DropdownButtonHideUnderline(child: DropdownButton <String>(
                isExpanded: true,
                isDense: false,

                focusColor: colorWidget,
                // Initial Value
                hint: const Text("Select Country", style: TextStyle(color: colorText),),
                // Down Arrow Icon
                icon: const Align(alignment: Alignment.centerRight, child: Icon(Icons.keyboard_arrow_down, color: colorText,)),
                dropdownColor: colorWidget,
                // Array list of items
                items: countriesList.map((String countriesList) {
                  return DropdownMenuItem (
                    value: countriesList,
                    child: Text(countriesList, style: const TextStyle(color: colorText),),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    country = newValue!;
                  });
                },
                value: country,
              ),
              ),
            ),
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
                  'Next',
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