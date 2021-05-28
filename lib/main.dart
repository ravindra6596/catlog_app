import 'package:catlog/pages/login_page.dart';
import 'package:catlog/utils/routs.dart';
import 'package:catlog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // When you add routs so dont need to the home property of the MaterialApp
      //  home:HomePage(),
      themeMode: ThemeMode.light,
      theme: Themes.lightTheme(context),
      // remove debug logo from app
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
