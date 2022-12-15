import 'package:al_quraan_alkareem/features/quraan/data/quraan_bloc/quraan_bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images_routes.dart';
import '../../../core/utils/ppTexts.dart';
import '../../azkar/widgets/build_container.dart';
import '../presentation/aya.dart';

Container QuraanListTileItem(
    {required int index,
    required QuraanBloc cubit,
    required BuildContext context}) {
  return buildContainer(
    margin: 5,
    raduis: 15,
    ContainerColor: AppColors.greyColor.withOpacity(.1),
    child: ListTile(
      title: AppText(
        text: cubit.quraanModel!.data.surahs[index].englishName,
        fontWeight: FontWeight.w600,
      ),
      subtitle: Row(
        children: [
          AppText(
              text:
                  "${cubit.quraanModel!.data.surahs[index].revelationType}    "),
          AppText(
              text:
                  "${cubit.quraanModel!.data.surahs[index].ayaList.length} VERSES")
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: AppColors.white.withOpacity(.1),
        backgroundImage: AssetImage(AppImagesRoutes.surah_leading),
        child: AppText(
          text: "${index + 1}",
          textColor: AppColors.black,
        ),
      ),
      trailing: AppText(
        text: cubit.allsurahs[index],
        textColor: AppColors.lightVilot,
        fontWeight: FontWeight.w500,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Aya(
                Ayas: cubit.quraanModel!.data.surahs[index].ayaList,
                curentSurah: cubit.quraanModel!.data.surahs[index]),
          ),
        );
      },
    ),
  );
}
