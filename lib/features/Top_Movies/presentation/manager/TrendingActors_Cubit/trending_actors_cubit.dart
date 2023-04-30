import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/person_model.dart';
import '../../../data/repos/home_repo.dart';

part 'trending_actors_state.dart';

class TrendingActorsCubit extends Cubit<TrendingActorsState> {
  TrendingActorsCubit(this.homeRepo) : super(TrendingActorsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchTrendingActors() async {
    emit(TrendingActorsLoading());
    var result = await homeRepo.fetchTrendingActors();

    result.fold((failure) {
      emit(TrendingActorsFailure(failure.errMessage));
    }, (actors) {
      emit(TrendingActorsSuccess(actors));
    });
  }
}
