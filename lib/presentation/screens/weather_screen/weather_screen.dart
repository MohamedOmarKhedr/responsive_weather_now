import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/app_cubit.dart';
import '../../views/weather_screen_body.dart';
import '../../widgets/custom_darwer.dart';
import '../../widgets/custom_scroll_remaining_screen_widget.dart';
import '../search_screen/search_screen.dart';

class WeatherScreen extends StatefulWidget {
  final BuildContext appContext;
  const WeatherScreen({super.key, required this.appContext});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
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
        return Scaffold(
          backgroundColor: appCubit.getThemeMode(lightMode: Colors.white, darkMode: Colors.black),
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: appCubit.getThemeMode(lightMode: appCubit.getAppbarColor(
                appCubit.weatherResponse.current?.condition?.text ?? ''), darkMode: Colors.black),
            leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu,color: Colors.white,),
            ),
            title: Text(
              'weather_now'.tr(),
              style: const TextStyle(
                  color: Colors.white,),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
          ),
          drawer: CustomDrawer(appContext: widget.appContext,),
          body: CustomScrollRemainingScreenWidget(context: context, child: WeatherScreenBody(
            appCubit: appCubit,
          ),),
          // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
