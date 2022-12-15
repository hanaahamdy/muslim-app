import 'package:al_quraan_alkareem/core/utils/app_images_routes.dart';
import 'package:al_quraan_alkareem/features/azkar/data/data_base/azkar_bloc/azkar_bloc.dart';
import 'package:al_quraan_alkareem/features/quraan/widgets/build_screen_appbar.dart';

import '../data/data_base/azkar_bloc/azkar_states.dart';
import '../widgets/get_all_azkar_data.dart';
import '../widgets/build_zekr_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<AzkarBloc, AzkarStates>(builder: (context, state) {
      var cubit = AzkarBloc.get(context);
      return Scaffold(
        body: SafeArea(child:Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15
          ),
          child: Column(
            children: [
              ScreenAppBar(
                  screenHeight: screenHeight, image: AppImagesRoutes.azkar),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: all_azkar_list(cubit).length,
                  itemBuilder: (context, index) {
                    return zekr_list_item(context, all_azkar_list(cubit), index, cubit);
                  },
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
