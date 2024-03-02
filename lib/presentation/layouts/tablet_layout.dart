import 'package:flutter/material.dart';

import '../screens/weather_screen/weather_screen.dart';

class TabletLayout extends StatelessWidget {
  final BuildContext appContext;
  const TabletLayout({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return WeatherScreen(appContext: appContext,);
  }
}
