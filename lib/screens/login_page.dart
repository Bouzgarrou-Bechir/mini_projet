// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/screens/controllers/auth_google.dart';
import 'package:mini_project/screens/signup_page.dart';

import 'controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailContoller = TextEditingController();
  final _passwordContoller = TextEditingController();

  Future singIn() async {
    AuthController.instance
        .login(_emailContoller.text.trim(), _passwordContoller.text.trim());
  }

  @override
  void dispose() {
    _emailContoller.dispose();
    _passwordContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.android,
                  size: 40,
                ),
                Text(
                  "Login",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 36,
                  ),
                ),
                Text(
                  "Welcome Back !",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 80),

                //email text field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: _emailContoller,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: "Email",
                        labelText: 'Enter Your Email',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),

                SizedBox(height: 10),

                //password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: _passwordContoller,
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: "Password",
                        labelText: 'Enter Your Password',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),

                SizedBox(height: 40),
                //sign in button
                ElevatedButton(
                  onPressed: () {
                    singIn();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[600],
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text("Submit",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                //register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignupPage());
                      },
                      child: Text(
                        " Register Now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  " or ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => {AuthGoogle().signInWithGoogle()},
                  child: Image.network(
                      "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png",
                      height: 35),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
