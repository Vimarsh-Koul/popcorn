import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:popcorn/Constants/keys.dart';
import 'package:popcorn/Models/images.dart';
import 'dart:convert';
import 'package:popcorn/Models/now_playing.dart';
import 'package:popcorn/Models/trending.dart';
import 'package:popcorn/Models/popular_tv.dart';
import 'package:popcorn/Models/upcoming_movies.dart';
import 'package:popcorn/Models/top_rated.dart';

class API_manager {
  Future<Trending> get_trending() async {
    var client = http.Client();
    var trending_model = null;
    try {
      var trending_response = await client.get(
          'https://api.themoviedb.org/3/trending/all/day?api_key=' +
              api_keys.movie_db_api);
      if (trending_response.statusCode == 200) {
        print('client get working\n');
        var trending_body = trending_response.body;
        var trending_json_map = json.decode(trending_body);
        trending_model = Trending.fromJson(trending_json_map);
      }
    } catch (Exception) {
      return trending_model;
    }
    return trending_model;
  }

  Future<TopRated> get_top_rated() async {
    var client = http.Client();
    var top_rated_model = null;
    try {
      var top_rated_movies_response = await client.get(
          'https://api.themoviedb.org/3/trending/all/day?api_key=' +
              api_keys.movie_db_api);
      if (top_rated_movies_response.statusCode == 200) {
        print('client get working\n');
        var top_rated_body = top_rated_movies_response.body;
        var top_rated_json_map = json.decode(top_rated_body);
        top_rated_model = TopRated.fromJson(top_rated_json_map);
      }
    } catch (Exception) {
      return top_rated_model;
    }
    return top_rated_model;
  }

  Future<ImageModel> get_config() async {
    var client = http.Client();
    var config_model = null;
    try {
      var config_response = await client.get(
          'https://api.themoviedb.org/3/configuration?api_key=' +
              api_keys.movie_db_api);
      if (config_response.statusCode == 200) {
        print('client get working get_config\n');
        var config_body = config_response.body;
        var config_json_map = json.decode(config_body);
        config_model = ImageModel.fromJson(config_json_map);
      }
    } catch (Exception) {
      return config_model;
    }
    return config_model;
  }

  Future<NowPlaying> get_now_playing() async {
    var client = http.Client();
    var now_playing_model = null;
    try {
      var now_playing_response = await client.get(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=cd8e56c48d290ee186d2f57c021b8b0c&language=en-US&page=1');
      if (now_playing_response.statusCode == 200) {
        print('client get working\n');
        var now_playing_body = now_playing_response.body;
        var now_playing_json_map = json.decode(now_playing_body);
        now_playing_model = NowPlaying.fromJson(now_playing_json_map);
      }
    } catch (Exception) {
      return now_playing_model;
    }
    return now_playing_model;
  }

  Future<PopularTv> get_popular_tv() async {
    var client = http.Client();
    var popular_tv_model = null;
    try {
      var popular_tv_response = await client.get(
          'https://api.themoviedb.org/3/tv/popular?api_key=cd8e56c48d290ee186d2f57c021b8b0c&language=en-US&page=1');
      if (popular_tv_response.statusCode == 200) {
        print('client get working\n');
        var popular_tv_body = popular_tv_response.body;
        var popular_tv_json_map = json.decode(popular_tv_body);
        popular_tv_model = PopularTv.fromJson(popular_tv_json_map);
      }
    } catch (Exception) {
      return popular_tv_model;
    }
    return popular_tv_model;
  }

  Future<UpcomingMovies> get_upcoming_movies() async {
    var client = http.Client();
    var upcoming_movies_model = null;
    try {
      var upcoming_movies_response = await client.get(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=cd8e56c48d290ee186d2f57c021b8b0c&language=en-US&page=1');
      if (upcoming_movies_response.statusCode == 200) {
        print('client get working\n');
        var upcoming_movies_body = upcoming_movies_response.body;
        var upcoming_movies_json_map = json.decode(upcoming_movies_body);
        upcoming_movies_model =
            UpcomingMovies.fromJson(upcoming_movies_json_map);
      }
    } catch (Exception) {
      return upcoming_movies_model;
    }
    return upcoming_movies_model;
  }
}
