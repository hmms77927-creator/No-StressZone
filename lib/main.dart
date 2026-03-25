import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_project_1/VIEW/HOME/home.dart';
import 'package:new_project_1/VIEW/WELLCOME_SCREEN/wellcome.dart';
import 'VIEW/ADD_CONTACTS/add_contacts.dart';
import 'VIEW/BOTTOMNAVIGATIONBAR/bottom_navigationbar.dart';
import 'VIEW/BRETHWORK/breathwork.dart';
import 'VIEW/CHOCE_YOUR_GOAL/chose_goal.dart';
import 'VIEW/CREATE_GROUP/create_group.dart';
import 'VIEW/Community/community.dart';
import 'VIEW/FLUXSOOUND/flux.dart';
import 'VIEW/GROUP_PAGE/group_page.dart';
import 'VIEW/GROUP_PAGE_1/group_page_1.dart';
import 'VIEW/GUIDED_VISULIZATION/guided_visulization.dart';
import 'VIEW/MEDIDATION_PLAYER/medidation_player.dart';
import 'VIEW/MENTAL_WELLNESS/metall_wellness.dart';
import 'VIEW/MIND_BODY_MOVEMENTS/mind_body_movements.dart';
import 'VIEW/POSITIVE_PHYSCHOLOGY/positive_physhology.dart';
import 'VIEW/SEND_MESSAGE/send_message.dart';
import 'VIEW/SOUND_PLAYER/sound_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BubbleBottomNav(),
    );
  }
}
