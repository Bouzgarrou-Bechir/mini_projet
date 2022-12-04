// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/auth_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //text controllers
  final _emailContoller = TextEditingController();
  final _passwordContoller = TextEditingController();

  Future signUp() async {
    AuthController.instance
        .register(_emailContoller.text.trim(), _passwordContoller.text.trim());
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
                  "SignUp",
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
                SizedBox(height: 10),

                //password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
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
                        hintText: "Confirm Password",
                        labelText: 'Enter Your Password Again',
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
                    signUp();
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
                SizedBox(
                  height: 20,
                ),
                //register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Im a member ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        " Login Now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
