import 'package:flutter/material.dart';
import 'package:new_project_1/VIEW/WIDGETS/BUTTONS/app_buttons.dart';

import '../../Constant/appColors.dart';
import '../WIDGETS/CONTAINERS/containers.dart';
import '../WIDGETS/TEXTFIELD/textfield.dart';

class CreateNewpassword extends StatefulWidget {
  const CreateNewpassword({super.key});

  @override
  State<CreateNewpassword> createState() => _CreateNewpasswordState();
}

class _CreateNewpasswordState extends State<CreateNewpassword> {
  TextEditingController password1controller=TextEditingController();
  TextEditingController password2controller=TextEditingController();
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
        child: SafeArea(child: Column(
          children: [
            Center(child:
            headerContainer(text:'CREATE NEW PASSWORD' , colors:AppColors.white),),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: PrimaryContainer(text:'Your New Password Must Be Different' , colors:AppColors.white),
            ),
            PrimaryContainer(text: 'From Previously Used Password' , colors:AppColors.white),
            Padding(
              padding: const EdgeInsets.only(top: 40,bottom: 10),
              child: LoginField(text: '***********', controller:password1controller ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom:40 ),
              child: LoginField(text: '***********', controller:password2controller ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: CustomElevatedLoginButton(text: 'SAVE', onPressed:(){}),
            ),
          ],
        )),
      ),
    );
  }
}
