import 'package:bmi/calculator_brain.dart';
import 'package:bmi/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/iconCard.dart';
import 'components/reusableCard.dart';
import 'components/roundedIconButton.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int heightCm = 180;
  int heightIn = 71;
  int weight = 200;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: IconCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    iconPassed: FontAwesomeIcons.mars,
                    data: "MALE",
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: IconCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    iconPassed: FontAwesomeIcons.venus,
                    data: "FEMALE",
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(heightCm.toString(), style: kHeavyFont),
                      const Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text((heightIn / 12).toDouble().toStringAsFixed(1),
                          style: kHeavyFont),
                      const Text(
                        'ft',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x32EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 16),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 32),
                      inactiveTrackColor: const Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: heightCm.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          heightCm = newValue.round();
                          heightIn = (heightCm * 0.393701).toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kHeavyFont,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight - 1 >= 110) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (weight + 1 <= 350) {
                                    weight++;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kHeavyFont,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (age - 1 >= 15) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (age + 1 <= 50) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: heightIn, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmi: calc.calculateBMI(),
                      result: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
            child: Container(
              child: const Center(
                  child: Text(
                'CALCULATE',
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
    );
  }
}
