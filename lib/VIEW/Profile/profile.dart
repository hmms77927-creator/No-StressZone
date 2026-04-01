// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:new_project_1/Routes/imagepicker_controller.dart';
// import '../../Constant/appColors.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   ImagePickerController controller =Get.put(ImagePickerController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               AppColors.yellowColor.withOpacity(0.55),
//               AppColors.screenColor
//             ],
//             stops: const [0.0, 0.2],
//           ),
//         ),
//         child: SafeArea(child: SingleChildScrollView(
//           child: Column(
//               children: [
//             Obx((){
//               return Column(
//                       children: [
//                         CircleAvatar(
//             radius:60 ,
//             backgroundImage: controller.imagePath.isNotEmpty ?
//             FileImage(File(controller.imagePath.toString())):
//             null,
//                         ),
//                         TextButton(onPressed: (){
//             controller.getImage();
//                         }, child:Text('Pick Image',style: TextStyle(color: AppColors.white),)),
//
//                       ],
//               );
//             }),
//             StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('user').snapshots(),
//             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//               final docs=snapshot.data!.docs;
//               return ListView.builder(
//                         itemCount: docs.length,
//                         itemBuilder: (BuildContext context,int index){
//                       String name=docs[index]['name'];
//                       String lastname=docs[index][' lastname'];
//                       String email=docs[index]['email'];
//                       String password=docs[index]['password'];
//                       return Column(
//                         children: [
//             Container(
//               child: Text(name,style: TextStyle(color: AppColors.white),),
//             ),
//             Container(
//               child: Text(lastname,style: TextStyle(color: AppColors.white),),
//             ),
//             Container(
//               child: Text(email,style: TextStyle(color: AppColors.white),),
//             ),
//             Container(
//               child: Text(password,style: TextStyle(color: AppColors.white),),
//             ),
//                         ],
//                       );
//               });
//             }),
//               ],
//             ),
//         )),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_1/Routes/imagepicker_controller.dart';
import 'package:new_project_1/VIEW/WIDGETS/BUTTONS/app_buttons.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
import '../../Constant/appColors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  final ImagePickerController controller = Get.put(ImagePickerController());
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String docId = ""; // 🔥 important for update

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
        child:
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
               headerContainer(text: 'PROFILE', colors:AppColors.white ),
                Obx(() {
                  return Column(
                    children: [
                      SizedBox(
                        height: 170,
                        width: 170,
                        child: Stack(
                          children: [
                                            Center(
                                              child: CircleAvatar(
                                                                        radius: 50,
                                                                        backgroundImage: controller.imagePath.isNotEmpty
                                                                            ? FileImage(File(controller.imagePath.value))
                                                                            : null,
                                                                        child: controller.imagePath.isEmpty
                                                                            ? const Icon(Icons.person, size: 50, color: Colors.white)
                                                                            : null,
                                                                      ),
                                            ),
                            Positioned(
                              top:80,
                                left:105,
                                child: IconButton(onPressed: (){ controller.getImage();}, icon: Icon(Icons.camera,color: AppColors.white,))),
                          ],
                        ),
                      )
                      // GestureDetector(
                      //   onTap: () {
                      //     controller.getImage(); // 👈 image picker call
                      //   },
                      //   child: CircleAvatar(
                      //     radius: 50,
                      //     backgroundImage: controller.imagePath.isNotEmpty
                      //         ? FileImage(File(controller.imagePath.value))
                      //         : null,
                      //     child: controller.imagePath.isEmpty
                      //         ? const Icon(Icons.person, size: 50, color: Colors.white)
                      //         : null,
                      //   ),
                      // ),
                    ],
                  );
                }),
                const SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('user')
                      .limit(1) // ✅ only one record
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    final doc = snapshot.data!.docs.first;
                    final data = doc.data() as Map<String, dynamic>;
                    docId = doc.id;
                    if (firstnamecontroller.text.isEmpty) {
                      firstnamecontroller.text = data['firstname'] ?? '';
                      lastnamecontroller.text = data['lastname'] ?? '';
                      emailcontroller.text = data['email'] ?? '';
                      passwordcontroller.text = data['password'] ?? '';
                    }
                    return Column(
                      children: [
                        TextField(
                          style: TextStyle(color: AppColors.white),
                          controller: firstnamecontroller,
                          decoration: _input('First Name'),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          style: TextStyle(color: AppColors.white),
                          controller: lastnamecontroller,
                          decoration: _input('Last Name'),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          style: TextStyle(color: AppColors.white),
                          controller: emailcontroller,
                          decoration: _input('Email'),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          style: TextStyle(color: AppColors.white),
                          controller: passwordcontroller,
                          obscureText: true,
                          decoration: _input('Password'),
                        ),
                        const SizedBox(height: 20),
                        CustomElevatedLoginButton(text: 'Save', onPressed:(){FirebaseFirestore.instance.collection('user').doc(docId).update({
                          'firstname': firstnamecontroller.text,
                          'lastname': lastnamecontroller.text,
                          'email': emailcontroller.text,
                          'password': passwordcontroller.text,
                        });})
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  InputDecoration _input(String label) {
    return InputDecoration(
      // labelText: label,
      // labelStyle: TextStyle(color: Colors.white),
      filled: true,
      fillColor: AppColors.cardcolor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_project_1/Routes/imagepicker_controller.dart';
// import 'package:new_project_1/VIEW/WIDGETS/BUTTONS/app_buttons.dart';
// import 'package:new_project_1/VIEW/WIDGETS/TEXTFIELD/textfield.dart';
// import '../../Constant/appColors.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   final ImagePickerController controller = Get.put(ImagePickerController());
//   TextEditingController emailcontroller= TextEditingController();
//   TextEditingController passwordcontroller= TextEditingController();
//   TextEditingController firstnamecontroller= TextEditingController();
//   TextEditingController lastnamecontroller= TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               AppColors.yellowColor.withOpacity(0.55),
//               AppColors.screenColor
//             ],
//             stops: const [0.0, 0.2],
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Obx(() {
//                     return Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundImage: controller.imagePath.isNotEmpty
//                               ? FileImage(File(controller.imagePath.value))
//                               : null,
//                           child: controller.imagePath.isEmpty
//                               ? Icon(Icons.person, size: 50, color: Colors.white)
//                               : null,
//                         ),
//                         const SizedBox(height: 8),
//                         TextButton(
//                           onPressed: () {
//                             controller.getImage();
//                           },
//                           child: Text(
//                             'Pick Image',
//                             style: TextStyle(color: AppColors.white),
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//                   const SizedBox(height: 20),
//                   StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance.collection('user').snapshots(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//                       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                         return const Center(
//                             child: Text(
//                               'No user data found',
//                               style: TextStyle(color: Colors.white),
//                             ));
//                       }
//                       final docs = snapshot.data!.docs;
//                       return Column(
//                         children: docs.map((doc) {
//                           final data = doc.data() as Map<String, dynamic>; // safe cast
//                           String firstname = data['firstname'] ?? 'No name';
//                           String lastname = data['lastname'] ?? 'No lastname';
//                           String email = data['email'] ?? '';
//                           String password = data['password'] ?? '';
//                           return Container(
//                             margin: const EdgeInsets.symmetric(vertical: 8),
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//
//                                 // TextField(
//                                 //   decoration: ,
//                                 // ),
//                                 Datafetchfield(text:'Name: $firstname' , controller: firstnamecontroller),
//                                 Datafetchfield(text:'Last Name: $lastname' , controller: lastnamecontroller),
//                                 Datafetchfield(text:'Email: $email', controller: emailcontroller),
//                                 Datafetchfield(text:'Password: $password' , controller: passwordcontroller),
//                                 CustomElevatedLoginButton(text: 'Save', onPressed:(){
// // FirebaseFirestore.instance.collection('user').doc(widget.id).update({
// //   'firstname':firstnamecontroller.text,
// //   'lastname':lastnamecontroller.text,
// //   'email':emailcontroller.text,
// //   'password':passwordcontroller.text,
// // });
//                                 }),
//                                 Container(
//                                     decoration: BoxDecoration(
//                                       color:AppColors.cardcolor,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Text('Name: $firstname', style: TextStyle(color: AppColors.white,fontSize: 14))),
//                                 Container(
//                                     decoration: BoxDecoration(
//                                       color:AppColors.cardcolor,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Text('Last Name: $lastname', style: TextStyle(color: AppColors.white,fontSize: 14))),
//                                 Container(
//                                     decoration: BoxDecoration(
//                                       color:AppColors.cardcolor,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Text('Email: $email', style: TextStyle(color: AppColors.white,fontSize: 14))),
//                                 Container(
//                                     decoration: BoxDecoration(
//                                       color:AppColors.cardcolor,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Text('Password: $password', style: TextStyle(color: AppColors.white,fontSize: 14))),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }