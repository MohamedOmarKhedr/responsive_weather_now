import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/app_cubit.dart';

import '../views/drawer_body.dart';

class CustomDrawer extends StatefulWidget {
  final BuildContext appContext;

  const CustomDrawer({super.key, required this.appContext,});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late AppCubit appCubit;

  @override
  void didChangeDependencies() {
    appCubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor:
          appCubit.getThemeMode(
              lightMode: Colors.white, darkMode: Colors.black),
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset('assets/images/LogoMakr2.png'),
              ),
              DrawerBody(appContext: widget.appContext,appCubit: appCubit,)
            ],
          ),
        );
      },
    );
  }
}
