import 'package:flutter/cupertino.dart';
import 'package:ott110/data/repository_impl/movie_repository_impl.dart';

import '../../../data/models/movie_model.dart';

final comingSoonProvider = ComingSoonProvider();

class ComingSoonProvider extends ChangeNotifier {

  final movieRepository = MovieRepositoryImpl();

  List<MovieModel> upComingMovieList = [];

  void comingSoonMovieList() async {
    final result = await movieRepository.getUpComingMovieList();
    if (result == null) {
      return;
    }
    upComingMovieList = result;
    notifyListeners();
  }

}