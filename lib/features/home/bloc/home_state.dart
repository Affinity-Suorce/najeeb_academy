part of 'home_bloc.dart';


@immutable
abstract class HomeState extends Equatable {}

class HomeLoad extends HomeState {
  @override
  List<Object?> get props => [];
}

class GetNumberOfViewsState extends HomeState{

  final RequestState requestState;
  final int numberOfViews;
  final Failure failure;


  GetNumberOfViewsState({
    this.requestState = RequestState.loading,
    this.numberOfViews = 0,
    this.failure = const Failure()
  });

  @override
  List<Object?> get props => [requestState,numberOfViews,failure];

  GetNumberOfViewsState copyWith({
    RequestState? requestState,
    int? numberOfViews,
    Failure? failure,
}) => GetNumberOfViewsState(
      requestState: requestState?? this.requestState,
      numberOfViews: numberOfViews?? this.numberOfViews,
  failure: failure?? this.failure
  );

}
