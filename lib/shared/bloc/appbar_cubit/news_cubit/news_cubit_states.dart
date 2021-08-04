abstract class NewsCubitStates {}

class IdleNewsState extends NewsCubitStates{}
class LoadingNewsState extends NewsCubitStates {}

class SuccessLoadedState extends NewsCubitStates {}

class ErrorLoadingState extends NewsCubitStates {
  final String error;
  ErrorLoadingState(this.error);
}
