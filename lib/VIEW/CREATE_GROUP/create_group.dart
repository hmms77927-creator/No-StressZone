import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appImages.dart';
import 'package:new_project_1/VIEW/WIDGETS/CARDS/cards.dart';
import 'package:new_project_1/VIEW/WIDGETS/TEXTFIELD/textfield.dart';
import '../../Constant/appColors.dart';
import '../GROUP_PAGE_1/group_page_1.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CONTAINERS/containers.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  int? selectedIndex;

  final List<Map<String, dynamic>> goalCards = [
    {'title': 'Reduce Stress', 'image': AppImages.goal_1, 'width': 194.0},
    {'title': 'Reduce Anxiety symptoms', 'image': AppImages.goal_2, 'width': 295.0},
    {'title': 'Boost Focus', 'image': AppImages.goal_1, 'width': 174.0},
    {'title': 'Emotion Regulation', 'image': AppImages.goal_3, 'width': 236.0},
    {'title': 'Build mental fitness', 'image': AppImages.goal_6, 'width': 237.0},
    {'title': 'Build Healthy Habits', 'image': AppImages.goal_4, 'width': 242.0},
    {'title': 'Boost productivity', 'image': AppImages.goal_1, 'width': 226.0},
    {'title': 'Improve Sleep', 'image': AppImages.goal_5, 'width': 200.0},
  ];

  @override
  Widget build(BuildContext context) {
    // Split goalCards into chunks of 2 for rows
    List<List<Map<String, dynamic>>> cardRows = [];
    for (var i = 0; i < goalCards.length; i += 2) {
      cardRows.add(goalCards.sublist(i, (i + 2 > goalCards.length) ? goalCards.length : i + 2));
    }

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: headerContainer(text: 'Add Contacts', colors: AppColors.white),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: notificattionbutton(onPressed: () {}, icons: Icons.notifications),
                    ),
                  ],
                ),
                HeaderField(text: 'Group Name'),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: PrimaryContainer(text: 'Members', colors: AppColors.white),
                ),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: radiuscontainer(image: AppImages.addcontact5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: PrimaryContainer(text: 'Select a Group Goal', colors: AppColors.white),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cardRows.length,
                    itemBuilder: (context, rowIndex) {
                      final rowCards = cardRows[rowIndex];
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: rowCards.map((card) {
                            final index = goalCards.indexOf(card);
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: SizedBox(
                                  width: card['width'],
                                  height: 60,
                                  child: choseCard(
                                    card['title'],
                                    card['image'],
                                    color: selectedIndex == index ? AppColors.black : AppColors.white,
                                    isSelect: selectedIndex == index,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>GroupPage1()) );
                      },
                      text: 'Create Group',
                      colors: AppColors.black,
                      buttoncolor: AppColors.yellowColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:new_project_1/Constant/appImages.dart';
// import 'package:new_project_1/VIEW/WIDGETS/CARDS/cards.dart';
// import 'package:new_project_1/VIEW/WIDGETS/TEXTFIELD/textfield.dart';
// import '../../Constant/appColors.dart';
// import '../GROUP_PAGE_1/group_page_1.dart';
// import '../WIDGETS/BUTTONS/app_buttons.dart';
// import '../WIDGETS/CONTAINERS/containers.dart';
//
// class CreateGroup extends StatefulWidget {
//   const CreateGroup({super.key});
//
//   @override
//   State<CreateGroup> createState() => _CreateGroupState();
// }
//
// class _CreateGroupState extends State<CreateGroup> {
//   int? selectedIndex;
//
//   final List<Map<String, dynamic>> goalCards = [
//     {'title': 'Reduce Stress', 'image': AppImages.goal_1, 'width': 194.0},
//     {'title': 'Reduce Anxiety symptoms', 'image': AppImages.goal_2, 'width': 295.0},
//     {'title': 'Boost Focus', 'image': AppImages.goal_1, 'width': 174.0},
//     {'title': 'Emotion Regulation', 'image': AppImages.goal_3, 'width': 236.0},
//     {'title': 'Build mental fitness', 'image': AppImages.goal_6, 'width': 237.0},
//     {'title': 'Build Healthy Habits', 'image': AppImages.goal_4, 'width': 242.0},
//     {'title': 'Boost productivity', 'image': AppImages.goal_1, 'width': 226.0},
//     {'title': 'Improve Sleep', 'image': AppImages.goal_5, 'width': 200.0},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     // Split goalCards into chunks of 2 for rows
//     List<List<Map<String, dynamic>>> cardRows = [];
//     for (var i = 0; i < goalCards.length; i += 2) {
//       cardRows.add(goalCards.sublist(i, (i + 2 > goalCards.length) ? goalCards.length : i + 2));
//     }
//
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
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
//             padding: const EdgeInsets.all(15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header Row
//                 Row(
//                   children: [
//                     headerContainer(text: 'Add Contacts', colors: AppColors.white),
//                     Spacer(),
//                     notificattionbutton(onPressed: () {}, icons: Icons.notifications),
//                   ],
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 HeaderField(text: 'Group Name'),
//
//                 const SizedBox(height: 15),
//
//                 PrimaryContainer(text: 'Members', colors: AppColors.white),
//
//                 const SizedBox(height: 10),
//
//                 SizedBox(
//                   height: 100,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: radiuscontainer(image: AppImages.addcontact1),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: radiuscontainer(image: AppImages.addcontact2),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: radiuscontainer(image: AppImages.addcontact3),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: radiuscontainer(image: AppImages.addcontact4),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: radiuscontainer(image: AppImages.addcontact5),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 PrimaryContainer(text: 'Select a Group Goal', colors: AppColors.white),
//
//                 const SizedBox(height: 10),
//
//                 // Goal Cards
//                 Column(
//                   children: cardRows.map((rowCards) {
//                     return SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: rowCards.map((card) {
//                           final index = goalCards.indexOf(card);
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedIndex = index;
//                                 });
//                               },
//                               child: SizedBox(
//                                 width: card['width'],
//                                 height: 60,
//                                 child: choseCard(
//                                   card['title'],
//                                   card['image'],
//                                   color: selectedIndex == index ? AppColors.black : AppColors.white,
//                                   isSelect: selectedIndex == index,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 Center(
//                   child: CustomButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => GroupPage1()),
//                       );
//                     },
//                     text: 'Create Group',
//                     colors: AppColors.black,
//                     buttoncolor: AppColors.yellowColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
