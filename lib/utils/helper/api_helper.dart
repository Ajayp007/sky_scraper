import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../screen/home/model/home_model.dart';

class ApiHelper {
  Future<HomeModel?> getWeatherAPI({required String city}) async {
    String link =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=f328d45c82255838461c68c2ab810685";
    var response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      HomeModel model = HomeModel.mapToModel(json);
      return model;
    }
    return null;
  }
}
