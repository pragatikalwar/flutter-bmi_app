import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var color = Color.fromARGB(255, 209, 231, 251);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 185, 223, 254),
          title: const Text('Your BMI'),
        ),
        body: Container(
          color: color,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 21),
                  TextField(
                    controller: wtcontroller,
                    decoration: const InputDecoration(
                        label: Text('Enter your weight in kgs'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 11),
                  TextField(
                    controller: ftcontroller,
                    decoration: const InputDecoration(
                        label: Text('Enter your height in feet'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 11),
                  TextField(
                    controller: incontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.height),
                        label: Text("Enter inches")),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtcontroller.text.toString();
                        var ft = ftcontroller.text.toString();
                        var inch = incontroller.text.toString();
                        if (wt != "" && ft != "" && inch != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iin = int.parse(inch);
                          var totalinch = ift * 12 + iin;
                          var meters = (totalinch * 2.54) / 100;
                          var bmi = iwt / (meters * meters);
                          var msg = "";

                          if (bmi > 25) {
                            msg = "You are overweight :(";
                            color = Color.fromARGB(204, 254, 177, 62);
                          } else if (bmi < 18) {
                            msg = "You are underweight :(";
                            color = Color.fromARGB(214, 241, 115, 95);
                          } else {
                            msg = "You are Healthy :)";
                            color = Color.fromARGB(193, 111, 196, 78);
                          }

                          setState(() {
                            result =
                                " $msg \n Your BMI is ${bmi.toStringAsFixed(2)} ";
                          });
                        } else {
                          setState(() {
                            color = Color.fromARGB(255, 251, 229, 197);
                            result = "Please fill all the reqd Blanks";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
