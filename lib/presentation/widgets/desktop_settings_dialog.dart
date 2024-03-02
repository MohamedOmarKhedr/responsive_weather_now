import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/app_cubit.dart';

import '../views/drawer_body.dart';
import 'custom_scroll_remaining_screen_widget.dart';

class DesktopSettingsDialog extends StatelessWidget {
  final AppCubit appCubit;
  final BuildContext appContext;
  const DesktopSettingsDialog(
      {super.key, required this.appCubit, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Dialog(
          backgroundColor: appCubit.getThemeMode(
              lightMode: Colors.white, darkMode: Colors.black),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 250,
              maxHeight: 275
            ),
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05
                ),
                DrawerBody(
                  appContext: appContext,
                  appCubit: appCubit,
                ),
                Column(
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height*.1,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:appCubit.getThemeMode(
                            lightMode: Colors.blueAccent, darkMode: Colors.white)
                      ),
                      child: Text(
                        'Ok',
                        style: TextStyle(
                            color: appCubit.getThemeMode(
                                lightMode: Colors.white, darkMode: Colors.black)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
