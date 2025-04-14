import 'package:bmi_calculator/countercard.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  String selectedGender = '';
  double height = 160;
  int weight = 60;
  int age = 20;
  double bmi = 0;

  void Claculatebmi() {
    double heightinM = height / 100;
    double result = weight / (heightinM * heightinM);
    setState(() {
      bmi = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        children: [
          Row(
            children: [
              GenderButton(
                gender: 'Male',
                icon: Icons.male,
                isSelected: selectedGender == 'Male',
                onTap: () {
                  setState(() {
                    selectedGender = 'Male';
                  });
                },
              ),
              GenderButton(
                gender: 'Female',
                icon: Icons.female,
                isSelected: selectedGender == 'Female',
                onTap: () {
                  setState(() {
                    selectedGender = 'Female';
                  });
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 200, 196, 196),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text("Height (cm)", style: TextStyle(fontSize: 30)),
                Slider(
                  value: height,
                  min: 100,
                  max: 250,
                  onChanged: (vlaue) {
                    setState(() {
                      height = vlaue;
                    });
                  },
                ),
                Text(
                  height.toInt().toString(),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: [
              CounterCard(
                label: 'Weight',
                value: weight,
                onAdd: () {
                  setState(() {
                    weight++;
                  });
                },
                onRemove: () {
                  setState(() {
                    weight--;
                  });
                },
              ),
              CounterCard(
                label: 'Age',
                value: age,
                onAdd: () {
                  setState(() {
                    age++;
                  });
                },
                onRemove: () {
                  setState(() {
                    age--;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          bmi > 0
              ? Text(
                "Your BMI is: '${bmi.toStringAsFixed(1)}'",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              )
              : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Claculatebmi,
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.calculate, color: Colors.white),
      ),
    );
  }
}
