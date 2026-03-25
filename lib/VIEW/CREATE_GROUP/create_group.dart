import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project_1/VIEW/ADD_CONTACTS/add_contacts.dart';
import '../../Constant/appColors.dart';
import '../../Constant/appImages.dart';
import '../../Routes/app_pages.dart';
import '../BOTTOMNAVIGATIONBAR/bottom_navigationbar.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CARDS/cards.dart';
import '../WIDGETS/CONTAINERS/containers.dart';
import '../WIDGETS/TEXTFIELD/textfield.dart';
class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});
  @override
  State<CreateGroup> createState() => _CreateGroupState();
}
class _CreateGroupState extends State<CreateGroup> {
  int? selectedIndex;
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
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    headerContainer(text: 'Create Group', colors: AppColors.white),
                    const Spacer(),
                    notificattionbutton(onPressed: () {}, icons: Icons.notifications),
                  ],
                ),
                const SizedBox(height: 15),
                HeaderField(text: 'Group Name'),
                const SizedBox(height: 20),
                PrimaryContainer(text: 'Members', colors: AppColors.white),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: radiuscontainer(image: AppImages.addcontact1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: radiuscontainer(image: AppImages.addcontact2),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: radiuscontainer(image: AppImages.addcontact3),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: radiuscontainer(image: AppImages.addcontact4),
                      ),
                      radiuscontainer(image: AppImages.addcontact5),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryContainer(text: 'Select a Group Goal', colors: AppColors.white),
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
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: 228,
                    height: 59,
                    child: CustomButton(
                      onPressed: () {
                        Get.toNamed(AppPages.addContacts);
                      },
                      text: 'Create Group',
                      colors: AppColors.black,
                      buttoncolor: AppColors.yellowColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
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
        child: Row(children: children),
      ),
    );
  }
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