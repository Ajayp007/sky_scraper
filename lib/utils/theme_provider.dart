import 'package:flutter/material.dart';
import 'package:sky_scraper/utils/shared_helper.dart';

class ThemeProvider with ChangeNotifier {
  bool? themeMode = true;

  void setTheme() async {
    themeMode = await Bookmark.bookmark.getThemeData();
    notifyListeners();
  }
}
