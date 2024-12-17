import 'package:flutter/material.dart';
import 'package:ott110/common/base_screen.dart';
import 'package:ott110/common/colors.dart';
import 'package:ott110/presentation/provider/nav_provider/home_provider.dart';
import 'package:ott110/presentation/screens/widget/cinema_list.dart';
import 'package:ott110/presentation/screens/widget/main_banner.dart';

class HomeScreen extends BaseScreen<HomeProvider> {
  HomeScreen({super.key}) : super(provider: homeProvider);

  @override
  void initState(BuildContext context) {
    super.initState(context);
    provider.loadingUi();
    provider.updateGenreList();
    provider.popularlyMovieList();
    provider.currentlyMovieList();
    provider.recentlyOpenedMovieList();
    provider;
  }

  @override
  Widget build(BuildContext context) {
    return provider.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: appBarColor,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset('assets/images/showtime 로고.png'),
              ),
              leadingWidth: 50,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(8))),
              actions: [
                const SizedBox(
                  width: 60,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.genreList.length,
                    itemBuilder: (context, index) {
                      final currentItem = provider.genreList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Center(
                          child: Text(
                            currentItem.name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  MainBanner(
                      movieList: provider.popularMovieList,
                      posterPath: provider.popularMovieList.first.poster_path,
                      genreList: provider.genreList),
                  CinemaList(
                      title: '방영중인 작품',
                      movieModelList: provider.currentMovieList),
                  CinemaList(
                      title: '인기 작품',
                      movieModelList: provider.popularMovieList),
                  CinemaList(
                      title: '최근 개봉',
                      movieModelList: provider.recentOpenedMovieList),
                  const SizedBox(height: 16)
                ],
              ),
            ),
          );
  }
}
