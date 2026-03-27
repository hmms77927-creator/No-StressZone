import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Constant/appColors.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CONTAINERS/containers.dart';
import '../WIDGETS/TEXTFIELD/textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();
  TextEditingController firstnamecontroller= TextEditingController();
  TextEditingController lastnamecontroller= TextEditingController();
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
            Center(child: headcontainer('SIGNUP', AppColors.white)),
            Padding(
              padding: const EdgeInsets.only(top: 40,bottom: 10),
              child: LoginField(text: 'First Name', controller: firstnamecontroller),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: LoginField(
                text: 'Last Name',
                controller: lastnamecontroller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: LoginField(
                text: 'Email',
                controller: emailcontroller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: LoginField(
                text: 'Password',
                controller: passwordcontroller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10,top: 50),
              child: CustomElevatedLoginButton(text: 'SIGNUP', onPressed: ()async{
             await FirebaseFirestore.instance.collection('set').add({
                  'firstname':firstnamecontroller.text,
                  'lastname':lastnamecontroller.text,
                  'email':emailcontroller.text,
                  'password':passwordcontroller.text,
                });
                // FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text , password: passwordcontroller.text,);
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    subContainer(text: 'Already have an acccount?', colors:AppColors.white),
                    CustomtextLoginbutton(text: 'Login', onPressed:(){
                    }, color: AppColors.yellowColor,),
                  ],
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
