import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:ott110/data/models/genre_model.dart';
import 'package:ott110/data/models/movie_model.dart';

import '../../common/string.dart';

class MovieRepositoryImpl {
  final client = Client();

  Future<List<GenreModel>?> getGenreList() async {
    try {
      final url = Uri.parse(
          '$baseUrl//genre/movie/list?language=$language&region=$region');

      final headers = {'Authorization': 'Bearer $apiKey'};

      final response = await client.get(url, headers: headers);

      if (response.statusCode != 200) {
        const MethodChannel('kr.mad.ott.ott110')
            .invokeMethod('toast', '오류가 발생되었습니다.');
        SystemNavigator.pop();
        return null;
      }
      // as = 형변환
      final jsonBody = jsonDecode(response.body);
      return List.generate((jsonBody['genres'] as List<dynamic>).length,
          (index) {
        return GenreModel.fromJson(jsonBody['genres'][index]);
      });
    } catch (e, t) {
      log('getGenreList', error: e, stackTrace: t);
      return null;
    }
  }

  Future<List<MovieModel>?> getPopularMovies() async {
    try {
      final url = Uri.parse(
          '$baseUrl/movie/top_rated?language=$language&region=$region&page=1');

      final headers = {'Authorization': 'Bearer $apiKey'};

      final response = await client.get(url, headers: headers);

      if (response.statusCode != 200) {
        const MethodChannel('kr.mad.ott.ott110')
            .invokeMethod('toast', '오류가 발생되었습니다.');
        SystemNavigator.pop();
        return null;
      }

      final json = jsonDecode(response.body);
      final movies = json['results'] as List<dynamic>;

      return List.generate(movies.length, (index) {
        return MovieModel.fromJson(json: movies[index]);
      });
    } catch (e, t) {
      log('getPopularMovies', error: e, stackTrace: t);
      return null;
    }
  }

  Future<List<MovieModel>?> getCurrentlyMovies() async {
    try {
      final url = Uri.parse(
          '$baseUrl/movie/now_playing?language=$language&region=$region&page=1');

      final headers = {'Authorization': 'Bearer $apiKey'};

      final response = await client.get(url, headers: headers);

      if (response.statusCode != 200) {
        const MethodChannel('kr.mad.ott.ott110')
            .invokeMethod('toast', '오류가 발생되었습니다.');
        SystemNavigator.pop();
        return null;
      }

      final json = jsonDecode(response.body);
      final movies = json['results'] as List<dynamic>;

      return List.generate(movies.length, (index) {
        return MovieModel.fromJson(json: movies[index]);
      });
    } catch (e, t) {
      log('getCurrentlyMovies', error: e, stackTrace: t);
      return null;
    }
  }

  Future<List<MovieModel>?> getRecentlyOpenedMovieList() async {
    try {
      final url = Uri.parse('$baseUrl/movie/now_playing?page=1');

      final headers = {'Authorization': 'Bearer $apiKey'};

      final response = await client.get(url, headers: headers);

      if (response.statusCode != 200) {
        const MethodChannel('kr.mad.ott.ott110')
            .invokeMethod('toast', '오류가 발생되었습니다.');
        SystemNavigator.pop();
        return null;
      }

      final json = jsonDecode(response.body);
      final movies = json['results'] as List<dynamic>;

      return List.generate(movies.length, (index) {
        return MovieModel.fromJson(json: movies[index]);
      });
    } catch (e, t) {
      log('getRecentlyOpenedMovieList', error: e, stackTrace: t);
      return null;
    }
  }

  Future<List<MovieModel>?> getUpComingMovieList() async {
    try {
      final url = Uri.parse(
          '$baseUrl/movie/upcoming?language=$language&region=$region&page=1');

      final headers = {'Authorization': 'Bearer $apiKey'};

      final response = await client.get(url, headers: headers);

      if (response.statusCode != 200) {
        const MethodChannel('kr.mad.ott.ott110')
            .invokeMethod('toast', '오류가 발생되었습니다.');
        SystemNavigator.pop();
        return null;
      }

      final json = jsonDecode(response.body);
      final movies = json['results'] as List<dynamic>;

      return List.generate(movies.length, (index) {
        return MovieModel.fromJson(json: movies[index]);
      });
    } catch (e, t) {
      log('getUpComingMovieList', error: e, stackTrace: t);
      return null;
    }
  }
}
