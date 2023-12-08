import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

class BudgetTrackingScreen extends StatefulWidget {
  const BudgetTrackingScreen({super.key});

  @override
  State<BudgetTrackingScreen> createState() => _BudgetTrackingScreenState();
}

class _BudgetTrackingScreenState extends State<BudgetTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D2C79),
      body: Column(
        children: [
          SizedBox(
            height: AppBar().preferredSize.height,
          ),
          Text(
            'Buy a dream house',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SleekCircularSlider(
            appearance: CircularSliderAppearance(

              customColors: CustomSliderColors(
                trackColor: Colors.white,
                progressBarColor: Colors.white30,
                shadowMaxOpacity: 30,
              ),
              infoProperties: InfoProperties(topLabelText: 'Running....'),
            ),
            initialValue: 30,
            onChange: (double value) {
            },
          )
          // CircularPercentIndicator(
          //   radius: 80.0,
          //   lineWidth: 10.0,
          //   animation: true,
          //   percent: 0.5,
          //   center: Column(
          //     children: [
          //       new Text(
          //         "\u0024 25000",
          //         style:
          //         new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
          //       ),
          //     ],
          //   ),
          //   footer: new Text(
          //     "Sales this week",
          //     style:
          //     new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          //   ),
          //   circularStrokeCap: CircularStrokeCap.round,
          //   progressColor: Colors.purple,
          // ),
        ],
      ),
    );
  }
}
