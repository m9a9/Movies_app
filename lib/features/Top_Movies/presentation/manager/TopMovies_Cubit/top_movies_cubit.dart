import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/features/Top_Movies/data/model/movie_model.dart';
import 'package:movies_app/features/Top_Movies/data/repos/home_repo.dart';

part 'top_movies_state.dart';

class TopMoviesCubit extends Cubit<TopMoviesState> {
  TopMoviesCubit(this.homeRepo) : super(TopMoviesInitial());

  final HomeRepo homeRepo;
  Future<void> fetchMovies() async {
    emit(TopMoviesLoading());
    var result = await homeRepo.fetchNowPlaying();

    result.fold((faliure) {
      emit(TopMoviesFailure(faliure.errMessage));
    }, (movies) {
      emit(TopMoviesSuccess(movies));
    });
  }

  Future<void> fetchMoviesByGenre(int id) async {
    emit(TopMoviesLoading());
    var result = await homeRepo.fetchMoviesByGenre(id);

    result.fold((faliure) {
      emit(TopMoviesFailure(faliure.errMessage));
    }, (movies) {
      emit(TopMoviesSuccess(movies));
    });
  }
}
