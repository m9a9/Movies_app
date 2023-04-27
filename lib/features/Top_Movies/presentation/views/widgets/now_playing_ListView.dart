import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/Top_Movies/presentation/manager/TopMovies_Cubit/top_movies_cubit.dart';

class NowPlayingListView extends StatelessWidget {
  const NowPlayingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopMoviesCubit, TopMoviesState>(
      builder: (context, state) {
        if (state is TopMoviesSuccess) {
          return AspectRatio(
            aspectRatio: 3 / 2.5,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3.5,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/original/${state.movies[index].backdropPath}',
                                  ),
                                  fit: BoxFit.cover),
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Text(
                          state.movies[index].originalTitle!.substring(
                              0,
                              min(state.movies[index].originalTitle!.length,
                                  20)),
                          style: Styles.style18,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.rate_review_rounded,
                              color: Colors.amber,
                            ),
                            Text('Rating ${state.movies[index].voteAverage!}'),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(' ${state.movies[index].voteCount!} vote'),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          );
        } else if (state is TopMoviesFailure) {
          return const Center(
            child: Text('Something went Wrong'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
