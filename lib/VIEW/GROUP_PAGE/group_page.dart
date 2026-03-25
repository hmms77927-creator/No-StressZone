import 'package:flutter/material.dart';
import 'package:new_project_1/VIEW/WIDGETS/BUTTONS/app_buttons.dart';
import 'package:new_project_1/VIEW/WIDGETS/CARDS/cards.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
import 'package:wave_linear_progress_indicator/wave_linear_progress_indicator.dart';

import '../../Constant/appColors.dart';
import '../../Constant/appImages.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
double value=0.5;
double value1=0.5;
double value2=0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
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
        child: SingleChildScrollView(
          child: SafeArea(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headcontainer('Group Page', AppColors.white),
                    notificattionbutton(onPressed: (){}, icons: Icons.add)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: SizedBox(
                      width: 353,
                      height: 70,
                      child: Groupcard(text: 'Health Friends', onPressed:(){})),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 15),
                child: PrimaryContainer(text: 'Member Progress', colors:AppColors.white ),
              ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.cardcolor,
              ),
              child:
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Padding(
            padding: const EdgeInsets.only(left:10,top: 10 ),
            child: membercontainer(text: 'John Smith'),
          ),
          slidercontainer(onChanged: (newvalue){setState(() {
           value =newvalue;
          });}, colors: AppColors.parratcolor, value: value),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: subContainer(text: '10 /14', colors: AppColors.white),
              )),
          Padding(
            padding: const EdgeInsets.only(left:10,top: 10 ),
            child: membercontainer(text: 'Mary Johnson'),
          ),
          slidercontainer(onChanged: (newvalue){setState(() {
            value1=newvalue;
          });}, colors: AppColors.skycolor, value: value1),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: subContainer(text: '6 /14', colors: AppColors.white),
              )),
          Padding(
            padding: const EdgeInsets.only(left:10,top: 10 ),
            child: membercontainer(text: 'Jane Doe'),
          ),
          slidercontainer(onChanged: (newvalue){setState(() {
            value2=newvalue;
          });}, colors: AppColors.pinkcolor, value: value2),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: subContainer(text: '2 /14', colors: AppColors.white),
              )),
                ],
              ),
            ),
          ),
              Padding(
                padding: const EdgeInsets.only(left: 15,bottom: 15),
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
          ) ),
        ),
      ) ,
    );
  }
}
