import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
import 'package:new_project_1/VIEW/WIDGETS/TEXTFIELD/textfield.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../WIDGETS/BUTTONS/app_buttons.dart';

class PositivePhyshology extends StatefulWidget {
  const PositivePhyshology({super.key});

  @override
  State<PositivePhyshology> createState() => _PositivePhyshologyState();
}

class _PositivePhyshologyState extends State<PositivePhyshology> {
  int selectedIndex = 3;
  double value = 70;

  final List moods = ["😡","🙂","😐","😊","😄"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.yellowColor.withOpacity(0.55),
              AppColors.screenColor
            ],
            stops: const [0.0, 0.2],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: headerContainer(text: 'Positive Psychology', colors: AppColors.white)),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Center(child: PrimaryContainer(text: 'What are you Grateful For Today?', colors:AppColors.white )),
                ),
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 15,right: 10),
              child: PositiveTextField(text: 'Type Here....'),
            ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: PrimaryContainer(text: 'Mood Tracking ', colors: AppColors.white),
                      ),
                  Center(
                    child: Container(
            width: 340,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xff1A1A1D),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            
                /// TITLE
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Mood Tracking",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                /// GAUGE
                SizedBox(
                  height: 190,
                  child: SfRadialGauge(
                    axes: [
            
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        startAngle: 180,
                        endAngle: 0,
                        showLabels: false,
                        showTicks: false,
            
                        axisLineStyle: const AxisLineStyle(
                          thickness: 22,
                          cornerStyle: CornerStyle.bothCurve,
                        ),
            
                        ranges: [
            
                          GaugeRange(
                            startValue: 0,
                            endValue: 20,
                            startWidth: 30,
                            endWidth: 30,
                            color: const Color(0xffD58D74),
                          ),
            
                          GaugeRange(
                            startValue: 20,
                            endValue: 40,
                            startWidth: 30,
                            endWidth: 30,
                            color: const Color(0xff8AD39B),
                          ),
            
                          GaugeRange(
                            startValue: 40,
                            endValue: 60,
                            startWidth: 30,
                            endWidth: 30,
                            color: const Color(0xffE8C06C),
                          ),
            
                          GaugeRange(
                            startValue: 60,
                            endValue: 80,
                            startWidth: 30,
                            endWidth: 30,
                            color: const Color(0xff8EC3DA),
                          ),
            
                          GaugeRange(
                            startValue: 80,
                            startWidth: 30,
                            endWidth: 30,
                            endValue: 100,
                            color: const Color(0xffE2A5C7),
                          ),
                        ],
            
                        pointers: [
            
                          NeedlePointer(
                            value: value,
                            needleLength: 0.6,
                            needleColor: Colors.yellow,
                            knobStyle: const KnobStyle(
                              color: Colors.white,
                              knobRadius: 0.07,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 25),
            
                /// EMOJIS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    moods.length,
                        (index) => GestureDetector(
            
                      onTap: (){
                        setState(() {
                          selectedIndex = index;
                          value = (index + 1) * 20;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff2A2A2E),
                          boxShadow: index == selectedIndex
                              ? [
                            BoxShadow(
                              color: Colors.yellow.withOpacity(.7),
                              blurRadius: 25,
                              spreadRadius: 2,
                            )
                          ]
                              : [],
                        ),
                        child: Text(
                          moods[index],
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
                    ),
                  ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: PrimaryContainer(text: 'Options', colors:AppColors.white ),
                ),
                SizedBox(
                  height: 38,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                          width: 120,
                          child: Videobottombutton(text: 'Morning Flow', onPressed: (){})),
                      SizedBox(
                          width: 141,
                          child: Videobottombutton(text: 'Mid-Day Stretch', onPressed: (){})),
                      SizedBox(
                          height: 38,
                          child: Videobottombutton(text: ' Evening Relax', onPressed: (){})),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}