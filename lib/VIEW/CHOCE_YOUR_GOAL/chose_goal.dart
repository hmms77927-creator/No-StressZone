import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/Constant/appImages.dart';
import '../../Routes/app_pages.dart';
import '../BOTTOMNAVIGATIONBAR/bottom_navigationbar.dart';
import '../HOME/home.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CARDS/cards.dart';
import '../WIDGETS/CONTAINERS/containers.dart';
class ChoseGoal extends StatefulWidget {
  const ChoseGoal({super.key});
  @override
  State<ChoseGoal> createState() => _ChoseGoalState();
}
class _ChoseGoalState extends State<ChoseGoal> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: headcontainer('Choose\nYour Goals', AppColors.white),
              ),
              const SizedBox(height: 20),
              buildHorizontalRow([
                buildCard(0, 'Reduce Stress', AppImages.goal_1, 194),
                buildCard(1, 'Reduce Anxiety symptoms', AppImages.goal_2, 300),
              ]),
              buildHorizontalRow([
                buildCard(2, 'Boost Focus', AppImages.goal_1, 174),
                buildCard(3, 'Emotion Regulation', AppImages.goal_3, 236),
              ]),
              buildHorizontalRow([
                buildCard(4, 'Build mental fitness', AppImages.goal_1, 237),
                buildCard(5, 'Build Healthy Habits', AppImages.goal_4, 242),
              ]),
              buildHorizontalRow([
                buildCard(6, 'Boost productivity', AppImages.goal_1, 220),
                buildCard(7, 'Improve Sleep', AppImages.goal_5, 236),
              ]),
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: bottombutton(
                    AppImages.arrowbutton,
                    AppColors.yellowColor,
                    onTap: () {
                      if (selectedIndex == -1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please select a goal first"),
                          ),
                        );
                      } else {
                        Get.toNamed( AppPages.bottomNav);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildHorizontalRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: children,
        ),
      ),
    );
  }

  // 🔥 Card Builder
  Widget buildCard(int index, String title, String image, double width) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: width+20,
        height: 60,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: choseCard(
            title,
            image,
            color: selectedIndex == index
                ? AppColors.black
                : AppColors.white,
            isSelect: selectedIndex == index,
          ),
        ),
      ),
    );
  }
}
