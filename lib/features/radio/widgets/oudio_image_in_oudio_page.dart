import 'package:al_quraan_alkareem/features/azkar/widgets/build_container.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images_routes.dart';
import '../data/radio_bloc/radio_bloc.dart';

Widget OudioComponentInOudioPage(double screenHeight, RadioBloc cubit, double screenWidth) {
  return buildContainer(
    height: screenHeight * .25,
    raduis: 15,
    child: cubit.isPlay == true
        ? Image(
      image: AssetImage(AppImagesRoutes.radio),
    )
        : CircleAvatar(
      radius: screenWidth * .15,
      backgroundColor: AppColors.mic,
      child: Icon(
        Icons.keyboard_voice_sharp,
        color: AppColors.white,
        size: screenWidth * .1,
      ),
    ),
  );
}
