import 'package:bmi/constant.dart';
import 'package:bmi/widgets/reusablecard.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.resultTest,
      required this.interpretation,
      required this.bmiResult});

  final String bmiResult;
  final String resultTest;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 30, 30),
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(' Your Result', style: ktitleResult),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultTest.toUpperCase(),
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    bmiResult,
                    style: kBMTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyText,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop((context));
            },
            child: Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATOR',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                ),
                color: kButtomContainerColour,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: kBottumContainerHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
