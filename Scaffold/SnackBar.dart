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
  SnackBar _snackBar1 = SnackBar(content: Text("You Click First Button"));
  SnackBar _snackBar2 = SnackBar(content: Text("You Click Second Button"));
  SnackBar _snackBar3 = SnackBar(content: Text("You Click Third Button"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 100,
                    child: RaisedButton(
                      onPressed: () {
                        Scaffold.of(context).removeCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(_snackBar1);
                      },
                      child: Text('First Button'),
                    ),
                  ),
                  ButtonTheme(
                    buttonColor: Colors.deepOrange,
                    minWidth: 200.0,
                    height: 100,
                    child: RaisedButton(
                      onPressed: () {
                        Scaffold.of(context).removeCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(_snackBar2);
                      },
                      child: Text('Second Button'),
                    ),
                  ),
                  ButtonTheme(
                    buttonColor: Colors.deepPurple,
                    minWidth: 200.0,
                    height: 100,
                    child: RaisedButton(
                      onPressed: () {
                        Scaffold.of(context).removeCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(_snackBar3);
                      },
                      child: Text('Third Button'),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
