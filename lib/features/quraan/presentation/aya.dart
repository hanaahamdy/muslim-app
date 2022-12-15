import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
import 'package:al_quraan_alkareem/features/azkar/data/data_base/azkar_bloc/azkar_bloc.dart';
import 'package:al_quraan_alkareem/features/azkar/widgets/build_container.dart';
import 'package:al_quraan_alkareem/features/azkar/widgets/share_icon.dart';
import 'package:al_quraan_alkareem/features/quraan/data/quraan_bloc/quraan_bloc.dart';
import 'package:al_quraan_alkareem/features/quraan/data/quraan_bloc/quraan_states.dart';
import '../../azkar/data/data_base/azkar_bloc/azkar_states.dart';
import '../data/quran_model/quran_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:al_quraan_alkareem/features/quraan/widgets/aya_page_appbar.dart';
import 'package:al_quraan_alkareem/core/utils/ppTexts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Aya extends StatefulWidget {
  List<AyaModel> Ayas;
  final SuraModel curentSurah;

  Aya({required this.Ayas, required this.curentSurah});

  @override
  State<Aya> createState() => _AyaState();
}

class _AyaState extends State<Aya> {
//  @override
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<QuraanBloc, QuraanStates>(builder: (context, state) {
      QuraanBloc cubit = QuraanBloc.get(context);
      return Scaffold(
          body:SafeArea(child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15 ),
            child: Column(
              children: [

                ayaPageAppBar(
                  curentSurah: widget.curentSurah,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                SizedBox(height: 10,),

                Expanded(
                  child: ListView.builder(physics: BouncingScrollPhysics(),
                      itemCount: widget.Ayas.length,
                      itemBuilder: (context, index) {
                        return buildContainer(
                          margin: 5,
                          ContainerColor: AppColors.greyColor.withOpacity(.1),
                          raduis: 15,
                          child: ListTile(
                            title: AppText(
                              textAlign: TextAlign.end,
                              text: widget.Ayas[index].text,
                            ),
                            leading: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColors.vilote,
                              child: AppText(
                                text: "${index + 1}",
                                textColor: AppColors.white,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cubit.playradio(
                                        audio_url: widget.Ayas[index].audio);
                                    cubit.aodioCurrentIndex(index);
                                  },
                                  icon: cubit.audio_current_index == index
                                      ? Icon(
                                    cubit.playIcon,
                                    color: AppColors.vilote,
                                  )
                                      : Icon(Icons.play_arrow
                                  ),
                                  color: AppColors.vilote,
                                ),
                                ShareIcon(contentForShare: widget.Ayas[index].text)
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),));
    });
  }
}
