import 'package:al_quraan_alkareem/core/utils/app_images_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/zekr_page_view_item.dart';

class AzkarPageView extends StatelessWidget {
  final List azzkarList;

  AzkarPageView({super.key, required this.azzkarList});

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImagesRoutes.zekr_content_background), fit: BoxFit.cover)),
      child: PageView.builder(
          reverse: true,
          physics: BouncingScrollPhysics(),
          itemCount: azzkarList.length,
          itemBuilder: (context, index) {
            return zekr_page_view_item(zekrItem: azzkarList[index]);
          }),
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
