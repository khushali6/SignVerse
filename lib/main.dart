import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ssip_signverse_project/Screen/HomeScreen.dart';
import 'package:ssip_signverse_project/Services/AuthClass.dart';
import 'package:ssip_signverse_project/introduction_animation/introduction_animation_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';




final storage = new FlutterSecureStorage();


Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? IntroductionAnimationScreen() : HomeScreen(),
  ),);
}



