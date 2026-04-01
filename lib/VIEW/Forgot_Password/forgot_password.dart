import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project_1/VIEW/WIDGETS/BUTTONS/app_buttons.dart';
import 'package:new_project_1/VIEW/WIDGETS/TEXTFIELD/textfield.dart';

import '../../Constant/appColors.dart';
import '../WIDGETS/CONTAINERS/containers.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController numbercontroller= TextEditingController();
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
        child: SafeArea(child:Column(
          children: [
            Center(child:
headerContainer(text:'FORGOT PASSWORD' , colors:AppColors.white),),
Padding(
  padding: const EdgeInsets.only(top: 20),
  child: PrimaryContainer(text:'Please Enter Your Register Mobile Number' , colors:AppColors.white),
),
PrimaryContainer(text: 'To Recieve a Verification Code' , colors:AppColors.white),
Padding(
  padding: const EdgeInsets.only(top: 20,bottom: 60),
  child: LoginField(text: 'Mobile Number', controller:numbercontroller,obcure: true, ),
),
Padding(
  padding: const EdgeInsets.only(top: 50),
  child: CustomElevatedLoginButton(text: 'SEND', onPressed:(){
    FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted:(PhoneAuthCredential credential){}, verificationFailed:(FirebaseAuthException ex){}, codeSent: (String verficationid,int? resendtoken){}, codeAutoRetrievalTimeout:(String verificationid){},phoneNumber:numbercontroller.text.toString()  );
  } ),
)
          ],
        ) ),
      ),
    );
  }
}
