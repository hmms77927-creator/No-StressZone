import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/Constant/appImages.dart';
import 'package:new_project_1/VIEW/WIDGETS/BUTTONS/app_buttons.dart';
import 'package:new_project_1/VIEW/WIDGETS/CARDS/cards.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
import '../WIDGETS/TEXTFIELD/textfield.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  String selectedMessage = "msg1";

  final List<Map<String, String>> messages = [
    {"id": "msg1", "text": "You’ve got this!"},
    {"id": "msg2", "text": "I’m Proud of you"},
    {"id": "msg3", "text": "I believe in you"},
    {"id": "msg4", "text": "You are enough"},
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
                    headerContainer(text: 'Send Message', colors: AppColors.white),
                    Spacer(),
                    notificattionbutton(
                        onPressed: () {}, icons: Icons.notifications),
                  ],
                ),
             Padding(
               padding: const EdgeInsets.only(top: 30),
               child: SendMassagescard(image: AppImages.addcontact1, text: 'John Smith', onPressed: (){}),
             ),
                ...messages.map((msg) {
                  bool isSelected = selectedMessage == msg["id"];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMessage = msg["id"]!;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            child: Row(
                              children: [
                                // Custom Radio Circle with border + inner padding
                                Container(
                                  width: 24,
                                  height: 24,
                                  padding: EdgeInsets.all(4), // inner padding
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.white, width: 2),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? AppColors.yellowColor
                                          : Colors.transparent,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                membercontainer(text: msg["text"]!),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: DashedLine(
                            color: AppColors.white.withOpacity(0.30), height: 2),
                      ),
                    ],
                  );
                }).toList(),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                  child: PositiveTextField(text: 'Add a Custom Message'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0,bottom: 10),
                  child: Center(
                    child: SizedBox(
                      width: 228,
                      height: 59,
                      child: CustomButton(
                        onPressed: () {},
                        text: 'Send',
                        colors: AppColors.black,
                        buttoncolor: AppColors.yellowColor,
                      ),
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