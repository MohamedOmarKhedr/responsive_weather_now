import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/business_logic/app_cubit.dart';

import '../styles/app_text_styles.dart';

class NonSearchView extends StatelessWidget {
  final AppCubit appCubit;
  const NonSearchView({super.key, required this.appCubit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('no_weather_view'.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 30),
              color: appCubit.getThemeMode(
                  lightMode: Colors.black, darkMode: Colors.white))),
    );
  }
}
