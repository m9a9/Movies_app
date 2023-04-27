import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/features/Top_Movies/data/repos/home_repo.dart';

import '../../../data/model/genre_model.dart';

part 'geners_state.dart';

class GenersCubit extends Cubit<GenersState> {
  GenersCubit(this.homeRepo) : super(GenersInitial());
  final HomeRepo homeRepo;
  Future<void> fetchGeners() async {
    emit(GenersLoading());
    var result = await homeRepo.fetchGenreList();
    result.fold((failure) {
      emit(GenersFailure(failure.errMessage));
    }, (genre) {
      emit(GenersSuccess(genre));
    });
  }
}
