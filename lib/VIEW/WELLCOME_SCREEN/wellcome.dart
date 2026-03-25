import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project_1/Constant/appImages.dart';
import '../../Routes/app_pages.dart';
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
      Get.toNamed(AppPages.choseGoal);
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

