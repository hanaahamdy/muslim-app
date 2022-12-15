import 'package:al_quraan_alkareem/core/utils/ppTexts.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images_routes.dart';
import '../../azkar/widgets/build_container.dart';

Widget ScreenAppBar({required double screenHeight, Widget? child,String? image}) {
  return
    buildContainer(shadowColor: AppColors.lightVilot.withOpacity(.2),
      raduis: 15,
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildContainer(
            height: screenHeight * .3,
            raduis: 15,
            child: Image(
              image: AssetImage(image==null?AppImagesRoutes.moshaf:image),
              fit: BoxFit.cover,
            ),
          ),
          buildContainer(
              lightGradientColor: AppColors.lightVilot.withOpacity(.4),
              darkdGradientColor: AppColors.secondvilot.withOpacity(.9),
              height: screenHeight * .3,
              raduis: 15,
              child:SizedBox()),
        ],
      )

  );
}
