import 'package:flutter/material.dart';
import 'package:peliculas/src/controllers/google_signin.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/login_page.dart';
import 'package:peliculas/src/pages/pelicula_detalle.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSigninController(),
          child: LoginPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Películas',
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xfff2b2d42),
            primaryColor: Color(0xfffef233c)),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'detalle': (BuildContext context) => PeliculaDetalle()
        },
      ),
    );
  }
}
