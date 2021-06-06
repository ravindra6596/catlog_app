import 'package:catlog/core/store.dart';
import 'package:catlog/pages/home_details_page.dart';
import 'package:catlog/pages/login_page.dart';
import 'package:catlog/utils/routs.dart';
import 'package:catlog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    VxState(
      store: MyStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // When you add routs so dont need to the home property of the MaterialApp
      //  home:HomePage(),
      themeMode: ThemeMode.light,
      theme: Themes.lightTheme(context),
      // remove debug logo from app
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.darkTheme(context),
      // Navigator 2
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_, __) => MaterialPage(
                child: LoginPage(),
              ),
          MyRoutes.homeRoute: (_, __) => MaterialPage(
                child: HomePage(),
              ),
          MyRoutes.homeDetailsRoute: (uri, params) {
            final catlog = (VxState.store as MyStore).catlog.getById(int.parse(uri.queryParameters["id"],),);
            return MaterialPage(
              child: HomeDetailsPage(
                catalog: catlog,
              ),
            );
          },
          MyRoutes.loginRoute: (_, __) => MaterialPage(
                child: LoginPage(),
              ),
          MyRoutes.cartRoute: (_, __) => MaterialPage(
                child: CartPage(),
              ),
        },
      ),
      /* initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      }, */
    );
  }
}
