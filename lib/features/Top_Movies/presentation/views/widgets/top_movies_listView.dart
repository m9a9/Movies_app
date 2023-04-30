import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/Top_Movies/presentation/manager/TopMovies_Cubit/top_movies_cubit.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/widgets/top_movies_listView_item.dart';

class TopMovieListView extends StatelessWidget {
  const TopMovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopMoviesCubit, TopMoviesState>(
      builder: (context, state) {
        if (state is TopMoviesSuccess) {
          return CarouselSlider.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index, _) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kMovieDetails,
                          extra: state.movies[index],
                        );
                      },
                      child: TopMoviesListViewItem(
                          movieName: state.movies[index].originalTitle!,
                          imageUrl:
                              'https://image.tmdb.org/t/p/original/${state.movies[index].backdropPath}'),
                    ));
              },
              options: CarouselOptions(
                autoPlayCurve: Curves.easeInOut,
                aspectRatio: 3 / 2,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                pauseAutoPlayOnTouch: true,
              ));
        } else if (state is TopMoviesFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
