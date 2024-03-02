import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/my_cache_keys.dart';
import 'package:weather_app/data/local_data/my_cache.dart';
import 'package:weather_app/test.dart';
import 'business_logic/app_cubit.dart';
import 'core/my_bloc_observer.dart';
import 'data/remote_data/data_providers/my_dio.dart';
import 'presentation/screens/my_home_screen/my_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await MyCache.initCache();
  MyDio.dioInit();
  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'DZ')],
      path: 'translations',
      fallbackLocale: const Locale('en', 'US'),
      startLocale: MyCache.getBool(key: MyCacheKeys.isArabicLanguage)?const Locale('ar', 'DZ'):const Locale('en', 'US'),
      child: DevicePreview(enabled: false,builder: (context) => const WeatherApp(),)));
}


late BuildContext appContext;
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => AppCubit()..initConnectivity(),
      child: MaterialApp(
        // ---
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // ----
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: const MyHomeScreen(),
      ),
    );
  }
}
