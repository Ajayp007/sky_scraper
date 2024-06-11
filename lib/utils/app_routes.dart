import 'package:flutter/material.dart';
import 'package:sky_scraper/screen/bookmark/bookmark_screen.dart';
import 'package:sky_scraper/screen/detail/detail_screen.dart';
import 'package:sky_scraper/screen/home/view/home_screen.dart';
import 'package:sky_scraper/screen/splash/splash_screen.dart';

Map<String,WidgetBuilder> appRoutes ={
  '/':(context)=> const SplashScreen(),
  'home':(context)=> const HomeScreen(),
  'detail':(context)=> const DetailScreen(),
  'bookmark':(context)=> const BookmarkScreen(),
};