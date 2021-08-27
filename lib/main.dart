import 'package:flutter/material.dart';
import '/widgets/left_bar.dart';
import '/widgets/right_bar.dart';
import '/constants/app_constraints.dart';

void main() {
  runApp(Homescreen());
}

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  double _bmiresult = 0;
  String _textresult = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator for Navya",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator for Navya",
            style: TextStyle(color: accentColor),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(color: accentColor, fontSize: 42)),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _widthController,
                    style: TextStyle(
                      fontSize: 42,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(color: accentColor, fontSize: 42)),
                  ),
                ),
              ]),
              SizedBox(height: 20),
              Container(
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(accentColor),
                  ),
                  onPressed: () {
                    double _h = double.parse(_heightController.text);
                    double _w = double.parse(_widthController.text);

                    setState(() {
                      _bmiresult = (_w / (_h * _h)) * 10000;
                      if (_bmiresult > 25) {
                        _textresult = 'You are overweight';
                      } else if (_bmiresult >= 18.5 && _bmiresult <= 25) {
                        _textresult = "Your weight is Normal";
                      } else
                        _textresult = "You are underweight";
                    });
                  },
                  child: Text('Calculate', style: TextStyle(fontSize: 22)),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: Text(
                  _bmiresult.toStringAsFixed(2),
                  style: TextStyle(color: accentColor, fontSize: 90),
                ),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: _textresult.isNotEmpty,
                child: Text(
                  _textresult,
                  style: TextStyle(color: accentColor, fontSize: 40),
                ),
              ),
              SizedBox(height: 90),
              Leftbar(barWidth: 60),
              Leftbar(barWidth: 40),
              Rightbar(barWith: 50),
              Rightbar(barWith: 70),
              Rightbar(barWith: 20),
            ],
          ),
        ),
      ),
    );
  }
}
