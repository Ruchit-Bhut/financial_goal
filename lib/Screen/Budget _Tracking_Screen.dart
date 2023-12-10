import 'dart:math';

import 'package:financial_goal/helper/helper.dart';
import 'package:financial_goal/provider/financial_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetTrackingScreen extends StatefulWidget {
  const BudgetTrackingScreen({super.key});

  @override
  State<BudgetTrackingScreen> createState() => _BudgetTrackingScreenState();
}

class _BudgetTrackingScreenState extends State<BudgetTrackingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController1;
  late Animation<double> _animation1;

  @override
  void initState() {
    super.initState();
    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );

    _animation1 =
        Tween<double>(begin: 0.0, end: 0.8).animate(_animationController1);

    // Start the animation when the screen loads
    _animationController1.forward();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Start the animation when the screen loads
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController.dispose();
    super.dispose();
  }

  double generatePercentage(int totalValue, int targetValue) {
    final percentage = (totalValue * 100) / targetValue;
    final animationValue = (percentage * 0.8) / 100;
    return animationValue;
  }

  @override
  Widget build(BuildContext context) {
    const circleProgressSize = 250.0;
    const iconSize = 120.0;
    return Scaffold(
      backgroundColor: const Color(0xff2D2C79),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: StreamBuilder(
            stream: context.read<FinancialProvider>().getFinancialData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                children: [
                  const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text(
                        'Buy a dream house',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: circleProgressSize,
                            width: circleProgressSize,
                            child: Transform.rotate(
                              angle: pi / -1.25,
                              child: AnimatedBuilder(
                                animation: _animationController1,
                                builder: (context, child) {
                                  return CircularProgressIndicator(
                                    strokeWidth: 6,
                                    strokeCap: StrokeCap.round,
                                    color: Colors.white54,
                                    value: _animation1.value,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: circleProgressSize,
                            width: circleProgressSize,
                            child: Transform.rotate(
                              angle: pi / -1.25,
                              child: AnimatedBuilder(
                                animation: _animationController,
                                builder: (context, child) {
                                  return CircularProgressIndicator(
                                    strokeWidth: 6,
                                    strokeCap: StrokeCap.round,
                                    color: Colors.white,
                                    value: Tween<double>(
                                            begin: 0.0,
                                            end: generatePercentage(
                                                snapshot.data!.totalAmount,
                                                snapshot.data!.targetAmount))
                                        .animate(_animationController)
                                        .value,
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: circleProgressSize / 2 - 100,
                            bottom: circleProgressSize / 2 - 100,
                            left: circleProgressSize / 2 - iconSize,
                            right: circleProgressSize / 2 - iconSize,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.home_rounded,
                                  size: iconSize,
                                  color: Colors.white,
                                ),
                                Text(
                                  "\u0024${getFormatString(snapshot.data!.totalAmount, context)}",
                                  style: const TextStyle(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "You Saved",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white54),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

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
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Goal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            snapshot.data!.targetDate,
                            style: const TextStyle(
                              color: Colors.white38,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '\u0024${getFormatString(snapshot.data!.targetAmount, context)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xff266CEA,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
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
                            const SizedBox(height: 8,),

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
                              '\u0024${getFormatString((snapshot.data!.targetAmount - snapshot.data!.totalAmount), context)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8,),

                            Text(
                              '\u0024${getFormatString(snapshot.data!.contribution, context)}',
                              style: const TextStyle(
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
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff2670F3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    const SizedBox(width: 15,),
                                    const Text(
                                      'Monthly Salary',
                                      style: TextStyle(
                                        color: Color(0xff0E0E65),
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),

                                Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff9ca1e),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    const SizedBox(width: 15,),

                                    const Text(
                                      'All Expense',
                                      style: TextStyle(
                                        color: Color(0xff0E0E65),
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),

                                Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff26dcc2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    const SizedBox(width: 15,),

                                    const Text(
                                      'House Rant',
                                      style: TextStyle(
                                        color: Color(0xff0E0E65),
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\u0024${getFormatString(snapshot.data!.salary, context)}',
                                  style: const TextStyle(
                                    color: Color(0xff0E0E65),
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(height: 10,),

                                Text(
                                  '\u0024${getFormatString(snapshot.data!.allExpenses, context)}',
                                  style: const TextStyle(
                                    color: Color(0xff0E0E65),
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(height: 10,),

                                Text(
                                  '\u0024${getFormatString(snapshot.data!.houseRent, context)}',
                                  style: const TextStyle(
                                    color: Color(0xff0E0E65),
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
