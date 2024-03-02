import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/views/desktop_non_search_view.dart';
import 'package:weather_app/presentation/widgets/custom_darwer.dart';
import '../../business_logic/app_cubit.dart';
import '../views/desktop_search_view.dart';
import '../views/drawer_body.dart';
import '../views/weather_screen_body.dart';
import '../widgets/custom_bottom_sheet_widget.dart';
import '../widgets/custom_scroll_remaining_screen_widget.dart';
import '../widgets/desktop_settings_dialog.dart';

class DesktopLayout extends StatefulWidget {
  final BuildContext appContext;

  const DesktopLayout({super.key, required this.appContext});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  late AppCubit appCubit;

  @override
  void didChangeDependencies() {
    appCubit = AppCubit.get(context);
    appCubit.changeConnectivity();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if(state is GetWeatherDataSuccessState){
          appCubit.checkTranslator(context: widget.appContext);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: appCubit.getThemeMode(
                lightMode: Colors.white, darkMode: Colors.black),
            appBar: AppBar(
              backgroundColor: appCubit.getThemeMode(
              lightMode: appCubit.getAppbarColor(
        appCubit.weatherResponse.current?.condition?.text ??
          '',),darkMode: Colors.black
              ),
              leading: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          DesktopSettingsDialog(
                            appContext: widget.appContext,
                            appCubit: appCubit,
                          ),
                    );
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white),

            ),),
            body: CustomScrollRemainingScreenWidget(
              context: context,
              child: Visibility(
                visible: appCubit.isSearch ,
                replacement: DesktopNonSearchView(
                  appCubit: appCubit,
                ),
                child: DesktopSearchView(appCubit: appCubit),

              ),
            ),
            bottomSheet: CustomBottomSheetWidget(
              connectionStatus: appCubit.connectionStatus,
              appCubit: appCubit,
            ));
      },
    );
  }
}
