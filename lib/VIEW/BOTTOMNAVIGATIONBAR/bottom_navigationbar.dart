import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appColors.dart';

import '../Community/community.dart';
import '../GROUP_PAGE/group_page.dart';
import '../HOME/home.dart';
import '../MENTAL_WELLNESS/metall_wellness.dart';
import '../Profile/profile.dart';

class BubbleBottomNav extends StatefulWidget {
  const BubbleBottomNav({super.key});

  @override
  State<BubbleBottomNav> createState() => _BubbleBottomNavState();
}

class _BubbleBottomNavState extends State<BubbleBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),Community(),MentalWellness(),Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(colors:[
            AppColors.white.withOpacity(0.55),
            AppColors.black,
          ] ),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            bool isActive = _currentIndex == index;
            IconData icon;
            String label;
            switch (index) {
              case 0:
                icon = Icons.home;
                label = "Home";
                break;
              case 1:
                icon = Icons.people ;
                label = "Community";
                break;
              case 2:
                icon = Icons.settings;
                label = "Settings";
                break;
              default:
                icon = Icons.person;
                label = "Person";
            }
            return GestureDetector(
              onTap: () => setState(() => _currentIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.yellowColor : AppColors.white,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Row(
                  children: [
                    Icon(icon, color: isActive ? AppColors.black : AppColors.black),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      child: isActive
                          ? Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          label,
                          style: const TextStyle(
                              color:AppColors.black ,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}