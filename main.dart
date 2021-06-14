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
  Color primaryColor = Colors.deepPurple;
  Color secondaryColor = Colors.white;
  Color secondaryDarkColor = Color.fromARGB(249, 249, 249, 249);
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
                      upperNumber,
                      style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                    ),
                    Text(
                      lowerNumber,
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
                button("7"),
                button("8"),
                button("9"),
                button("+"),
              ],
            ),
            Row(
              children: <Widget>[
                button("4"),
                button("5"),
                button("6"),
                button("-"),
              ],
            ),
            Row(
              children: <Widget>[
                button("1"),
                button("2"),
                button("3"),
                button("x"),
              ],
            ),
            Row(
              children: <Widget>[
                button("C"),
                button("0"),
                button("="),
                button("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String val) {
    return Expanded(
      child: FlatButton(
        color: secondaryDarkColor,
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 35.0, color: Colors.deepPurple),
        ),
      ),
    );
  }

  int firstNum, secondNum;
  String firstT = "",
      temp = "",
      secondT = "",
      lowerNumber = "",
      uNum = "",
      upperNumber = "";
  String opp = "", lNum = "";
  void btnClicked(String btnText) {
    if (btnText == "C") {
      firstT = "";
      lowerNumber = "";
      uNum = "";
      upperNumber = "";
      lNum = "";
      firstNum = 0;
      secondNum = 0;
      opp = "";
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      opp = btnText;
      uNum += btnText;
      firstNum = int.parse(firstT);
      firstT = "";
      secondT = "";
    } else if (btnText == "=") {
      uNum = lNum;
      lNum = "";
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
      uNum += btnText;
      secondT += btnText;
      secondNum = int.parse(secondT);
      if (opp == "+") {
        lNum = (firstNum + secondNum).toString();
        firstT = lNum;
      }
      if (opp == "-") {
        lNum = (firstNum - secondNum).toString();
        firstT = lNum;
      }
      if (opp == "x") {
        lNum = (firstNum * secondNum).toString();
        firstT = lNum;
      }
      if (opp == "/") {
        lNum = (firstNum ~/ secondNum).toString();
        firstT = lNum;
      }
    } else {
      uNum += btnText;
      firstT += btnText;
    }
    setState(() {
      upperNumber = uNum;
      lowerNumber = lNum;
    });
  }
}
