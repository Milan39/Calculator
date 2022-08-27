import 'package:day3/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';
//  import 'math_expression.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String userInput = "";
  static String answer = "";
  final List<String> button = [
    'AC',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '+/-',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // User input section where the button is clicked and input is appeared here
              Container(
                padding: const EdgeInsets.only(top: 20, right: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              // answer section where answer is shown 
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(20),
                child: Text(
                  answer,
                  style: const TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: button.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  // Clear button which is in index 0
                  if (index == 0) {
                    return MyButton(
                      bottomtapped: () {
                        setState(() {
                          userInput = '';
                          answer = "";
                        });
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      ButtonText: button[index],
                    );
                  }
                  // Delete button which is in index 1
                  else if (index == 1) {
                    return MyButton(
                      bottomtapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      ButtonText: button[index],
                    );
                  }
                  //equal buttons
                  else if (index == button.length - 1) {
                    return MyButton(
                      bottomtapped: () {
                        setState(() {
                          equalButtonPressed();
                        });
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      ButtonText: button[index],
                    );
                  }
                  //rest of the buttons
                  else {
                    return MyButton(
                        bottomtapped: () {
                          setState(() {
                            userInput += button[index];
                          });
                        },
                        color: isOperator(button[index])
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        textColor: isOperator(button[index])
                            ? Colors.white
                            : Colors.deepPurple,
                        ButtonText: button[index]);
                  }
                }))
      ]),
    );
  }

  bool isOperator(String x) {
    if (x == '%' ||
        x == '/' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == '+/-') {
      return true;
    }
    return false;
  }

  void equalButtonPressed() {
      String userIn = userInput;
       userIn = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(userIn);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();

  }

}
