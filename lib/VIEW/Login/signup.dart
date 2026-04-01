import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_1/Routes/app_pages.dart';
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
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();

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
          child: Column(
            children: [
              Center(child: headcontainer('SIGNUP', AppColors.white)),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: LoginField(
                    text: 'First Name', controller: firstnamecontroller, obcure: false),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: LoginField(
                    text: 'Last Name', controller: lastnamecontroller, obcure: false),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: LoginField(
                    text: 'Email', controller: emailcontroller, obcure: false),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: LoginField(
                    text: 'Password', controller: passwordcontroller, obcure: true),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10, top: 50),
              //   child: CustomElevatedLoginButton(
              //     text: 'SIGNUP',
              //     onPressed: () async {
              //       String email = emailcontroller.text.trim();
              //       String password = passwordcontroller.text.trim();
              //       String first = firstnamecontroller.text.trim();
              //       String last = lastnamecontroller.text.trim();
              //
              //       if (email.isEmpty || password.isEmpty || first.isEmpty || last.isEmpty) {
              //         Get.snackbar(
              //           'Error',
              //           'Please fill all fields',
              //           backgroundColor: Colors.red,
              //           colorText: Colors.white,
              //         );
              //         return;
              //       }
              //
              //       try {
              //         // 1️⃣ Create user in Firebase Auth
              //         UserCredential userCredential = await FirebaseAuth.instance
              //             .createUserWithEmailAndPassword(
              //           email: email,
              //           password: password,
              //         );
              //
              //         String uid = userCredential.user!.uid;
              //
              //         // 2️⃣ Store safe data in Firestore
              //         await FirebaseFirestore.instance.collection('user').doc(uid).set({
              //           'uid': uid,
              //           'firstname': first,
              //           'lastname': last,
              //           'email': email,
              //         });
              //
              //         // 3️⃣ Navigate directly to Home
              //         Get.offAllNamed(AppPages.bottomNav);
              //
              //         Get.snackbar(
              //           'Success',
              //           'Account created successfully',
              //           backgroundColor: Colors.green,
              //           colorText: Colors.white,
              //         );
              //       } on FirebaseAuthException catch (e) {
              //         Get.snackbar(
              //           'Signup Failed',
              //           e.message ?? 'Something went wrong',
              //           backgroundColor: Colors.red,
              //           colorText: Colors.white,
              //         );
              //       } catch (e) {
              //         Get.snackbar(
              //           'Error',
              //           'Something went wrong. Please try again.',
              //           backgroundColor: Colors.red,
              //           colorText: Colors.white,
              //         );
              //       }
              //     },
              //   ),
              // ),
              CustomElevatedLoginButton(text: 'SIGNUP', onPressed:(){
                FirebaseFirestore.instance.collection('user').add({
                  'firstname':firstnamecontroller.text,
                  'lastname':lastnamecontroller.text,
                  'email':emailcontroller.text,
                  'password':passwordcontroller.text,
                });
                        Get.offAllNamed(AppPages.bottomNav);
              }),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      subContainer(text: 'Already have an account?', colors: AppColors.white),
                      CustomtextLoginbutton(
                        text: 'Login',
                        onPressed: () {
                          Get.toNamed(AppPages.login);
                        },
                        color: AppColors.yellowColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}