import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';
import 'package:weather_app/data/remote_data/requests/weather_request.dart';
import 'package:weather_app/data/remote_data/responses/weather_response.dart';

import '../core/my_cache_keys.dart';
import '../data/local_data/my_cache.dart';
import '../main.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);



  bool isSearch = false;

  String location = '';

  Color appbarColor = Colors.blue;

  WeatherResponse weatherResponse = WeatherResponse();

  void getWeatherData({required String location}) {
    emit(GetWeatherDataLoadingState());
    WeatherRequest().weatherRequest(location: location).then((value) {
      weatherResponse = value;
      isSearch = true;
      emit(GetWeatherDataSuccessState());
    }).catchError((error) {
      emit(GetWeatherDataErrorState());
    });
  }

  List<List<Color>> colors = [
    [
      Colors.green[900]!,
      Colors.green[700]!,
      Colors.green[500]!,
      Colors.green[300]!,
      Colors.green[100]!,
    ],
    [
      Colors.yellow[900]!,
      Colors.yellow[700]!,
      Colors.yellow[500]!,
      Colors.yellow[300]!,
      Colors.yellow[100]!,
    ],
    [
      Colors.grey[700]!,
      Colors.grey[600]!,
      Colors.grey[500]!,
      Colors.grey[400]!,
      Colors.grey[300]!,
    ],
    [
      Colors.blue[900]!,
      Colors.blue[700]!,
      Colors.blue[500]!,
      Colors.blue[300]!,
      Colors.blue[100]!,
    ],
  ];

  List<Color> getBackgroundColor(String conditionText) {
    if (conditionText == 'Clear') {
      return colors[0];
    } else if (conditionText == 'Sunny') {
      return colors[1];
    } else if (conditionText == 'Thunderstorm' ||
        conditionText == 'Cloudy' ||
        conditionText == 'Overcast' ||
        conditionText == 'Snow' ||
        conditionText == 'Mist') {
      return colors[2];
    } else {
      return colors[3];
    }
  }

  Color getAppbarColor(String conditionText) {
    if (conditionText == 'Clear') {
      return Colors.green;
    } else if (conditionText == 'Sunny') {
      return Colors.yellow;
    } else if (conditionText == 'Thunderstorm' ||
        conditionText == 'Cloudy' ||
        conditionText == 'Overcast' ||
        conditionText == 'Snow' ||
        conditionText == 'Mist') {
      return Colors.grey;
    } else {
      return Colors.blue;
    }
  }

  String connectionStatus = 'Unknown';

  Future<void> initConnectivity() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      connectionStatus = "Mobile";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      connectionStatus = "WiFi";
    } else {
      connectionStatus = "None";
    }
    if (kDebugMode) {
      print(connectionStatus);
    }
  }

  void changeConnectivity() {
    Connectivity().onConnectivityChanged.listen((result) {
      initConnectivity();
      emit(ChangeConnectivityState());
    });
  }

  // ---

  bool isArabicLanguage = MyCache.getBool(key: MyCacheKeys.isArabicLanguage);
  bool isDarkMode = MyCache.getBool(key: MyCacheKeys.isDarkMode);

  Color getThemeMode({required Color lightMode, required Color darkMode}) {
    if (isDarkMode) {
      return darkMode;
    } else {
      return lightMode;
    }
  }

  void onClickDarkMode() {
    if(isDarkMode) {
      isDarkMode = false;
      MyCache.putBool(key: MyCacheKeys.isDarkMode, value: false);
    } else {
      isDarkMode = true;
      MyCache.putBool(key: MyCacheKeys.isDarkMode, value: true);
    }
    emit(CheckThemeModeState());
  }

  void onClickArabicLanguage({required BuildContext appContext}) {
    if (appContext.locale.languageCode == 'en') {
      isArabicLanguage= true;
      MyCache.putBool(key: MyCacheKeys.isArabicLanguage, value: true);
      appContext.setLocale(const Locale('ar', 'DZ'));
    } else {
      isArabicLanguage= false;
      MyCache.putBool(key: MyCacheKeys.isArabicLanguage, value: false);
      appContext.setLocale(const Locale('en', 'US'));
    }
    emit(CheckLanguageState());
  }

//--------------
  String conditionText =  '?';


  void checkTranslator({required BuildContext context}) {
    conditionText = weatherResponse.current?.condition!.text ?? '';
    final translator = GoogleTranslator();
    emit(CheckTranslatorLoadingState());
    if (context.locale.languageCode == 'ar') {
      translator.translate(conditionText, to: 'ar').then((s) {
        if (kDebugMode) {
          print(s.text);
        }
        conditionText = s.text;
        emit(CheckTranslatorSuccessState());
      }).catchError((error) {
        if (kDebugMode) {
          print('Translation error: $error');
        }
      });
    } else {
      translator.translate(conditionText, to: 'en').then((s) {
        if (kDebugMode) {
          print(s.text);
        }
        conditionText = s.text;
        emit(CheckTranslatorSuccessState());
      }).catchError((error) {
        if (kDebugMode) {
          print('Translation error: $error');
          conditionText = weatherResponse.current?.condition!.text ?? '';
          emit(CheckTranslatorLoadingState());
        }
      });
    }
  }
}
