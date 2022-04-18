import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var textt) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          result = result + textt;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(30),
        primary: Colors.red,
      ),
      child: Text("$textt"),
    );
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: Text(
              result,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("1"),
              btn("2"),
              btn("3"),
              btn("+"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("4"),
              btn("5"),
              btn("6"),
              btn("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("7"),
              btn("8"),
              btn("9"),
              btn("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("0"),
              btn("/"),
              ElevatedButton(
                onPressed: output,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.all(30),
                ),
                child: Text("="),
              ),
              ElevatedButton(
                onPressed: clearr,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.all(28),
                ),
                child: Text("Clr"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
