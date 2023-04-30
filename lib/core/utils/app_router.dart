import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/home_page_view.dart';

import '../../features/Top_Movies/data/model/movie_model.dart';
import '../../features/Top_Movies/data/repos/home_repo_impl.dart';
import '../../features/Top_Movies/presentation/manager/MovieDetails_cubit/movie_details_cubit.dart';
import '../../features/Top_Movies/presentation/views/movie_details_view.dart';
import 'api_service.dart';

abstract class AppRouter {
  static const kMovieDetails = '/MovieDetails';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePageView(),
    ),
    GoRoute(
      path: kMovieDetails,
      builder: (context, state) => BlocProvider(
        create: (context) => MovieDetailsCubit(
          HomeRepoImpl(
            ApiService(
              Dio(),
            ),
          ),
        ),
        child: MovieDetailsView(
          movie: state.extra as Movie,
        ),
      ),
    ),
  ]);
}
