import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/Top_Movies/data/model/movie_model.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/widgets/movie_details_viewBody.dart';

import '../manager/MovieDetails_cubit/movie_details_cubit.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<MovieDetailsCubit>();
    cubit.fetchSimilarMovies(id: widget.movie.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsViewBody(
        movie: widget.movie,
      ),
    );
  }
}
