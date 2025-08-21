import 'package:flutter/material.dart';
import 'package:weather_app/business_logic/app_cubit.dart';

import '../widgets/custom_text_field.dart';

class DesktopNonSearchView extends StatelessWidget {
  final AppCubit appCubit;
  const DesktopNonSearchView({super.key, required this.appCubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
        Container(
          height: MediaQuery.sizeOf(context).width * .25,
          width: MediaQuery.sizeOf(context).width * .25,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/images/LogoMakr.png',
            ),
            fit: BoxFit.fill,
          )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 1 / 4),
          child: CustomTextField(
            appCubit: appCubit,
            onSubmitted: (value) {
              appCubit.getWeatherData(location: appCubit.location);
            },
            iconOnPressed: () {
              appCubit.getWeatherData(location: appCubit.location);
            },
            borderColor: appCubit.getThemeMode(lightMode: Colors.blue, darkMode: Colors.white),
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}
