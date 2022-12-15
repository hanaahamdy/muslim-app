import '../../../../quraan/data/Api/Api.dart';
import '../../../../quraan/data/quran_model/quran_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../models/azkar_model.dart';
import '../azkar_db/azkar.dart';
import 'azkar_states.dart';

class AzkarBloc extends Cubit<AzkarStates> {
  AzkarBloc() : super(AppInitState());

  static AzkarBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List morning = [];
  List evening = [];
  List after_sleeping = [];
  List suit_wearing = [];
  List in_bathroom = [];
  List out_bathroom = [];
  List wedoaa = [];
  List after_wedoaa = [];
  List house_left = [];
  List house_enter = [];
  List mosqu_route = [];
  List mosqu_enter = [];
  List mosq_leave = [];
  List azkar_azan = [];
  List azan_listening = [];
  List rekooa = [];
  List after_rekoaa = [];
  List sgood = [];
  List between_sgood = [];
  List sleeping_zekr = [];

  //"دعاء الرفع من الركوع"

  List<String> listTitels = [
    "أذكار الصباح",
    "أذكار المساء",
    "أذكار الاستيقاظ من النوم",
    "دعاء لبس الثوب",
    "دعاء دخول الخلاء - الحمام",
    "دعاء الخروج من الخلاء - الحمام",
    "الذكر قبل الوضوء",
    "الذكر بعد الفراغ من الوضوء",
    "الذكر عند الخروج من المنزل",
    "الذكر عند دخول المنزل",
    "دعاء الذهاب إلى المسجد",
    "دعاء دخول المسجد",
    "دعاء الخروج من المسجد",
    "أذكار الآذان",
    "دعاء الاستفتاح",
    "دعاء الركوع",
    "دعاء الرفع من الركوع",
    "دعاء السجود",
    "دعاء الجلسة بين السجدتين",
    "أذكار النوم"
  ];

  void getAzkarData() async {
    morning = [];
    evening = [];
    after_sleeping = [];
    suit_wearing = [];
    in_bathroom = [];
    out_bathroom = [];
    wedoaa = [];
    after_wedoaa = [];
    house_left = [];
    house_enter = [];
    mosqu_route = [];
    mosqu_enter = [];
    mosq_leave = [];
    azkar_azan = [];
    azan_listening = [];
    after_sleeping = [];
    rekooa = [];
    after_rekoaa = [];
    sgood = [];
    between_sgood = [];
    sleeping_zekr = [];

    emit(GetAzkarLoadingState());
    azkar.forEach((element) {
      if (element["category"] == "أذكار الصباح") {
        morning.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "أذكار المساء") {
        evening.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "أذكار الاستيقاظ من النوم") {
        after_sleeping.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء لبس الثوب") {
        suit_wearing.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء دخول الخلاء - الحمام") {
        in_bathroom.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء الخروج من الخلاء - الحمام") {
        out_bathroom.add(AzkarModel.fromJson(element));
      }

      if (element["category"] == "الذكر قبل الوضوء") {
        wedoaa.add(AzkarModel.fromJson(element));
      }

      if (element["category"] == "الذكر بعد الفراغ من الوضوء") {
        after_wedoaa.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "الذكر عند الخروج من المنزل") {
        house_left.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "الذكر عند دخول المنزل") {
        house_enter.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء الذهاب إلى المسجد") {
        mosqu_route.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء دخول المسجد") {
        mosqu_enter.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء الخروج من المسجد") {
        mosq_leave.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "أذكار الآذان") {
        azkar_azan.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء الاستفتاح") {
        azan_listening.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء الركوع") {
        rekooa.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء الرفع من الركوع") {
        after_rekoaa.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء السجود") {
        sgood.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "دعاء الجلسة بين السجدتين") {
        between_sgood.add(AzkarModel.fromJson(element));
      }
      if (element["category"] == "أذكار النوم") {
        sleeping_zekr.add(AzkarModel.fromJson(element));
      }
      //
    });
    print(mosq_leave[0].zekr);
  }


}
