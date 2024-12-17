import 'package:flutter/material.dart';
import 'package:ott110/common/base_screen.dart';
import 'package:ott110/common/colors.dart';
import 'package:ott110/presentation/provider/nav_provider/coming_soon_provider.dart';

class ComingSoonScreen extends BaseScreen<ComingSoonProvider> {
  ComingSoonScreen({super.key}) : super(provider: comingSoonProvider);

  @override
  void initState(BuildContext context) {
    super.initState(context);
    provider.comingSoonMovieList();
    provider;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          '공개예정 작품',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: provider.upComingMovieList.length,
        itemBuilder: (context, index) {
          final currentItem = provider.upComingMovieList[index];
          return Column(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/original/${currentItem.poster_path}',
                fit: BoxFit.cover,
                height: 160,
                width: 110,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  '${currentItem.release_date.replaceAll("-", ".")} 예정',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 195,
        ),
      ),
    );
  }
}
