import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Calculator",
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstnum;
  int secnum;
  String texttodisplay = "";
  String res;
  String operationtoperform;

  void btnClick(String btntext) {
    if (btntext == "C") {
      texttodisplay = "";
      res = "";
      firstnum = 0;
      secnum = 0;
    } else if (btntext == "+" ||
        btntext == "x" ||
        btntext == "/" ||
        btntext == "-") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operationtoperform = btntext;
    } else if (btntext == "=") {
      secnum = int.parse(texttodisplay);
      if (operationtoperform == "+") {
        res = (firstnum + secnum).toString();
      }
      if (operationtoperform == "-") {
        res = (firstnum - secnum).toString();
      }
      if (operationtoperform == "x") {
        res = (firstnum * secnum).toString();
      }
      if (operationtoperform == "/") {
        res = (firstnum ~/ secnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btntext).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget customButton(String btnValue) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      onPressed: () => btnClick(btnValue),
      child: Text(
        "$btnValue",
        style: TextStyle(fontSize: 25.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttodisplay",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
              ),
            )),
            Row(
              children: <Widget>[
                customButton('7'),
                customButton('8'),
                customButton('9'),
                customButton('x')
              ],
            ),
            Row(
              children: <Widget>[
                customButton('4'),
                customButton('5'),
                customButton('6'),
                customButton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                customButton('1'),
                customButton('2'),
                customButton('3'),
                customButton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                customButton('C'),
                customButton('0'),
                customButton('='),
                customButton('/'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
