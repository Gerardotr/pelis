import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninController with ChangeNotifier {
  var _googleSignin = GoogleSignIn();

  GoogleSignInAccount googleSignInAccount;

  login() async {
    this.googleSignInAccount = await _googleSignin.signIn();
    notifyListeners();
  }


  logOut(context) async {
    this.googleSignInAccount = await _googleSignin.signOut();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, '/');
    });
    notifyListeners();
  }


}