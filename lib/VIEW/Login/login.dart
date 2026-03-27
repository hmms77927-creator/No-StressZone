import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_project_1/VIEW/WIDGETS/BUTTONS/app_buttons.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
import 'package:new_project_1/VIEW/WIDGETS/TEXTFIELD/textfield.dart';

import '../../Constant/appColors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSave=false;
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();
  // FirebaseAuth instance to handle authentication.
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // // GoogleSignIn instance to handle Google Sign-In.
  // final _googleSignIn = GoogleSignIn();
  //
  // /// Signs in the user with Google and returns the authenticated Firebase [User].
  // ///
  // /// Returns `null` if the sign-in process is canceled or fails.
  // Future<User?> signInWithGoogle() async {
  //   try {
  //
  //     // Trigger the Google Sign-In flow.
  //     final googleUser = await _googleSignIn.signIn();
  //
  //     // User canceled the sign-in.
  //     if (googleUser == null) return null;
  //
  //     // Retrieve the authentication details from the Google account.
  //     final googleAuth = await googleUser.authentication;
  //
  //     // Create a new credential using the Google authentication details.
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     // Sign in to Firebase with the Google credential.
  //     final userCredential = await _auth.signInWithCredential(credential);
  //
  //     // Return the authenticated user.
  //     return userCredential.user;
  //   } catch (e) {
  //
  //     // Print the error and return null if an exception occurs.
  //     print("Sign-in error: $e");
  //     return null;
  //   }
  // }
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
         Center(child: headcontainer('LOGIN', AppColors.white)),
Padding(
  padding: const EdgeInsets.only(top: 40,bottom: 10),
  child: LoginField(text: 'Email', controller: emailcontroller),
),
    Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: LoginField(
      text: 'Password',
      controller: passwordcontroller,
      onPressed: () {
      setState(() {
      isSave = !isSave;
      });
      },
      icon: isSave ? Icons.visibility_off : Icons.visibility,
      ),
    ),
         Align(alignment: Alignment.topRight, child: CustomtextLoginbutton(text: 'Forgot Password?', onPressed:(){}, color: AppColors.white,)),
Padding(
  padding: const EdgeInsets.only(bottom: 10,top: 50),
  child: CustomElevatedLoginButton(text: 'LOGIN', onPressed: (){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text,);
  }),
),
         Padding(
           padding: const EdgeInsets.only(top: 10),
           child: Center(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 subContainer(text: 'Don`t have an acccount?', colors:AppColors.white),
                 CustomtextLoginbutton(text: 'Register now', onPressed:(){
                 }, color: AppColors.yellowColor,),
               ],
             ),
           ),
         )
       ],
     ),),
   ),
    );
  }
}
