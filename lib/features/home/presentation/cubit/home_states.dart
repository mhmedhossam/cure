class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeFailureState extends HomeState {
  final String message;
  HomeFailureState({required this.message});
}

class HomeSucceededState extends HomeState {}
