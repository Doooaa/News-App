
// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class newsState {}

class newsInitialState extends newsState {}

class newsButtomNavState extends newsState {}

class ontap_BottomNavbarState extends newsState {}

class getBusinessDataloading extends newsState {}

class getBusinessDataSuccess extends newsState {}

class getBusinessDataError extends newsState {
  String error;
  getBusinessDataError(this.error);

}

class getSportsDataloading extends newsState {}

class getSportsDataSuccess extends newsState {}

class getSportsDataError extends newsState {
  String error;
  getSportsDataError(this.error);

}

class getScienceDataloading extends newsState {}

class getScienceDataSuccess extends newsState {}

class getScienceDataError extends newsState {
  String error;
  getScienceDataError(this.error);

}

class ChangeThemeModestate extends newsState {}