import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var bgcolor;

  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(color:bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('enter your weight first....'),
                      prefixIcon: Icon(Icons.line_weight_rounded),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text('enter your height (in feet)...'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11),
                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                      label: Text('enter your height (in inch)...'),
                      prefixIcon: Icon(Icons.hdr_weak_outlined),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inchController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinch = int.parse(inch);

                          var tinch = (ift * 12) + iinch;
                          var tcm = tinch * 2.54;
                          var tm = tcm / 100;
                          var bmi = iwt / (tm * tm);
                          var msg = "";
                          if (bmi > 25) {
                            msg = "You're OverWeighted!!";
                            bgcolor = Colors.deepOrange.shade300;
                          } else if (bmi < 18){
                            msg = "You're UnderWeight";
                            bgcolor = Colors.red;
                          } else {
                             msg = "You're Healthy";
                             bgcolor = Colors.green;
                          }

                          setState(() {
                            result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill the all required blanks";
                          });
                        }
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 18),
                      )),
                  SizedBox(height: 8),
                  Text(
                    result,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
