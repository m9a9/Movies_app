import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/core/utils/observer.dart';
import 'package:movies_app/features/Top_Movies/data/repos/home_repo_impl.dart';
import 'package:movies_app/features/Top_Movies/presentation/manager/TopMovies_Cubit/top_movies_cubit.dart';

import 'features/Top_Movies/presentation/manager/TrendingActors_Cubit/trending_actors_cubit.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MoviesApp()),
    blocObserver: SimplrBlocObserver(),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopMoviesCubit(
            HomeRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          )..fetchMovies(),
        ),
        BlocProvider(
          create: (context) => TrendingActorsCubit(
            HomeRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          )..fetchTrendingActors(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
