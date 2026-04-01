import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_project_1/Routes/app_pages.dart';
import 'package:new_project_1/VIEW/WELLCOME_SCREEN/wellcome.dart';

import 'firebase_options.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Urbanist',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:Wellcome(),
      getPages: AppPages.routes,
    );
  }
}
