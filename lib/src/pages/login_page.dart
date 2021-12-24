import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:peliculas/src/controllers/google_signin.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginUI(),
    );
  }

  loginUI() {
    return Consumer<GoogleSigninController>(
      builder: (context, model, child) {
        if (model.googleSignInAccount != null) {
          return HomePage();
        } else {
          return loginControls(context);
        }
      },
    );
  }

  loginControls(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login con Google',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
              onTap: () {
                Provider.of<GoogleSigninController>(context, listen: false)
                    .login();
              },
              child: Image.asset('assets/img/7328930.png'))
        ],
      ),
    );
  }
}
