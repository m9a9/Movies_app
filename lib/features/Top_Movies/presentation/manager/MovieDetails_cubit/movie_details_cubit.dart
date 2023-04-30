import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/features/Top_Movies/data/model/movie_model.dart';
import 'package:movies_app/features/Top_Movies/data/repos/home_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.homeRepo) : super(MovieDetailsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarMovies({required int id}) async {
    emit(MovieDetailsLoading());
    var result = await homeRepo.fetchSimilarMovies(id: id);

    result.fold((failure) {
      emit(MovieDetailsFailure(failure.errMessage));
    }, (movie) {
      emit(MovieDetailsSuccess(movie));
    });
  }
}
