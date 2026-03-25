// import 'package:flutter/material.dart';
// import 'package:new_project_1/Constant/appColors.dart';
// import 'package:new_project_1/Constant/appImages.dart';
// import 'package:new_project_1/VIEW/WIDGETS/CARDS/cards.dart';
// import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
//
// import '../BRETHWORK/breathwork.dart';
// import '../GUIDED_VISULIZATION/guided_visulization.dart';
// import '../MEDIDATION_PLAYER/medidation_player.dart';
// import '../MIND_BODY_MOVEMENTS/mind_body_movements.dart';
// import '../POSITIVE_PHYSCHOLOGY/positive_physhology.dart';
//
// class MentalWellness extends StatefulWidget {
//   const MentalWellness({super.key});
//
//   @override
//   State<MentalWellness> createState() => _MentalWellnessState();
// }
//
// class _MentalWellnessState extends State<MentalWellness> {
//   int? selectedIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity ,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               AppColors.yellowColor.withOpacity(0.55),
//               AppColors.screenColor
//             ],
//             stops: const [0.0, 0.2],
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Center(
//                   child: headerContainer(
//                     text: 'Mental Wellness',
//                     colors: AppColors.white,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
//                   child: wellnesscard(
//                     text: 'Breathwork',
//                     title: 'Calm Your Breath',
//                     image: AppImages.wellness1,
//                     colors: selectedIndex == 0
//                         ? AppColors.black
//                         : AppColors.white,
//                     isSelect: selectedIndex == 0,
//                     onTap: () {
//                       Navigator.push(context,MaterialPageRoute(builder: (context)=>Breathwork()));
//
//                       setState(() {
//                         selectedIndex = selectedIndex == 0 ? null : 0;
//                       });
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
//                   child:wellnesscard(
//                     text: 'Positive Psychology',
//                     title: 'Boost mental Clarity',
//                     image: AppImages.wellness2,
//                     colors: selectedIndex == 1
//                         ? AppColors.black
//                         : AppColors.white,
//                     isSelect: selectedIndex == 1,
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = selectedIndex == 1 ? -1 : 1;
//                       });
//
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PositivePhyshology(),
//                         ),
//                       );
//                     },
//                     isSelected: selectedIndex == 1, // ✅ FIXED
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
//                   child: wellnesscard(
//                     text: 'Mind body Movements',
//                     title: 'Ease body tension',
//                     image: AppImages.wellness3,
//                     colors: selectedIndex == 2
//                         ? AppColors.black
//                         : AppColors.white,
//                     isSelect: selectedIndex == 2,
//                     onTap: () {
//                       Navigator.push(context,MaterialPageRoute(builder: (context)=>MindBodyMovements()));
//
//                       setState(() {
//                         selectedIndex = selectedIndex == 2 ? null : 2;
//                       });
//                     },
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
//                   child: wellnesscard(
//                     text: 'Guided Visualizations',
//                     title: 'Use Your Imagination',
//                     image: AppImages.wellness4,
//                     colors: selectedIndex == 3
//                         ? AppColors.black
//                         : AppColors.white,
//                     isSelect: selectedIndex == 3,
//                     onTap: () {
//                       Navigator.push(context,MaterialPageRoute(builder: (context)=>GuidedVisulization()));
//                       setState((
//
//                           ) {
//                         selectedIndex = selectedIndex == 3 ? null : 3;
//                       });
//                     },
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
//                   child: wellnesscard(
//                     text: 'Guided Meditations',
//                     title: 'Guided Meditations',
//                     image: AppImages.wellness5,
//                     colors: selectedIndex == 4
//                         ? AppColors.black
//                         : AppColors.white,
//                     isSelect: selectedIndex == 4,
//                     onTap: () {
//                       Navigator.push(context,MaterialPageRoute(builder: (context)=>MedidationPlayer()));
//                       setState(() {
//                         selectedIndex = selectedIndex == 4 ? null : 4;
//                       });
//                     },
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/Constant/appImages.dart';
import 'package:new_project_1/VIEW/WIDGETS/CARDS/cards.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';

import '../BRETHWORK/breathwork.dart';
import '../GUIDED_VISULIZATION/guided_visulization.dart';
import '../MEDIDATION_PLAYER/medidation_player.dart';
import '../MIND_BODY_MOVEMENTS/mind_body_movements.dart';
import '../POSITIVE_PHYSCHOLOGY/positive_physhology.dart';

class MentalWellness extends StatefulWidget {
  const MentalWellness({super.key});

  @override
  State<MentalWellness> createState() => _MentalWellnessState();
}

class _MentalWellnessState extends State<MentalWellness> {
  int selectedIndex = -1; // no null, only int

  final List<Map<String, dynamic>> wellnessItems = [
    {
      "text": "Breathwork",
      "title": "Calm Your Breath",
      "image": AppImages.wellness1,
      "page": Breathwork(),
    },
    {
      "text": "Positive Psychology",
      "title": "Boost mental Clarity",
      "image": AppImages.wellness2,
      "page": PositivePhyshology(),
    },
    {
      "text": "Mind Body Movements",
      "title": "Ease body tension",
      "image": AppImages.wellness3,
      "page": MindBodyMovements(),
    },
    {
      "text": "Guided Visualizations",
      "title": "Use Your Imagination",
      "image": AppImages.wellness4,
      "page": GuidedVisulization(),
    },
    {
      "text": "Guided Meditations",
      "title": "Guided Meditations",
      "image": AppImages.wellness5,
      "page": MedidationPlayer(),
    },
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
              AppColors.screenColor,
            ],
            stops: const [0.0, 0.2],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: headerContainer(
                        text: 'Mental Wellness',
                        colors: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ...List.generate(wellnessItems.length, (index) {
                    final item = wellnessItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: wellnesscard(
                        text: item["text"],
                        title: item["title"],
                        image: item["image"],
                        colors: selectedIndex == index
                            ? AppColors.black
                            : AppColors.white,
                        isSelect: selectedIndex == index,
                        isSelected: selectedIndex == index,
                        onTap: () {
                          setState(() {
                            selectedIndex =
                            selectedIndex == index ? -1 : index;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => item["page"],
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}