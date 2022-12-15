import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../azkar/widgets/build_container.dart';
import '../presentation/radio_station_audio_page.dart';
import '../data/radio_bloc/radio_model/radio_model.dart';

Container RadioListTAileItem(
    {required BuildContext context, required RadioModel radioModel}) {
  return buildContainer(
    margin: 5,
    raduis: 15,
    ContainerColor: AppColors.greyColor.withOpacity(.1),
    child: ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RadioOudio(
                  stationTitle: radioModel.stationName,
                  stationOudio: radioModel.stationUrl,
                )));
      },
      trailing: Icon(Icons.radio),
      title: Text(
        "${radioModel.stationName}",
        textAlign: TextAlign.end,
        style: TextStyle(color: AppColors.lightVilot),
      ),
    ),
  );
}