import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
import 'package:al_quraan_alkareem/core/utils/app_images_routes.dart';
import 'package:al_quraan_alkareem/features/quraan/widgets/build_screen_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/radio_bloc/radio_bloc.dart';
import '../data/radio_bloc/radio_states.dart';
import '../widgets/radio_list_tile_item.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<RadioBloc, RadioStates>(
      listener: (context, state) {},
      builder: (context, state) {
        RadioBloc cubit = RadioBloc.get(context);
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Column(
              children: [
                ScreenAppBar(
                    screenHeight: screenHeight,
                    image: AppImagesRoutes.radio_logo),
                SizedBox(height: 10,),
                state is RadioGetDataLoadingState
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.lightVilot,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: cubit.model?.radiosList.length,
                          itemBuilder: (context, index) {
                            return RadioListTAileItem(
                                context: context,
                                radioModel: cubit.model!.radiosList[index]);
                          },
                        ),
                      ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
