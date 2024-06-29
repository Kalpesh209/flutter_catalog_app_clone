import 'package:flutter/material.dart';
import 'package:flutter_catalog_app_clone/AppUtils/app_routes.dart';
import 'package:flutter_catalog_app_clone/AppUtils/app_themes.dart';
import 'package:flutter_catalog_app_clone/AppUtils/theme_provider.dart';
import 'package:flutter_catalog_app_clone/Business/app_store.dart';
import 'package:flutter_catalog_app_clone/Presentation/Screens/cart_screen.dart';
import 'package:flutter_catalog_app_clone/Presentation/Screens/home_page_screen.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';


/*
Title:Entry Point of App
Purpose:Entry Point of App
Created On :
Edited On:
Author: Kalpesh Khandla
*/

void main() {
  runApp(
    VxState(
      store: AppStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeProvider = ThemeProvider();
  @override
  Widget build(BuildContext context) {
    themeProvider.isDark = false;
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => themeProvider,
      child: Consumer<ThemeProvider>(builder: (context, model, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: model.isDark ? ThemeMode.light : ThemeMode.dark,
          theme: AppThemes.lighttheme(context),
          darkTheme: AppThemes.darktheme(context),
          initialRoute: AppRoutes.homeRoute,
          routes: {
            "/": (context) => const HomePageScreen(),
            AppRoutes.homeRoute: (context) => const HomePageScreen(),
            AppRoutes.cartpageRoute: (context) => const CartScreen(),
          },
        );
      }),
    );
  }
}
