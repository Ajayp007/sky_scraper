import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/api_helper.dart';
import '../../../utils/shared_helper.dart';
import '../model/home_model.dart';

class HomeProvider with ChangeNotifier {
  Future<HomeModel?>? model;

  Connectivity connectivity = Connectivity();
  bool? isInternet;
  String searchCity = "surat";

  List<String> bookmark = [];

  ApiHelper helper = ApiHelper();

  void search(String s) {
    searchCity = s;
    getWeatherData();
    notifyListeners();
  }

  void deleteBookmark(int index) {
    bookmark.removeAt(index);
    Bookmark.bookmark.setBookmarkData(bookmark);
    notifyListeners();
  }

  Future<void> setBookmark(String bookCity) async {
    List<String>? bookmarkData = await Bookmark.bookmark.getBookmarkData();
    if (bookmarkData != null) {
      bookmarkData.add(bookCity);
      Bookmark.bookmark.setBookmarkData(bookmarkData);
    } else {
      Bookmark.bookmark.setBookmarkData([bookCity]);
    }
    getBook();
    notifyListeners();
  }

  Future<void> getBook() async {
    var list = await Bookmark.bookmark.getBookmarkData();
    if (list != null) {
      bookmark = list;
      notifyListeners();
    }
  }

  void getWeatherData() {
    model = helper.getWeatherAPI(city: searchCity);
    model!.then(
      (value) {
        if (value != null) {
          notifyListeners();
        }
      },
    );
  }

  void checkConnection() async {
    connectivity.onConnectivityChanged.listen(
      (event) {
        if (event.contains(ConnectivityResult.none)) {
          isInternet = false;
        } else {
          isInternet = true;
        }
        notifyListeners();
      },
    );
  }
}
