import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  static const Color primaryColor = Colors.deepPurple;
  static const Color secondaryColor = Colors.white;
  static const Color secondaryDarkColor = Color.fromARGB(249, 249, 249, 249);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                color: secondaryColor,
                padding: EdgeInsets.only(
                  top: 110.0,
                  right: 10.0,
                ),
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    Text(
                      vasa,
                      style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                    ),
                    Text(
                      text1,
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Button("7"),
                Button("8"),
                Button("9"),
                Button("+"),
              ],
            ),
            Row(
              children: <Widget>[
                Button("4"),
                Button("5"),
                Button("6"),
                Button("-"),
              ],
            ),
            Row(
              children: <Widget>[
                Button("1"),
                Button("2"),
                Button("3"),
                Button("x"),
              ],
            ),
            Row(
              children: <Widget>[
                Button("C"),
                Button("0"),
                Button("="),
                Button("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Button(String val) {
    return Expanded(
      child: FlatButton(
        color: secondaryDarkColor,
        //elevation: 0.5,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(30),
        // ),
        padding: EdgeInsets.all(25.0),

        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 35.0, color: Colors.deepPurple),
        ),
      ),
    );
  }

  int first, second;
  String res, text1 = "", text = "", re = "", vasa = "";
  String opp = "", tr = "";
  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text1 = "";
      re = "";
      vasa = "";
      text = "";
      tr = "";
      first = 0;
      second = 0;
      re = "";
      opp = "";
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
      re += btnText;
    } else if (btnText == "=") {
      re = res;
      first = int.parse(re);
      tr = "";
    } else if ((opp == "+" || opp == "-" || opp == "x" || opp == "/") &&
        (btnText == "1" ||
            btnText == "2" ||
            btnText == "3" ||
            btnText == "4" ||
            btnText == "5" ||
            btnText == "6" ||
            btnText == "7" ||
            btnText == "8" ||
            btnText == "9" ||
            btnText == "0")) {
      re += btnText;
      text += btnText;
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
        tr = res;
      }
      if (opp == "-") {
        res = (first - second).toString();
        tr = res;
        //re = res;
      }
      if (opp == "x") {
        res = (first * second).toString();
        tr = res;
      }
      if (opp == "/") {
        res = (first ~/ second).toString();
        tr = res;
      }
    } else {
      re += btnText;
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      vasa = re;
      text = res;
      text1 = tr;
    });
  }
}
