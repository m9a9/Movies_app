import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        movieName: state.movies[index].originalTitle!,
                        imageUrl:
                            'https://image.tmdb.org/t/p/original/${state.movies[index].backdropPath}'));
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
// CarouselSlider.builder(
//         itemCount: 10,
//         itemBuilder: (context, index, _) {
//           return const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             child: TopMoviesListViewItem(
//               imageUrl:
//                   'https://images.unsplash.com/photo-1682478695074-9e47f09a7459?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
//             ),
//           );
//         },
//         options: CarouselOptions(
//           autoPlayCurve: Curves.easeInOut,
//           aspectRatio: 3 / 2,
//           autoPlay: true,
//           autoPlayInterval: const Duration(seconds: 2),
//           autoPlayAnimationDuration: const Duration(milliseconds: 850),
//           pauseAutoPlayOnTouch: true,
//         ));