import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/app_cubit.dart';
import 'package:weather_app/presentation/styles/app_text_styles.dart';

import '../screens/weather_screen/weather_screen.dart';

class MobileLayout extends StatelessWidget {
  final BuildContext appContext;
  const MobileLayout({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return WeatherScreen(appContext: appContext,);
  }
}















