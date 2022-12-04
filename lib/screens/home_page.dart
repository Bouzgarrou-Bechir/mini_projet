import 'package:flutter/material.dart';

import 'controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  String email;

  HomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('successfully logged in with  $email'),
            const SizedBox(height: 40),
            //sign in button
            ElevatedButton(
              onPressed: () {
                AuthController.instance.logOut();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[600],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("Logout",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
