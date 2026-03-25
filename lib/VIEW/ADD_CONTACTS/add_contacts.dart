import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
import '../../Constant/appImages.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/TEXTFIELD/textfield.dart';

class addcontacts extends StatefulWidget {
  const addcontacts({super.key});

  @override
  State<addcontacts> createState() => _addcontactsState();
}

class _addcontactsState extends State<addcontacts> {

  List<String> selectedContacts = [];

  bool isSelected = false;
  bool isSelect = false;

  void toggleContact(String name) {
    setState(() {
      if (selectedContacts.contains(name)) {
        selectedContacts.remove(name);
      } else {
        selectedContacts.add(name);
      }
    });
  }

  Widget contactItem(String name, String image) {
    return Column(
      children: [
        communitycontactcontainer(
          text: name,
          image: image,
          title: selectedContacts.contains(name) ? 'Added' : 'Add',
          onPressed: () {
            toggleContact(name);
          },
        ),
        DashedLine(
          color: AppColors.white.withOpacity(0.30),
          height: 2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // height: double.infinity,
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
              children: [
                Row(
                  children: [
                    headerContainer(
                      text: 'Add Contacts',
                      colors: AppColors.white,
                    ),
                    const Spacer(),
                    notificattionbutton(
                      onPressed: () {},
                      icons: Icons.notifications,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: HeaderField(
                    text: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.yellowColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                contactItem('John Smith', AppImages.addcontact1),
                contactItem('Mary Johnson', AppImages.addcontact2),
                contactItem('Jane Doe', AppImages.addcontact3),
                contactItem('Michael Brown', AppImages.addcontact4),
                contactItem('Emma Wilson', AppImages.addcontact5),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 172,
                      height: 127,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: homecontainer(
                          text: 'Invite via Phone',
                          colors: isSelected
                              ? AppColors.black
                              : AppColors.white,
                          image: AppImages.contact1,
                          containcolors: isSelected
                              ? AppColors.yellowColor
                              : AppColors.black,
                          isSelected: isSelected,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 172,
                      height: 127,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelect = !isSelect;
                          });
                        },
                        child: homecontainer(
                          text: 'Invite via Email',
                          colors: isSelect
                              ? AppColors.black
                              : AppColors.white,
                          image: AppImages.contact2,
                          containcolors: isSelect
                              ? AppColors.yellowColor
                              : AppColors.black,
                          isSelected: isSelected,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellowColor
                    ),
                    onPressed: selectedContacts.length >= 2
                        ? () {
                      print("Group Created: $selectedContacts");
                    }
                        : null,
                    child: const Text("Generate Group",style:TextStyle(color: AppColors.black,fontSize: 18, ) ,),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}