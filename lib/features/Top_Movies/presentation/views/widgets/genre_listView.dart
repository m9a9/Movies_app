import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/Top_Movies/data/model/genre_model.dart';
import 'package:movies_app/features/Top_Movies/presentation/manager/geners_Cubit/geners_cubit.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/widgets/top_movies_listView_item.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/repos/home_repo_impl.dart';
import '../../manager/MoviesByGenre_Cubit/movies_by_genre_cubit.dart';

class GenerListView extends StatefulWidget {
  const GenerListView({super.key, this.selectedGenre = 28});
  final int selectedGenre;

  @override
  State<GenerListView> createState() => _GenerListViewState();
}

class _GenerListViewState extends State<GenerListView> {
  late int selectedGenre;
  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GenersCubit(
            HomeRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          )..fetchGeners(),
        ),
        BlocProvider(
          create: (context) => MoviesByGenreCubit(
            HomeRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          )..fetchMoviesByGenre(selectedGenre),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GenersCubit, GenersState>(
            builder: (context, state) {
              if (state is GenersSuccess) {
                return SizedBox(
                  height: 60,
                  child: ListView.builder(
                      itemCount: state.genre.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Genre genre = state.genre[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Genre genre = state.genre[index];
                                selectedGenre = genre.id!;
                                BlocProvider.of<MoviesByGenreCubit>(context)
                                    .fetchMoviesByGenre(selectedGenre);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 3.55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: genre.id == selectedGenre
                                    ? Colors.deepOrange
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  state.genre[index].name!,
                                  style: Styles.style18.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: genre.id == selectedGenre
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              } else if (state is GenersFailure) {
                return const Center(
                  child: Text('Somthing wrong'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                ),
              );
            },
          ),
          Text(
            'Now Playing',
            textAlign: TextAlign.left,
            style: Styles.style18,
          ),
          BlocBuilder<MoviesByGenreCubit, MoviesByGenreState>(
            builder: (context, state) {
              if (state is MoviesByGenreSuccess) {
                return AspectRatio(
                  aspectRatio: 3 / 2.5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: TopMoviesListViewItem(
                                  movieName: '',
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/original/${state.movies[index].backdropPath}',
                                ),
                              ),
                              Text(
                                state.movies[index].originalTitle!.substring(
                                    0,
                                    min(
                                        state.movies[index].originalTitle!
                                            .length,
                                        18)),
                                style: Styles.style18,
                                overflow: TextOverflow.clip,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.rate_review_rounded,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                      'Rating ${state.movies[index].voteAverage!}'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                      ' ${state.movies[index].voteCount!} vote'),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                );
              } else if (state is MoviesByGenreFailure) {
                return const Center(
                  child: Text('Something went Wrong'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
                                    // 'https://image.tmdb.org/t/p/original/${state.movies[index].backdropPath}',
