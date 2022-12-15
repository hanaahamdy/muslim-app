import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
import 'package:al_quraan_alkareem/core/utils/app_images_routes.dart';
import 'package:al_quraan_alkareem/core/utils/ppTexts.dart';
import 'package:al_quraan_alkareem/features/azkar/widgets/build_container.dart';
import 'package:al_quraan_alkareem/features/radio/data/radio_bloc/radio_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/radio_bloc/radio_states.dart';
import '../widgets/build_play_radio_oudio_icon.dart';
import '../widgets/oudio_image_in_oudio_page.dart';
import '../widgets/radio_audio_appbar.dart';

class RadioOudio extends StatelessWidget {
  final String stationTitle;
  final String stationOudio;

  const RadioOudio(
      {super.key, required this.stationTitle, required this.stationOudio});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<RadioBloc, RadioStates>(
        builder: (context, state) {
          RadioBloc cubit = RadioBloc.get(context);
          return Scaffold(
            appBar: buildAppBar(stationTitle: stationTitle),
            body: buildContainer(
              raduis: 1,
              image: AppImagesRoutes.zekr_content_background,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: state is RadioGetDataErrorState
                      ? Center(
                        child: AppText(textColor: AppColors.lightVilot,
                            textAlign: TextAlign.center,
                            text:
                                "Oops you are Offline please check your Internet connection"),
                      )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              OudioComponentInOudioPage(
                                  screenHeight, cubit, screenWidth),
                              SizedBox(
                                height: screenHeight * .2,
                              ),
                              build_play_oudio_icon(
                                  stationOudio: stationOudio, cubit: cubit)
                            ]),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
