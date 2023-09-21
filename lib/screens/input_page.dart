import 'package:bmi/widgets/calculator_brain.dart';
import 'package:bmi/iconContent.dart';
import 'package:bmi/widgets/reusablecard.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'result_page.dart';

enum Gender { male, female }

class inputpage extends StatefulWidget {
  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
  Gender? selectedGender;
  int Height = 180;
  int Weight = 60;
  int Age = 23;
  dynamic Bmi = 18.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI Calculator')),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      childCard: IconContent(icon: Icons.male, label: 'Male')),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    childCard: IconContent(icon: Icons.female, label: 'Female'),
                  ),
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColour,
              childCard: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'HEIGHT',
                      style: kLabelText,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          Height.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50),
                        ),
                        const Text(
                          'cm',
                          style: kLabelText,
                        )
                      ]),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor:
                            const Color.fromARGB(255, 85, 85, 85),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color.fromARGB(255, 236, 78, 131),
                        overlayColor: Colors.pink[200],
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: Height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            Height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('WEIGHT', style: kLabelText),
                      Text(
                        Weight.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 50),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor:
                                const Color.fromRGBO(53, 52, 52, 0.675),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                Weight = Weight - 1;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            backgroundColor:
                                const Color.fromRGBO(53, 52, 52, 0.675),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                Weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('AGE', style: kLabelText),
                      Text(
                        Age.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 50),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor:
                                const Color.fromRGBO(53, 52, 52, 0.675),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                Age = Age - 1;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            backgroundColor:
                                const Color.fromRGBO(53, 52, 52, 0.675),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                Age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            )),
            GestureDetector(
              onTap: () {
                calculatorBrain calc =
                    calculatorBrain(height: Height, weight: Weight, bmi: Bmi);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              interpretation: calc.getInterpretation(),
                              resultTest: calc.getResult(),
                            )));
              },
              child: Expanded(
                child: Container(
                  child: const Center(
                    child: Text(
                      'CALCULATOR',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                    ),
                  ),
                  color: kButtomContainerColour,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  height: kBottumContainerHeight,
                ),
              ),
            )
          ],
        ));
  }
}
