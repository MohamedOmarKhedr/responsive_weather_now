import 'package:flutter/material.dart';

abstract class AppTextStyles{
  static TextStyle styleRegular20(BuildContext context) => TextStyle(
    color: const Color(0xffffffff),
    fontSize: getResponsiveFontSize(context, fontSize: 20),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  static TextStyle styleMedium30(BuildContext context) => TextStyle(
      color: const Color(0xffffffff),
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
  );

  static TextStyle styleSemiBold20(BuildContext context) => TextStyle(
      color: const Color(0xffffffff),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
  );




}

double getResponsiveFontSize(BuildContext context,{required double fontSize}){
  double scaleFactor = getScaleFactor(context);

  double responsiveFontSize = scaleFactor * fontSize;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  // (min,max) fontSize
  responsiveFontSize.clamp(lowerLimit, upperLimit);

  return responsiveFontSize;
}

double getScaleFactor(BuildContext context){
  // هذا الحل لا يحتاج إلي context ولكنه مناسب فقط في حالة إن كان البرنامج هيشتغل علي موبايل أو تابلت فقط
  // var dispatcher = PlatformDispatcher.instance;
  // var  physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;

  if (width < 600) {
    return width / 400;
  } else if (width < 800){
    return width / 700;
  }
  else{
    return width / 1000;
  }
}
