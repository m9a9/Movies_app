import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/core/utils/observer.dart';
import 'package:movies_app/features/Top_Movies/data/repos/home_repo_impl.dart';
import 'package:movies_app/features/Top_Movies/presentation/manager/TopMovies_Cubit/top_movies_cubit.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/home_page_view.dart';

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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageView(),
      ),
    );
  }
}

// class Fake extends StatelessWidget {
//   const Fake({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: Center(
//           child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             height: 200,
//             width: 350,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                     strokeAlign: BorderSide.strokeAlignOutside, width: 2.5)),
//           ),
//           const Positioned(
//             left: 15,
//             top: -14,
//             child: Card(
//               child: Text(
//                 'data data data',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }
