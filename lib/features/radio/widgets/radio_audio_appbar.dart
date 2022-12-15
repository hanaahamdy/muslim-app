
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/ppTexts.dart';

AppBar buildAppBar({required String stationTitle}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.white,
    title: AppText(
      text: stationTitle,
      textColor: AppColors.lightVilot,
    ),
  );
}