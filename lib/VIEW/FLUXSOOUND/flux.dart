import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/Constant/appImages.dart';
import 'package:new_project_1/Routes/app_pages.dart';
import 'package:new_project_1/VIEW/WIDGETS/CARDS/cards.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
import 'package:new_project_1/VIEW/WIDGETS/TEXTFIELD/textfield.dart';

import '../BRETHWORK/breathwork.dart';
import '../SOUND_PLAYER/sound_player.dart';
class Flux extends StatefulWidget {
  const Flux({super.key});

  @override
  State<Flux> createState() => _FluxState();
}

class _FluxState extends State<Flux> {
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
          child: Column(
            children: [
              // Header
              Center(
                child: headerContainer(
                    text: 'Flux Sounds', colors: AppColors.white),
              ),
              const SizedBox(height: 15),
              // Search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: HeaderField(
                  text: 'Search',
                  prefixIcon: Icon(Icons.search, color: AppColors.white),
                ),
              ),
              const SizedBox(height: 15),
              // Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:
                PrimaryContainer(text: 'Categories', colors: AppColors.white),
              ),
              const SizedBox(height: 15),
              // Cards list
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FluxCard(
                        text: 'Rain',
                        title: 'Peaceful Rainfall',
                        image: AppImages.flux1,
                        isSelected: selectedIndex == 0,
                        onTap: () {
                          Get.toNamed(AppPages.soundPlayer);
                          setState(() {
                            selectedIndex = selectedIndex == 0 ? null : 0;
                          });
                        },
                        onPressed: () {},
                      ),
                      FluxCard(
                        text: 'Ocean',
                        title: 'Gentle Ocean',
                        image: AppImages.flux2,
                        isSelected: selectedIndex == 1,
                        onTap: () {
                          Get.toNamed(AppPages.breathWork);
                          setState(() {
                            selectedIndex = selectedIndex == 1 ? null : 1;
                          });
                        },
                        onPressed: () {},
                      ),
                      FluxCard(
                        text: 'White Noise',
                        title: 'Ambient Sound',
                        image: AppImages.flux3,
                        isSelected: selectedIndex == 2,
                        onTap: () {
                          setState(() {
                            selectedIndex = selectedIndex == 2 ? null : 2;
                          });
                        },
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
