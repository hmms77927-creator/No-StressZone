import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appImages.dart';

import '../CHOCE_YOUR_GOAL/chose_goal.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({super.key});

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChoseGoal()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          AppImages.wellcome,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}