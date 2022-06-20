import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
  Column _textContainer(String tx) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            tx,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            softWrap: true,
          ),
        ),
        const Text(
          "Just something more with normal font"
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Makes disappear the notification bar (works bad)
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Color color = Theme.of(context).primaryColor;
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
    Widget textSection = Padding(
      padding: const EdgeInsets.all(32),
      child: _textContainer(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese'
            'Alps. Situated 1,578 meters above sea level, it is one of the'
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a'
            'half-hour walk through pastures and pine forest, leads you to the'
            'lake, which warms to 20 degrees Celsius in the summer. Activities'
            'enjoyed here include rowing, and riding the summer toboggan run.'
      ),
    );
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: flatButtonStyle,
                  // Within the SecondScreen widget
                  onPressed: () {
                    // Navigate back to the first screen by popping the current route
                    // off the stack.
                    Navigator.pop(context);
                  },
                  child: const Text('Go back!'),
                ),
              ),
            ],
          ),
          titleSection,
          buttonSection,
          textSection,
          Image.asset(
            'images/face.jpeg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}