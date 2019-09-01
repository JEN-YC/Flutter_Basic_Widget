import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    Icon(Icons.star, size: 200.0,),
    Icon(Icons.mood_bad, size: 200.0,),
    Icon(Icons.wb_sunny, size: 200.0,),
  ];
  void _onItemTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Star')),
          BottomNavigationBarItem(
              icon: Icon(Icons.mood_bad), title: Text('Sad')),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny), title: Text('Sunny')),
        ],
        onTap: _onItemTap,
        currentIndex: _selectedIndex,),
        body: Center(child: _widgetOption.elementAt(_selectedIndex),));
  }
}


