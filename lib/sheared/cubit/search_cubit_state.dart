abstract class SearchState{}
class SearchInitial extends SearchState{}
class getSearchDataloading extends SearchState {}

class getSearchDataSuccess extends SearchState {}

class getSearchDataError extends SearchState {
  String error;
  getSearchDataError(this.error);

}