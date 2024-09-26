import 'package:bmi/components/reusableCard.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {required this.bmi, required this.result, required this.interpretation});

  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 8,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      bmi,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 100),
                    ),
                    Text(
                      interpretation,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: const Center(
                    child: Text(
                  'RE-CALCULATE',
                  style: kCalculate,
                )),
                color: kBottomContainerColor,
                margin: const EdgeInsets.only(top: 10),
                height: kBottomContainerHeight,
                padding: EdgeInsets.only(bottom: 10),
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
