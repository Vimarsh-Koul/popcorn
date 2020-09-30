import 'package:http/http.dart' as http;
import 'package:popcorn/Constants/keys.dart';
import 'dart:convert';

import 'package:popcorn/Models/trending.dart';

class API_manager {
  Future<Result> get_trending() async {
    var client = http.Client();
    var trending_model = null;
    try {
      var trending_response = await client.get(
          'https://api.themoviedb.org/3/trending/all/day?api_key=cd8e56c48d290ee186d2f57c021b8b0c');
      if (trending_response.statusCode == 200) {
        var trending_body = trending_response.body;
        var trending_json_map = json.decode(trending_body);
        trending_model = Result.fromJson(trending_json_map);
      }
    } catch (Exception) {
      return trending_model;
    }
    return trending_model;
  }
}
