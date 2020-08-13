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
  var columns = ['名字', '國語', '英文', '數學', '自然', '標記'];
  var students = <Student>[
    Student(
        name: "小明",
        chineseGrade: 50,
        scienceGrade: 70,
        mark: Icons.verified_user),
    Student(
        name: "小華", scienceGrade: 82, englishGrade: 60, mark: Icons.mood_bad),
    Student(name: "小陳", chineseGrade: 90, englishGrade: 85, mark: Icons.mood),
    Student(name: "小美", mathGrade: 70, englishGrade: 88, chineseGrade: 84),
    Student(name: "小夫", chineseGrade: 76, mathGrade: 58, englishGrade: 99),
  ];
  int _sortColumnIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data Table"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              sortColumnIndex: _sortColumnIndex,
              columns: columns
                  .map((e) => DataColumn(
                      label: Text(e),
                      onSort: (columnIndex, ascending) {
                        if (columnIndex == 0 || columnIndex == 5) return;
                        setState(() {
                          _sortColumnIndex = columnIndex;
                          if (ascending) {
                            switch (columnIndex) {
                              case 1:
                                students.sort((a, b) =>
                                    a.chineseGrade.compareTo(b.chineseGrade));
                                break;
                              case 2:
                                students.sort((a, b) =>
                                    a.englishGrade.compareTo(b.englishGrade));
                                break;
                              case 3:
                                students.sort((a, b) =>
                                    a.mathGrade.compareTo(b.mathGrade));
                                break;
                              case 4:
                                students.sort((a, b) =>
                                    a.scienceGrade.compareTo(b.scienceGrade));
                                break;
                            }
                          }
                        });
                      }))
                  .toList(),
              rows: students
                  .map((e) => DataRow(cells: [
                        DataCell(Text(e.name)),
                        DataCell(Text(e.chineseGrade.toString())),
                        DataCell(Text(e.englishGrade.toString())),
                        DataCell(Text(e.mathGrade.toString())),
                        DataCell(Text(e.scienceGrade.toString())),
                        DataCell(Icon(e.mark))
                      ]))
                  .toList()),
        ));
  }
}

class Student {
  Student(
      {@required this.name,
      this.chineseGrade = 0,
      this.mathGrade = 0,
      this.englishGrade = 0,
      this.scienceGrade = 0,
      this.mark});
  String name;
  int chineseGrade;
  int mathGrade;
  int englishGrade;
  int scienceGrade;
  IconData mark;
}
