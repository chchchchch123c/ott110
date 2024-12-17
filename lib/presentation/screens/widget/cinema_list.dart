import 'package:flutter/material.dart';
import 'package:ott110/data/models/movie_model.dart';
class CinemaList extends StatelessWidget {
  const CinemaList({super.key, required this.title, required this.movieModelList});

  final String title;

  final List<MovieModel> movieModelList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieModelList.length,
            itemBuilder: (context, index) {
              final currentItem = movieModelList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.network(
                  'https://image.tmdb.org/t/p/original/${currentItem.poster_path}',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
