import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scraper/screen/home/provider/home_provider.dart';
import 'package:sky_scraper/utils/app_routes.dart';
import 'package:sky_scraper/utils/app_theme.dart';
import 'package:sky_scraper/utils/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          value.setTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: appRoutes,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
            value.themeMode == true ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    ),
  );
}
