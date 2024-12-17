import 'package:flutter/cupertino.dart';
import 'package:ott110/data/models/genre_model.dart';
import 'package:ott110/data/models/movie_model.dart';

import '../../../data/repository_impl/movie_repository_impl.dart';

final homeProvider = HomeProvider();

class HomeProvider extends ChangeNotifier {

  final movieRepository = MovieRepositoryImpl();
  bool isLoading = false;

  void loadingUi() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }

  List<GenreModel> genreList = [];
  List<MovieModel> currentMovieList = [];
  List<MovieModel> popularMovieList = [];
  List<MovieModel> recentOpenedMovieList = [];

  void updateGenreList() async {
    final result = await movieRepository.getGenreList();
    if (result == null) {
      return;
    }
    genreList = result;
    notifyListeners();
  }

  void popularlyMovieList() async {
    final result = await movieRepository.getPopularMovies();
    if (result == null) {
      return;
    }
    popularMovieList = result;
    notifyListeners();
  }

  void currentlyMovieList() async {
    final result = await movieRepository.getCurrentlyMovies();
    if (result == null) {
      return;
    }
    currentMovieList = result;
    notifyListeners();
  }


  void recentlyOpenedMovieList() async {
    final result = await movieRepository.getRecentlyOpenedMovieList();
    if (result == null) {
      return;
    }
    recentOpenedMovieList = result;
    notifyListeners();
  }

}