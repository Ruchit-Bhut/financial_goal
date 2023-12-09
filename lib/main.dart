import 'package:financial_goal/Home_Screen.dart';
import 'package:financial_goal/Screen/Budget%20_Tracking_Screen.dart';
import 'package:financial_goal/firebase_options.dart';
import 'package:financial_goal/provider/financial_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => FinancialProvider(),)
      ],
      child: HomeScreen()),
    );
  }
}
