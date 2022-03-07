import 'package:coodesh_challenge/view/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coodesh Challenge',
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.white,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,elevation: 0,titleTextStyle: TextStyle(color: Colors.black),actionsIconTheme: IconThemeData(color: Colors.black),)

      ),
      home: const HomeScreen(),
    );
  }
}
