import 'package:al_quraan_alkareem/features/azkar/presentation/list_of_azkar.dart';
import 'package:al_quraan_alkareem/features/home_layout/home_bloc/home_states.dart';
import 'package:al_quraan_alkareem/features/quraan/presentation/quraan.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';


import '../../radio/presentation/radio_station_list.dart';

class HomeBloc extends Cubit<HomeStates> {
  HomeBloc() : super(HomeInitState());

  static HomeBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int current_index = 2;

  void currentBottomIndex(int index) {
    current_index = index;
    emit(BottomNavState());
  }
  List<Widget>screens=[
    RadioScreen(),AzkarList(),QuranList()
  ];

  List<BottomNavigationBarItem> bottomItems = [

    BottomNavigationBarItem(icon: Icon(Icons.radio), label: "الاذاعه"),

    BottomNavigationBarItem(
        icon: Icon(FlutterIslamicIcons.prayer), label: "الاذكار"),

    BottomNavigationBarItem(
        icon: Icon(FlutterIslamicIcons.quran), label: "القرآن الكريم"), ];
}
