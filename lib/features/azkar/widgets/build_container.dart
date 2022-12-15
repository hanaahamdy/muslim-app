import 'package:al_quraan_alkareem/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container buildContainer(
    {required double raduis,
    String? image,
    required Widget child,
    double? margin,
    double? herozintalPadding,
    double? verticalPadding,
    Color? borderColor,
    Color? ContainerColor,
    Color? lightGradientColor,
    Color? darkdGradientColor,
    Clip? clip,
    Color? shadowColor,
    double? height}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: herozintalPadding == null ? 2 : herozintalPadding,
            vertical: verticalPadding == null ?2 : verticalPadding),
    clipBehavior: clip == null ? Clip.antiAliasWithSaveLayer : clip,
    height: height == null ? null : height,
    margin: margin == null ? null : EdgeInsets.all(margin),
    width: double.infinity,
    decoration: BoxDecoration(
        boxShadow: shadowColor == null
            ? null
            : [
                BoxShadow(
                    color: shadowColor, blurRadius: 10, offset: Offset(0, 15))
              ],
        gradient: lightGradientColor == null
            ? null
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [lightGradientColor, darkdGradientColor!]),
        image: image != null
            ? DecorationImage(image: AssetImage("${image}"), fit: BoxFit.cover)
            : null,
        borderRadius: BorderRadius.circular(raduis),
        border: borderColor == null ? null : Border.all(color: Colors.black),
        color: ContainerColor == null ? null : ContainerColor),
    child: child,
  );
}
//AppColors.greyColor.withOpacity(.1)
