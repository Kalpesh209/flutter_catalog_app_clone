import 'package:flutter/material.dart';
import 'package:flutter_catalog_app_clone/AppUtils/app_themes.dart';

class ThemeProvider with ChangeNotifier {
  bool isDark = false;

  ThemeData getTheme(BuildContext context) {
    return isDark
        ? AppThemes.darktheme(context)
        : AppThemes.lighttheme(context);
  }

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
