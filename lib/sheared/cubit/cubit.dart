import '../../screens/sports.dart';
import '../../screens/bisness.dart';
import '../../screens/sciences.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sp_task/sheared/cubit/state.dart';
import 'package:sp_task/sheared/network/local/cach_helper.dart';
import 'package:sp_task/sheared/network/remote/dio_helper.dart';



class NewsCubit extends Cubit<newsState> {
  NewsCubit() : super(newsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> BottomNavItems = const [
    BottomNavigationBarItem(
        label: "Bisness",
        icon: Icon(
          Icons.business_center,
        )),
    BottomNavigationBarItem(
        label: "Sports",
        icon: Icon(
          Icons.sports_basketball,
        )),
    BottomNavigationBarItem(
        label: "science",
        icon: Icon(
          Icons.science_sharp,
        )),
    // BottomNavigationBarItem(
    //     label: "settings",
    //     icon: Icon(
    //       Icons.settings,
    //     )),
  ];
  List<Widget> Screens = const [
    bisness_screen(),
    sports_screen(),
    science_screen(),
  ];
  int currenIndex_navBar = 0;
  void ontap_BottomNavbar(index) {
    currenIndex_navBar = index;
    print(currenIndex_navBar);

    if (index == 1)
      getSportsData();
    else if (index == 2) getScienceData();
    emit(ontap_BottomNavbarState());
  }

  List<dynamic> business = [];
  getBusinessData() {
    emit(getBusinessDataloading());
    if (business.length == 0) {
      dio_helper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'f96edd43fbc848b69a17ab04fec81381'
      }).then((value) {
        business = value!.data['articles'];
        print("lenggggggggggggggggggggth ${business.length}");
        emit(getBusinessDataSuccess());
      }).catchError((e) {
        print('3aaaaaaaaaa ${e.toString()}');
        emit(getBusinessDataError(e.toString()));
      });
    } else {
      emit(getBusinessDataSuccess());
    }
  }

  List<dynamic> sports = [];
  getSportsData() {
    emit(getSportsDataloading());
    if (sports.length == 0) {
      dio_helper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'f96edd43fbc848b69a17ab04fec81381'
      }).then((value) {
        sports = value!.data['articles'];
        // print(sports.length);
        emit(getSportsDataSuccess());
      }).catchError((e) {
        print('3aaaaaaaaaa ${e.toString()}');
        emit(getSportsDataError(e.toString()));
      });
    } //if for loading items of api for 1 time only to improve the performance
    else {
      emit(getSportsDataSuccess());
    }
  }

  List<dynamic> Science = [];
  getScienceData() {
    if (Science.length == 0) {
      emit(getScienceDataloading());
      dio_helper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'f96edd43fbc848b69a17ab04fec81381'
      }).then((value) {
        Science = value!.data['articles'];
        print(Science.length);
        emit(getScienceDataSuccess());
      }).catchError((e) {
        print('3aaaaaaaaaa ${e.toString()}');
        emit(getScienceDataError(e.toString()));
      });
    } else {
      emit(getScienceDataSuccess());
    }
  }

//link
static Future<void> _launchInBrowser(String url) async {
    final Uri parsedUri = Uri.parse(url);
    print(parsedUri);
    if (!await launchUrl(
      parsedUri,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw Exception('Could not launch $parsedUri');
    }
  }



  bool isDark = false;
  ChangeThemeMode( {bool? fromReferances}) {
    if (fromReferances != null) {
      isDark = fromReferances;
      emit(ChangeThemeModestate());
    } else {
      isDark = !isDark;
      cashHelper
          .putBooleanData(key: 'isDark', value: isDark)
          .then((value) => emit(ChangeThemeModestate()));
    }
  }
  
  

}