import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
import 'package:al_quraan_alkareem/features/azkar/widgets/share_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/ppTexts.dart';
import 'build_container.dart';

Widget zekr_page_view_item({required zekrItem}) {
  return Padding(
    padding: const EdgeInsets.all(14),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppText(
          text: zekrItem.reference != null ? zekrItem.reference : null,
          textColor: AppColors.greyColor,
        ),
        Container(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: Text(
              zekrItem.zekr,
              style: TextStyle(color: AppColors.vilote, height: 1.5,fontSize: 16),
              textAlign: TextAlign.end,
            )),
        Divider(
          color: Colors.black,
          height: 3,
        ),
        SizedBox(
          height: 20,
        ),
        AppText(
          text: zekrItem.description != null ? zekrItem.description : null,
          textColor: AppColors.greyColor,
          textAlign: TextAlign.end,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            buildContainer(ContainerColor: AppColors.greyColor.withOpacity(.2),
                raduis: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    zekrItem.count != ""
                        ? Expanded(
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.repeat,
                                color: AppColors.vilote,
                              ),
                              label: AppText(
                                text: zekrItem.count,
                              ),
                            ),
                        )
                        : Divider(),
                    Expanded(child: ShareIcon(contentForShare: zekrItem.zekr))
                  ],
                )),
          ],
        )
      ],
    ),
  );
}
