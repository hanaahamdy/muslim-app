import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
import 'package:al_quraan_alkareem/core/utils/app_images_routes.dart';
import 'package:al_quraan_alkareem/features/azkar/widgets/build_container.dart';
import 'package:flutter/material.dart';


import '../data/data_base/azkar_bloc/azkar_bloc.dart';
import '../presentation/read_complet_zekr_item.dart';

Widget zekr_list_item(
    BuildContext context, List<dynamic> allAzkar, int index, AzkarBloc cubit) {
  return buildContainer(
    margin: 5,
    ContainerColor: AppColors.greyColor.withOpacity(.1),
    raduis: 15,
    child: ListTile(
        leading: Icon(
          Icons.arrow_back_ios,
          color: AppColors.vilote,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AzkarPageView(
                azzkarList: allAzkar[index],
              ),
            ),
          );
        },
        trailing: Text(
          cubit.listTitels[index],
          style: TextStyle(color: AppColors.lightVilot),
        )),
  );
}
