import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData AppTheme() {
  return ThemeData(
      fontFamily: "Arabquranislamic2",
      scaffoldBackgroundColor: AppColors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.vilote,
          unselectedItemColor: AppColors.greyColor));
}
