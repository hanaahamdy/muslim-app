

import 'package:al_quraan_alkareem/features/quraan/data/quraan_bloc/quraan_states.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Api/Api.dart';
import '../quran_model/quran_model.dart';

class QuraanBloc extends Cubit<QuraanStates> {
  QuraanBloc() : super(QuraanBlocInitState());

  static QuraanBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<String> allsurahs = [];
  List<AyaModel> ayahs = [];
  String? test;

  QuraanModel? quraanModel;

  void getQuranData() {
    allsurahs = [];
    emit(GetQuranLoadingState());
    Api.getQuranData(url: "quran/ar.alafasy").then((value) {
      quraanModel = QuraanModel.fromJson(value.data);
      quraanModel?.data.surahs.forEach((element) {
        allsurahs.add(element.name);
      });
      print(quraanModel?.data.surahs[6].name);
      emit(GetQuranSuccessState());
    }).catchError((onError) {
      emit(GetQuranErrorState());
    });
  }
  int audio_current_index=0;
  void aodioCurrentIndex(int index)
  {
    audio_current_index=index;
    emit(CurrentPlayIndexState());

  }

//
//  AudioPlayer audioplayer=AudioPlayer();
//  IconData? playIcon=Icons.pause_circle_filled;
//  bool isPlay=false;
//  void playradio({required String auio_url})async{
//    isPlay=!isPlay;
////    isPlay?playIcon=(Icons.pause_circle_filled):(Icons.play_arrow);
//    if(isPlay){
//      await audioplayer.play(auio_url);
//      playIcon=playIcon=Icons.pause_circle_filled;
//      emit(QuranPlayState());
//    }
//    else{
//      stop();
//      playIcon=playIcon=Icons.play_arrow;
//      emit(QuranStopState());
//    };
//  }
//  void stop(){
//    audioplayer.stop();
//
//  }

//  AudioPlayer audioplayer = AudioPlayer();
//  IconData? playIcon = Icons.pause_circle_filled;
//  bool isPlay = false;
//
//  void playradio({required String audio_url}) {
//    isPlay = !isPlay;
//
//    if (isPlay) {
//      playIcon = playIcon = Icons.play_arrow;
//      audioplayer.play(audio_url);
//      emit(QuranPlayState());
//    } else {
//      playIcon = playIcon = Icons.pause_circle_filled;
//      stop();
//      emit(QuranStopState());
//    }
//    ;
//  }

  AudioPlayer audioplayer=AudioPlayer();
  IconData? playIcon=Icons.play_arrow;
  bool isPlay=false;
  void playradio({required String audio_url}){
    isPlay=!isPlay;
    if(isPlay){
      audioplayer.play(audio_url);
      playIcon=playIcon=Icons.pause;
      emit(QuranPlayState());
    }
    else{
      playIcon= playIcon=Icons.play_arrow;
      stop();
      emit(QuranStopState());
    };
  }
  void stop(){
    audioplayer.stop();

  }

}
