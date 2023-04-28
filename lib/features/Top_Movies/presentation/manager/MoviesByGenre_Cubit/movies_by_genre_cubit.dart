import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/movie_model.dart';
import '../../../data/repos/home_repo.dart';

part 'movies_by_genre_state.dart';

class MoviesByGenreCubit extends Cubit<MoviesByGenreState> {
  MoviesByGenreCubit(this.homeRepo) : super(MoviesByGenreInitial());
  final HomeRepo homeRepo;

  Future<void> fetchMoviesByGenre(int id) async {
    emit(MoviesByGenreLoading());
    var result = await homeRepo.fetchMoviesByGenre(id);

    result.fold((faliure) {
      emit(MoviesByGenreFailure(faliure.errMessage));
    }, (movies) {
      emit(MoviesByGenreSuccess(movies));
    });
  }
}
