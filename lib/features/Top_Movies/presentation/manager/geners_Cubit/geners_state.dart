part of 'geners_cubit.dart';

abstract class GenersState extends Equatable {
  const GenersState();

  @override
  List<Object> get props => [];
}

class GenersInitial extends GenersState {}

class GenersLoading extends GenersState {}

class GenersSuccess extends GenersState {
  final List<Genre> genre;

  const GenersSuccess(this.genre);
}

class GenersFailure extends GenersState {
  final String errMessage;

  const GenersFailure(this.errMessage);
}
