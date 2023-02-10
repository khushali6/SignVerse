import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssip_signverse_project/Screen/HomeScreen.dart';
import 'package:ssip_signverse_project/animation/FadeAnimation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssip_signverse_project/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool cricular = false;
  bool passwordVisible = true;

  void _register() async {
    try {
      if (_passwordController.text != null &&
          _confirmPasswordController.text != null &&
          _passwordController.text != _confirmPasswordController.text) {
        const snackbar = SnackBar(
          content: Text(
            "Both Password are not Same",
            style: const TextStyle(fontFamily: "Poppins"),
          ),
          backgroundColor: const Color(0xff4339E7),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        setState(() {
          cricular = false;
        });

      } else {
        final firebase_auth.User? user =
            (await _auth.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text))
                .user;
        setState(() {
          cricular = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),);
      }
    } on FirebaseAuthException catch (e) {
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      const Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Create an account, It's free",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                            fontFamily: "Poppins"),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1.2,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          // Email Filed Start
                          const Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87),
                          ),
                          // Email Filed End

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
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                        ],
                      )),

                  //Password Filed Start
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
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff4339E7), width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )),
                  //Password filed End

                  //confirm Password Filed Start
                  FadeAnimation(
                      1.4,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Confirm Password",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: _confirmPasswordController,
                            obscureText: passwordVisible,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
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
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff4339E7), width: 2.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )),
                  //confirm Password Filed End


                ],
              ),
              FadeAnimation(
                  1.5,
                  Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async {
                          setState(() {
                            cricular = true;
                          });
                          _register();
                        },
                        color: Color(0xff4339E7),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: cricular
                            ? CircularProgressIndicator()
                            : Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "Poppins"),
                              ),
                      ))),
              FadeAnimation(
                  1.6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontFamily: "Poppins"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 12),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xff4339E7),
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
