import 'package:flutter/material.dart';
import 'Secondpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xff181718)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 75;
  double weight = 60;
  double bmi = 19;
  String hi = "healthy weight?";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Row(
          children: [
            Container(
                height: 584,
                width: 1200,
                color: Color(0xffda9edc),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height in cm is ${height.round()}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff41015a),
                        )),
                    Slider(
                        value: height,
                        min: 30,
                        max: 300,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                            bmi = weight / (((height / 100) * (height / 100)));
                            if (bmi < 18) {
                              hi = "underweight";
                              print(hi);
                            }
                            if (bmi > 18 && bmi < 25) {
                              hi = "healthy weight";
                              print(hi);
                            }
                            if (bmi > 25) {
                              hi = "overweight";
                              print(hi);
                            }
                          });
                        }),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'You decremented the weight value by 1kg')));
                        setState(() {
                          weight--;
                          bmi = weight / (((height / 100) * (height / 100)));
                          if (bmi < 18) {
                            hi = "underweight";
                            print(hi);
                          }
                          if (bmi > 18 && bmi < 25) {
                            hi = "healthy weight";
                            print(hi);
                          }
                          if (bmi > 25) {
                            hi = "overweight";
                            print(hi);
                          }
                        });
                      },
                      child: const Text('-'),
                    ),
                    Text(
                      "Weight-${weight.round()}",
                      style: TextStyle(
                        backgroundColor: Color(0xffda9edc),
                        color: Color(0xff41015a),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'You incremeneted the weight value by 1 kg')));
                        setState(() {
                          weight++;

                          bmi = weight / (((height / 100) * (height / 100)));
                          if (bmi < 18) {
                            hi = "underweight";
                            print(hi);
                          }
                          if (bmi > 18 && bmi < 25) {
                            hi = "healthy weight";
                            print(hi);
                          }
                          if (bmi > 25) {
                            hi = "overweight";
                            print(hi);
                          }
                        });
                      },
                      child: const Text('+'),
                    ),
                    Text(
                      "Your BMI is ${bmi.round()}",
                      style: TextStyle(
                        color: Color(0xfff1e049),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Your bmi shows you are- ${hi}",
                      style: TextStyle(
                        color: Color(0xff021b44),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondPage(
                                      bmi: bmi,
                                    )));

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Calculate')));
                      },
                      child: Text("Calculate"),
                    ),
                  ],
                )),
          ],
        ));
  }
}
