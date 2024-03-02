part of 'app_cubit.dart';


abstract class AppState {}

class AppInitial extends AppState {}

final class GetWeatherDataLoadingState extends AppState {}

final class GetWeatherDataSuccessState extends AppState {}

final class GetWeatherDataErrorState extends AppState {}

final class ChangeConnectivityState extends AppState {}

final class CheckThemeModeState extends AppState {}

final class CheckLanguageState extends AppState {}

final class CheckTranslatorLoadingState extends AppState {}

final class CheckTranslatorSuccessState extends AppState {}

final class CheckTranslatorErrorState extends AppState {}





