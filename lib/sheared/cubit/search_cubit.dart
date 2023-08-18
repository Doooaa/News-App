import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sp_task/sheared/cubit/search_cubit_state.dart';
import 'package:sp_task/sheared/network/remote/dio_helper.dart';
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) =>BlocProvider.of(context);
  //search
List<dynamic> Search = [];
  getSearchData(String? Searh_name) {
  
    emit(getSearchDataloading());
      Search=[];//فضي يحبيبي عشن تملي تاني
   
      dio_helper.getData(url: '/v2/everything', query: {
          'q':'${Searh_name}',
        'apiKey': 'f96edd43fbc848b69a17ab04fec81381'
      }).then((value) {
        Search = value!.data['articles'];
         print(Search.length);
        emit(getSearchDataSuccess());
      }).catchError((e) {
        print('search size of list ${e.toString()}');
        emit(getSearchDataError(e.toString()));
      });
    } //if for loading items of api for 1 time only to improve the performance
   
  



}