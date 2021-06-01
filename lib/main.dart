import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> li = ['data 1', 'data 2', 'data 3', 'data 4'];

  List<int> newList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: li.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (!newList.contains(index)) {
                setState(() {
                  newList.add(index);
                });
              } else {
                setState(() {
                  newList.removeAt(newList.indexOf(index));
                });
              }
            },
            child: Row(
              children: [
                _buildBtn(index),
                Text(
                  index.toString(),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  _buildBtn(int index) {
    if (newList.contains(index)) {
      return Icon(Icons.radio_button_checked);
    } else {
      return Icon(Icons.radio_button_off_outlined);
    }
  }
}
