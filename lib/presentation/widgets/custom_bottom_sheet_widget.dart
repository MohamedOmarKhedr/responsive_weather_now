import 'package:flutter/material.dart';

import '../../business_logic/app_cubit.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  final AppCubit appCubit;
  final String connectionStatus;
  const CustomBottomSheetWidget({super.key, required this.connectionStatus, required this.appCubit});

  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: connectionStatus == 'None',
      child: Container(
        height: 50,
        width: double.infinity,
        color: appCubit.getThemeMode(lightMode: Colors.red, darkMode: Colors.white),
        child: Center(
          child: Text(
            'No Internet Connection',
            style: TextStyle(color: appCubit.getThemeMode(lightMode: Colors.white, darkMode: Colors.black), fontSize: 18),
          ),
        ),
      ),
    );
  }
}
