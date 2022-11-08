import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({required this.bmi});
  double bmi;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5a5a5),
      appBar: AppBar(title: Text("Result-Second Page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Recalculate')));
              },
              child: Text("Your BMI is ${widget.bmi}",
                  style: TextStyle(fontSize: 50))),
        ],
      ),
    );
  }
}
