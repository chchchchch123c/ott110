import 'package:flutter/material.dart';
import 'package:ott110/data/models/genre_model.dart';

class ClassifyGenre extends StatelessWidget {
  const ClassifyGenre(
      {super.key, required this.genreIds, required this.showGenreList});

  final List<int> genreIds;
  final List<GenreModel> showGenreList;

  @override
  Widget build(BuildContext context) {
    final genreText = genreIds.fold(
      '',
      (previousValue, element) {
        final genre = showGenreList.firstWhere(
          (element2) => element == element2.id,
        );
        return previousValue.isEmpty
            ? genre.name
            : "$previousValue | ${genre.name}";
      },
    );
    return Text(
      genreText, // ㅎㅇㄹ
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
