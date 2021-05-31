import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var answer = '';

// function to calculate the input operation
  void equalPressed() {
    String finalUserinput = userInput;
    if (finalUserinput[0] == '+') {
      finalUserinput = finalUserinput.substring(1);
    }

    Parser p = Parser();
    Expression exp = p.parse(finalUserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      this.answer = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // The viewscreens for input and answer
            Expanded(
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userInput,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(
                          answer,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
            ),
            // The keypad implemented with gridview
            Expanded(
              flex: 3,
              child: Container(
                child: GridView.count(
                  crossAxisCount: 4,
                  children: <Widget>[
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput = '';
                            this.answer = '';
                          });
                        },
                        child: const Text('C')),
                    OutlinedButton(
                        onPressed: () {
                          if (this.userInput != '') {
                            setState(() {
                              this.userInput = '-(' + this.userInput + ')';
                            });
                          }
                        },
                        child: const Text('+/-')),
                    OutlinedButton(
                        onPressed: () {
                          if (this.userInput != '') {
                            setState(() {
                              this.userInput = '(' + this.userInput + ')/100';
                            });
                          }
                        },
                        child: const Text('%')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '/';
                          });
                        },
                        child: const Text('/')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '7';
                          });
                        },
                        child: const Text('7')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '8';
                          });
                        },
                        child: const Text('8')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '9';
                          });
                        },
                        child: const Text('9')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '*';
                          });
                        },
                        child: const Text('*')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '4';
                          });
                        },
                        child: const Text('4')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '5';
                          });
                        },
                        child: const Text('5')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '6';
                          });
                        },
                        child: const Text('6')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '-';
                          });
                        },
                        child: const Text('-')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '1';
                          });
                        },
                        child: const Text('1')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '2';
                          });
                        },
                        child: const Text('2')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '3';
                          });
                        },
                        child: const Text('3')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '+';
                          });
                        },
                        child: const Text('+')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '0';
                          });
                        },
                        child: const Text('0')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '00';
                          });
                        },
                        child: const Text('00')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            this.userInput += '.';
                          });
                        },
                        child: const Text('.')),
                    OutlinedButton(
                        onPressed: this.equalPressed, child: const Text('=')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
