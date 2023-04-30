part of 'trending_actors_cubit.dart';

abstract class TrendingActorsState extends Equatable {
  const TrendingActorsState();

  @override
  List<Object> get props => [];
}

class TrendingActorsInitial extends TrendingActorsState {}

class TrendingActorsLoading extends TrendingActorsState {}

class TrendingActorsSuccess extends TrendingActorsState {
  final List<Person> Actors;

  const TrendingActorsSuccess(this.Actors);
}

class TrendingActorsFailure extends TrendingActorsState {
  final String errMessage;

  const TrendingActorsFailure(this.errMessage);
}
