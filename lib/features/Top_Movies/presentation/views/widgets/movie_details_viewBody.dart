import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/features/Top_Movies/data/model/movie_model.dart';
import 'package:movies_app/features/Top_Movies/presentation/manager/MovieDetails_cubit/movie_details_cubit.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/widgets/top_movies_listView_item.dart';

import '../../../../../core/utils/styles.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 3 / 2.8,
                child: TopMoviesListViewItem(
                  imageUrl:
                      'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                  movieName: movie.originalTitle!,
                ),
              ),
              Positioned(
                top: 150,
                left: 150,
                right: 150,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 48,
                    )),
              ),
              Positioned(
                top: 30,
                left: 20,
                child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 28,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              movie.overview!,
              style: Styles.style18,
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomMovieNumbers(
            movie: movie,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: const [
          //     Text(
          //       'VoteAverage',
          //     ),
          //     Text(
          //       'VoteCount',
          //     ),
          //     Text(
          //       'popularity',
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     const SizedBox(
          //       height: 5,
          //     ),
          //     Text(movie.voteAverage ?? ''),
          //     const SizedBox(
          //       height: 5,
          //     ),
          //     Text(movie.voteCount.toString()),
          //     const SizedBox(
          //       height: 5,
          //     ),
          //     Text(movie.popularity.toString()),
          //   ],
          // ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Similar Movies',
            style: Styles.style18,
          ),
          BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
              builder: (context, state) {
            if (state is MovieDetailsSuccess) {
              return AspectRatio(
                aspectRatio: 2 / 0.9,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 3,
                          child: TopMoviesListViewItem(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/original/${state.movieDetails[index].backdropPath}',
                              movieName: '${state.movieDetails[index].title}'),
                        ),
                      );
                    }),
              );
            } else if (state is MovieDetailsFailure) {
              return const Center(
                child: Text('state.errrMessa'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class CustomMovieNumbers extends StatelessWidget {
  const CustomMovieNumbers({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: MediaQuery.of(context).size.height / 9,
        width: MediaQuery.of(context).size.width - 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xfffff0f3),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'VoteAverage',
                    style: Styles.style18,
                  ),
                  Text(
                    'VoteCount',
                    style: Styles.style18,
                  ),
                  Text(
                    'popularity',
                    style: Styles.style18,
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.voteAverage ?? '',
                  style: Styles.style18,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.voteCount.toString(),
                  style: Styles.style18,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.popularity.toString(),
                  style: Styles.style18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
