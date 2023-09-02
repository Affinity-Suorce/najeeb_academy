part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class GetNumberOfViewsEvent extends HomeEvent {

  @override
  List<Object?> get props => [];

  GetNumberOfViewsEvent();
}

class SetNumberOfViewsEvent extends HomeEvent {

  final int numberOfVideoView;
  @override
  List<Object?> get props => [];

  SetNumberOfViewsEvent(this.numberOfVideoView);
}
