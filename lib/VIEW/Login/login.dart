import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_1/Routes/app_pages.dart';
import '../../Constant/appColors.dart';
import '../WIDGETS/BUTTONS/app_buttons.dart';
import '../WIDGETS/CONTAINERS/containers.dart';
import '../WIDGETS/TEXTFIELD/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSave = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

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
              AppColors.screenColor,
            ],
            stops: const [0.0, 0.2],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Center(child: headcontainer('LOGIN', AppColors.white)),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: LoginField(
                  text: 'Email',
                  controller: emailcontroller,
                  obcure: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: LoginField(
                  text: 'Password',
                  controller: passwordcontroller,
                  onPressed: () {
                    setState(() {
                      isSave = !isSave;
                    });
                  },
                  icon: isSave ? Icons.visibility : Icons.visibility_off,
                  obcure: isSave,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: CustomtextLoginbutton(
                  text: 'Forgot Password?',
                  onPressed: () {},
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 50),
                child: CustomElevatedLoginButton(
                  text: 'LOGIN',
                  onPressed: () async {
                    String email = emailcontroller.text.trim();
                    String password = passwordcontroller.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Please enter email and password',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    try {
                      // 1️⃣ Login with Firebase Auth
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email, password: password);

                      // 2️⃣ Navigate directly to Home
                      Get.offAllNamed(AppPages.bottomNav);

                      Get.snackbar(
                        'Success',
                        'Login successful',
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } on FirebaseAuthException catch (e) {
                      String message = '';
                      if (e.code == 'user-not-found') {
                        message = 'No user found for this email.';
                      } else if (e.code == 'wrong-password') {
                        message = 'Incorrect password.';
                      } else if (e.code == 'invalid-email') {
                        message = 'Invalid email format.';
                      } else if (e.code == 'network-request-failed') {
                        message = 'Network error. Check your connection.';
                      } else {
                        message = e.message ?? 'Login failed';
                      }

                      Get.snackbar(
                        'Login Failed',
                        message,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } catch (e) {
                      Get.snackbar(
                        'Error',
                        'Something went wrong. Please try again.',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      subContainer(
                          text: 'Don`t have an account?', colors: AppColors.white),
                      CustomtextLoginbutton(
                        text: 'Register now',
                        onPressed: () {
                          Get.toNamed(AppPages.signin);
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