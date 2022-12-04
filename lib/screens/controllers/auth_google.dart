import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_project/screens/home_page.dart';
import 'package:mini_project/screens/login_page.dart';

class AuthGoogle {
  // 1.handleAuthState()
  // 2.signInWithGoogle()
  // 3.signOut()
  // determine if the user is authenticated

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return HomePage(email: FirebaseAuth.instance.currentUser!.email!);
        } else {
          return LoginPage();
        }
      },
    );
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn(); // GoogleSigning

    // Obtain the auth detail from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Once signed in , return the user credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
