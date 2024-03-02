import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/business_logic/app_cubit.dart';

class DrawerBody extends StatelessWidget {
  final BuildContext appContext;
  final AppCubit appCubit;
  const DrawerBody({super.key, required this.appContext, required this.appCubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.language,
              color: appCubit.getThemeMode(
                  lightMode: Colors.black, darkMode: Colors.white)),
          title: Text(
            'arabic_language',
            style: TextStyle(
                color: appCubit.getThemeMode(
                    lightMode: Colors.black, darkMode: Colors.white)),
          ).tr(),
          trailing: Checkbox(
            value: appCubit.isArabicLanguage,
            side: BorderSide(
                color: appCubit.getThemeMode(
                    lightMode: Colors.black, darkMode: Colors.white)),
            onChanged: (bool? value) {
              appCubit.onClickArabicLanguage(appContext: appContext);
              appCubit.checkTranslator(context: context);
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.dark_mode_outlined,
              color: appCubit.getThemeMode(
                  lightMode: Colors.black, darkMode: Colors.white)),
          title: Text(
            'dark_mode',
            style: TextStyle(
                color: appCubit.getThemeMode(
                    lightMode: Colors.black, darkMode: Colors.white)),
          ).tr(),
          trailing: Checkbox(
            side: BorderSide(
                color: appCubit.getThemeMode(
                    lightMode: Colors.black, darkMode: Colors.white)),
            value: appCubit.isDarkMode,
            onChanged: (bool? value) {
              appCubit.onClickDarkMode();
            },
          ),
        ),
      ],
    );
  }
}
