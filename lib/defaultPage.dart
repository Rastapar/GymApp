import 'package:flutter/material.dart';

const Color colorBack = Colors.black;
const Color colorWidget = Colors.orange;
const Color colorText = Colors.white;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _substractCounter(){
    setState((){
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(

        child: Container(
          color: colorWidget,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: colorBack,
                ),
                child: Text(
                  'Mythologym',
                  style: TextStyle(
                    color: colorWidget,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text(
                    'Home',
                    style: TextStyle(
                      color: colorText,
                      fontSize: 20,
                    ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                }
              ),
              ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: colorText,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/sign_up');
                  }
              ),
              ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text(
                    'Login',
                    style: TextStyle(
                      color: colorText,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  }
              ),
              ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text(
                    'Menu',
                    style: TextStyle(
                      color: colorText,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/menu');
                  }
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
              onPressed: _substractCounter,
              icon: const Icon(Icons.arrow_back_rounded),
              tooltip: "decrementa el numero pishula",
            ),
            ElevatedButton(
                onPressed: (){
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text("Envio un hijo aqui?"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementa el numero pisha',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
