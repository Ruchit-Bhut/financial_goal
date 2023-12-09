import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_goal/helper/helper.dart';
import 'package:financial_goal/model/financial_model.dart';
import 'package:financial_goal/provider/financial_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
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
      backgroundColor: const Color(0xff2D2C79),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: context.read<FinancialProvider>().getFinancialData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                children: [
                  SizedBox(
                    height: AppBar().preferredSize.height,
                  ),
                  const Text(
                    'Buy a dream house',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // AnimatedLinearProgressIndicator(
                  //   value: progressValue, // progress value
                  //   backgroundColor: Colors.grey[300],
                  //   valueColor: Colors.blue, // progress color
                  // ),
                  SleekCircularSlider(

                    appearance: CircularSliderAppearance(

                      customColors: CustomSliderColors(

                        trackColor: Colors.red,
                        progressBarColor: Colors.white30,
                        shadowMaxOpacity: 90,
                      ),
                      infoProperties: InfoProperties(
                        topLabelText: '\u0024${getFormatString(snapshot.data!.totalAmount,context)}',
                        topLabelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    initialValue: (snapshot.data!.totalAmount * 100) / snapshot.data!.targetAmount,
                    onChange: (double value) {},
                  ),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Goal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            snapshot.data!.targetDate,
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '\u0024${getFormatString(snapshot.data!.targetAmount,context)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xff266CEA,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Need more savings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Monthly Saving Projection',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\u0024${getFormatString((snapshot.data!.targetAmount - snapshot.data!.totalAmount),context)}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\u0024${getFormatString(snapshot.data!.contribution,context)}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Contributions',
                              style: TextStyle(
                                color: Color(0xff0E0E65),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Show History',
                              style: TextStyle(
                                color: Color(0xff0E0E65),
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 18,
                              width: 330,
                              decoration: BoxDecoration(
                                color: const Color(0xff26dcc2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: 18,
                              width: 280,
                              decoration: BoxDecoration(
                                color: const Color(0xfff9ca1e),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: 18,
                              width: 180,
                              decoration: BoxDecoration(
                                color: const Color(0xff2670F3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

// class AnimatedLinearProgressIndicator extends AnimatedWidget {
//   final double? value; // progress value
//   final Color backgroundColor;
//   final Color valueColor;
//
//   AnimatedLinearProgressIndicator({
//     required Key key,
//      this.value,
//     this.backgroundColor = Colors.grey,
//     this.valueColor = Colors.blue,
//   }) : super(key: key, listenable: Tween<double>(begin: 0.0, end: value).animate(CurvedAnimation(parent: va, curve: curve)));
//
//   @override
//   Widget build(BuildContext context) {
//     final animation = listenable as Animation<double>;
//     return Container(
//       height: 10,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5.0),
//         color: backgroundColor,
//       ),
//       child: FractionallySizedBox(
//         widthFactor: animation.value,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5.0),
//             color: valueColor,
//           ),
//         ),
//       ),
//     );
//   }
// }
