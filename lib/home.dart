import 'package:flutter/material.dart';

class SimpleCalculator extends StatelessWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green)),
      home: const MyHomePage(title: 'Simple Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  String option = "";
  String output = "0";
  String result = "0";

  buttonPressed(String ButtonKey) {
    if (ButtonKey == "C") {
      result = "0";
      firstNum = 0.0;
      secondNum = 0.0;
      option = "";
    } else if (ButtonKey == "DEL") {
      {
        result = result.substring(0, result.length - 1);
      }
    } else if (ButtonKey == "+/-") {
      {
        if (result[0] != "-") {
          result = "-" + result;
        } else {
          result = result.substring(1);
        }
      }
    } else if (ButtonKey == ".") {
      if (result.contains(".")) {
        return;
      } else {
        result = result + ButtonKey;
      }
    } else if (ButtonKey == "+" ||
        ButtonKey == "-" ||
        ButtonKey == "X" ||
        ButtonKey == "%" ||
        ButtonKey == "/") {
      firstNum = double.parse(output);
      option = ButtonKey;
      result = "0";
      output = output + ButtonKey;
    } else if (ButtonKey == "=") {
      secondNum = double.parse(output);

      if (option == "%") {
        result = (firstNum % secondNum).toString();
      }
      if (option == "+") {
        result = (secondNum + firstNum).toString();
      }
      if (option == "-") {
        result = (firstNum - secondNum).toString();
      }
      if (option == "X") {
        result = (secondNum * firstNum).toString();
      }
      if (option == "/") {
        result = (firstNum / secondNum).toString();
      }
      firstNum = 0.0;
      secondNum = 0.0;
    } else {
      result = result + ButtonKey;
    }

    setState(() {
      output = double.parse(result).toStringAsFixed(2);
    });
  }

  Widget calculatorButton(String ButtonVal) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
      width: width * 0.25,
      height: height * 0.24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff40C4FF),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          )),
      child: ElevatedButton(
        child: Text(
          //to hold button value
          ButtonVal,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        onPressed: () => buttonPressed(ButtonVal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: const Color(0xffE0E0E0),
        body: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  style: const TextStyle(fontSize: 60.0),
                )),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    calculatorButton("C"),
                    calculatorButton("DEL"),
                    calculatorButton("%"),
                    calculatorButton("/")
                  ],
                ),
                Row(
                  children: <Widget>[
                    calculatorButton("7"),
                    calculatorButton("8"),
                    calculatorButton("9"),
                    calculatorButton("X")
                  ],
                ),
                Row(
                  children: <Widget>[
                    calculatorButton("4"),
                    calculatorButton("5"),
                    calculatorButton("6"),
                    calculatorButton("-")
                  ],
                ),
                Row(
                  children: <Widget>[
                    calculatorButton("1"),
                    calculatorButton("2"),
                    calculatorButton("3"),
                    calculatorButton("+")
                  ],
                ),
                Row(
                  children: <Widget>[
                    calculatorButton("+/-"),
                    calculatorButton("0"),
                    calculatorButton("."),
                    calculatorButton("="),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
