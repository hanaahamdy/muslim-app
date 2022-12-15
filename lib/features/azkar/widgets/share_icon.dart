import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
Widget ShareIcon({required String contentForShare}) {
  return IconButton(
    onPressed: () {
      Share.share( contentForShare);
    },
    icon: Icon(
      Icons.share,
      color: AppColors.vilote,
    ),
  );
}
