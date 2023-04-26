import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/Top_Movies/data/repos/home_repo_impl.dart';
import 'package:movies_app/features/Top_Movies/presentation/manager/TopMovies_Cubit/top_movies_cubit.dart';

import 'features/Top_Movies/presentation/views/home_page_view.dart';

void main() {
  runApp(const MoviesApp());
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
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageView(),
      ),
    );
  }
}
