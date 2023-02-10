import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ssip_signverse_project/Services/AuthClass.dart';
import 'package:ssip_signverse_project/introduction_animation/introduction_animation_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  String email = '';

  Future _getemail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }

  Future _logout() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove('email');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntroductionAnimationScreen()),
      );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getemail();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(child: email == '' ? Text('') :Text(email)),
          MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () async {
                setState(() {
                 _logout();
                });
              },
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.logout_outlined)),
        ],
      ),
    );
  }
}
