import 'package:flutter/material.dart';

import '../../business_logic/app_cubit.dart';
import '../widgets/custom_text_field.dart';
import 'search_view_body.dart';

class DesktopSearchView extends StatefulWidget {
  const DesktopSearchView({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  State<DesktopSearchView> createState() => _DesktopSearchViewState();
}

class _DesktopSearchViewState extends State<DesktopSearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: widget.appCubit.isDarkMode
              ? const LinearGradient(colors: [Colors.black, Colors.black])
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.appCubit.getBackgroundColor(widget
                          .appCubit.weatherResponse.current?.condition?.text ??
                      ''),
                )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 1 / 4),
            child: CustomTextField(
              appCubit: widget.appCubit,
              onSubmitted: (value) {
                widget.appCubit
                    .getWeatherData(location: widget.appCubit.location);
              },
              iconOnPressed: () {
                widget.appCubit
                    .getWeatherData(location: widget.appCubit.location);
              },
              borderColor: widget.appCubit.getThemeMode(
                  lightMode: widget.appCubit.getAppbarColor(widget
                          .appCubit.weatherResponse.current?.condition?.text ??
                      ''),
                  darkMode: Colors.white),
            ),
          ),
          const SizedBox(height: 30),
          SearchViewBody(
            appCubit: widget.appCubit,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
