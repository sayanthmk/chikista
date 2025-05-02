import 'package:chikitsa/addmedicine/add_medicin.dart';
import 'package:chikitsa/constants/color/colors.dart';
import 'package:chikitsa/report_page/dashboard.dart';
import 'package:chikitsa/report_page/pie_chart.dart';
import 'package:chikitsa/widgets/bottom_nav_bar.dart';
import 'package:chikitsa/medic_page/medic_page.dart';
import 'package:chikitsa/profile/profile.dart';
import 'package:chikitsa/signup_page/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme:
            ColorScheme.fromSeed(seedColor: ChikitsaColors.primaryColor),
        useMaterial3: true,
      ),
      home: SignInScreen(),
    );
  }
}
