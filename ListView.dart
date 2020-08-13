import 'package:english_words/english_words.dart';
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
  static const loadingTag = "@@@END@@@";
  var _words = <String>[loadingTag];
  var _divider = Divider(color: Colors.amber, thickness: 5,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              if (_words[index] == loadingTag) {
                _retrieveData();
                return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator());
              } else {
                return ListTile(
                  title: Text(_words[index]),
                );
              }
            },
            separatorBuilder: (context, index) => _divider,
            itemCount: _words.length));
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(
            _words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
