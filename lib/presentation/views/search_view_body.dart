import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/app_cubit.dart';
import '../../core/constants_methods.dart';

class SearchViewBody extends StatelessWidget {
  final AppCubit appCubit;

  const SearchViewBody({Key? key, required this.appCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              appCubit.weatherResponse.location!.name??'?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                  color: appCubit.getThemeMode(
                      lightMode: Colors.black, darkMode: Colors.white)
              ),
            ),
          ),
          Text(
            '${"updated_at".tr()} ${appCubit.weatherResponse.current!.lastUpdated?.substring(10)}',
            style: TextStyle(
              fontSize: 24,
                color: appCubit.getThemeMode(
                    lightMode: Colors.black, darkMode: Colors.white)
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https:${appCubit.weatherResponse.current?.condition!.icon??''}",
              ),
              const SizedBox(width: 20,),
              Text(
                '${appCubit.weatherResponse.current!.tempC}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                    color: appCubit.getThemeMode(
                        lightMode: Colors.black, darkMode: Colors.white)
                ),
              ),
              const SizedBox(width: 20,),
              Column(
                children: [
                  Text(
                    '${"max_temp".tr()} ${appCubit.weatherResponse.forecast!.forecastday![0].day!.maxtempC}',
                    style: TextStyle(
                      fontSize: 16,
                        color: appCubit.getThemeMode(
                            lightMode: Colors.black, darkMode: Colors.white)
                    ),
                  ),
                  Text(
                    '${"min_temp".tr()} ${appCubit.weatherResponse.forecast!.forecastday![0].day!.mintempC}',
                    style: TextStyle(
                      fontSize: 16,
                        color: appCubit.getThemeMode(
                            lightMode: Colors.black, darkMode: Colors.white)
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              appCubit.conditionText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                  color: appCubit.getThemeMode(
                      lightMode: Colors.black, darkMode: Colors.white)
              ),
            ),
          ),
        ],
      );
  }
}
