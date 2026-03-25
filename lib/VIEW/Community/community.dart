import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/Constant/appImages.dart';
import 'package:new_project_1/VIEW/WIDGETS/BUTTONS/app_buttons.dart';
import 'package:new_project_1/VIEW/WIDGETS/CARDS/cards.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';

import '../ADD_CONTACTS/add_contacts.dart';
import '../CREATE_GROUP/create_group.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
child: SafeArea(child: SingleChildScrollView(
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
          child: Row(
            children: [
              headerContainer(text: 'Community', colors:AppColors.white ),
              Spacer(),
              notificattionbutton(onPressed: (){}, icons: Icons.notifications),
            ],
          ),
        ),
    Padding(
      padding: const EdgeInsets.only(top: 20,left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 55,
              width:171,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateGroup()) );
                },
                child: communitytopcard(text: 'Create Group',),
              )),
          SizedBox(
              height: 55,
              width:171,
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>addcontacts()) );

                  },
                  child: communitytopcard(text: 'Add Contact'))),
        ],
      ),
    ),
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 15),
          child: PrimaryContainer(text: 'Active Group', colors:AppColors.white),
        ),
    Padding(
      padding: const EdgeInsets.only(left: 15,top: 15),
      child: communitygroupcard(text: 'We are Family', image:AppSVG.community1 , onPressed:(){} ),
    ),
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 15),
          child: communitygroupcard(text: 'Health Friends', image:AppSVG.community2 , onPressed:(){} ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 15),
          child: communitygroupcard(text: 'Work Buddies', image:AppSVG.community3 , onPressed:(){} ),
        ),
    Padding(
      padding: const EdgeInsets.only(left: 15,top: 15),
      child: PrimaryContainer(text: 'Suggested Contacts', colors:AppColors.white ),
    ),
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
          child: communitycontactcontainer(text: 'John Smith', image:AppImages.addcontact1, title:'Add', onPressed:(){} ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 5,right: 15),
          child: DashedLine(color:AppColors.white.withOpacity(0.30), height: 2),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
          child: communitycontactcontainer(text: 'Mary Johnson', image:AppImages.addcontact2, title:'Add', onPressed:(){} ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,top:5,right: 15),      child: DashedLine(color:AppColors.white.withOpacity(0.30), height: 2),
        ),
      ],
    ),
  ),
),
),
      )
    );
  }
}
