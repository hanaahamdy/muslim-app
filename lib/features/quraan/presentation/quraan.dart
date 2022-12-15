import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
import 'package:al_quraan_alkareem/core/utils/ppTexts.dart';
import 'package:al_quraan_alkareem/features/azkar/widgets/build_container.dart';
import 'package:al_quraan_alkareem/features/quraan/data/quraan_bloc/quraan_bloc.dart';
import 'package:al_quraan_alkareem/features/quraan/data/quraan_bloc/quraan_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/QuranListTileItem.dart';
import '../widgets/build_screen_appbar.dart';

class QuranList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<QuraanBloc, QuraanStates>(
        builder: (context, state) {
          QuraanBloc cubit = QuraanBloc.get(context);
          var model = cubit.quraanModel?.data;
          return Scaffold(
              body: SafeArea(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                child: Column(
                  children: [

                    ScreenAppBar(screenHeight: screenHeight),
                    SizedBox(height: 10,),
                    if (state is GetQuranErrorState)
                      Expanded(
                        child: Center(
                          child: AppText(
                            textAlign: TextAlign.center,
                            textColor: AppColors.lightVilot,
                            text:
                            "Oops! you are Offline please check your internet connection",
                          ),
                        ),
                      )
                    else if (state is GetQuranLoadingState)
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.lightVilot,
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: buildContainer(raduis: 15, child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: cubit.allsurahs.length,
                          itemBuilder: (context, index) {
                            return QuraanListTileItem(
                                cubit: cubit, index: index, context: context);
                          },
                        ),),
                      )
                  ],
                ),
              ),));
        },
        listener: (context, state) {});
  }
}
