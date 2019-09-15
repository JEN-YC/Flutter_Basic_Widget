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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Container example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),
        body: Container(
          transform: Matrix4.rotationZ(0.1),
          color: Colors.tealAccent,
          padding: EdgeInsets.all(50.0),
          child: Container(
            transform: Matrix4.rotationZ(-0.2),
            constraints: BoxConstraints.expand(),
            color: Colors.deepOrange,
            child: Center(child: Text('Flutter Container Child', style: TextStyle(fontSize: 60.0),)),
          ),
        )
    );
  }
}
