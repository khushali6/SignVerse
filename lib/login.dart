import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssip_signverse_project/Screen/HomeScreen.dart';
import 'package:ssip_signverse_project/Services/AuthClass.dart';
import 'package:ssip_signverse_project/animation/FadeAnimation.dart';
import 'package:ssip_signverse_project/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthClass authClass = AuthClass();
  bool cricular = false;
  bool passwordVisible = true;



  void _login() async {
    try{
      firebase_auth.UserCredential userCreadential =
      await firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text);
      setState(() {
        cricular = false;
      });
      print("Hello");
      SharedPreferences pref = await SharedPreferences.getInstance();
      print("Hello2");
      pref.setString("email", _emailController.value.text);
      print("Hello3");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),);
    }
     on firebase_auth.FirebaseAuthException catch (e) {
      final snackbar = SnackBar(
        content: Text(
          e.message.toString(),
          style: const TextStyle(fontFamily: "Poppins"),
        ),
        backgroundColor: const Color(0xff4339E7),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {
        cricular = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                         const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.2,
                          Text(
                            "Login to your account",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.2,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: _emailController,
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff4339E7), width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            )),
                        FadeAnimation(
                            1.3,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: _passwordController,
                                  obscureText: passwordVisible,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff4339E7), width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    suffixIcon: IconButton(
                                      icon: (passwordVisible)
                                          ? FaIcon(FontAwesomeIcons.eyeSlash)
                                          : FaIcon(FontAwesomeIcons.eye),

                                      color: Color(0xff4339E7),
                                      onPressed: () {
                                        setState(() {
                                          passwordVisible = !passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  FadeAnimation(
                      1.4,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () async {
                              setState(() {
                                cricular = true;
                              });
                              _login();
                            },
                            color: Color(0xff4339E7),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: cricular ? CircularProgressIndicator()
                              : Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  fontFamily: "Poppins",
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                  FadeAnimation(
                      1.5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()),
                              );
                            },
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 12),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xff4339E7),
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            FadeAnimation(
                1.2,
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/introduction_animation/background.png'),
                          fit: BoxFit.cover)),
                ))
          ],
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
