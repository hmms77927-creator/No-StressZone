import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appImages.dart';
import '../../Constant/appColors.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CARDS/cards.dart';
import '../WIDGETS/CONTAINERS/containers.dart';

class GroupPage1 extends StatefulWidget {
  const GroupPage1({super.key});

  @override
  State<GroupPage1> createState() => _GroupPage1State();
}

class _GroupPage1State extends State<GroupPage1> {
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
        child: SafeArea(child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  PrimaryContainer(text: 'Group Page', colors:AppColors.white),
                  Spacer(),
                  notificattionbutton(onPressed: (){}, icons: Icons.add)
                ],
              ),
              Groupcard(text: 'Health Friends', onPressed:(){}),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                child: PrimaryContainer(text: 'Weekly Leaderboard', colors:AppColors.white ),
              ),
          Card(
            color: AppColors.cardcolor,
            child: Column(
              children: [
                Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            subContainer(text: 'Player', colors: AppColors.white.withOpacity(0.8)),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: subContainer(text: 'Today', colors: AppColors.white.withOpacity(0.8)),
            ),
            Padding(
              padding: const EdgeInsets.only(right:15),            child: Container(
                height: 20,
                width: 1,
                color: Colors.white54,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10), child: subContainer(text: 'Player', colors: AppColors.white.withOpacity(0.8)),
            ),
          ],
                ),
                UserTile(name: 'John Smith', image: AppImages.addcontact1, score: 14, total:22),
                UserTile(name: 'Mary Johnson', image: AppImages.addcontact2, score: 14, total:22),
                UserTile(name: 'Jane Doe', image: AppImages.addcontact3, score: 14, total:22),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 20),
            child: PrimaryContainer(text: 'Leaderboard', colors: AppColors.white),
          ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: LeaderCard(text: 'John Smith', image:AppImages.addcontact1, onPressed: (){}, subtext: '1', images: AppImages.buttonImage, title: '140',),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: LeaderCard(text: 'Mary Johnson', image:AppImages.addcontact2, onPressed: (){}, subtext: '2', images: AppImages.buttonImage, title: '140',),
              ),
            ],
          ),
        ) ),
      ),
    );
  }
}
