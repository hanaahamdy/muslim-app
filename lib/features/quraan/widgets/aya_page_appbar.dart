import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
import 'package:al_quraan_alkareem/core/utils/app_images_routes.dart';
import 'package:al_quraan_alkareem/core/utils/ppTexts.dart';
import 'package:al_quraan_alkareem/features/azkar/widgets/build_container.dart';
import '../data/quran_model/quran_model.dart';
import 'package:flutter/material.dart';

Widget ayaPageAppBar(
    {required double screenHeight,
    required double screenWidth,
    required SuraModel curentSurah}) {
  return buildContainer(
    shadowColor: AppColors.lightVilot.withOpacity(.2),
    raduis: 15,
    child: Stack(
      alignment: Alignment.center,
      children: [
        buildContainer(
          height: screenHeight * .3,
          raduis: 15,
          child: Image(
            image: AssetImage(AppImagesRoutes.moshaf),
            fit: BoxFit.cover,
          ),
        ),
        buildContainer(
            lightGradientColor: AppColors.lightVilot.withOpacity(.4),
            darkdGradientColor: AppColors.secondvilot.withOpacity(.9),
            height: screenHeight * .3,
            raduis: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  text: curentSurah.name,
                  textColor: AppColors.white,
                ),
                AppText(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  text: curentSurah.englishName,
                  textColor: AppColors.white,
                ),
                Divider(
                  color: AppColors.white,
                  endIndent: screenWidth * .1,
                  indent: screenWidth * .1,
                ),
                AppText(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  text: curentSurah.revelationType,
                  textColor: AppColors.white,
                ),
                AppText(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  text: "﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                  textColor: AppColors.white,
                ),
              ],
            )),
      ],
    ),
  );
}


