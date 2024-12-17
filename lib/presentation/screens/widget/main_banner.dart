import 'package:flutter/material.dart';
import 'package:ott110/data/models/genre_model.dart';
import 'package:ott110/data/models/movie_model.dart';
import 'package:ott110/presentation/screens/widget/rating_bar.dart';

import '../../../common/colors.dart';
import 'classify_genre.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({super.key, required this.movieList, required this.posterPath, required this.genreList});

  final List<MovieModel> movieList;
  final List<GenreModel> genreList;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return movieList.isNotEmpty
        ? Stack(
      children: [
        Container(
          width: MediaQuery
              .sizeOf(context)
              .width,
          height: MediaQuery
              .sizeOf(context)
              .height * 0.8,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/original${movieList.first.poster_path}'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          width: MediaQuery
              .sizeOf(context)
              .width,
          height: 30,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    backgroundColor,
                    backgroundColor.withOpacity(0)
                  ])),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.27,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      backgroundColor.withOpacity(0),
                      backgroundColor,
                      backgroundColor,
                      backgroundColor,
                    ])),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movieList.first.vote_average
                    .toStringAsFixed(1),
                style:
                const TextStyle(color: Colors.white, fontSize: 50),
              ),
              const SizedBox(
                height: 4,
              ),
              RatingBar(
                  rate: movieList.first.vote_average),
              const SizedBox(
                height: 10,
              ),
              ClassifyGenre(
                  genreIds:
                  movieList.first.genre_ids,
                  showGenreList: genreList)
            ],
          ),
        )
      ],
    )
        : const Center(child: CircularProgressIndicator());
  }
}
