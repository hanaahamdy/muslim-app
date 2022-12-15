import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../azkar/widgets/build_container.dart';
import '../data/radio_bloc/radio_bloc.dart';


Container build_play_oudio_icon({required RadioBloc cubit,required stationOudio}) {
  return buildContainer(
    verticalPadding: 10,
    ContainerColor: AppColors.greyColor.withOpacity(.2),
    raduis: 15,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.mic,
          child: IconButton(
            onPressed: () {
              cubit.playradio(auio_url: stationOudio);
            },
            icon: Icon(
              cubit.playIcon,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    ),
  );
}