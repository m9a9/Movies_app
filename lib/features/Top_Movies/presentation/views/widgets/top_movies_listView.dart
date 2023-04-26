import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/Top_Movies/data/model/movie_model.dart';
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
                  child: TopMoviesListViewItem(
                    imageUrl: state.movies[index].backdropPath!,
                  ),
                );
              },
              options: CarouselOptions(
                autoPlayCurve: Curves.easeInOut,
                aspectRatio: 3 / 2,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 850),
                pauseAutoPlayOnTouch: true,
              ));
        } else if (state is TopMoviesFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
