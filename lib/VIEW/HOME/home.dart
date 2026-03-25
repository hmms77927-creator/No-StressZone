import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../Constant/appColors.dart';
import '../../Constant/appImages.dart';
import '../Community/community.dart';
import '../FLUXSOOUND/flux.dart';
import '../GROUP_PAGE/group_page.dart';
import '../MENTAL_WELLNESS/metall_wellness.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CONTAINERS/containers.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectedIndex = -1; // 👈 BEST PRACTICE

  double value = 0.6;

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
              AppColors.screenColor,
            ],
            stops: const [0.0, 0.2],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [

                  /// 🔹 TOP HEADER
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              headerContainer(
                                text: 'Good Morning',
                                colors: AppColors.white,
                              ),
                              SizedBox(width: 5),
                              Image.asset(AppImages.hand, width: 25),
                            ],
                          ),
                          subContainer(
                            text: 'Mon , Jun 9',
                            colors: AppColors.white,
                          ),
                        ],
                      ),
                      Spacer(),
                      notificattionbutton(
                        onPressed: () {},
                        icons: Icons.notifications,
                      ),
                    ],
                  ),

                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.white.withOpacity(0.47),
                          AppColors.white.withOpacity(0.0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      border: Border(
                        top: BorderSide(color: AppColors.white),
                        bottom: BorderSide(color: AppColors.yellowColor),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircularPercentIndicator(
                          radius: 40,
                          lineWidth: 12,
                          percent: 0.7,
                          progressColor: AppColors.yellowColor,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: PrimaryContainer(
                            text: '33%',
                            colors: AppColors.yellowColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Homebodycontainer1(text: 'Activities of the'),
                            Row(
                              children: [
                                Homebodycontainer1(text: 'Day 1/3'),
                                SizedBox(width: 5),
                                Image.asset(AppImages.homepic, width: 20),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MentalWellness()),
                          );
                        },
                        child: homecontainer(
                          text: 'Mental\n Wellness',
                          colors: selectedIndex == 0
                              ? AppColors.black
                              : AppColors.white,
                          image: AppImages.home1,
                          containcolors: selectedIndex == 0
                              ? AppColors.yellowColor
                              : AppColors.black,
                          isSelected: selectedIndex == 0,
                        ),
                      ),

                      /// 1
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Flux()),
                          );
                        },
                        child: homecontainer(
                          text: 'Flux\n Sounds',
                          colors: selectedIndex == 1
                              ? AppColors.black
                              : AppColors.white,
                          image: AppImages.home2,
                          containcolors: selectedIndex == 1
                              ? AppColors.yellowColor
                              : AppColors.black,
                          isSelected: selectedIndex == 1,
                        ),
                      ),

                      /// 2
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Community()),
                          );
                        },
                        child: homecontainer(
                          text: 'Community',
                          colors: selectedIndex == 2
                              ? AppColors.black
                              : AppColors.white,
                          image: AppImages.home3,
                          containcolors: selectedIndex == 2
                              ? AppColors.yellowColor
                              : AppColors.black,
                          isSelected: selectedIndex == 2,
                        ),
                      ),

                      /// 3
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 3;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GroupPage()),
                          );
                        },
                        child: homecontainer(
                          text: 'Affirmation\n of the Day',
                          colors: selectedIndex == 3
                              ? AppColors.black
                              : AppColors.white,
                          image: AppImages.home4,
                          containcolors: selectedIndex == 3
                              ? AppColors.yellowColor
                              : AppColors.black,
                          isSelected: selectedIndex == 3,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  BodyLastContainer(
                    text: 'Anxiety Reduction Routine',
                    title: 'To Week 2 Day 3',
                    onChanged: (newvalue) {
                      value = newvalue;
                    },
                    values: value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}