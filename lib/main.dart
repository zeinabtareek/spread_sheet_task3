import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:spread_sheet_task/screens/main_screen/main_screen.dart';
import 'package:spread_sheet_task/services/users_services.dart';
import 'package:spread_sheet_task/try_scanner/screen.dart';
  main() async {
    await WidgetsFlutterBinding.ensureInitialized();
    await  Firebase.initializeApp();
   await UsersSheet.init();
  runApp(const MyApp());
}




 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home:MainScreen()
      // home:HomeScreen()
    );
  }
}



