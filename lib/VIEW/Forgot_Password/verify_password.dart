import 'package:flutter/material.dart';
import 'package:new_project_1/VIEW/WIDGETS/BUTTONS/app_buttons.dart';
import 'package:pinput/pinput.dart';

import '../../Constant/appColors.dart';
import '../WIDGETS/CONTAINERS/containers.dart';

class VerifyPassword extends StatefulWidget {
  // String  verificationid;
  const VerifyPassword({super.key});

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  // String  verificationid;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
    );
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
            headerContainer(text:'VERIFY YOUR NUMBER' , colors:AppColors.white),),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: PrimaryContainer(text:'Please Enter The 4 Digit Code Sent To' , colors:AppColors.white),
            ),
            PrimaryContainer(text: 'To Recieve a Verification Code' , colors:AppColors.white),
            Pinput(
              length: 4, // kitne digits chahye
              defaultPinTheme: defaultPinTheme,

              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              onCompleted: (pin) {
                print("Entered PIN: $pin");
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top:60 ),
              child: CustomElevatedLoginButton(text: 'VERIFY', onPressed: (){}),
            ),
          ],
        )),
      ),
    );
  }
}
