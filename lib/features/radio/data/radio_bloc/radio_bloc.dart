import 'package:al_quraan_alkareem/features/quraan/data/Api/Api.dart';
import 'package:al_quraan_alkareem/features/radio/data/radio_bloc/radio_states.dart';

import 'radio_model/radio_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioBloc extends Cubit<RadioStates> {
  RadioBloc() : super(RadioInitState());

  static RadioBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List radioList = [];
  RadioParentModel? model;

  void getRadios() async{
    emit(RadioGetDataLoadingState());
   Api.getRadioData().then((value) {
      model = RadioParentModel.fromJson(value.data);
     radioList=model!.radiosList;
      print(model?.radiosList[0].stationUrl);
      print(radioList.length);
      emit(RadioGetDataSuccessState());
    }).catchError((onError) {
      emit(RadioGetDataErrorState());
    }
    );

  }

  AudioPlayer audioplayer=AudioPlayer();
 IconData? playIcon=Icons.play_arrow;
  bool isPlay=false;
  void playradio({required String auio_url}){
    isPlay=!isPlay;
    if(isPlay){
      audioplayer.play(auio_url);
      playIcon=playIcon=Icons.pause;
      emit(PlayRadioOudioState());
    }
    else{
     playIcon= playIcon=Icons.play_arrow;
      stop();
      emit(StopRadioAudioState());
    };
  }
  void stop(){
    audioplayer.stop();

  }

}
