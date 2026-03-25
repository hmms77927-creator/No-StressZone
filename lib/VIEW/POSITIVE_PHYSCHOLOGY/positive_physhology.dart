import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
import 'package:new_project_1/VIEW/WIDGETS/TEXTFIELD/textfield.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../Constant/appImages.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';

class PositivePhyshology extends StatefulWidget {
  const PositivePhyshology({super.key});

  @override
  State<PositivePhyshology> createState() => _PositivePhyshologyState();
}

class _PositivePhyshologyState extends State<PositivePhyshology> {
  int selectedIndex = 3;
  double value = 70;

  final List<String> items = [
    AppSVG.emoji_1,
    AppSVG.emoji_2,
    AppSVG.emoji_3,
    AppSVG.emoji_4,
    AppSVG.emoji_5,
  ];
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
                  child: PrimaryContainer(text: 'What are you Grateful For Today?', colors:AppColors.white ),
                ),
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 15,right: 10),
              child: PositiveTextField(text: 'Type Here....'),
            ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                SizedBox(
                  height: 250, // pehle 190, ab bada
                  width: 250,  // optional, agar square chahiye
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
                          thickness: 30, // pehle 22, ab thick for bigger gauge
                          cornerStyle: CornerStyle.bothCurve,
                          color: Colors.transparent,
                        ),
                        ranges: [
                          GaugeRange(
                            startValue: 0,
                            endValue: 19.5,
                            startWidth: 50, // bada karo
                            endWidth: 50,   // bada karo
                            color: const Color(0xffD58D74),
                          ),
                          GaugeRange(
                            startValue: 20.5,
                            endValue: 39.5,
                            startWidth: 50,
                            endWidth: 50,
                            color: const Color(0xff8AD39B),
                          ),
                          GaugeRange(
                            startValue: 40.5,
                            endValue: 59.5,
                            startWidth: 50,
                            endWidth: 50,
                            color: const Color(0xffE8C06C),
                          ),
                          GaugeRange(
                            startValue: 60.5,
                            endValue: 79.5,
                            startWidth: 50,
                            endWidth: 50,
                            color: const Color(0xff8EC3DA),
                          ),
                          GaugeRange(
                            startValue: 80.5,
                            endValue: 100,
                            startWidth: 50,
                            endWidth: 50,
                            color: AppColors.pinkcolor,
                          ),
                        ],
                        pointers: [
                          NeedlePointer(
                            value: value,
                            needleLength: 0.5, // thoda lamba karo
                            needleColor: AppColors.yellowColor,
                            knobStyle: const KnobStyle(
                              color: Colors.white,
                              knobRadius: 0.08, // knob bhi thoda bada
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    items.length,
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
                          // color: const Color(0xff2A2A2E),
                          border: Border(bottom:BorderSide(width: 1,color: AppColors.white),top:BorderSide(width: 1,color: AppColors.white),left: BorderSide(width: 1,color: AppColors.white),right: BorderSide(width: 1,color: AppColors.white),   ),
                          gradient: LinearGradient(colors: [AppColors.white.withOpacity(0.47),AppColors.black]),
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
                        child: SvgPicture.asset(
                          items[index],   // SVG path
                          width: 30,
                          height: 30,
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Videobottombutton(text: 'Morning Flow', onPressed: (){}),
                          )),
                      SizedBox(
                          width: 141,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Videobottombutton(text: 'Mid-Day-Stretch', onPressed: (){}),
                          )),
                      SizedBox(
                          height: 38,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Videobottombutton(text: ' Evening-Relax', onPressed: (){}),
                          )),
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